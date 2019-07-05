Clear-Host
$env:LC_MESSAGES='en_US.UTF-8'
$env:PGCLIENTENCODING='utf-8'
$env:PGPASSWORD='!qa2Ws3eD'

Push-Location -Path $PSScriptRoot

psql `
	--set=ENV_DEBUG=1 `
	--set=ENV_CLEAN=1 `
	--set=ENV_SHARD=1 `
	--username=postgres `
	--dbname=meshdb `
	--file=deploy.sql `
	--host=localhost `
	--quiet `
	--set ON_ERROR_STOP=on

Write-Host Done...

Pop-Location