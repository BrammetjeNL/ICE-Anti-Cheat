# ICE Scanner - Bijgewerkte versie (dichter bij je laatste screenshot)
# Save as main.ps1

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="ICE Scanner"
        Width="1380" Height="860"
        WindowStyle="None"
        ResizeMode="NoResize"
        Background="Transparent"
        AllowsTransparency="True"
        WindowStartupLocation="CenterScreen">

    <Border Background="#0C0E18" CornerRadius="12" BorderBrush="#1E2A44" BorderThickness="1">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="48"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Top Bar -->
            <Border Background="#11151F" CornerRadius="12,12,0,0">
                <Grid>
                    <TextBlock Text="ICE SCANNER" Foreground="#67E8F9" FontWeight="Bold" FontSize="18" 
                               VerticalAlignment="Center" Margin="25,0,0,0"/>
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,0,15,0">
                        <Button x:Name="MinBtn" Content="🗕" Width="44" Height="32" Background="Transparent" Foreground="#94A3B8" BorderThickness="0"/>
                        <Button x:Name="CloseBtn" Content="✕" Width="44" Height="32" Background="Transparent" Foreground="#94A3B8" BorderThickness="0"/>
                    </StackPanel>
                </Grid>
            </Border>

            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="270"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- SIDEBAR -->
                <Border Background="#11151F">
                    <StackPanel>
                        <!-- Logo -->
                        <Border Margin="0,25,0,20" HorizontalAlignment="Center">
                            <Image x:Name="LogoImage" Width="130" Height="130" Stretch="Uniform"/>
                        </Border>

                        <!-- Menu -->
                        <StackPanel Margin="12,0">
                            <Button Height="48" Background="Transparent" BorderThickness="0" Margin="4,3">
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="🏠" FontSize="20" Width="30" Foreground="#67E8F9"/>
                                    <TextBlock Text="Dashboard" Foreground="#E2E8F0" FontSize="14.5" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                            <Button Height="48" Background="#1E3A5F" BorderThickness="0" Margin="4,3">   <!-- Highlighted Tools -->
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="🔧" FontSize="20" Width="30" Foreground="#67E8F9"/>
                                    <TextBlock Text="Tools" Foreground="#E2E8F0" FontSize="14.5" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                            <Button Height="48" Background="Transparent" BorderThickness="0" Margin="4,3">
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="💬" FontSize="20" Width="30"/>
                                    <TextBlock Text="Command Logs" Foreground="#E2E8F0" FontSize="14.5" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                            <Button Height="48" Background="Transparent" BorderThickness="0" Margin="4,3">
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="⏻" FontSize="20" Width="30"/>
                                    <TextBlock Text="Exit Launcher" Foreground="#E2E8F0" FontSize="14.5" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                        </StackPanel>

                        <Separator Background="#1F2A44" Margin="20,30,20,15"/>

                        <!-- Bottom -->
                        <StackPanel Margin="22,0">
                            <TextBlock Text="Made by:" Foreground="#64748B" FontSize="12.5"/>
                            <TextBlock Text="Brammetje &amp; ItsDarknessz" Foreground="#67E8F9" FontSize="13" Margin="0,3,0,20"/>
                            <TextBlock Text="ICE SCANNER" Foreground="#67E8F9" FontSize="14.5" FontWeight="SemiBold"/>
                            <TextBlock Text="Version 1.0" Foreground="#94A3B8" FontSize="12.5"/>
                        </StackPanel>
                    </StackPanel>
                </Border>

                <!-- Main Content -->
                <ScrollViewer Grid.Column="1" Margin="30,25,30,20" VerticalScrollBarVisibility="Auto">
                    <StackPanel>
                        <TextBlock Text="DASHBOARD" FontSize="34" FontWeight="Bold" Foreground="#F1F5F9"/>
                        <TextBlock Text="Welcome to ICE Scanner" Foreground="#94A3B8" FontSize="16.5" Margin="0,4,0,25"/>

                        <!-- System Status -->
                        <TextBlock Text="SYSTEM STATUS" FontSize="16" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,0,0,12"/>

                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="2*"/>
                                <ColumnDefinition Width="1.3*"/>
                            </Grid.ColumnDefinitions>

                            <StackPanel Margin="0,0,20,0">
                                <!-- Admin -->
                                <Border Background="#1A2337" CornerRadius="10" Padding="18" Margin="0,0,0,14">
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock Text="🛡️" FontSize="38" Margin="0,0,18,0"/>
                                        <StackPanel>
                                            <TextBlock Text="Administrator Privileges" Foreground="#F1F5F9" FontSize="15"/>
                                            <TextBlock Text="You have full administrative permissions." Foreground="#94A3B8" FontSize="13" Margin="0,4,0,0"/>
                                        </StackPanel>
                                        <Border Background="#22C55E" CornerRadius="20" Padding="16,5" Height="28" VerticalAlignment="Center" HorizontalAlignment="Right" Margin="40,0,0,0">
                                            <TextBlock Text="Active" Foreground="#000" FontWeight="Bold" FontSize="12"/>
                                        </Border>
                                    </StackPanel>
                                </Border>

                                <!-- WiFi -->
                                <Border Background="#1A2337" CornerRadius="10" Padding="18">
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock Text="📶" FontSize="38" Margin="0,0,18,0"/>
                                        <StackPanel>
                                            <TextBlock Text="WiFi Connection" Foreground="#F1F5F9" FontSize="15"/>
                                            <TextBlock Text="Your internet connection is stable." Foreground="#94A3B8" FontSize="13" Margin="0,4,0,0"/>
                                        </StackPanel>
                                        <Border Background="#22C55E" CornerRadius="20" Padding="16,5" Height="28" VerticalAlignment="Center" HorizontalAlignment="Right" Margin="40,0,0,0">
                                            <TextBlock Text="Active" Foreground="#000" FontWeight="Bold" FontSize="12"/>
                                        </Border>
                                    </StackPanel>
                                </Border>
                            </StackPanel>

                            <!-- Discord Accounts -->
                            <Border Background="#1A2337" CornerRadius="10" Padding="16" Margin="0,0,0,0">
                                <StackPanel>
                                    <TextBlock Text="Discord Accounts" Foreground="#E2E8F0" FontSize="14.5" Margin="0,0,0,12"/>
                                    <UniformGrid Columns="2">
                                        <Border Margin="6" Background="#0F1625" CornerRadius="8" Padding="8">
                                            <StackPanel HorizontalAlignment="Center">
                                                <TextBlock Text="👤" FontSize="38"/>
                                                <TextBlock Text="ItsDarknessz" Foreground="#67E8F9" FontSize="12.5" Margin="0,6,0,0"/>
                                            </StackPanel>
                                        </Border>
                                        <Border Margin="6" Background="#0F1625" CornerRadius="8" Padding="8">
                                            <StackPanel HorizontalAlignment="Center">
                                                <TextBlock Text="👤" FontSize="38"/>
                                                <TextBlock Text="sDarknessz AL" Foreground="#67E8F9" FontSize="12.5" Margin="0,6,0,0"/>
                                            </StackPanel>
                                        </Border>
                                    </UniformGrid>
                                </StackPanel>
                            </Border>
                        </Grid>

                        <!-- Statistics -->
                        <TextBlock Text="STATISTICS" FontSize="16" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,28,0,12"/>
                        <UniformGrid Columns="4" Margin="0,0,0,30">
                            <Border Background="#1A2337" CornerRadius="10" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="28" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Scans Run" Foreground="#94A3B8" FontSize="12.5"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="10" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="28" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Threats Found" Foreground="#94A3B8" FontSize="12.5"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="10" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="---" FontSize="28" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Last Scan" Foreground="#94A3B8" FontSize="12.5"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="10" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="28" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Files Scanned" Foreground="#94A3B8" FontSize="12.5"/>
                                </StackPanel>
                            </Border>
                        </UniformGrid>

                        <!-- Live Log -->
                        <TextBlock Text="LIVE LOG CONSOLE" FontSize="16" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,0,0,10"/>
                        <Border Background="#0F1625" CornerRadius="10" BorderBrush="#1F2A44" BorderThickness="1" Padding="16">
                            <TextBox Background="Transparent" BorderThickness="0" Foreground="#A1B0C8" FontFamily="Consolas" FontSize="13.5" IsReadOnly="True" Height="220" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto"
                                     Text="[12:45:01] [INFO] ICE Initializing...&#10;[12:45:01] [INFO] Administrator privileges detected.&#10;[12:45:01] [INFO] Internet connection stable.&#10;[12:45:02] [INFO] Discord detected.&#10;[12:45:02] [INFO] Minecraft installation found.&#10;[12:45:02] [READY] ICE Ready."/>
                        </Border>

                        <TextBlock Text="ICE SCANNER • BUILT FOR SECURITY" Foreground="#475569" HorizontalAlignment="Center" Margin="0,30,0,0"/>
                    </StackPanel>
                </ScrollViewer>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Logo
$bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
$bitmap.BeginInit()
$bitmap.UriSource = New-Object System.Uri("https://files.catbox.moe/9v4p8k.png") # Vervang met je eigen logo link
$bitmap.EndInit()
$window.FindName("LogoImage").Source = $bitmap

$window.Add_MouseLeftButtonDown({ $window.DragMove() })
$window.FindName("CloseBtn").Add_Click({ $window.Close() })
$window.FindName("MinBtn").Add_Click({ $window.WindowState = "Minimized" })

$window.ShowDialog() | Out-Null
