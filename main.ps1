Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="ICE CONTROL PANEL"
        Width="1200" Height="760"
        WindowStyle="None"
        Background="#0B0B0F"
        FontFamily="Segoe UI">

    <Border BorderBrush="#2B2B2B" BorderThickness="1" CornerRadius="10">

        <Grid>

            <Grid.RowDefinitions>
                <RowDefinition Height="45"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- TOP BAR -->
            <Grid Background="#15151C">

                <TextBlock Text="ICE CONTROL PANEL"
                           Foreground="White"
                           FontWeight="Bold"
                           VerticalAlignment="Center"
                           Margin="15,0,0,0"/>

                <StackPanel Orientation="Horizontal"
                            HorizontalAlignment="Right">

                    <Button Name="MinBtn" Content="_" Width="45" Background="Transparent" Foreground="White"/>
                    <Button Name="CloseBtn" Content="X" Width="45" Background="Transparent" Foreground="White"/>

                </StackPanel>

            </Grid>

            <!-- BODY -->
            <Grid Grid.Row="1">

                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="240"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- SIDEBAR -->
                <StackPanel Background="#12121A">

                    <TextBlock Text="NAVIGATION"
                               Foreground="Gray"
                               Margin="12"
                               FontSize="10"/>

                    <Button Name="BtnHome" Content="Dashboard" Margin="8"/>
                    <Button Name="BtnTools" Content="Tools Hub" Margin="8"/>
                    <Button Name="BtnScan" Content="System Scan" Margin="8"/>
                    <Button Name="BtnLogs" Content="Logs" Margin="8"/>
                    <Button Name="BtnUsers" Content="Users" Margin="8"/>
                    <Button Name="BtnSettings" Content="Settings" Margin="8"/>

                    <Separator Margin="10" Background="#333"/>

                    <TextBlock Text="STATUS"
                               Foreground="Gray"
                               Margin="12,10,0,0"
                               FontSize="10"/>

                    <TextBlock Name="StatusBadge"
                               Text="IDLE"
                               Foreground="#00FF7F"
                               Margin="12,5,0,0"
                               FontWeight="Bold"/>

                </StackPanel>

                <!-- MAIN -->
                <Grid Grid.Column="1" Margin="12">

                    <Grid.RowDefinitions>
                        <RowDefinition Height="120"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <!-- HEADER CARD -->
                    <Border Background="#181820" CornerRadius="8" Padding="14">

                        <StackPanel>
                            <TextBlock Name="Title"
                                       Text="Welcome to ICE"
                                       Foreground="White"
                                       FontSize="22"
                                       FontWeight="Bold"/>

                            <TextBlock Name="Sub"
                                       Text="Select a module from the left panel"
                                       Foreground="Gray"/>
                        </StackPanel>

                    </Border>

                    <!-- CONTENT GRID -->
                    <Grid Grid.Row="1" Margin="0,12,0,0">

                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="2.2*"/>
                            <ColumnDefinition Width="1.1*"/>
                        </Grid.ColumnDefinitions>

                        <!-- TOOL HUB -->
                        <Border Background="#14141B" CornerRadius="8" Margin="0,0,10,0">
                            <StackPanel Margin="12">

                                <TextBlock Text="TOOLS HUB"
                                           Foreground="White"
                                           FontWeight="Bold"
                                           Margin="0,0,0,10"/>

                                <UniformGrid Columns="2">

                                    <Button Content="Scan System" Margin="6"/>
                                    <Button Content="Process Check" Margin="6"/>
                                    <Button Content="Memory Dump" Margin="6"/>
                                    <Button Content="File Scan" Margin="6"/>
                                    <Button Content="Network Check" Margin="6"/>
                                    <Button Content="Cleanup" Margin="6"/>

                                </UniformGrid>

                            </StackPanel>
                        </Border>

                        <!-- LOG PANEL -->
                        <Border Grid.Column="1" Background="#0E0E13" CornerRadius="8">
                            <StackPanel Margin="12">

                                <TextBlock Text="CONSOLE OUTPUT"
                                           Foreground="Gray"
                                           Margin="0,0,0,6"/>

                                <TextBox Name="LogBox"
                                         Background="Transparent"
                                         BorderThickness="0"
                                         Foreground="#00FF7F"
                                         FontFamily="Consolas"
                                         IsReadOnly="True"
                                         TextWrapping="Wrap"
                                         VerticalScrollBarVisibility="Auto"/>
                            </StackPanel>
                        </Border>

                    </Grid>

                </Grid>
            </Grid>

        </Grid>

    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# ELEMENTS
$CloseBtn = $window.FindName("CloseBtn")
$MinBtn   = $window.FindName("MinBtn")
$LogBox   = $window.FindName("LogBox")

$Title    = $window.FindName("Title")
$Sub      = $window.FindName("Sub")
$Status   = $window.FindName("StatusBadge")

function Log($msg){
    $LogBox.AppendText("[$(Get-Date -f HH:mm:ss)] $msg`n")
    $LogBox.ScrollToEnd()
}

# NAV EVENTS
$window.FindName("BtnHome").Add_Click({
    $Title.Text = "Dashboard"
    $Sub.Text = "System overview active"
    $Status.Text = "IDLE"
    Log "Dashboard opened"
})

$window.FindName("BtnTools").Add_Click({
    $Title.Text = "Tools Hub"
    $Sub.Text = "Tool modules loaded"
    $Status.Text = "READY"
    Log "Tools opened"
})

$window.FindName("BtnScan").Add_Click({
    $Title.Text = "System Scan"
    $Sub.Text = "Scanning environment..."
    $Status.Text = "RUNNING"
    Log "Scan started"
})

$window.FindName("BtnLogs").Add_Click({
    $Title.Text = "Logs"
    $Sub.Text = "Viewing logs"
    Log "Logs opened"
})

$window.FindName("BtnUsers").Add_Click({
    $Title.Text = "Users"
    $Sub.Text = "User database loaded"
    Log "Users opened"
})

$window.FindName("BtnSettings").Add_Click({
    $Title.Text = "Settings"
    $Sub.Text = "Config panel active"
    Log "Settings opened"
})

# WINDOW EVENTS
$CloseBtn.Add_Click({ $window.Close() })
$MinBtn.Add_Click({ $window.WindowState = "Minimized" })

# START LOG
Log "ICE Control Panel initialized"
$window.ShowDialog() | Out-Null
