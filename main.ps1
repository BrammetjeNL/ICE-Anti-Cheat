# ICE Scanner - Improved Dashboard (Beter vormen & layout)
# Save as main.ps1

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Windows.Forms

$window = New-Object System.Windows.Window
$window.Title = "ICE Scanner"
$window.Width = 1300
$window.Height = 820
$window.Background = "#0A0C12"
$window.WindowStartupLocation = "CenterScreen"
$window.ResizeMode = "CanResizeWithGrip"

# Main Grid
$grid = New-Object System.Windows.Controls.Grid
$window.Content = $grid

$col1 = New-Object System.Windows.Controls.ColumnDefinition
$col1.Width = "280"
$col2 = New-Object System.Windows.Controls.ColumnDefinition
$grid.ColumnDefinitions.Add($col1)
$grid.ColumnDefinitions.Add($col2)

# ==================== SIDEBAR ====================
$sidebar = New-Object System.Windows.Controls.StackPanel
$sidebar.Background = "#11151F"
[System.Windows.Controls.Grid]::SetColumn($sidebar, 0)
$grid.Children.Add($sidebar)

# Logo
$logoContainer = New-Object System.Windows.Controls.Border
$logoContainer.Margin = "0,35,0,25"
$logoContainer.HorizontalAlignment = "Center"
$sidebar.Children.Add($logoContainer)

$logoText = New-Object System.Windows.Controls.TextBlock
$logoText.Text = "❄️"
$logoText.FontSize = 110
$logoText.Foreground = "#67E8F9"
$logoText.HorizontalAlignment = "Center"
$logoContainer.Child = $logoText

# Menu Items
$menuItems = @(
    @{Text="Dashboard"; Icon="🏠"; Active=$true},
    @{Text="Tools"; Icon="🔧"; Active=$false},
    @{Text="Command Logs"; Icon="💬"; Active=$false},
    @{Text="Exit Launcher"; Icon="⏻"; Active=$false}
)

foreach ($item in $menuItems) {
    $btn = New-Object System.Windows.Controls.Button
    $btn.Height = 58
    $btn.Margin = "16,6,16,6"
    $btn.Background = if ($item.Active) { "#1E2937" } else { "Transparent" }
    $btn.BorderThickness = 0
    $btn.Foreground = "#E2E8F0"
    $btn.FontSize = 15.5
    $btn.Style = $null  # Clean button

    $sp = New-Object System.Windows.Controls.StackPanel
    $sp.Orientation = "Horizontal"
    $sp.Margin = "24,0,0,0"

    $icon = New-Object System.Windows.Controls.TextBlock
    $icon.Text = $item.Icon
    $icon.Width = 32
    $icon.FontSize = 21
    $icon.VerticalAlignment = "Center"
    $sp.Children.Add($icon)

    $txt = New-Object System.Windows.Controls.TextBlock
    $txt.Text = $item.Text
    $txt.VerticalAlignment = "Center"
    $txt.Margin = "8,0,0,0"
    $sp.Children.Add($txt)

    $btn.Content = $sp
    $sidebar.Children.Add($btn)
}

# Bottom
$bottom = New-Object System.Windows.Controls.StackPanel
$bottom.VerticalAlignment = "Bottom"
$bottom.Margin = "0,0,0,35"

$madeBy = New-Object System.Windows.Controls.TextBlock
$madeBy.Text = "Made by:`nBrammetje & ItsDarknessz"
$madeBy.Foreground = "#64748B"
$madeBy.FontSize = 12.5
$madeBy.HorizontalAlignment = "Center"
$madeBy.Margin = "0,0,0,12"
$bottom.Children.Add($madeBy)

$version = New-Object System.Windows.Controls.TextBlock
$version.Text = "ICE SCANNER`nVersion 1.0"
$version.Foreground = "#67E8F9"
$version.FontSize = 13.5
$version.HorizontalAlignment = "Center"
$bottom.Children.Add($version)

$sidebar.Children.Add($bottom)

# ==================== MAIN CONTENT ====================
$scroll = New-Object System.Windows.Controls.ScrollViewer
$scroll.VerticalScrollBarVisibility = "Auto"
[System.Windows.Controls.Grid]::SetColumn($scroll, 1)
$grid.Children.Add($scroll)

$main = New-Object System.Windows.Controls.StackPanel
$main.Margin = "40,35,40,40"
$scroll.Content = $main

# Header
$header = New-Object System.Windows.Controls.TextBlock
$header.Text = "DASHBOARD"
$header.FontSize = 34
$header.FontWeight = "Bold"
$header.Foreground = "#F8FAFC"
$main.Children.Add($header)

$welcome = New-Object System.Windows.Controls.TextBlock
$welcome.Text = "Welcome to ICE Scanner"
$welcome.Foreground = "#94A3B8"
$welcome.FontSize = 16.5
$welcome.Margin = "0,6,0,35"
$main.Children.Add($welcome)

# Status Cards - 2 kolommen
$statusGrid = New-Object System.Windows.Controls.Grid
$statusGrid.Margin = "0,0,0,35"
$statusGrid.ColumnDefinitions.Add((New-Object System.Windows.Controls.ColumnDefinition))
$statusGrid.ColumnDefinitions.Add((New-Object System.Windows.Controls.ColumnDefinition))

# Admin Card
$adminCard = New-Object System.Windows.Controls.Border
$adminCard.Background = "#1A2337"
$adminCard.CornerRadius = 16
$adminCard.Padding = "24"
$adminCard.Margin = "0,0,16,0"
[System.Windows.Controls.Grid]::SetColumn($adminCard, 0)

$adminStack = New-Object System.Windows.Controls.StackPanel
$adminStack.Orientation = "Horizontal"

$shield = New-Object System.Windows.Controls.TextBlock
$shield.Text = "🛡️"
$shield.FontSize = 48
$shield.Margin = "0,0,22,0"
$shield.VerticalAlignment = "Center"
$adminStack.Children.Add($shield)

$adminInfo = New-Object System.Windows.Controls.StackPanel
$adminTitle = New-Object System.Windows.Controls.TextBlock
$adminTitle.Text = "Administrator Privileges"
$adminTitle.Foreground = "#F1F5F9"
$adminTitle.FontSize = 15.5
$adminInfo.Children.Add($adminTitle)

$adminDesc = New-Object System.Windows.Controls.TextBlock
$adminDesc.Text = "You have full administrative permissions."
$adminDesc.Foreground = "#94A3B8"
$adminDesc.FontSize = 13.5
$adminInfo.Children.Add($adminDesc)

$adminStack.Children.Add($adminInfo)
$adminCard.Child = $adminStack

$active = New-Object System.Windows.Controls.Border
$active.Background = "#22C55E"
$active.CornerRadius = 20
$active.Width = 72
$active.Height = 28
$active.HorizontalAlignment = "Right"
$active.VerticalAlignment = "Top"
$activeTxt = New-Object System.Windows.Controls.TextBlock
$activeTxt.Text = "Active"
$activeTxt.Foreground = "#000"
$activeTxt.FontWeight = "Bold"
$activeTxt.HorizontalAlignment = "Center"
$activeTxt.VerticalAlignment = "Center"
$active.Child = $activeTxt
$adminCard.Child = $adminStack  # temporary, we'll layer it better later if needed

$statusGrid.Children.Add($adminCard)

# WiFi Card (zelfde stijl)
$wifiCard = New-Object System.Windows.Controls.Border
$wifiCard.Background = "#1A2337"
$wifiCard.CornerRadius = 16
$wifiCard.Padding = "24"
$wifiCard.Margin = "16,0,0,0"
[System.Windows.Controls.Grid]::SetColumn($wifiCard, 1)

$wifiStack = New-Object System.Windows.Controls.StackPanel
$wifiStack.Orientation = "Horizontal"

$wifiIcon = New-Object System.Windows.Controls.TextBlock
$wifiIcon.Text = "📶"
$wifiIcon.FontSize = 46
$wifiIcon.Margin = "0,0,22,0"
$wifiIcon.VerticalAlignment = "Center"
$wifiStack.Children.Add($wifiIcon)

$wifiInfo = New-Object System.Windows.Controls.StackPanel
$wifiTitle = New-Object System.Windows.Controls.TextBlock
$wifiTitle.Text = "WiFi Connection"
$wifiTitle.Foreground = "#F1F5F9"
$wifiTitle.FontSize = 15.5
$wifiInfo.Children.Add($wifiTitle)

$wifiDesc = New-Object System.Windows.Controls.TextBlock
$wifiDesc.Text = "Your internet connection is stable."
$wifiDesc.Foreground = "#94A3B8"
$wifiDesc.FontSize = 13.5
$wifiInfo.Children.Add($wifiDesc)

$wifiStack.Children.Add($wifiInfo)
$wifiCard.Child = $wifiStack

$statusGrid.Children.Add($wifiCard)
$main.Children.Add($statusGrid)

# Live Log Console
$logTitle = New-Object System.Windows.Controls.TextBlock
$logTitle.Text = "LIVE LOG CONSOLE"
$logTitle.FontSize = 19
$logTitle.FontWeight = "SemiBold"
$logTitle.Foreground = "#F1F5F9"
$logTitle.Margin = "0,10,0,12"
$main.Children.Add($logTitle)

$logBorder = New-Object System.Windows.Controls.Border
$logBorder.Background = "#0F1625"
$logBorder.BorderBrush = "#1E2A44"
$logBorder.BorderThickness = 1
$logBorder.CornerRadius = 16
$logBorder.Padding = 18

$log = New-Object System.Windows.Controls.TextBox
$log.IsReadOnly = $true
$log.Background = "Transparent"
$log.Foreground = "#CBD5E1"
$log.FontFamily = "Consolas"
$log.FontSize = 13.8
$log.Text = @"
[12:45:01] [INFO] ICE Initializing...
[12:45:01] [INFO] Administrator privileges detected.
[12:45:01] [INFO] Internet connection stable.
[12:45:02] [INFO] Discord detected.
[12:45:02] [INFO] Minecraft installation found.
[12:45:02] [READY] ICE Ready.
"@
$logBorder.Child = $log
$main.Children.Add($logBorder)

# Footer
$footer = New-Object System.Windows.Controls.TextBlock
$footer.Text = "ICE SCANNER • BUILT FOR SECURITY"
$footer.Foreground = "#475569"
$footer.HorizontalAlignment = "Center"
$footer.Margin = "0,45,0,0"
$main.Children.Add($footer)

$window.ShowDialog() | Out-Null
