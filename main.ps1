# ICE Scanner - Main Dashboard (Start Page)
# Save as main.ps1 and upload to your repo

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Windows.Forms

# Create WPF Window
$window = New-Object System.Windows.Window
$window.Title = "ICE Scanner"
$window.Width = 1280
$window.Height = 720
$window.Background = "#0F1117"
$window.WindowStartupLocation = "CenterScreen"
$window.ResizeMode = "CanResize"
$window.MinWidth = 1000
$window.MinHeight = 600

# Main Grid
$grid = New-Object System.Windows.Controls.Grid
$window.Content = $grid

# Column Definitions (Sidebar + Content)
$col1 = New-Object System.Windows.Controls.ColumnDefinition
$col1.Width = "250"
$col2 = New-Object System.Windows.Controls.ColumnDefinition
$grid.ColumnDefinitions.Add($col1)
$grid.ColumnDefinitions.Add($col2)

# ==================== LEFT SIDEBAR ====================
$sidebar = New-Object System.Windows.Controls.StackPanel
$sidebar.Background = "#171B26"
$sidebar.Width = 250
[System.Windows.Controls.Grid]::SetColumn($sidebar, 0)
$grid.Children.Add($sidebar)

# Logo
$logoBorder = New-Object System.Windows.Controls.Border
$logoBorder.Height = 120
$logoBorder.Margin = "20,30,20,10"
$sidebar.Children.Add($logoBorder)

$logoText = New-Object System.Windows.Controls.TextBlock
$logoText.Text = "❄️"
$logoText.FontSize = 80
$logoText.HorizontalAlignment = "Center"
$logoText.Foreground = "#60A5FA"
$logoBorder.Child = $logoText

# Menu Items
$menuItems = @(
    @{Text="Dashboard"; Icon="🏠"; Active=$true},
    @{Text="Tools"; Icon="🔧"; Active=$false},
    @{Text="Command Logs"; Icon="💬"; Active=$false},
    @{Text="Exit Launcher"; Icon="⏻"; Active=$false}
)

foreach ($item in $menuItems) {
    $menuBtn = New-Object System.Windows.Controls.Button
    $menuBtn.Height = 50
    $menuBtn.Margin = "10,2,10,2"
    $menuBtn.Background = if ($item.Active) { "#1E2538" } else { "Transparent" }
    $menuBtn.BorderThickness = 0
    $menuBtn.Foreground = "#E2E8F0"
    $menuBtn.FontSize = 15
    $menuBtn.HorizontalContentAlignment = "Left"
    $menuBtn.Padding = "20,0,0,0"
    
    $stack = New-Object System.Windows.Controls.StackPanel
    $stack.Orientation = "Horizontal"
    
    $icon = New-Object System.Windows.Controls.TextBlock
    $icon.Text = $item.Icon
    $icon.Margin = "0,0,15,0"
    $icon.FontSize = 18
    $stack.Children.Add($icon)
    
    $txt = New-Object System.Windows.Controls.TextBlock
    $txt.Text = $item.Text
    $txt.VerticalAlignment = "Center"
    $stack.Children.Add($txt)
    
    $menuBtn.Content = $stack
    $sidebar.Children.Add($menuBtn)
}

# Bottom section
$bottomPanel = New-Object System.Windows.Controls.StackPanel
$bottomPanel.VerticalAlignment = "Bottom"
$bottomPanel.Margin = "0,0,0,20"

$about = New-Object System.Windows.Controls.TextBlock
$about.Text = "Made by:`nBrammetje & ItsDarknessz"
$about.Foreground = "#94A3B8"
$about.FontSize = 12
$about.Margin = "20,10"
$about.HorizontalAlignment = "Center"
$bottomPanel.Children.Add($about)

$version = New-Object System.Windows.Controls.TextBlock
$version.Text = "ICE SCANNER`nVersion 1.0"
$version.Foreground = "#60A5FA"
$version.FontSize = 14
$version.HorizontalAlignment = "Center"
$version.Margin = "0,10"
$bottomPanel.Children.Add($version)

$sidebar.Children.Add($bottomPanel)

# ==================== MAIN CONTENT ====================
$mainContent = New-Object System.Windows.Controls.ScrollViewer
$mainContent.VerticalScrollBarVisibility = "Auto"
[System.Windows.Controls.Grid]::SetColumn($mainContent, 1)
$grid.Children.Add($mainContent)

$mainPanel = New-Object System.Windows.Controls.StackPanel
$mainPanel.Margin = "30"
$mainContent.Content = $mainPanel

# Header
$header = New-Object System.Windows.Controls.TextBlock
$header.Text = "DASHBOARD"
$header.FontSize = 28
$header.FontWeight = "Bold"
$header.Foreground = "#E2E8F0"
$header.Margin = "0,0,0,5"
$mainPanel.Children.Add($header)

$welcome = New-Object System.Windows.Controls.TextBlock
$welcome.Text = "Welcome to ICE Scanner"
$welcome.Foreground = "#94A3B8"
$welcome.FontSize = 16
$welcome.Margin = "0,0,0,30"
$mainPanel.Children.Add($welcome)

# System Status
$statusGrid = New-Object System.Windows.Controls.Grid
$statusGrid.Margin = "0,0,0,25"
$colDef1 = New-Object System.Windows.Controls.ColumnDefinition; $colDef1.Width = "Auto"
$colDef2 = New-Object System.Windows.Controls.ColumnDefinition; $colDef2.Width = "*"
$statusGrid.ColumnDefinitions.Add($colDef1)
$statusGrid.ColumnDefinitions.Add($colDef2)

# Admin Privileges
$adminPanel = New-Object System.Windows.Controls.Border
$adminPanel.Background = "#1E2538"
$adminPanel.CornerRadius = 8
$adminPanel.Padding = 20
$adminPanel.Margin = "0,0,15,0"
[System.Windows.Controls.Grid]::SetColumn($adminPanel, 0)

$adminStack = New-Object System.Windows.Controls.StackPanel
$shield = New-Object System.Windows.Controls.TextBlock
$shield.Text = "🛡️"
$shield.FontSize = 28
$shield.Foreground = "#34D399"
$adminStack.Children.Add($shield)

$adminTitle = New-Object System.Windows.Controls.TextBlock
$adminTitle.Text = "Administrator Privileges"
$adminTitle.Foreground = "#E2E8F0"
$adminTitle.FontSize = 15
$adminTitle.Margin = "0,8,0,0"
$adminStack.Children.Add($adminTitle)

$adminStatus = New-Object System.Windows.Controls.TextBlock
$adminStatus.Text = "You have full administrative permissions."
$adminStatus.Foreground = "#94A3B8"
$adminStatus.FontSize = 13
$adminStack.Children.Add($adminStatus)

$activeBadge = New-Object System.Windows.Controls.TextBlock
$activeBadge.Text = "Active"
$activeBadge.Background = "#34D399"
$activeBadge.Foreground = "#000"
$activeBadge.Padding = "12,4"
$activeBadge.HorizontalAlignment = "Right"
$activeBadge.FontWeight = "Bold"
$adminStack.Children.Add($activeBadge)

$adminPanel.Child = $adminStack
$statusGrid.Children.Add($adminPanel)

# WiFi
$wifiPanel = New-Object System.Windows.Controls.Border
$wifiPanel.Background = "#1E2538"
$wifiPanel.CornerRadius = 8
$wifiPanel.Padding = 20
$wifiPanel.Margin = "0,0,0,0"
[System.Windows.Controls.Grid]::SetColumn($wifiPanel, 1)

$wifiStack = New-Object System.Windows.Controls.StackPanel
$wifiIcon = New-Object System.Windows.Controls.TextBlock
$wifiIcon.Text = "📶"
$wifiIcon.FontSize = 28
$wifiIcon.Foreground = "#60A5FA"
$wifiStack.Children.Add($wifiIcon)

$wifiTitle = New-Object System.Windows.Controls.TextBlock
$wifiTitle.Text = "WiFi Connection"
$wifiTitle.Foreground = "#E2E8F0"
$wifiTitle.FontSize = 15
$wifiTitle.Margin = "0,8,0,0"
$wifiStack.Children.Add($wifiTitle)

$wifiStatus = New-Object System.Windows.Controls.TextBlock
$wifiStatus.Text = "Your internet connection is stable."
$wifiStatus.Foreground = "#94A3B8"
$wifiStatus.FontSize = 13
$wifiStack.Children.Add($wifiStatus)

$wifiActive = New-Object System.Windows.Controls.TextBlock
$wifiActive.Text = "Active"
$wifiActive.Background = "#34D399"
$wifiActive.Foreground = "#000"
$wifiActive.Padding = "12,4"
$wifiActive.HorizontalAlignment = "Right"
$wifiActive.FontWeight = "Bold"
$wifiStack.Children.Add($wifiActive)

$wifiPanel.Child = $wifiStack
$statusGrid.Children.Add($wifiPanel)

$mainPanel.Children.Add($statusGrid)

# Accounts Section
$accountsTitle = New-Object System.Windows.Controls.TextBlock
$accountsTitle.Text = "ACCOUNTS"
$accountsTitle.FontSize = 20
$accountsTitle.FontWeight = "SemiBold"
$accountsTitle.Foreground = "#E2E8F0"
$accountsTitle.Margin = "0,10,0,15"
$mainPanel.Children.Add($accountsTitle)

$accountsGrid = New-Object System.Windows.Controls.UniformGrid
$accountsGrid.Columns = 4
$accountsGrid.Margin = "0,0,0,30"

# Minecraft Accounts
$minecraft1 = CreateAccountCard "ItsDarknessz" "Premium" "🧱"
$minecraft2 = CreateAccountCard "DarknessDev" "Premium" "🧱"
$discord1 = CreateAccountCard "ItsDarknessz" "123456789012345678" "💬"
$discord2 = CreateAccountCard "ItsDarknessz ALT" "987654321098765432" "💬"

$accountsGrid.Children.Add($minecraft1)
$accountsGrid.Children.Add($minecraft2)
$accountsGrid.Children.Add($discord1)
$accountsGrid.Children.Add($discord2)

$mainPanel.Children.Add($accountsGrid)

# Statistics
$statsTitle = New-Object System.Windows.Controls.TextBlock
$statsTitle.Text = "STATISTICS"
$statsTitle.FontSize = 20
$statsTitle.FontWeight = "SemiBold"
$statsTitle.Foreground = "#E2E8F0"
$statsTitle.Margin = "0,10,0,15"
$mainPanel.Children.Add($statsTitle)

$statsPanel = New-Object System.Windows.Controls.UniformGrid
$statsPanel.Columns = 4
$statsPanel.Margin = "0,0,0,30"

$statsPanel.Children.Add((CreateStatCard "0" "Scans Run" "📊"))
$statsPanel.Children.Add((CreateStatCard "0" "Threats Found" "🛡️"))
$statsPanel.Children.Add((CreateStatCard "---" "Last Scan" "🕒"))
$statsPanel.Children.Add((CreateStatCard "0" "Files Scanned" "📁"))

$mainPanel.Children.Add($statsPanel)

# Live Log Console
$logTitle = New-Object System.Windows.Controls.TextBlock
$logTitle.Text = "LIVE LOG CONSOLE"
$logTitle.FontSize = 20
$logTitle.FontWeight = "SemiBold"
$logTitle.Foreground = "#E2E8F0"
$logTitle.Margin = "0,10,0,10"
$mainPanel.Children.Add($logTitle)

$logBorder = New-Object System.Windows.Controls.Border
$logBorder.Background = "#0A0C10"
$logBorder.BorderBrush = "#1E2538"
$logBorder.BorderThickness = 1
$logBorder.CornerRadius = 8
$logBorder.Height = 220
$logBorder.Padding = 15

$logText = New-Object System.Windows.Controls.TextBox
$logText.IsReadOnly = $true
$logText.Background = "Transparent"
$logText.Foreground = "#94A3B8"
$logText.FontFamily = "Consolas"
$logText.FontSize = 13
$logText.Text = @"
[12:45:01] [INFO] ICE Initializing...
[12:45:01] [INFO] Administrator privileges detected.
[12:45:01] [INFO] Internet connection stable.
[12:45:02] [INFO] Discord detected.
[12:45:02] [INFO] Minecraft installation found.
[12:45:02] [READY] ICE Ready.
"@
$logBorder.Child = $logText
$mainPanel.Children.Add($logBorder)

# Footer
$footer = New-Object System.Windows.Controls.TextBlock
$footer.Text = "ICE SCANNER • BUILT FOR SECURITY"
$footer.Foreground = "#475569"
$footer.HorizontalAlignment = "Center"
$footer.Margin = "0,20,0,0"
$mainPanel.Children.Add($footer)

# Helper Functions
function CreateAccountCard {
    param($name, $sub, $emoji)
    
    $card = New-Object System.Windows.Controls.Border
    $card.Background = "#1E2538"
    $card.CornerRadius = 8
    $card.Margin = 8
    $card.Padding = 12
    
    $stack = New-Object System.Windows.Controls.StackPanel
    
    $avatar = New-Object System.Windows.Controls.TextBlock
    $avatar.Text = $emoji
    $avatar.FontSize = 42
    $avatar.HorizontalAlignment = "Center"
    $stack.Children.Add($avatar)
    
    $nameTxt = New-Object System.Windows.Controls.TextBlock
    $nameTxt.Text = $name
    $nameTxt.Foreground = "#E2E8F0"
    $nameTxt.FontSize = 14
    $nameTxt.HorizontalAlignment = "Center"
    $nameTxt.Margin = "0,8,0,0"
    $stack.Children.Add($nameTxt)
    
    $subTxt = New-Object System.Windows.Controls.TextBlock
    $subTxt.Text = $sub
    $subTxt.Foreground = "#60A5FA"
    $subTxt.FontSize = 12
    $subTxt.HorizontalAlignment = "Center"
    $stack.Children.Add($subTxt)
    
    $card.Child = $stack
    return $card
}

function CreateStatCard {
    param($value, $label, $emoji)
    
    $card = New-Object System.Windows.Controls.Border
    $card.Background = "#1E2538"
    $card.CornerRadius = 8
    $card.Margin = 8
    $card.Padding = 15
    
    $stack = New-Object System.Windows.Controls.StackPanel
    
    $val = New-Object System.Windows.Controls.TextBlock
    $val.Text = $value
    $val.FontSize = 32
    $val.FontWeight = "Bold"
    $val.Foreground = "#60A5FA"
    $val.HorizontalAlignment = "Center"
    $stack.Children.Add($val)
    
    $lbl = New-Object System.Windows.Controls.TextBlock
    $lbl.Text = $label
    $lbl.Foreground = "#94A3B8"
    $lbl.FontSize = 13
    $lbl.HorizontalAlignment = "Center"
    $stack.Children.Add($lbl)
    
    $card.Child = $stack
    return $card
}

# Show Window
$window.ShowDialog() | Out-Null
