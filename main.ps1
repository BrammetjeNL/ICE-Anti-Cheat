# ICE Scanner - Mooie XAML Dashboard
# Save as main.ps1

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Windows.Forms

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="ICE Scanner"
        Width="1280" Height="820"
        WindowStyle="None"
        ResizeMode="NoResize"
        Background="Transparent"
        AllowsTransparency="True"
        WindowStartupLocation="CenterScreen"
        FontFamily="Segoe UI">

    <Window.Resources>
        <SolidColorBrush x:Key="Bg" Color="#0A0C12"/>
        <SolidColorBrush x:Key="SidebarBg" Color="#11151F"/>
        <SolidColorBrush x:Key="CardBg" Color="#1A2337"/>
        <SolidColorBrush x:Key="Accent" Color="#67E8F9"/>
        <SolidColorBrush x:Key="TextMain" Color="#F1F5F9"/>
        <SolidColorBrush x:Key="TextMuted" Color="#94A3B8"/>
    </Window.Resources>

    <Border Background="{StaticResource Bg}" CornerRadius="12" BorderBrush="#1E2A44" BorderThickness="1">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="48"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- Title Bar -->
            <Border Grid.Row="0" Background="#0F1625" CornerRadius="12,12,0,0">
                <Grid>
                    <TextBlock Text="ICE SCANNER" Foreground="{StaticResource Accent}" FontWeight="Bold" FontSize="16"
                               VerticalAlignment="Center" Margin="20,0,0,0"/>
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,0,10,0">
                        <Button x:Name="MinBtn" Content="🗕" Width="40" Height="32" Background="Transparent" Foreground="#94A3B8" FontSize="14" BorderThickness="0"/>
                        <Button x:Name="CloseBtn" Content="✕" Width="40" Height="32" Background="Transparent" Foreground="#94A3B8" FontSize="14" BorderThickness="0"/>
                    </StackPanel>
                </Grid>
            </Border>

            <!-- Main Body -->
            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="280"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- SIDEBAR -->
                <Border Background="{StaticResource SidebarBg}" BorderBrush="#1E2A44" BorderThickness="0,0,1,0">
                    <StackPanel>
                        <!-- Logo -->
                        <Border Margin="0,40,0,20" HorizontalAlignment="Center">
                            <TextBlock Text="❄️" FontSize="110" Foreground="{StaticResource Accent}" HorizontalAlignment="Center"/>
                        </Border>

                        <!-- Menu -->
                        <StackPanel Margin="16,0">
                            <Button x:Name="BtnDashboard" Height="52" Background="#1E2937" BorderThickness="0" Margin="0,4">
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="🏠" FontSize="22" Width="32"/>
                                    <TextBlock Text="Dashboard" Foreground="{StaticResource TextMain}" FontSize="15" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                            <Button x:Name="BtnTools" Height="52" Background="Transparent" BorderThickness="0" Margin="0,4">
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="🔧" FontSize="22" Width="32"/>
                                    <TextBlock Text="Tools" Foreground="{StaticResource TextMain}" FontSize="15" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                            <Button x:Name="BtnLogs" Height="52" Background="Transparent" BorderThickness="0" Margin="0,4">
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="💬" FontSize="22" Width="32"/>
                                    <TextBlock Text="Command Logs" Foreground="{StaticResource TextMain}" FontSize="15" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                            <Button x:Name="BtnExit" Height="52" Background="Transparent" BorderThickness="0" Margin="0,4">
                                <StackPanel Orientation="Horizontal" Margin="20,0">
                                    <TextBlock Text="⏻" FontSize="22" Width="32"/>
                                    <TextBlock Text="Exit Launcher" Foreground="{StaticResource TextMain}" FontSize="15" VerticalAlignment="Center"/>
                                </StackPanel>
                            </Button>
                        </StackPanel>

                        <!-- Bottom -->
                        <StackPanel VerticalAlignment="Bottom" Margin="0,0,0,40">
                            <TextBlock Text="Made by:`nBrammetje &amp; ItsDarknessz" Foreground="#64748B" FontSize="13" TextAlignment="Center" Margin="0,0,0,12"/>
                            <TextBlock Text="ICE SCANNER`nVersion 1.0" Foreground="{StaticResource Accent}" FontSize="14" TextAlignment="Center"/>
                        </StackPanel>
                    </StackPanel>
                </Border>

                <!-- MAIN CONTENT -->
                <ScrollViewer Grid.Column="1" VerticalScrollBarVisibility="Auto" Margin="30,25,30,25">
                    <StackPanel>
                        <TextBlock Text="DASHBOARD" FontSize="32" FontWeight="Bold" Foreground="{StaticResource TextMain}"/>
                        <TextBlock Text="Welcome to ICE Scanner" Foreground="{StaticResource TextMuted}" FontSize="16.5" Margin="0,4,0,30"/>

                        <!-- System Status -->
                        <TextBlock Text="SYSTEM STATUS" FontSize="18" FontWeight="SemiBold" Foreground="{StaticResource TextMain}" Margin="0,0,0,12"/>
                        <Grid Margin="0,0,0,35">
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition/>
                                <ColumnDefinition/>
                            </Grid.ColumnDefinitions>

                            <!-- Admin Card -->
                            <Border Background="{StaticResource CardBg}" CornerRadius="14" Padding="22" Margin="0,0,14,0">
                                <StackPanel Orientation="Horizontal">
                                    <TextBlock Text="🛡️" FontSize="46" Margin="0,0,20,0" VerticalAlignment="Center"/>
                                    <StackPanel>
                                        <TextBlock Text="Administrator Privileges" Foreground="{StaticResource TextMain}" FontSize="15.5"/>
                                        <TextBlock Text="You have full administrative permissions." Foreground="{StaticResource TextMuted}" FontSize="13.5"/>
                                    </StackPanel>
                                    <Border Background="#22C55E" CornerRadius="20" Padding="16,6" Height="30" VerticalAlignment="Top" HorizontalAlignment="Right" Margin="0,8,0,0">
                                        <TextBlock Text="Active" Foreground="#000" FontWeight="Bold"/>
                                    </Border>
                                </StackPanel>
                            </Border>

                            <!-- WiFi Card -->
                            <Border Background="{StaticResource CardBg}" CornerRadius="14" Padding="22" Margin="14,0,0,0">
                                <StackPanel Orientation="Horizontal">
                                    <TextBlock Text="📶" FontSize="46" Margin="0,0,20,0" VerticalAlignment="Center"/>
                                    <StackPanel>
                                        <TextBlock Text="WiFi Connection" Foreground="{StaticResource TextMain}" FontSize="15.5"/>
                                        <TextBlock Text="Your internet connection is stable." Foreground="{StaticResource TextMuted}" FontSize="13.5"/>
                                    </StackPanel>
                                    <Border Background="#22C55E" CornerRadius="20" Padding="16,6" Height="30" VerticalAlignment="Top" HorizontalAlignment="Right" Margin="0,8,0,0">
                                        <TextBlock Text="Active" Foreground="#000" FontWeight="Bold"/>
                                    </Border>
                                </StackPanel>
                            </Border>
                        </Grid>

                        <!-- Accounts -->
                        <TextBlock Text="ACCOUNTS" FontSize="19" FontWeight="SemiBold" Foreground="{StaticResource TextMain}" Margin="0,0,0,12"/>
                        <UniformGrid Columns="4" Margin="0,0,0,35">
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="12" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="🧱" FontSize="42" HorizontalAlignment="Center"/>
                                    <TextBlock Text="ItsDarknessz" Foreground="{StaticResource TextMain}" FontSize="14" HorizontalAlignment="Center" Margin="0,8,0,0"/>
                                    <TextBlock Text="Premium" Foreground="{StaticResource Accent}" FontSize="12" HorizontalAlignment="Center"/>
                                </StackPanel>
                            </Border>
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="12" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="🧱" FontSize="42" HorizontalAlignment="Center"/>
                                    <TextBlock Text="DarknessDev" Foreground="{StaticResource TextMain}" FontSize="14" HorizontalAlignment="Center" Margin="0,8,0,0"/>
                                    <TextBlock Text="Premium" Foreground="{StaticResource Accent}" FontSize="12" HorizontalAlignment="Center"/>
                                </StackPanel>
                            </Border>
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="12" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="👩" FontSize="42" HorizontalAlignment="Center"/>
                                    <TextBlock Text="ItsDarknessz" Foreground="{StaticResource TextMain}" FontSize="14" HorizontalAlignment="Center" Margin="0,8,0,0"/>
                                    <TextBlock Text="123456789012345678" Foreground="{StaticResource Accent}" FontSize="12" HorizontalAlignment="Center"/>
                                </StackPanel>
                            </Border>
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="12" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="👩" FontSize="42" HorizontalAlignment="Center"/>
                                    <TextBlock Text="ItsDarknessz ALT" Foreground="{StaticResource TextMain}" FontSize="14" HorizontalAlignment="Center" Margin="0,8,0,0"/>
                                    <TextBlock Text="987654321098765432" Foreground="{StaticResource Accent}" FontSize="12" HorizontalAlignment="Center"/>
                                </StackPanel>
                            </Border>
                        </UniformGrid>

                        <!-- Statistics -->
                        <TextBlock Text="STATISTICS" FontSize="19" FontWeight="SemiBold" Foreground="{StaticResource TextMain}" Margin="0,0,0,12"/>
                        <UniformGrid Columns="4" Margin="0,0,0,35">
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="32" FontWeight="Bold" Foreground="{StaticResource Accent}"/>
                                    <TextBlock Text="Scans Run" Foreground="{StaticResource TextMuted}" FontSize="13"/>
                                </StackPanel>
                            </Border>
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="32" FontWeight="Bold" Foreground="{StaticResource Accent}"/>
                                    <TextBlock Text="Threats Found" Foreground="{StaticResource TextMuted}" FontSize="13"/>
                                </StackPanel>
                            </Border>
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="---" FontSize="32" FontWeight="Bold" Foreground="{StaticResource Accent}"/>
                                    <TextBlock Text="Last Scan" Foreground="{StaticResource TextMuted}" FontSize="13"/>
                                </StackPanel>
                            </Border>
                            <Border Background="{StaticResource CardBg}" CornerRadius="12" Padding="16" Margin="6">
                                <StackPanel HorizontalAlignment="Center">
                                    <TextBlock Text="0" FontSize="32" FontWeight="Bold" Foreground="{StaticResource Accent}"/>
                                    <TextBlock Text="Files Scanned" Foreground="{StaticResource TextMuted}" FontSize="13"/>
                                </StackPanel>
                            </Border>
                        </UniformGrid>

                        <!-- Live Log -->
                        <TextBlock Text="LIVE LOG CONSOLE" FontSize="19" FontWeight="SemiBold" Foreground="{StaticResource TextMain}" Margin="0,0,0,10"/>
                        <Border Background="#0F1625" CornerRadius="14" BorderBrush="#1E2A44" BorderThickness="1" Padding="18">
                            <TextBox x:Name="LogBox" Background="Transparent" BorderThickness="0" Foreground="#CBD5E1" FontFamily="Consolas" FontSize="13.5" IsReadOnly="True" Height="240" TextWrapping="Wrap" VerticalScrollBarVisibility="Auto"
                                     Text="[12:45:01] [INFO] ICE Initializing...&#x0a;[12:45:01] [INFO] Administrator privileges detected.&#x0a;[12:45:01] [INFO] Internet connection stable.&#x0a;[12:45:02] [INFO] Discord detected.&#x0a;[12:45:02] [INFO] Minecraft installation found.&#x0a;[12:45:02] [READY] ICE Ready."/>
                        </Border>

                        <TextBlock Text="ICE SCANNER • BUILT FOR SECURITY" Foreground="#475569" HorizontalAlignment="Center" Margin="0,30,0,0" FontSize="12"/>
                    </StackPanel>
                </ScrollViewer>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# Window Controls
$window.Add_MouseLeftButtonDown({ $window.DragMove() })
$window.FindName("CloseBtn").Add_Click({ $window.Close() })
$window.FindName("MinBtn").Add_Click({ $window.WindowState = "Minimized" })

$window.ShowDialog() | Out-Null
