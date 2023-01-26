Clear-AzContext                                                            #Clear the context from PowerShell
Connect-AzAccount -Subscription 6b23affb-06e7-449d-a474-10756bd4d1a6

Select-AzSubscription -SubscriptionId 6b23affb-06e7-449d-a474-10756bd4d1a6                # Select your Azure Subscription
$vaultResourceId = (Get-AzKeyVault -VaultName codefe4kv).ResourceId          # Get your key vault's Resource ID 
$vault = Get-AzResource -ResourceId $vaultResourceId -ExpandProperties     # Get the properties for your key vault
$vault.Properties.TenantId = (Get-AzContext).Tenant.TenantId               # Change the Tenant that your key vault resides in
$vault.Properties.AccessPolicies = @()                                     # Access policies can be updated with real
                                                                           # applications/users/rights so that it does not need to be                             # done after this whole activity. Here we are not setting 
                                                                           # any access policies. 
Set-AzResource -ResourceId $vaultResourceId -Properties $vault.Properties  # Modifies the key vault's properties.

Clear-AzContext                                                            #Clear the context from PowerShell
Connect-AzAccount                                                          #Log in again to confirm you have the correct tenant id