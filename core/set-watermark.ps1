Add-Type -AssemblyName System.Drawing, System.Windows.Forms

# 1. Locate original untouched Windows Wallpaper
$stockWallpapers = @(
    "$env:windir\Web\4K\Wallpaper\Windows\img0_3840x2160.jpg",
    "$env:windir\Web\4K\Wallpaper\Windows\img0_1920x1200.jpg",
    "$env:windir\Web\Wallpaper\Windows\img0.jpg"
)
$cleanWp = $null
foreach ($p in $stockWallpapers) {
    if (Test-Path $p) { $cleanWp = $p; break }
}
if (-not $cleanWp) {
    $cleanWp = "$env:windir\Web\Wallpaper\Windows\img0.jpg"
}

# 2. Match exact primary screen resolution so wallpaper fits 1:1 without scaling distortion
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$newBmp = New-Object System.Drawing.Bitmap($screen.Width, $screen.Height)
$g = [System.Drawing.Graphics]::FromImage($newBmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

$bytes = [System.IO.File]::ReadAllBytes($cleanWp)
$ms = New-Object System.IO.MemoryStream(,$bytes)
$bmp = [System.Drawing.Bitmap]::FromStream($ms)
$g.DrawImage($bmp, 0, 0, $screen.Width, $screen.Height)
$bmp.Dispose()
$ms.Dispose()

# 3. Setup Brand Watermark Text (Balanced, Compact & Elegant)
$font1 = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$font2 = New-Object System.Drawing.Font("Segoe UI", 10.5, [System.Drawing.FontStyle]::Regular)
$brushShadow = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(180, 0, 0, 0))
$brushWhite = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(245, 255, 255, 255))
$brushAccent = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(230, 210, 230, 255))

$textLine1 = "NIVRO Cloud Platform"
$textLine2 = "Windows Server 2025 - Private Plan Authorized"

$marginRight = 24
$marginBottom = 65  # Just above the taskbar like official watermark

$size1 = $g.MeasureString($textLine1, $font1)
$size2 = $g.MeasureString($textLine2, $font2)
$maxWidth = [Math]::Max($size1.Width, $size2.Width)

$x = $newBmp.Width - $maxWidth - $marginRight
$y = $newBmp.Height - $size1.Height - $size2.Height - $marginBottom

# Draw Text with Subtle Shadow
$g.DrawString($textLine1, $font1, $brushShadow, ($x + 1), ($y + 1))
$g.DrawString($textLine1, $font1, $brushWhite, $x, $y)

$g.DrawString($textLine2, $font2, $brushShadow, ($x + 1), ($y + $size1.Height + 1))
$g.DrawString($textLine2, $font2, $brushAccent, $x, ($y + $size1.Height))

# 4. Save branded wallpaper
$destDir = "$env:ProgramData\NIVRO"
if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
$destPath = "$destDir\wallpaper_branded.png"
if (Test-Path $destPath) { Remove-Item -Path $destPath -Force -ErrorAction SilentlyContinue }
$newBmp.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)

# Clean up
$g.Dispose()
$newBmp.Dispose()
$bmp.Dispose()
$ms.Dispose()

# 5. Apply as wallpaper in Registry & Desktop
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value $destPath
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallpaperStyle -Value "2"
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name TileWallpaper -Value "0"

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
[Wallpaper]::SystemParametersInfo(20, 0, $destPath, 3)

# Force immediate desktop redraw
(New-Object -ComObject WScript.Shell).SendKeys('{F5}')
Stop-Process -Name explorer -Force
