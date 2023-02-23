/*
Challenge 3 does not use a parameters file like seen in challenge 2.  This is something
to call out to attendees and suggest they can use a parameters file if desired.
*/
param storageAccountName string
param containers array

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = [ for container in containers: {
  name: '${storageAccountName}/default/${container}'
}]
