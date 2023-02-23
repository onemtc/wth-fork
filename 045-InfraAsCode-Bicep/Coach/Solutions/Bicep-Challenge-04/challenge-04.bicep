@secure()
param adminPassword string

// this Bicep file is mostly a noop.  It's just used to demonstrate reading from a keyvault

//This is only to show you accessed the key vault.  THIS IS AN ANTI-PATTERN AND NOT RECOMMENDED IN NORMAL USE
#disable-next-line outputs-should-not-contain-secrets
output kvinfo string = adminPassword
