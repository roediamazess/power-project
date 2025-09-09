# PowerPro Git Setup Script
Write-Host "========================================" -ForegroundColor Green
Write-Host "    PowerPro - Git Setup" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if Git is available
Write-Host "[1/6] Checking Git availability..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>$null
    if ($gitVersion) {
        Write-Host "Git found: $gitVersion" -ForegroundColor Green
    } else {
        Write-Host "Git not found in PATH, trying alternative locations..." -ForegroundColor Yellow
        $gitPaths = @(
            "C:\Program Files\Git\bin\git.exe",
            "C:\Program Files (x86)\Git\bin\git.exe",
            "C:\Users\$env:USERNAME\AppData\Local\Programs\Git\bin\git.exe"
        )
        
        $gitFound = $false
        foreach ($path in $gitPaths) {
            if (Test-Path $path) {
                Write-Host "Found Git at: $path" -ForegroundColor Green
                $env:PATH += ";$(Split-Path $path)"
                $gitFound = $true
                break
            }
        }
        
        if (-not $gitFound) {
            Write-Host "Git not found. Please install Git from https://git-scm.com/download/win" -ForegroundColor Red
            Read-Host "Press Enter to continue anyway..."
        }
    }
} catch {
    Write-Host "Error checking Git: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "[2/6] Initializing Git repository..." -ForegroundColor Yellow
try {
    git init
    Write-Host "Git repository initialized" -ForegroundColor Green
} catch {
    Write-Host "Error initializing Git: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "[3/6] Adding remote origin..." -ForegroundColor Yellow
try {
    git remote add origin https://github.com/roediamazess/power-project.git
    Write-Host "Remote origin added" -ForegroundColor Green
} catch {
    Write-Host "Remote might already exist, continuing..." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "[4/6] Adding all files..." -ForegroundColor Yellow
try {
    git add .
    Write-Host "Files added to staging area" -ForegroundColor Green
} catch {
    Write-Host "Error adding files: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "[5/6] Making initial commit..." -ForegroundColor Yellow
try {
    git commit -m "Initial commit: Laravel 11.0 PowerPro project setup

- Laravel 11.0 framework installation
- PostgreSQL database configuration
- SQLite fallback database
- Docker support and configuration
- SSL/HTTPS setup scripts
- Development environment ready
- Comprehensive documentation"
    Write-Host "Initial commit created" -ForegroundColor Green
} catch {
    Write-Host "Error creating commit: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "[6/6] Pushing to GitHub..." -ForegroundColor Yellow
try {
    git push -u origin master
    Write-Host "Successfully pushed to GitHub!" -ForegroundColor Green
} catch {
    Write-Host "Error pushing to GitHub: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "You may need to authenticate with GitHub" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Setup completed!" -ForegroundColor Green
Write-Host "Repository: https://github.com/roediamazess/power-project" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to continue..."
