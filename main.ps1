# ICE Scanner - Zeer nauwkeurige replica van je screenshot
# Save as main.ps1

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="ICE Scanner"
        Width="1400" Height="920"
        WindowStyle="None"
        ResizeMode="NoResize"
        Background="Transparent"
        AllowsTransparency="True"
        WindowStartupLocation="CenterScreen">

    <Border Background="#0A0C12" CornerRadius="16" BorderBrush="#1F2A44" BorderThickness="1">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="52"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Background="#0F1625" CornerRadius="16,16,0,0">
                <Grid>
                    <TextBlock Text="ICE SCANNER" Foreground="#67E8F9" FontWeight="Bold" FontSize="18" VerticalAlignment="Center" Margin="30,0,0,0"/>
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,0,15,0">
                        <Button x:Name="MinBtn" Content="🗕" Width="48" Height="36" Background="Transparent" Foreground="#94A3B8" BorderThickness="0" FontSize="16"/>
                        <Button x:Name="CloseBtn" Content="✕" Width="48" Height="36" Background="Transparent" Foreground="#94A3B8" BorderThickness="0" FontSize="18"/>
                    </StackPanel>
                </Grid>
            </Border>

            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="295"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- SIDEBAR -->
                <Border Background="#11151F" BorderBrush="#1F2A44" BorderThickness="0,0,1,0">
                    <StackPanel>
                        <!-- Logo -->
                        <Border Margin="0,38,0,25" HorizontalAlignment="Center" Width="172" Height="172">
                            <Image x:Name="LogoImage" Stretch="Uniform"/>
                        </Border>

                        <!-- Menu -->
                        <StackPanel Margin="18,0">
                            <Button Height="58" Background="#1E2937" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="26,0">
                                    <TextBlock Text="🏠" FontSize="25" Width="40" Foreground="#67E8F9"/>
                                    <TextBlock Text="Dashboard" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                            <Button Height="58" Background="Transparent" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="26,0">
                                    <TextBlock Text="🔧" FontSize="25" Width="40"/>
                                    <TextBlock Text="Tools" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                            <Button Height="58" Background="Transparent" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="26,0">
                                    <TextBlock Text="💬" FontSize="25" Width="40"/>
                                    <TextBlock Text="Command Logs" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                            <Button Height="58" Background="Transparent" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="26,0">
                                    <TextBlock Text="⏻" FontSize="25" Width="40"/>
                                    <TextBlock Text="Exit Launcher" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                        </StackPanel>

                        <Separator Background="#1F2A44" Margin="28,40,28,20" Height="1"/>

                        <StackPanel Margin="28,0">
                            <TextBlock Text="Made by:" Foreground="#64748B" FontSize="13"/>
                            <TextBlock Text="Brammetje &amp; ItsDarknessz" Foreground="#67E8F9" FontSize="13.5" Margin="0,4,0,22"/>
                            <TextBlock Text="ICE SCANNER" Foreground="#67E8F9" FontSize="15.5" FontWeight="SemiBold"/>
                            <TextBlock Text="Version 1.0" Foreground="#94A3B8" FontSize="13"/>
                        </StackPanel>
                    </StackPanel>
                </Border>

                <!-- MAIN CONTENT -->
                <ScrollViewer Grid.Column="1" Margin="38,32,38,25" VerticalScrollBarVisibility="Auto">
                    <StackPanel>
                        <TextBlock Text="DASHBOARD" FontSize="37" FontWeight="Bold" Foreground="#F1F5F9"/>
                        <TextBlock Text="Welcome to ICE Scanner" Foreground="#94A3B8" FontSize="17.5" Margin="0,6,0,32"/>

                        <!-- System Status -->
                        <TextBlock Text="SYSTEM STATUS" FontSize="17" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,0,0,12"/>
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition/>
                                <ColumnDefinition/>
                            </Grid.ColumnDefinitions>

                            <Border Background="#1A2337" CornerRadius="12" Padding="22" Margin="0,0,16,0">
                                <StackPanel Orientation="Horizontal">
                                    <TextBlock Text="🛡️" FontSize="46" Margin="0,0,24,0" VerticalAlignment="Center"/>
                                    <StackPanel>
                                        <TextBlock Text="Administrator Privileges" Foreground="#F1F5F9" FontSize="15.5"/>
                                        <TextBlock Text="You have full administrative permissions." Foreground="#94A3B8" FontSize="13.5" Margin="0,6,0,0"/>
                                    </StackPanel>
                                    <Border Background="#22C55E" CornerRadius="20" Padding="20,6" Height="32" VerticalAlignment="Top" HorizontalAlignment="Right" Margin="60,8,0,0">
                                        <TextBlock Text="Active" Foreground="#000" FontWeight="Bold" FontSize="13"/>
                                    </Border>
                                </StackPanel>
                            </Border>

                            <Border Background="#1A2337" CornerRadius="12" Padding="22" Margin="16,0,0,0">
                                <StackPanel Orientation="Horizontal">
                                    <TextBlock Text="📶" FontSize="46" Margin="0,0,24,0" VerticalAlignment="Center"/>
                                    <StackPanel>
                                        <TextBlock Text="WiFi Connection" Foreground="#F1F5F9" FontSize="15.5"/>
                                        <TextBlock Text="Your internet connection is stable." Foreground="#94A3B8" FontSize="13.5" Margin="0,6,0,0"/>
                                    </StackPanel>
                                    <Border Background="#22C55E" CornerRadius="20" Padding="20,6" Height="32" VerticalAlignment="Top" HorizontalAlignment="Right" Margin="60,8,0,0">
                                        <TextBlock Text="Active" Foreground="#000" FontWeight="Bold" FontSize="13"/>
                                    </Border>
                                </StackPanel>
                            </Border>
                        </Grid>

                        <!-- Accounts -->
                        <TextBlock Text="ACCOUNTS" FontSize="18" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,32,0,12"/>
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition/>
                                <ColumnDefinition/>
                            </Grid.ColumnDefinitions>

                            <!-- Minecraft -->
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="0,0,16,0">
                                <StackPanel>
                                    <TextBlock Text="Minecraft Accounts" Foreground="#E2E8F0" FontSize="15" Margin="0,0,0,12"/>
                                    <UniformGrid Columns="2">
                                        <Border Background="#0F1625" CornerRadius="10" Padding="10" Margin="6">
                                            <StackPanel HorizontalAlignment="Center">
                                                <TextBlock Text="🧱" FontSize="52" HorizontalAlignment="Center"/>
                                                <TextBlock Text="ItsDarknessz" Foreground="#67E8F9" FontSize="13.5" HorizontalAlignment="Center" Margin="0,8,0,2"/>
                                                <TextBlock Text="Premium" Foreground="#22C55E" FontSize="12" HorizontalAlignment="Center"/>
                                            </StackPanel>
                                        </Border>
                                        <Border Background="#0F1625" CornerRadius="10" Padding="10" Margin="6">
                                            <StackPanel HorizontalAlignment="Center">
                                                <TextBlock Text="🧱" FontSize="52" HorizontalAlignment="Center"/>
                                                <TextBlock Text="DarknessDev" Foreground="#67E8F9" FontSize="13.5" HorizontalAlignment="Center" Margin="0,8,0,2"/>
                                                <TextBlock Text="Premium" Foreground="#22C55E" FontSize="12" HorizontalAlignment="Center"/>
                                            </StackPanel>
                                        </Border>
                                    </UniformGrid>
                                </StackPanel>
                            </Border>

                            <!-- Discord -->
                            <Border Background="#1A2337" CornerRadius="12" Padding="18">
                                <StackPanel>
                                    <TextBlock Text="Discord Accounts" Foreground="#E2E8F0" FontSize="15" Margin="0,0,0,12"/>
                                    <UniformGrid Columns="2">
                                        <Border Background="#0F1625" CornerRadius="10" Padding="10" Margin="6">
                                            <StackPanel HorizontalAlignment="Center">
                                                <TextBlock Text="👩" FontSize="52" HorizontalAlignment="Center"/>
                                                <TextBlock Text="ItsDarknessz" Foreground="#67E8F9" FontSize="13.5" HorizontalAlignment="Center" Margin="0,8,0,2"/>
                                                <TextBlock Text="123456789012345678" Foreground="#94A3B8" FontSize="11.5" HorizontalAlignment="Center"/>
                                            </StackPanel>
                                        </Border>
                                        <Border Background="#0F1625" CornerRadius="10" Padding="10" Margin="6">
                                            <StackPanel HorizontalAlignment="Center">
                                                <TextBlock Text="👩" FontSize="52" HorizontalAlignment="Center"/>
                                                <TextBlock Text="ItsDarknessz ALT" Foreground="#67E8F9" FontSize="13.5" HorizontalAlignment="Center" Margin="0,8,0,2"/>
                                                <TextBlock Text="987654321098765432" Foreground="#94A3B8" FontSize="11.5" HorizontalAlignment="Center"/>
                                            </StackPanel>
                                        </Border>
                                    </UniformGrid>
                                </StackPanel>
                            </Border>
                        </Grid>

                        <!-- Statistics -->
                        <TextBlock Text="STATISTICS" FontSize="18" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,32,0,12"/>
                        <UniformGrid Columns="4" Margin="0,0,0,35">
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="34" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Scans Run" Foreground="#94A3B8" FontSize="13"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="34" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Threats Found" Foreground="#94A3B8" FontSize="13"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="---" FontSize="34" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Last Scan" Foreground="#94A3B8" FontSize="13"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="34" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Files Scanned" Foreground="#94A3B8" FontSize="13"/>
                                </StackPanel>
                            </Border>
                        </UniformGrid>

                        <!-- Live Log -->
                        <TextBlock Text="LIVE LOG CONSOLE" FontSize="18" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,0,0,12"/>
                        <Border Background="#0F1625" CornerRadius="12" BorderBrush="#1F2A44" BorderThickness="1" Padding="20">
                            <TextBox Background="Transparent" BorderThickness="0" Foreground="#A1B0C8" FontFamily="Consolas" FontSize="13.8" IsReadOnly="True" Height="260" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto"
                                     Text="[12:45:01] [INFO] ICE Initializing...&#10;[12:45:01] [INFO] Administrator privileges detected.&#10;[12:45:01] [INFO] Internet connection stable.&#10;[12:45:02] [INFO] Discord detected.&#10;[12:45:02] [INFO] Minecraft installation found.&#10;[12:45:02] [READY] ICE Ready."/>
                        </Border>

                        <TextBlock Text="ICE SCANNER • BUILT FOR SECURITY" Foreground="#475569" HorizontalAlignment="Center" Margin="0,40,0,0" FontSize="13"/>
                    </StackPanel>
                </ScrollViewer>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Logo laden
$logo = $window.FindName("LogoImage")
$bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
$bitmap.BeginInit()
$bitmap.UriSource = New-Object System.Uri("https://files.catbox.moe/9v4p8k.png") # Vervang dit met een directe link naar je Ice.png als je wilt
$bitmap.CacheOption = "OnLoad"
$bitmap.EndInit()
$logo.Source = $bitmap

$window.Add_MouseLeftButtonDown({ $window.DragMove() })
$window.FindName("CloseBtn").Add_Click({ $window.Close() })
$window.FindName("MinBtn").Add_Click({ $window.WindowState = "Minimized" })

$window.ShowDialog() | Out-Null
