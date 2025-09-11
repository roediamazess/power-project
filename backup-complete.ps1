# PowerPro Complete Backup Script
Write-Host "========================================" -ForegroundColor Green
Write-Host "    PowerPro - Complete Backup System" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Get current timestamp
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupDir = "backup\backup_$timestamp"

Write-Host "[1/8] Creating backup directory..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
New-Item -ItemType Directory -Path "$backupDir\database" -Force | Out-Null
New-Item -ItemType Directory -Path "$backupDir\files" -Force | Out-Null
New-Item -ItemType Directory -Path "$backupDir\config" -Force | Out-Null
New-Item -ItemType Directory -Path "$backupDir\storage" -Force | Out-Null
Write-Host "Backup directory: $backupDir" -ForegroundColor Green
Write-Host ""

Write-Host "[2/8] Backing up database..." -ForegroundColor Yellow
if (Test-Path "database\database.sqlite") {
    Copy-Item "database\database.sqlite" "$backupDir\database\" -Force
    Write-Host "Database backed up successfully" -ForegroundColor Green
} else {
    Write-Host "WARNING: Database file not found" -ForegroundColor Red
}
Write-Host ""

Write-Host "[3/8] Backing up configuration files..." -ForegroundColor Yellow
if (Test-Path ".env") {
    Copy-Item ".env" "$backupDir\config\" -Force
    Write-Host ".env backed up" -ForegroundColor Green
}
if (Test-Path "config") {
    Copy-Item "config\*" "$backupDir\config\" -Recurse -Force
    Write-Host "Config files backed up" -ForegroundColor Green
}
if (Test-Path "composer.json") {
    Copy-Item "composer.json" "$backupDir\config\" -Force
    Write-Host "composer.json backed up" -ForegroundColor Green
}
Write-Host ""

Write-Host "[4/8] Backing up application files..." -ForegroundColor Yellow
if (Test-Path "app") {
    Copy-Item "app" "$backupDir\files\" -Recurse -Force
    Write-Host "App directory backed up" -ForegroundColor Green
}
if (Test-Path "resources") {
    Copy-Item "resources" "$backupDir\files\" -Recurse -Force
    Write-Host "Resources directory backed up" -ForegroundColor Green
}
if (Test-Path "routes") {
    Copy-Item "routes" "$backupDir\files\" -Recurse -Force
    Write-Host "Routes directory backed up" -ForegroundColor Green
}
if (Test-Path "public") {
    Copy-Item "public" "$backupDir\files\" -Recurse -Force
    Write-Host "Public directory backed up" -ForegroundColor Green
}
Write-Host ""

Write-Host "[5/8] Backing up storage directory..." -ForegroundColor Yellow
if (Test-Path "storage") {
    Copy-Item "storage" "$backupDir\storage\" -Recurse -Force
    Write-Host "Storage directory backed up" -ForegroundColor Green
}
Write-Host ""

Write-Host "[6/8] Backing up documentation..." -ForegroundColor Yellow
Get-ChildItem -Path "." -Filter "*.md" | ForEach-Object {
    Copy-Item $_.FullName "$backupDir\" -Force
    Write-Host "Backed up: $($_.Name)" -ForegroundColor Green
}
Get-ChildItem -Path "." -Filter "*.bat" | ForEach-Object {
    Copy-Item $_.FullName "$backupDir\" -Force
    Write-Host "Backed up: $($_.Name)" -ForegroundColor Green
}
Write-Host ""

Write-Host "[7/8] Creating backup manifest..." -ForegroundColor Yellow
$manifestContent = @"
PowerPro Website Backup
================================

Backup Date: $(Get-Date)
Backup Directory: $backupDir

Contents:
- Database: database.sqlite
- Configuration: .env, config files
- Application: app, resources, routes, public
- Storage: storage directory
- Documentation: README, guides, scripts

To restore: Run restore-website.bat
"@
$manifestContent | Out-File -FilePath "$backupDir\BACKUP_INFO.txt" -Encoding UTF8
Write-Host "Backup manifest created" -ForegroundColor Green
Write-Host ""

Write-Host "[8/8] Creating compressed backup..." -ForegroundColor Yellow
try {
    Compress-Archive -Path $backupDir -DestinationPath "backup\powerpro_backup_$timestamp.zip" -Force
    Write-Host "Compressed backup created: backup\powerpro_backup_$timestamp.zip" -ForegroundColor Green
} catch {
    Write-Host "Error creating compressed backup: $($_.Exception.Message)" -ForegroundColor Red
}
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host "    BACKUP COMPLETED SUCCESSFULLY!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Backup Location: $backupDir" -ForegroundColor Cyan
Write-Host "Compressed File: backup\powerpro_backup_$timestamp.zip" -ForegroundColor Cyan
Write-Host ""
Write-Host "You can now safely update your website!" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to continue..."






