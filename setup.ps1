$ErrorActionPreference = 'Stop'

$sourceRoot = $PSScriptRoot
$parentRoot = Split-Path -Parent $sourceRoot
$projectRoot = Join-Path $parentRoot 'tasks-today-management-system-app'

if (Test-Path $projectRoot) {
    throw "The destination folder already exists: $projectRoot. Rename or move it, then run this script again."
}

Write-Host 'Creating a clean CodeIgniter 4 project...'
composer create-project codeigniter4/appstarter $projectRoot
if ($LASTEXITCODE -ne 0) {
    throw 'Composer could not create the CodeIgniter project. Check that Composer is installed and try again.'
}

Write-Host 'Copying the task management application files...'
Copy-Item -Path (Join-Path $sourceRoot 'app\*') -Destination (Join-Path $projectRoot 'app') -Recurse -Force

$assetsSource = Join-Path $sourceRoot 'public\assets'
$assetsDestination = Join-Path $projectRoot 'public\assets'
New-Item -ItemType Directory -Path $assetsDestination -Force | Out-Null
Copy-Item -Path (Join-Path $assetsSource '*') -Destination $assetsDestination -Recurse -Force

Copy-Item -Path (Join-Path $sourceRoot 'sql') -Destination $projectRoot -Recurse -Force
Copy-Item -Path (Join-Path $sourceRoot '.env.example') -Destination (Join-Path $projectRoot '.env') -Force
Copy-Item -Path (Join-Path $sourceRoot 'README.md') -Destination (Join-Path $projectRoot 'README.md') -Force

Write-Host "Project created at: $projectRoot"
Write-Host 'Next: create the tasks_today_db database, then run php spark migrate and php spark db:seed TasksTodaySeeder from that folder.'
