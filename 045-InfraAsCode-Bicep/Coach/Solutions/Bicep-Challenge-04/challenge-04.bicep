@secure()
param adminPassword string

// this bicep file is mostly a noop.  It's just used to demonstrate reading from a keyvault

//This is only to show you accessed the key vault.  THIS IS AN ANTI-PATTERN AND NOT RECOMMENDED IN NORMAL USE
output kvinfo string = adminPassword


