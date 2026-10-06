Add-Type -AssemblyName System.Drawing, System.Windows.Forms

# 1. Get current wallpaper path
$wpPath = (Get-ItemProperty 'HKCU:\Control Panel\Desktop').Wallpaper
if (-not (Test-Path $wpPath) -or -not $wpPath) {
    $wpPath = "$env:windir\Web\Wallpaper\Windows\img0.jpg"
}

# 2. Load Wallpaper via MemoryStream (Prevents GDI+ lock)
$bytes = [System.IO.File]::ReadAllBytes($wpPath)
$ms = New-Object System.IO.MemoryStream(,$bytes)
$bmp = [System.Drawing.Bitmap]::FromStream($ms)
$newBmp = New-Object System.Drawing.Bitmap($bmp.Width, $bmp.Height)
$g = [System.Drawing.Graphics]::FromImage($newBmp)
$g.DrawImage($bmp, 0, 0, $bmp.Width, $bmp.Height)

# 3. Setup Brand Watermark Text
$font1 = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$font2 = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Regular)
$brushShadow = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(180, 0, 0, 0))
$brushWhite = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 255, 255))
$brushAccent = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 96, 165, 250))

$textLine1 = "NIVRO Cloud Platform"
$textLine2 = "Windows Server 2025 · Private Plan Authorized"

# Calculate positions based on primary screen resolution
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$screenWidth = $screen.Width
$screenHeight = $screen.Height

# If wallpaper resolution differs from screen, scale coordinates
$scaleX = $bmp.Width / [Math]::Max(1, $screenWidth)
$scaleY = $bmp.Height / [Math]::Max(1, $screenHeight)

$marginRightScreen = 30
$marginBottomScreen = 90  # Well above the 48px taskbar

$size1 = $g.MeasureString($textLine1, $font1)
$size2 = $g.MeasureString($textLine2, $font2)
$maxWidth = [Math]::Max($size1.Width, $size2.Width)

$x = $bmp.Width - ($maxWidth + ($marginRightScreen * $scaleX))
$y = $bmp.Height - (($size1.Height + $size2.Height) + ($marginBottomScreen * $scaleY))

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
