Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="ICE PANEL"
        Width="1100" Height="700"
        WindowStyle="None"
        ResizeMode="NoResize"
        Background="#0F0F0F"
        FontFamily="Segoe UI">

    <Border BorderBrush="#2C2C2C" BorderThickness="1" CornerRadius="8" Background="#0F0F0F">
        <Grid>

            <Grid.RowDefinitions>
                <RowDefinition Height="45"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>

            <!-- TOP BAR -->
            <Grid Background="#151515">
                <TextBlock Text="ICE PANEL"
                           VerticalAlignment="Center"
                           Margin="15,0,0,0"
                           Foreground="White"
                           FontWeight="Bold"/>

                <StackPanel Orientation="Horizontal"
                            HorizontalAlignment="Right">

                    <Button Name="MinBtn" Content="_"
                            Width="40" Background="Transparent"
                            Foreground="White"/>

                    <Button Name="CloseBtn" Content="X"
                            Width="40" Background="Transparent"
                            Foreground="White"/>
                </StackPanel>
            </Grid>

            <!-- BODY -->
            <Grid Grid.Row="1">

                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="220"/>
                    <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- SIDEBAR -->
                <StackPanel Background="#141414">

                    <TextBlock Text="MENU"
                               Foreground="Gray"
                               Margin="10"
                               FontSize="11"/>

                    <Button Name="BtnDashboard" Content="Dashboard" Margin="10"/>
                    <Button Name="BtnTools" Content="Tools" Margin="10"/>
                    <Button Name="BtnLogs" Content="Logs" Margin="10"/>
                </StackPanel>

                <!-- MAIN AREA -->
                <Grid Grid.Column="1" Margin="10">

                    <Grid.RowDefinitions>
                        <RowDefinition Height="120"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>

                    <!-- STATUS CARD -->
                    <Border Background="#1A1A1A" CornerRadius="6" Padding="10">
                        <StackPanel>
                            <TextBlock Name="StatusTitle"
                                       Text="Welcome"
                                       Foreground="White"
                                       FontSize="18"
                                       FontWeight="Bold"/>

                            <TextBlock Name="StatusSub"
                                       Text="Select a menu option"
                                       Foreground="Gray"/>
                        </StackPanel>
                    </Border>

                    <!-- CONTENT -->
                    <Grid Grid.Row="1" Margin="0,10,0,0">

                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="2*"/>
                            <ColumnDefinition Width="1*"/>
                        </Grid.ColumnDefinitions>

                        <!-- LEFT PANEL -->
                        <Border Background="#161616" CornerRadius="6" Margin="0,0,10,0">
                            <StackPanel Margin="10">

                                <TextBlock Text="TOOLS"
                                           Foreground="White"
                                           FontWeight="Bold"/>

                                <Button Content="Tool 1" Margin="5"/>
                                <Button Content="Tool 2" Margin="5"/>
                                <Button Content="Tool 3" Margin="5"/>
                            </StackPanel>
                        </Border>

                        <!-- LOG PANEL -->
                        <Border Grid.Column="1"
                                Background="#0D0D0D"
                                CornerRadius="6">

                            <StackPanel Margin="10">

                                <TextBlock Text="LOGS"
                                           Foreground="Gray"/>

                                <TextBox Name="LogBox"
                                         Background="Transparent"
                                         Foreground="Lime"
                                         BorderThickness="0"
                                         IsReadOnly="True"
                                         TextWrapping="Wrap"/>
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

# EVENTS
$CloseBtn = $window.FindName("CloseBtn")
$MinBtn   = $window.FindName("MinBtn")
$LogBox   = $window.FindName("LogBox")

function Log($msg){
    $LogBox.AppendText("[$(Get-Date -f HH:mm:ss)] $msg`n")
    $LogBox.ScrollToEnd()
}

$CloseBtn.Add_Click({ $window.Close() })
$MinBtn.Add_Click({ $window.WindowState = "Minimized" })

# Sidebar buttons
$window.FindName("BtnDashboard").Add_Click({
    Log "Dashboard opened"
})

$window.FindName("BtnTools").Add_Click({
    Log "Tools opened"
})

$window.FindName("BtnLogs").Add_Click({
    Log "Logs viewed"
})

$window.ShowDialog() | Out-Null
