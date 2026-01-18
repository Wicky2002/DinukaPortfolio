# Portfolio Image Setup Script
# This script helps organize existing images and creates placeholders for missing ones

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Portfolio Image Setup Assistant" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

$imagesPath = "images"

# Check if images folder exists
if (-not (Test-Path $imagesPath)) {
    Write-Host "Creating images folder..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $imagesPath | Out-Null
}

Write-Host "Current images in folder:" -ForegroundColor Green
Get-ChildItem $imagesPath | ForEach-Object { 
    Write-Host "  $($_.Name)" -ForegroundColor Gray 
}
Write-Host ""

# Image mapping - what you have vs what you need
$imageMapping = @{
    "profile.jpg" = "me.jpg";
    "about-me.jpg" = "me.jpg";
    "ai-dermatology.jpg" = "ai.png";
    "shadowbyte.jpg" = "cid.jpg";
    "storm-pack.jpg" = "harware.png";
    "Dinuka_Wickramasinghe_CV.pdf" = "CV-AI.pdf"
}

Write-Host "Organizing images..." -ForegroundColor Yellow
Write-Host ""

foreach ($needed in $imageMapping.Keys) {
    $existing = $imageMapping[$needed]
    $existingPath = Join-Path $imagesPath $existing
    $neededPath = Join-Path $imagesPath $needed
    
    if (Test-Path $existingPath) {
        if (-not (Test-Path $neededPath)) {
            Copy-Item $existingPath $neededPath
            Write-Host "  Created $needed from $existing" -ForegroundColor Green
        } else {
            Write-Host "  $needed already exists" -ForegroundColor Gray
        }
    } else {
        Write-Host "  Missing: $needed (source: $existing not found)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Missing Images (Need to Add)" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

$missingImages = @(
    "portfolio-web.jpg";
    "ml-projects.jpg";
    "security-tools.jpg"
)

foreach ($img in $missingImages) {
    $path = Join-Path $imagesPath $img
    if (-not (Test-Path $path)) {
        Write-Host "  $img - Please add this image" -ForegroundColor Yellow
    } else {
        Write-Host "  $img - Found!" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Recommendations" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "For missing images, you can:" -ForegroundColor White
Write-Host "  1. Take screenshots of your actual projects" -ForegroundColor Gray
Write-Host "  2. Use free stock images from:" -ForegroundColor Gray
Write-Host "     - Unsplash.com" -ForegroundColor Gray
Write-Host "     - Pexels.com" -ForegroundColor Gray
Write-Host "     - Pixabay.com" -ForegroundColor Gray
Write-Host "  3. Create placeholder designs using Canva" -ForegroundColor Gray
Write-Host ""
Write-Host "Image size recommendations:" -ForegroundColor White
Write-Host "  - Profile photos: 400x400px (square)" -ForegroundColor Gray
Write-Host "  - About photo: 600x800px (portrait)" -ForegroundColor Gray
Write-Host "  - Project images: 800x600px (landscape)" -ForegroundColor Gray
Write-Host ""
Write-Host "Setup complete! Check the IMAGE_REQUIREMENTS.md file for more details." -ForegroundColor Green
Write-Host ""
