# ICE Scanner - Volledige Startpagina (Dashboard) replica
# Save as main.ps1

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="ICE Scanner"
        Width="1380" Height="900"
        WindowStyle="None"
        ResizeMode="NoResize"
        Background="Transparent"
        AllowsTransparency="True"
        WindowStartupLocation="CenterScreen">

    <Border Background="#0A0C12" CornerRadius="14" BorderBrush="#1F2A44" BorderThickness="1">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="52"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Background="#0F1625" CornerRadius="14,14,0,0">
                <Grid>
                    <TextBlock Text="ICE SCANNER" Foreground="#67E8F9" FontWeight="Bold" FontSize="17.5" VerticalAlignment="Center" Margin="28,0,0,0"/>
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,0,12,0">
                        <Button x:Name="MinBtn" Content="🗕" Width="46" Height="34" Background="Transparent" Foreground="#94A3B8" BorderThickness="0" FontSize="16"/>
                        <Button x:Name="CloseBtn" Content="✕" Width="46" Height="34" Background="Transparent" Foreground="#94A3B8" BorderThickness="0" FontSize="18"/>
                    </StackPanel>
                </Grid>
            </Border>

            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="290"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- SIDEBAR -->
                <Border Background="#11151F" BorderBrush="#1F2A44" BorderThickness="0,0,1,0">
                    <StackPanel>
                        <!-- Logo -->
                        <Border Margin="0,32,0,22" HorizontalAlignment="Center" Width="168" Height="168">
                            <Image x:Name="LogoImage" Stretch="Uniform"/>
                        </Border>

                        <!-- Menu -->
                        <StackPanel Margin="16,0">
                            <Button Height="56" Background="#1E2937" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="24,0">
                                    <TextBlock Text="🏠" FontSize="24" Width="38" Foreground="#67E8F9"/>
                                    <TextBlock Text="Dashboard" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                            <Button Height="56" Background="Transparent" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="24,0">
                                    <TextBlock Text="🔧" FontSize="24" Width="38"/>
                                    <TextBlock Text="Tools" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                            <Button Height="56" Background="Transparent" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="24,0">
                                    <TextBlock Text="💬" FontSize="24" Width="38"/>
                                    <TextBlock Text="Command Logs" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                            <Button Height="56" Background="Transparent" BorderThickness="0" Margin="4,6">
                                <StackPanel Orientation="Horizontal" Margin="24,0">
                                    <TextBlock Text="⏻" FontSize="24" Width="38"/>
                                    <TextBlock Text="Exit Launcher" Foreground="#E2E8F0" FontSize="15.5" VerticalAlignment="Center" Margin="12,0,0,0"/>
                                </StackPanel>
                            </Button>
                        </StackPanel>

                        <Separator Background="#1F2A44" Margin="25,35,25,15" Height="1"/>

                        <!-- Bottom -->
                        <StackPanel Margin="25,0,25,35">
                            <TextBlock Text="Made by:" Foreground="#64748B" FontSize="13"/>
                            <TextBlock Text="Brammetje &amp; ItsDarknessz" Foreground="#67E8F9" FontSize="13.5" Margin="0,4,0,20"/>
                            <TextBlock Text="ICE SCANNER" Foreground="#67E8F9" FontSize="15" FontWeight="SemiBold"/>
                            <TextBlock Text="Version 1.0" Foreground="#94A3B8" FontSize="13"/>
                        </StackPanel>
                    </StackPanel>
                </Border>

                <!-- MAIN DASHBOARD -->
                <ScrollViewer Grid.Column="1" Margin="35,30,35,25" VerticalScrollBarVisibility="Auto">
                    <StackPanel>
                        <TextBlock Text="DASHBOARD" FontSize="36" FontWeight="Bold" Foreground="#F1F5F9"/>
                        <TextBlock Text="Welcome to ICE Scanner" Foreground="#94A3B8" FontSize="17.5" Margin="0,6,0,30"/>

                        <!-- System Status + Accounts -->
                        <Grid Margin="0,0,0,25">
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="Auto"/>
                                <ColumnDefinition Width="*"/>
                            </Grid.ColumnDefinitions>

                            <!-- System Status -->
                            <StackPanel Margin="0,0,25,0">
                                <TextBlock Text="SYSTEM STATUS" FontSize="17" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,0,0,12"/>

                                <Border Background="#1A2337" CornerRadius="12" Padding="20" Margin="0,0,0,14">
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock Text="🛡️" FontSize="44" Margin="0,0,22,0" VerticalAlignment="Center"/>
                                        <StackPanel>
                                            <TextBlock Text="Administrator Privileges" Foreground="#F1F5F9" FontSize="15.5"/>
                                            <TextBlock Text="You have full administrative permissions." Foreground="#94A3B8" FontSize="13.5" Margin="0,6,0,0"/>
                                        </StackPanel>
                                        <Border Background="#22C55E" CornerRadius="20" Padding="18,6" Height="30" VerticalAlignment="Top" HorizontalAlignment="Right" Margin="50,6,0,0">
                                            <TextBlock Text="Active" Foreground="#000" FontWeight="Bold" FontSize="12.5"/>
                                        </Border>
                                    </StackPanel>
                                </Border>

                                <Border Background="#1A2337" CornerRadius="12" Padding="20">
                                    <StackPanel Orientation="Horizontal">
                                        <TextBlock Text="📶" FontSize="44" Margin="0,0,22,0" VerticalAlignment="Center"/>
                                        <StackPanel>
                                            <TextBlock Text="WiFi Connection" Foreground="#F1F5F9" FontSize="15.5"/>
                                            <TextBlock Text="Your internet connection is stable." Foreground="#94A3B8" FontSize="13.5" Margin="0,6,0,0"/>
                                        </StackPanel>
                                        <Border Background="#22C55E" CornerRadius="20" Padding="18,6" Height="30" VerticalAlignment="Top" HorizontalAlignment="Right" Margin="50,6,0,0">
                                            <TextBlock Text="Active" Foreground="#000" FontWeight="Bold" FontSize="12.5"/>
                                        </Border>
                                    </StackPanel>
                                </Border>
                            </StackPanel>

                            <!-- Minecraft & Discord Accounts -->
                            <StackPanel Grid.Column="1">
                                <Grid>
                                    <Grid.ColumnDefinitions>
                                        <ColumnDefinition/>
                                        <ColumnDefinition/>
                                    </Grid.ColumnDefinitions>

                                    <!-- Minecraft Accounts -->
                                    <Border Background="#1A2337" CornerRadius="12" Padding="16" Margin="0,0,12,0">
                                        <StackPanel>
                                            <StackPanel Orientation="Horizontal" Margin="0,0,0,12">
                                                <TextBlock Text="👤" FontSize="18"/>
                                                <TextBlock Text="Minecraft Accounts" Foreground="#E2E8F0" FontSize="15" Margin="8,0,0,0" VerticalAlignment="Center"/>
                                            </StackPanel>
                                            <UniformGrid Columns="2">
                                                <Border Margin="4" Background="#0F1625" CornerRadius="8" Padding="8">
                                                    <StackPanel HorizontalAlignment="Center">
                                                        <TextBlock Text="🧱" FontSize="48" HorizontalAlignment="Center"/>
                                                        <TextBlock Text="ItsDarknessz" Foreground="#67E8F9" FontSize="13" HorizontalAlignment="Center" Margin="0,6,0,0"/>
                                                        <TextBlock Text="Premium" Foreground="#22C55E" FontSize="11.5" HorizontalAlignment="Center"/>
                                                    </StackPanel>
                                                </Border>
                                                <Border Margin="4" Background="#0F1625" CornerRadius="8" Padding="8">
                                                    <StackPanel HorizontalAlignment="Center">
                                                        <TextBlock Text="🧱" FontSize="48" HorizontalAlignment="Center"/>
                                                        <TextBlock Text="DarknessDev" Foreground="#67E8F9" FontSize="13" HorizontalAlignment="Center" Margin="0,6,0,0"/>
                                                        <TextBlock Text="Premium" Foreground="#22C55E" FontSize="11.5" HorizontalAlignment="Center"/>
                                                    </StackPanel>
                                                </Border>
                                            </UniformGrid>
                                        </StackPanel>
                                    </Border>

                                    <!-- Discord Accounts -->
                                    <Border Background="#1A2337" CornerRadius="12" Padding="16">
                                        <StackPanel>
                                            <StackPanel Orientation="Horizontal" Margin="0,0,0,12">
                                                <TextBlock Text="💬" FontSize="18"/>
                                                <TextBlock Text="Discord Accounts" Foreground="#E2E8F0" FontSize="15" Margin="8,0,0,0" VerticalAlignment="Center"/>
                                            </StackPanel>
                                            <UniformGrid Columns="2">
                                                <Border Margin="4" Background="#0F1625" CornerRadius="8" Padding="8">
                                                    <StackPanel HorizontalAlignment="Center">
                                                        <TextBlock Text="👩" FontSize="48" HorizontalAlignment="Center"/>
                                                        <TextBlock Text="ItsDarknessz" Foreground="#67E8F9" FontSize="13" HorizontalAlignment="Center" Margin="0,6,0,0"/>
                                                        <TextBlock Text="123456789012345678" Foreground="#94A3B8" FontSize="11" HorizontalAlignment="Center"/>
                                                    </StackPanel>
                                                </Border>
                                                <Border Margin="4" Background="#0F1625" CornerRadius="8" Padding="8">
                                                    <StackPanel HorizontalAlignment="Center">
                                                        <TextBlock Text="👩" FontSize="48" HorizontalAlignment="Center"/>
                                                        <TextBlock Text="ItsDarknessz ALT" Foreground="#67E8F9" FontSize="13" HorizontalAlignment="Center" Margin="0,6,0,0"/>
                                                        <TextBlock Text="987654321098765432" Foreground="#94A3B8" FontSize="11" HorizontalAlignment="Center"/>
                                                    </StackPanel>
                                                </Border>
                                            </UniformGrid>
                                        </StackPanel>
                                    </Border>
                                </Grid>
                            </StackPanel>
                        </Grid>

                        <!-- Statistics -->
                        <TextBlock Text="STATISTICS" FontSize="17" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,0,0,12"/>
                        <UniformGrid Columns="4" Margin="0,0,0,30">
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="32" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Scans Run" Foreground="#94A3B8" FontSize="13" Margin="0,4,0,0"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="32" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Threats Found" Foreground="#94A3B8" FontSize="13" Margin="0,4,0,0"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="---" FontSize="32" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Last Scan" Foreground="#94A3B8" FontSize="13" Margin="0,4,0,0"/>
                                </StackPanel>
                            </Border>
                            <Border Background="#1A2337" CornerRadius="12" Padding="18" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="32" FontWeight="Bold" Foreground="#67E8F9"/>
                                    <TextBlock Text="Files Scanned" Foreground="#94A3B8" FontSize="13" Margin="0,4,0,0"/>
                                </StackPanel>
                            </Border>
                        </UniformGrid>

                        <!-- Live Log Console -->
                        <TextBlock Text="LIVE LOG CONSOLE" FontSize="18" FontWeight="SemiBold" Foreground="#E2E8F0" Margin="0,0,0,12"/>
                        <Border Background="#0F1625" CornerRadius="12" BorderBrush="#1F2A44" BorderThickness="1" Padding="18">
                            <TextBox Background="Transparent" BorderThickness="0" Foreground="#A1B0C8" FontFamily="Consolas" FontSize="13.8" IsReadOnly="True" Height="260" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto"
                                     Text="[12:45:01] [INFO] ICE Initializing...&#10;[12:45:01] [INFO] Administrator privileges detected.&#10;[12:45:01] [INFO] Internet connection stable.&#10;[12:45:02] [INFO] Discord detected.&#10;[12:45:02] [INFO] Minecraft installation found.&#10;[12:45:02] [READY] ICE Ready."/>
                        </Border>

                        <TextBlock Text="ICE SCANNER • BUILT FOR SECURITY" Foreground="#475569" HorizontalAlignment="Center" Margin="0,35,0,0" FontSize="13"/>
                    </StackPanel>
                </ScrollViewer>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Laad jouw logo
$logo = $window.FindName("LogoImage")
$bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
$bitmap.BeginInit()
$bitmap.UriSource = New-Object System.Uri("https://files.catbox.moe/9v4p8k.png") # tijdelijke link - vervang later met jouw logo
$bitmap.EndInit()
$logo.Source = $bitmap

$window.Add_MouseLeftButtonDown({ $window.DragMove() })
$window.FindName("CloseBtn").Add_Click({ $window.Close() })
$window.FindName("MinBtn").Add_Click({ $window.WindowState = "Minimized" })

$window.ShowDialog() | Out-Null
