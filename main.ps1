Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="ICE Dashboard"
        Width="1100" Height="700"
        WindowStyle="None"
        ResizeMode="NoResize"
        Background="#0E0E10"
        FontFamily="Segoe UI">

    <Border CornerRadius="10" BorderBrush="#2A2A2A" BorderThickness="1" Background="#0E0E10">
        <Grid>

            <Grid.RowDefinitions>
                <RowDefinition Height="45"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- TOP BAR -->
            <Grid Background="#151518">
                <TextBlock Text="ICE DASHBOARD"
                           Foreground="White"
                           FontWeight="Bold"
                           VerticalAlignment="Center"
                           Margin="15,0,0,0"/>

                <StackPanel Orientation="Horizontal"
                            HorizontalAlignment="Right">

                    <Button Name="MinBtn" Content="_"
                            Width="40"
                            Background="Transparent"
                            Foreground="White"/>

                    <Button Name="CloseBtn" Content="X"
                            Width="40"
                            Background="Transparent"
                            Foreground="White"/>
                </StackPanel>
            </Grid>

            <!-- BODY -->
            <Grid Grid.Row="1">

                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="210"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- SIDEBAR -->
                <StackPanel Background="#121214">

                    <TextBlock Text="MENU"
                               Foreground="Gray"
                               Margin="12"
                               FontSize="11"/>

                    <Button Name="BtnDashboard" Content="Dashboard" Margin="8"/>
                    <Button Name="BtnTools" Content="Tools" Margin="8"/>
                    <Button Name="BtnLogs" Content="Logs" Margin="8"/>
                    <Button Name="BtnSettings" Content="Settings" Margin="8"/>
                </StackPanel>

                <!-- MAIN AREA -->
                <Grid Grid.Column="1" Margin="12">

                    <Grid.RowDefinitions>
                        <RowDefinition Height="120"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <!-- STATUS CARD -->
                    <Border Background="#1A1A1D" CornerRadius="8" Padding="12">
                        <StackPanel>
                            <TextBlock Name="TitleText"
                                       Text="Welcome back"
                                       FontSize="20"
                                       FontWeight="Bold"
                                       Foreground="White"/>

                            <TextBlock Name="SubText"
                                       Text="Select a module from the sidebar"
                                       Foreground="Gray"/>
                        </StackPanel>
                    </Border>

                    <!-- CONTENT -->
                    <Grid Grid.Row="1" Margin="0,12,0,0">

                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="2*"/>
                            <ColumnDefinition Width="1.2*"/>
                        </Grid.ColumnDefinitions>

                        <!-- TOOLS GRID -->
                        <Border Background="#16161A" CornerRadius="8" Margin="0,0,10,0">
                            <StackPanel Margin="12">

                                <TextBlock Text="TOOLS"
                                           Foreground="White"
                                           FontWeight="Bold"
                                           Margin="0,0,0,10"/>

                                <UniformGrid Columns="2">

                                    <Button Content="Scan System" Margin="6"/>
                                    <Button Content="Check Logs" Margin="6"/>
                                    <Button Content="User Check" Margin="6"/>
                                    <Button Content="Clean Temp" Margin="6"/>

                                </UniformGrid>

                            </StackPanel>
                        </Border>

                        <!-- LOG PANEL -->
                        <Border Grid.Column="1"
                                Background="#101012"
                                CornerRadius="8">

                            <StackPanel Margin="12">

                                <TextBlock Text="CONSOLE"
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

# LOAD UI
$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

# ELEMENTS
$CloseBtn = $window.FindName("CloseBtn")
$MinBtn   = $window.FindName("MinBtn")
$LogBox   = $window.FindName("LogBox")

$TitleText = $window.FindName("TitleText")
$SubText   = $window.FindName("SubText")

# LOG FUNCTION
function Log($msg){
    $LogBox.AppendText("[$(Get-Date -f HH:mm:ss)] $msg`n")
    $LogBox.ScrollToEnd()
}

# EVENTS
$CloseBtn.Add_Click({ $window.Close() })
$MinBtn.Add_Click({ $window.WindowState = "Minimized" })

$window.FindName("BtnDashboard").Add_Click({
    $TitleText.Text = "Dashboard"
    $SubText.Text = "System overview loaded"
    Log "Opened dashboard"
})

$window.FindName("BtnTools").Add_Click({
    $TitleText.Text = "Tools"
    $SubText.Text = "Tool module active"
    Log "Opened tools"
})

$window.FindName("BtnLogs").Add_Click({
    $TitleText.Text = "Logs"
    $SubText.Text = "Viewing system logs"
    Log "Opened logs"
})

$window.FindName("BtnSettings").Add_Click({
    $TitleText.Text = "Settings"
    $SubText.Text = "Configuration panel"
    Log "Opened settings"
})

# START
Log "ICE Dashboard initialized"
$window.ShowDialog() | Out-Null
