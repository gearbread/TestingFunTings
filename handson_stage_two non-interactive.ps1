# Variables - replace these with your actual details for the HandsOnSPN_B33fy SPN
$tenantId = "X"
$clientId = "X"



# Authenticate
# https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0#use-delegated-access-with-a-custom-application-for-microsoft-graph-powershell
$ClientSecretCredential = Get-Credential -Credential "$clientid"
## Enter clientsecret for "HandsOnSPN_B33fy" in the password prompt.
Connect-MgGraph -TenantId "$tenantid" -ClientSecretCredential $ClientSecretCredential
Write-output "________-_-_-Welcome Friend! See your identity's details below!-_-_-_______________"
get-MGContext

# Create new service principal, triggering guard rail
#New-MgApplication -DisplayName "BADAPP" -SignInAudience "AzureADMyOrg"
#write-output "You should see the new application details above, if so congrats you have created an app and triggered a guard rail."