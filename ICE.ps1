Add-Type -AssemblyName PresentationFramework

$FirebaseUrl = "https://ice-anticheat-default-rtdb.europe-west1.firebasedatabase.app/stats.json"

try {
    $Stats = Invoke-RestMethod -Uri $FirebaseUrl
}
catch {
    $Stats = @{
        scansRun     = 0
        threatsFound = 0
        filesScanned = 0
        lastScan     = "Unavailable"
    }
}

[xml]$xaml = @"
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
Title="ICE Dashboard"
Height="700"
Width="1200"
Background="#0B1020"
WindowStartupLocation="CenterScreen">

<Grid Margin="20">

<Grid.RowDefinitions>
<RowDefinition Height="Auto"/>
<RowDefinition Height="20"/>
<RowDefinition Height="*"/>
<RowDefinition Height="180"/>
</Grid.RowDefinitions>

<TextBlock
Text="ICE Anti Cheat"
Foreground="White"
FontSize="32"
FontWeight="Bold"/>

<UniformGrid Grid.Row="2" Columns="4">

<Border Margin="10" CornerRadius="10" Background="#131D36">
<StackPanel Margin="20">
<TextBlock Text="Scans Run" Foreground="White" FontSize="18"/>
<TextBlock x:Name="ScansRun" Foreground="#4DA3FF" FontSize="28"/>
</StackPanel>
</Border>

<Border Margin="10" CornerRadius="10" Background="#131D36">
<StackPanel Margin="20">
<TextBlock Text="Threats Found" Foreground="White" FontSize="18"/>
<TextBlock x:Name="ThreatsFound" Foreground="#4DA3FF" FontSize="28"/>
</StackPanel>
</Border>

<Border Margin="10" CornerRadius="10" Background="#131D36">
<StackPanel Margin="20">
<TextBlock Text="Files Scanned" Foreground="White" FontSize="18"/>
<TextBlock x:Name="FilesScanned" Foreground="#4DA3FF" FontSize="28"/>
</StackPanel>
</Border>

<Border Margin="10" CornerRadius="10" Background="#131D36">
<StackPanel Margin="20">
<TextBlock Text="Last Scan" Foreground="White" FontSize="18"/>
<TextBlock x:Name="LastScan" Foreground="#4DA3FF" FontSize="18"/>
</StackPanel>
</Border>

</UniformGrid>

<Border Grid.Row="3" Background="#111827" CornerRadius="10" Margin="10">
<Grid Margin="10">
<Grid.RowDefinitions>
<RowDefinition Height="Auto"/>
<RowDefinition Height="*"/>
</Grid.RowDefinitions>

<TextBlock
Text="Activity Console"
Foreground="White"
FontWeight="Bold"
FontSize="16"/>

<TextBox
x:Name="ConsoleBox"
Grid.Row="1"
Background="#0B1020"
Foreground="#4DA3FF"
BorderThickness="0"
IsReadOnly="True"
TextWrapping="Wrap"
VerticalScrollBarVisibility="Auto"/>
</Grid>
</Border>

</Grid>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$window.FindName("ScansRun").Text     = "$($Stats.scansRun)"
$window.FindName("ThreatsFound").Text = "$($Stats.threatsFound)"
$window.FindName("FilesScanned").Text = "$($Stats.filesScanned)"
$window.FindName("LastScan").Text     = "$($Stats.lastScan)"

$ConsoleBox = $window.FindName("ConsoleBox")

function Write-Log {
    param($Text)

    $time = Get-Date -Format "HH:mm:ss"
    $ConsoleBox.AppendText("[$time] $Text`r`n")
    $ConsoleBox.ScrollToEnd()
}

Write-Log "ICE Dashboard initialized"
Write-Log "Connected to Firebase"
Write-Log "Statistics loaded successfully"

$window.ShowDialog() | Out-Null
