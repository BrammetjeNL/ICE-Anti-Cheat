#Requires -Version 5.1
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Net.Http

# ─────────────────────────────────────────────
#  Firebase Config
# ─────────────────────────────────────────────
$global:FB_PROJECT  = "ice-anti-cheat"
$global:FB_DB_URL   = "https://ice-anticheat-default-rtdb.europe-west1.firebasedatabase.app"
$global:FB_API_KEY  = "AIzaSyAk-axuPu5AKuZi9F0p2Ksk60o8GAWKS94"

# ─────────────────────────────────────────────
#  Tool Definitions
# ─────────────────────────────────────────────
$global:Tools = @(
    @{ Name="PrefetchView";          Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/PrefetchView/releases/latest" },
    @{ Name="BAMReveal";             Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/BAMReveal/releases/latest" },
    @{ Name="StringsParser";         Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/StringsParser/releases/latest" },
    @{ Name="Fileless";              Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/Fileless/releases/latest" },
    @{ Name="DPS-Analyzer";          Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/DPS-Analyzer/releases/latest" },
    @{ Name="UserAssistView";        Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/UserAssistView/releases/latest" },
    @{ Name="JournalParser";         Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/JournalParser/releases/latest" },
    @{ Name="InjGen";                Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/InjGen/releases/latest" },
    @{ Name="USBDetector";           Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/USBDetector/releases/latest" },
    @{ Name="PFTrace";               Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/PFTrace/releases/latest" },
    @{ Name="CheckDeletedUSN";       Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/CheckDeletedUSN/releases/latest" },
    @{ Name="JARParser";             Category="Orbdiff";      Type="GitHub"; URL="https://github.com/Orbdiff/JARParser/releases/latest" },
    @{ Name="BAM-parser";            Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/BAM-parser/releases/latest" },
    @{ Name="PathsParser";           Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/PathsParser/releases/latest" },
    @{ Name="JournalTrace";          Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/JournalTrace/releases/latest" },
    @{ Name="KernelLiveDumpTool";    Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/KernelLiveDumpTool/releases/latest" },
    @{ Name="BamDeletedKeys";        Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/BamDeletedKeys/releases/latest" },
    @{ Name="Espouken Tool";         Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/Tool/releases/latest" },
    @{ Name="pcasvc-executed";       Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/pcasvc-executed/releases/latest" },
    @{ Name="process-parser";        Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/process-parser/releases/latest" },
    @{ Name="prefetch-parser";       Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/prefetch-parser/releases/latest" },
    @{ Name="ActivitiesCache";       Category="Spokwn";       Type="GitHub"; URL="https://github.com/spokwn/ActivitiesCache-execution/releases/latest" },
    @{ Name="MeowDoomsdayFucker";    Category="Tonynoh";      Type="GitHub"; URL="https://github.com/MeowTonynoh/MeowDoomsdayFucker/releases/latest" },
    @{ Name="MeowModAnalyzer";       Category="Tonynoh";      Type="Cmd";    Command="Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/MeowTonynoh/MeowModAnalyzer/main/MeowModAnalyzer.ps1')" },
    @{ Name="MeowResolver";          Category="Tonynoh";      Type="GitHub"; URL="https://github.com/MeowTonynoh/MeowResolver/releases/latest" },
    @{ Name="MeowNovowareFucker";    Category="Tonynoh";      Type="GitHub"; URL="https://github.com/MeowTonynoh/MeowNovowareFucker/releases/latest" },
    @{ Name="MeowImportsChecker";    Category="Tonynoh";      Type="GitHub"; URL="https://github.com/MeowTonynoh/MeowImportsChecker/releases/latest" },
    @{ Name="MeowClientsFucker";     Category="Tonynoh";      Type="GitHub"; URL="https://github.com/MeowTonynoh/MeowClientFucker/releases/latest" },
    @{ Name="PSHunter";              Category="Praiselily";   Type="GitHub"; URL="https://github.com/praiselily/PSHunter/releases/latest" },
    @{ Name="AltDetector";           Category="Praiselily";   Type="GitHub"; URL="https://github.com/praiselily/AltDetector/releases/latest" },
    @{ Name="WeHateFakers";          Category="Praiselily";   Type="Cmd";    Command="iwr https://raw.githubusercontent.com/praiselily/WeHateFakers/refs/heads/main/HotspotLogs.ps1 | iex" },
    @{ Name="CommonDirectories";     Category="Praiselily";   Type="Cmd";    Command="Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/praiselily/lilith-ps/refs/heads/main/CommonDirectories.ps1')" },
    @{ Name="HarddiskConverter";     Category="Praiselily";   Type="Cmd";    Command="Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/praiselily/lilith-ps/refs/heads/main/HarddiskConverter.ps1')" },
    @{ Name="Services";              Category="Praiselily";   Type="Cmd";    Command="Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/praiselily/lilith-ps/refs/heads/main/Services.ps1')" },
    @{ Name="SignedScheduledTasks";  Category="Praiselily";   Type="Cmd";    Command="Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/praiselily/lilith-ps/refs/heads/main/Signed-Scheduled-Tasks.ps1')" },
    @{ Name="RL ModAnalyzer";        Category="RedLotus";     Type="GitHub"; URL="https://github.com/ItzIceHere/RedLotus-Mod-Analyzer/releases/latest" },
    @{ Name="RL TaskSentinel";       Category="RedLotus";     Type="GitHub"; URL="https://github.com/ItzIceHere/RedLotus-Task-Sentinel/releases/latest" },
    @{ Name="RL AltChecker";         Category="RedLotus";     Type="GitHub"; URL="https://github.com/ItzIceHere/RedLotusAltChecker/releases/latest" },
    @{ Name="ComputerActivityView";  Category="Others";       Type="Web";    URL="https://www.nirsoft.net/utils/computer_activity_view.html" },
    @{ Name="AmcacheParser";         Category="Others";       Type="Web";    URL="https://download.ericzimmermanstools.com/net9/AmcacheParser.zip" },
    @{ Name="SystemInformer";        Category="Others";       Type="Link";   URL="https://www.systeminformer.com/canary" },
    @{ Name="DIE-engine";            Category="Others";       Type="Web";    URL="https://github.com/horsicq/DIE-engine/releases" },
    @{ Name="DQRKIS-FUCKER";         Category="Others";       Type="Cmd";    Command="Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/cheesecatlol/DQRKIS-FUCKER/refs/heads/main/DqrkisFucker.ps1')" },
    @{ Name="MacroDetector";         Category="Others";       Type="Cmd";    Command="Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/NiccBlahh/MacroDetector/refs/heads/main/MacroDetector.ps1')" },
    @{ Name="bstrings";              Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/bstrings.zip" },
    @{ Name="JLECmd";                Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/JLECmd.zip" },
    @{ Name="JumpListExplorer";      Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/JumpListExplorer.zip" },
    @{ Name="MFTECmd";               Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/MFTECmd.zip" },
    @{ Name="PECmd";                 Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/PECmd.zip" },
    @{ Name="RecentFileCacheParser"; Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/RecentFileCacheParser.zip" },
    @{ Name="RegistryExplorer";      Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/RegistryExplorer.zip" },
    @{ Name="ShellBagsExplorer";     Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/ShellBagsExplorer.zip" },
    @{ Name="SrumECmd";              Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/SrumECmd.zip" },
    @{ Name="TimelineExplorer";      Category="Zimmerman";    Type="Web";    URL="https://download.ericzimmermanstools.com/net9/TimelineExplorer.zip" },
    @{ Name="FullEventLogView";      Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/fulleventlogview.zip" },
    @{ Name="NetworkUsageView";      Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/networkusageview.zip" },
    @{ Name="BrowserDownloadsView";  Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/browserdownloadsview.zip" },
    @{ Name="AlternateStreamView";   Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/alternatestreamview.zip" },
    @{ Name="USBDeview";             Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/usbdeview.zip" },
    @{ Name="OpenSaveFilesView";     Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/opensavefilesview.zip" },
    @{ Name="ExecutedProgramsList";  Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/executedprogramslist.zip" },
    @{ Name="TaskSchedulerView";     Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/taskschedulerview.zip" },
    @{ Name="JumpListsView";         Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/jumplistsview.zip" },
    @{ Name="WinPrefetchView";       Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/winprefetchview.zip" },
    @{ Name="RegScanner";            Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/regscanner.zip" },
    @{ Name="ShellBagsView";         Category="NirSoft";      Type="Web";    URL="https://www.nirsoft.net/utils/shellbagsview.zip" }
)

# ─────────────────────────────────────────────
#  Helpers
# ─────────────────────────────────────────────
function Add-Log {
    param([string]$Message, [string]$Level = "INFO")
    $ts = (Get-Date).ToString("HH:mm:ss")
    $color = switch ($Level) {
        "INFO"    { "#4FC3F7" }
        "OK"      { "#66BB6A" }
        "WARN"    { "#FFA726" }
        "ERROR"   { "#EF5350" }
        "READY"   { "#66BB6A" }
        default   { "#B0BEC5" }
    }
    $global:Window.Dispatcher.Invoke([action]{
        $run1 = New-Object System.Windows.Documents.Run
        $run1.Text = "[$ts] "
        $run1.Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#607D8B")

        $run2 = New-Object System.Windows.Documents.Run
        $run2.Text = "[$Level] "
        $run2.Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString($color)

        $run3 = New-Object System.Windows.Documents.Run
        $run3.Text = $Message
        $run3.Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#CFD8DC")

        $para = New-Object System.Windows.Documents.Paragraph
        $para.Margin = [System.Windows.Thickness]::new(0,1,0,1)
        $para.Inlines.Add($run1)
        $para.Inlines.Add($run2)
        $para.Inlines.Add($run3)

        $global:LogDoc.Blocks.Add($para)
        $global:LogBox.ScrollToEnd()
    })
}

function Get-FirebaseStat {
    param([string]$Path)
    try {
        $url = "$global:FB_DB_URL/$Path.json?auth=$global:FB_API_KEY"
        $resp = Invoke-RestMethod -Uri $url -Method GET -TimeoutSec 5
        return $resp
    } catch { return $null }
}

function Set-FirebaseStat {
    param([string]$Path, $Value)
    try {
        $url = "$global:FB_DB_URL/$Path.json?auth=$global:FB_API_KEY"
        $body = $Value | ConvertTo-Json -Compress
        Invoke-RestMethod -Uri $url -Method PUT -Body $body -ContentType "application/json" -TimeoutSec 5 | Out-Null
    } catch {}
}

function Get-MinecraftAccounts {
    $accounts = @()
    # Minecraft launcher accounts.json locations
    $paths = @(
        "$env:APPDATA\.minecraft\launcher_accounts.json",
        "$env:APPDATA\.minecraft\launcher_profiles.json"
    )
    foreach ($p in $paths) {
        if (Test-Path $p) {
            try {
                $json = Get-Content $p -Raw | ConvertFrom-Json
                # New launcher format
                if ($json.accounts) {
                    $json.accounts.PSObject.Properties | ForEach-Object {
                        $acc = $_.Value
                        $accounts += [PSCustomObject]@{
                            Name = if ($acc.minecraftProfile.name) { $acc.minecraftProfile.name } else { $acc.username }
                            UUID = if ($acc.minecraftProfile.id)   { $acc.minecraftProfile.id }   else { "" }
                            Type = if ($acc.type -eq "Microsoft") { "Microsoft" } else { "Legacy" }
                        }
                    }
                }
                # Old launcher format
                if ($json.authenticationDatabase) {
                    $json.authenticationDatabase.PSObject.Properties | ForEach-Object {
                        $acc = $_.Value
                        $accounts += [PSCustomObject]@{
                            Name = $acc.displayName
                            UUID = $_.Name
                            Type = "Legacy"
                        }
                    }
                }
            } catch {}
        }
    }
    # Also check for Lunar / Badlion / other launchers
    $lunarPath = "$env:APPDATA\.lunarclient\settings\game\accounts.json"
    if (Test-Path $lunarPath) {
        try {
            $json = Get-Content $lunarPath -Raw | ConvertFrom-Json
            if ($json) {
                $json | ForEach-Object {
                    $accounts += [PSCustomObject]@{
                        Name = $_.username
                        UUID = $_.uuid
                        Type = "Lunar"
                    }
                }
            }
        } catch {}
    }
    return $accounts
}

function Get-DiscordAccounts {
    $accounts = @()
    $discordPaths = @(
        "$env:APPDATA\discord\Local Storage\leveldb",
        "$env:APPDATA\discordcanary\Local Storage\leveldb",
        "$env:APPDATA\discordptb\Local Storage\leveldb"
    )
    foreach ($dp in $discordPaths) {
        if (Test-Path $dp) {
            $variant = Split-Path (Split-Path $dp -Parent) -Leaf
            $accounts += [PSCustomObject]@{
                Name    = $variant
                Variant = $variant
                Found   = $true
            }
        }
    }
    return $accounts
}

# ─────────────────────────────────────────────
#  XAML UI
# ─────────────────────────────────────────────
[xml]$XAML = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="ICE SCANNER"
    Height="600" Width="1100"
    MinHeight="550" MinWidth="950"
    WindowStartupLocation="CenterScreen"
    Background="#0A0E17"
    AllowsTransparency="True"
    WindowStyle="None"
    ResizeMode="CanResizeWithGrip">

  <Window.Resources>
    <!-- Scrollbar style -->
    <Style x:Key="SlimScrollBar" TargetType="ScrollBar">
      <Setter Property="Width" Value="5"/>
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="ScrollBar">
            <Grid>
              <Track x:Name="PART_Track" IsDirectionReversed="True">
                <Track.Thumb>
                  <Thumb>
                    <Thumb.Template>
                      <ControlTemplate TargetType="Thumb">
                        <Border Background="#2A3A55" CornerRadius="3"/>
                      </ControlTemplate>
                    </Thumb.Template>
                  </Thumb>
                </Track.Thumb>
              </Track>
            </Grid>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
    <Style TargetType="ScrollViewer">
      <Setter Property="VerticalScrollBarVisibility" Value="Auto"/>
    </Style>

    <!-- Nav button style -->
    <Style x:Key="NavBtn" TargetType="Button">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="Foreground" Value="#607D8B"/>
      <Setter Property="BorderThickness" Value="0"/>
      <Setter Property="Height" Value="44"/>
      <Setter Property="HorizontalContentAlignment" Value="Left"/>
      <Setter Property="Padding" Value="16,0"/>
      <Setter Property="FontSize" Value="13"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="Bd" Background="{TemplateBinding Background}" CornerRadius="6" Margin="8,2">
              <ContentPresenter HorizontalAlignment="Left" VerticalAlignment="Center" Margin="12,0"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="#1A2740"/>
                <Setter Property="Foreground" Value="#B0BEC5"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- Nav button ACTIVE -->
    <Style x:Key="NavBtnActive" TargetType="Button" BasedOn="{StaticResource NavBtn}">
      <Setter Property="Background" Value="#1A2A45"/>
      <Setter Property="Foreground" Value="#4FC3F7"/>
    </Style>

    <!-- Tool button style -->
    <Style x:Key="ToolBtn" TargetType="Button">
      <Setter Property="Background" Value="#111827"/>
      <Setter Property="Foreground" Value="#CFD8DC"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="BorderBrush" Value="#1E2D40"/>
      <Setter Property="Height" Value="36"/>
      <Setter Property="Margin" Value="0,3"/>
      <Setter Property="Padding" Value="12,0"/>
      <Setter Property="FontSize" Value="12"/>
      <Setter Property="HorizontalContentAlignment" Value="Left"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="Bd" Background="{TemplateBinding Background}"
                    BorderBrush="{TemplateBinding BorderBrush}"
                    BorderThickness="{TemplateBinding BorderThickness}"
                    CornerRadius="5">
              <ContentPresenter HorizontalAlignment="Left" VerticalAlignment="Center"
                                Margin="{TemplateBinding Padding}"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="#1A2740"/>
                <Setter TargetName="Bd" Property="BorderBrush" Value="#2A4A70"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- Card border style -->
    <Style x:Key="Card" TargetType="Border">
      <Setter Property="Background" Value="#0D1520"/>
      <Setter Property="BorderBrush" Value="#1A2535"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="CornerRadius" Value="8"/>
      <Setter Property="Padding" Value="16"/>
    </Style>

    <!-- Status pill -->
    <Style x:Key="PillActive" TargetType="Border">
      <Setter Property="Background" Value="#0D2A1A"/>
      <Setter Property="BorderBrush" Value="#1B5E20"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="CornerRadius" Value="12"/>
      <Setter Property="Padding" Value="10,3"/>
    </Style>

    <!-- Close/min button -->
    <Style x:Key="WinBtn" TargetType="Button">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="BorderThickness" Value="0"/>
      <Setter Property="Foreground" Value="#607D8B"/>
      <Setter Property="Width" Value="32"/>
      <Setter Property="Height" Value="32"/>
      <Setter Property="FontSize" Value="14"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="Bd" Background="{TemplateBinding Background}" CornerRadius="4">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="#1E2D40"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
  </Window.Resources>

  <Border CornerRadius="10" BorderBrush="#1A2535" BorderThickness="1">
    <Grid>
      <Grid.ColumnDefinitions>
        <ColumnDefinition Width="200"/>
        <ColumnDefinition Width="*"/>
      </Grid.ColumnDefinitions>

      <!-- ═══ SIDEBAR ═══ -->
      <Border Grid.Column="0" Background="#080D18" CornerRadius="10,0,0,10">
        <Grid>
          <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
          </Grid.RowDefinitions>

          <!-- Logo -->
          <StackPanel Grid.Row="0" Margin="20,24,20,20" HorizontalAlignment="Center">
            <TextBlock Text="❄" FontSize="40" HorizontalAlignment="Center"
                       Foreground="#4FC3F7" Margin="0,0,0,6"/>
            <TextBlock Text="ICE SCANNER" FontSize="13" FontWeight="Bold"
                       HorizontalAlignment="Center" Foreground="#E3F2FD"/>
            <TextBlock Text="Version 1.0" FontSize="10" HorizontalAlignment="Center"
                       Foreground="#37474F" Margin="0,2,0,0"/>
          </StackPanel>

          <!-- Nav -->
          <StackPanel Grid.Row="1" Margin="0,8,0,0">
            <Button x:Name="BtnDashboard" Style="{StaticResource NavBtnActive}" Content="🏠  Dashboard"/>
            <Button x:Name="BtnTools"     Style="{StaticResource NavBtn}"       Content="🔧  Tools"/>
            <Button x:Name="BtnLogs"      Style="{StaticResource NavBtn}"       Content="📋  Command Logs"/>

            <Separator Margin="16,16" Background="#1A2535"/>

            <Button x:Name="BtnAbout"    Style="{StaticResource NavBtn}" Content="ℹ  About Us"/>
            <Button x:Name="BtnSettings" Style="{StaticResource NavBtn}" Content="⚙  Settings"/>
          </StackPanel>

          <!-- Made by -->
          <Border Grid.Row="2" Margin="12,0,12,16" Background="#0D1520"
                  BorderBrush="#1A2535" BorderThickness="1" CornerRadius="6" Padding="12,10">
            <StackPanel>
              <TextBlock Text="Made by:" FontSize="10" Foreground="#37474F"/>
              <TextBlock Text="Brammetje &amp; ItsDarknessz" FontSize="11"
                         Foreground="#4FC3F7" Margin="0,2,0,0"/>
            </StackPanel>
          </Border>
        </Grid>
      </Border>

      <!-- ═══ MAIN CONTENT ═══ -->
      <Grid Grid.Column="1">
        <Grid.RowDefinitions>
          <RowDefinition Height="50"/>
          <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <!-- Title bar -->
        <Border Grid.Row="0" Background="#0A0E17" x:Name="TitleBar">
          <Grid Margin="20,0">
            <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
              <TextBlock x:Name="PageTitle" Text="DASHBOARD" FontSize="16" FontWeight="Bold"
                         Foreground="#E3F2FD"/>
              <TextBlock x:Name="PageSub" Text=" • Welcome to ICE Scanner" FontSize="12"
                         Foreground="#37474F" VerticalAlignment="Bottom" Margin="0,0,0,1"/>
            </StackPanel>
            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
              <!-- Internet status -->
              <Border x:Name="NetStatus" Style="{StaticResource PillActive}" Margin="0,0,8,0">
                <StackPanel Orientation="Horizontal">
                  <TextBlock Text="●" FontSize="8" Foreground="#66BB6A" VerticalAlignment="Center" Margin="0,0,4,0"/>
                  <TextBlock x:Name="NetText" Text="Online" FontSize="11" Foreground="#66BB6A"/>
                </StackPanel>
              </Border>
              <!-- Admin status -->
              <Border x:Name="AdminStatus" Style="{StaticResource PillActive}" Margin="0,0,16,0">
                <StackPanel Orientation="Horizontal">
                  <TextBlock Text="●" FontSize="8" Foreground="#66BB6A" VerticalAlignment="Center" Margin="0,0,4,0"/>
                  <TextBlock x:Name="AdminText" Text="Admin" FontSize="11" Foreground="#66BB6A"/>
                </StackPanel>
              </Border>
              <Button x:Name="BtnMin" Style="{StaticResource WinBtn}" Content="─"/>
              <Button x:Name="BtnClose" Style="{StaticResource WinBtn}" Content="✕" Foreground="#EF5350"/>
            </StackPanel>
          </Grid>
        </Border>

        <!-- ══ PAGES ══ -->
        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
          <Grid>

            <!-- ── DASHBOARD PAGE ── -->
            <Grid x:Name="PageDashboard" Margin="20,16,20,20" Visibility="Visible">
              <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
              </Grid.RowDefinitions>

              <!-- Row 1: System Status + Accounts -->
              <Grid Grid.Row="0" Margin="0,0,0,12">
                <Grid.ColumnDefinitions>
                  <ColumnDefinition Width="*"/>
                  <ColumnDefinition Width="12"/>
                  <ColumnDefinition Width="*"/>
                  <ColumnDefinition Width="12"/>
                  <ColumnDefinition Width="*"/>
                </Grid.ColumnDefinitions>

                <!-- System Status -->
                <Border Grid.Column="0" Style="{StaticResource Card}">
                  <StackPanel>
                    <TextBlock Text="SYSTEM STATUS" FontSize="10" FontWeight="Bold"
                               Foreground="#37474F" Margin="0,0,0,14"/>
                    <!-- Admin row -->
                    <Border Background="#0A1520" BorderBrush="#1A2535" BorderThickness="1"
                            CornerRadius="6" Padding="12,10" Margin="0,0,0,8">
                      <Grid>
                        <StackPanel Orientation="Horizontal">
                          <TextBlock Text="🛡" FontSize="16" VerticalAlignment="Center" Margin="0,0,10,0"/>
                          <StackPanel>
                            <TextBlock Text="Administrator Privileges" FontSize="12"
                                       Foreground="#CFD8DC" FontWeight="Medium"/>
                            <TextBlock x:Name="AdminDesc" Text="Checking..." FontSize="10" Foreground="#546E7A"/>
                          </StackPanel>
                        </StackPanel>
                        <Border x:Name="AdminPill" HorizontalAlignment="Right" VerticalAlignment="Center"
                                Background="#0D2A1A" BorderBrush="#1B5E20" BorderThickness="1"
                                CornerRadius="10" Padding="10,3">
                          <TextBlock x:Name="AdminPillText" Text="Active" FontSize="10" Foreground="#66BB6A"/>
                        </Border>
                      </Grid>
                    </Border>
                    <!-- WiFi row -->
                    <Border Background="#0A1520" BorderBrush="#1A2535" BorderThickness="1"
                            CornerRadius="6" Padding="12,10">
                      <Grid>
                        <StackPanel Orientation="Horizontal">
                          <TextBlock Text="📶" FontSize="16" VerticalAlignment="Center" Margin="0,0,10,0"/>
                          <StackPanel>
                            <TextBlock Text="WiFi Connection" FontSize="12"
                                       Foreground="#CFD8DC" FontWeight="Medium"/>
                            <TextBlock x:Name="NetDesc" Text="Checking..." FontSize="10" Foreground="#546E7A"/>
                          </StackPanel>
                        </StackPanel>
                        <Border x:Name="NetPill" HorizontalAlignment="Right" VerticalAlignment="Center"
                                Background="#0D2A1A" BorderBrush="#1B5E20" BorderThickness="1"
                                CornerRadius="10" Padding="10,3">
                          <TextBlock x:Name="NetPillText" Text="Active" FontSize="10" Foreground="#66BB6A"/>
                        </Border>
                      </Grid>
                    </Border>
                  </StackPanel>
                </Border>

                <!-- Minecraft Accounts -->
                <Border Grid.Column="2" Style="{StaticResource Card}">
                  <StackPanel>
                    <Grid Margin="0,0,0,14">
                      <StackPanel Orientation="Horizontal">
                        <TextBlock Text="⛏" FontSize="12" VerticalAlignment="Center" Margin="0,0,6,0"/>
                        <TextBlock Text="MINECRAFT ACCOUNTS" FontSize="10" FontWeight="Bold"
                                   Foreground="#37474F" VerticalAlignment="Center"/>
                      </StackPanel>
                    </Grid>
                    <ItemsControl x:Name="McAccountsList">
                      <ItemsControl.ItemTemplate>
                        <DataTemplate>
                          <Border Background="#0A1520" BorderBrush="#1A2535" BorderThickness="1"
                                  CornerRadius="6" Padding="10,8" Margin="0,3">
                            <Grid>
                              <StackPanel>
                                <TextBlock Text="{Binding Name}" FontSize="12" Foreground="#CFD8DC"
                                           FontWeight="Medium"/>
                                <TextBlock Text="{Binding Type}" FontSize="10" Foreground="#4FC3F7"
                                           Margin="0,2,0,0"/>
                              </StackPanel>
                              <TextBlock Text="{Binding UUID}" FontSize="9" Foreground="#37474F"
                                         HorizontalAlignment="Right" VerticalAlignment="Center"/>
                            </Grid>
                          </Border>
                        </DataTemplate>
                      </ItemsControl.ItemTemplate>
                    </ItemsControl>
                    <TextBlock x:Name="McNoAccounts" Text="No Minecraft accounts found."
                               FontSize="11" Foreground="#37474F" Visibility="Collapsed"
                               HorizontalAlignment="Center" Margin="0,10"/>
                  </StackPanel>
                </Border>

                <!-- Discord Accounts -->
                <Border Grid.Column="4" Style="{StaticResource Card}">
                  <StackPanel>
                    <Grid Margin="0,0,0,14">
                      <StackPanel Orientation="Horizontal">
                        <TextBlock Text="💬" FontSize="12" VerticalAlignment="Center" Margin="0,0,6,0"/>
                        <TextBlock Text="DISCORD ACCOUNTS" FontSize="10" FontWeight="Bold"
                                   Foreground="#37474F" VerticalAlignment="Center"/>
                      </StackPanel>
                    </Grid>
                    <ItemsControl x:Name="DcAccountsList">
                      <ItemsControl.ItemTemplate>
                        <DataTemplate>
                          <Border Background="#0A1520" BorderBrush="#1A2535" BorderThickness="1"
                                  CornerRadius="6" Padding="10,8" Margin="0,3">
                            <StackPanel>
                              <TextBlock Text="{Binding Name}" FontSize="12" Foreground="#CFD8DC"
                                         FontWeight="Medium"/>
                              <TextBlock Text="{Binding Variant}" FontSize="10" Foreground="#7E57C2"
                                         Margin="0,2,0,0"/>
                            </StackPanel>
                          </Border>
                        </DataTemplate>
                      </ItemsControl.ItemTemplate>
                    </ItemsControl>
                    <TextBlock x:Name="DcNoAccounts" Text="No Discord installations found."
                               FontSize="11" Foreground="#37474F" Visibility="Collapsed"
                               HorizontalAlignment="Center" Margin="0,10"/>
                  </StackPanel>
                </Border>
              </Grid>

              <!-- Row 2: Stats -->
              <Border Grid.Row="1" Style="{StaticResource Card}" Margin="0,0,0,12">
                <Grid>
                  <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="*"/>
                  </Grid.ColumnDefinitions>
                  <StackPanel Grid.Column="0" HorizontalAlignment="Center">
                    <TextBlock Text="📊" FontSize="20" HorizontalAlignment="Center"/>
                    <TextBlock x:Name="StatScans" Text="0" FontSize="28" FontWeight="Bold"
                               Foreground="#4FC3F7" HorizontalAlignment="Center" Margin="0,4,0,2"/>
                    <TextBlock Text="Scans Run" FontSize="11" Foreground="#37474F" HorizontalAlignment="Center"/>
                  </StackPanel>
                  <StackPanel Grid.Column="1" HorizontalAlignment="Center">
                    <TextBlock Text="🛡" FontSize="20" HorizontalAlignment="Center"/>
                    <TextBlock x:Name="StatThreats" Text="0" FontSize="28" FontWeight="Bold"
                               Foreground="#EF5350" HorizontalAlignment="Center" Margin="0,4,0,2"/>
                    <TextBlock Text="Threats Found" FontSize="11" Foreground="#37474F" HorizontalAlignment="Center"/>
                  </StackPanel>
                  <StackPanel Grid.Column="2" HorizontalAlignment="Center">
                    <TextBlock Text="🕐" FontSize="20" HorizontalAlignment="Center"/>
                    <TextBlock x:Name="StatLastScan" Text="--:--:--" FontSize="24" FontWeight="Bold"
                               Foreground="#7E57C2" HorizontalAlignment="Center" Margin="0,4,0,2"/>
                    <TextBlock Text="Last Scan" FontSize="11" Foreground="#37474F" HorizontalAlignment="Center"/>
                  </StackPanel>
                  <StackPanel Grid.Column="3" HorizontalAlignment="Center">
                    <TextBlock Text="💾" FontSize="20" HorizontalAlignment="Center"/>
                    <TextBlock x:Name="StatFiles" Text="0" FontSize="28" FontWeight="Bold"
                               Foreground="#66BB6A" HorizontalAlignment="Center" Margin="0,4,0,2"/>
                    <TextBlock Text="Files Scanned" FontSize="11" Foreground="#37474F" HorizontalAlignment="Center"/>
                  </StackPanel>
                </Grid>
              </Border>

              <!-- Row 3: Live Log Console -->
              <Border Grid.Row="2" Style="{StaticResource Card}">
                <StackPanel>
                  <StackPanel Orientation="Horizontal" Margin="0,0,0,12">
                    <TextBlock Text="●" FontSize="8" Foreground="#66BB6A" VerticalAlignment="Center" Margin="0,0,6,0"/>
                    <TextBlock Text="LIVE LOG CONSOLE" FontSize="10" FontWeight="Bold"
                               Foreground="#37474F"/>
                  </StackPanel>
                  <Border Background="#060C14" BorderBrush="#111D2C" BorderThickness="1"
                          CornerRadius="6" Height="160">
                    <RichTextBox x:Name="LogBox" Background="Transparent" BorderThickness="0"
                                 IsReadOnly="True" Padding="10,8" FontFamily="Consolas" FontSize="11"
                                 VerticalScrollBarVisibility="Auto">
                      <FlowDocument x:Name="LogDoc" LineHeight="18"/>
                    </RichTextBox>
                  </Border>
                </StackPanel>
              </Border>
            </Grid>

            <!-- ── TOOLS PAGE ── -->
            <Grid x:Name="PageTools" Margin="20,16,20,20" Visibility="Collapsed">
              <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
              </Grid.RowDefinitions>
              <TextBox x:Name="ToolSearch" Grid.Row="0" Margin="0,0,0,12"
                       Background="#0D1520" Foreground="#607D8B" BorderBrush="#1A2535"
                       BorderThickness="1" Padding="12,8" FontSize="12"
                       Text="Search tools..."
                       Height="36"/>
              <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                <StackPanel x:Name="ToolsPanel"/>
              </ScrollViewer>
            </Grid>

            <!-- ── LOGS PAGE ── -->
            <Grid x:Name="PageLogs" Margin="20,16,20,20" Visibility="Collapsed">
              <Border Style="{StaticResource Card}">
                <StackPanel>
                  <TextBlock Text="COMMAND LOG HISTORY" FontSize="10" FontWeight="Bold"
                             Foreground="#37474F" Margin="0,0,0,14"/>
                  <Border Background="#060C14" BorderBrush="#111D2C" BorderThickness="1"
                          CornerRadius="6" Height="440">
                    <RichTextBox x:Name="LogBox2" Background="Transparent" BorderThickness="0"
                                 IsReadOnly="True" Padding="10,8" FontFamily="Consolas" FontSize="11"
                                 VerticalScrollBarVisibility="Auto">
                      <FlowDocument x:Name="LogDoc2" LineHeight="18"/>
                    </RichTextBox>
                  </Border>
                </StackPanel>
              </Border>
            </Grid>

            <!-- ── ABOUT PAGE ── -->
            <Grid x:Name="PageAbout" Margin="20,16,20,20" Visibility="Collapsed">
              <Border Style="{StaticResource Card}">
                <StackPanel HorizontalAlignment="Center" Margin="0,30,0,0">
                  <TextBlock Text="❄" FontSize="60" HorizontalAlignment="Center" Foreground="#4FC3F7"/>
                  <TextBlock Text="ICE SCANNER" FontSize="24" FontWeight="Bold"
                             Foreground="#E3F2FD" HorizontalAlignment="Center" Margin="0,12,0,4"/>
                  <TextBlock Text="Version 1.0  •  Built for Security" FontSize="12"
                             Foreground="#37474F" HorizontalAlignment="Center"/>
                  <Separator Margin="40,24" Background="#1A2535"/>
                  <TextBlock Text="Created by Brammetje &amp; ItsDarknessz" FontSize="14"
                             Foreground="#607D8B" HorizontalAlignment="Center"/>
                  <TextBlock Text="A powerful Minecraft anti-cheat investigation toolkit." FontSize="12"
                             Foreground="#37474F" HorizontalAlignment="Center" Margin="0,8,0,0"
                             TextWrapping="Wrap" MaxWidth="400" TextAlignment="Center"/>
                </StackPanel>
              </Border>
            </Grid>

            <!-- ── SETTINGS PAGE ── -->
            <Grid x:Name="PageSettings" Margin="20,16,20,20" Visibility="Collapsed">
              <Border Style="{StaticResource Card}">
                <StackPanel>
                  <TextBlock Text="SETTINGS" FontSize="10" FontWeight="Bold"
                             Foreground="#37474F" Margin="0,0,0,20"/>
                  <TextBlock Text="Firebase Database" FontSize="13" Foreground="#CFD8DC" Margin="0,0,0,6"/>
                  <TextBlock Text="ice-anticheat-default-rtdb.europe-west1.firebasedatabase.app"
                             FontSize="11" Foreground="#37474F" FontFamily="Consolas" Margin="0,0,0,20"/>
                  <TextBlock Text="Refresh Stats" FontSize="13" Foreground="#CFD8DC" Margin="0,0,0,8"/>
                  <Button x:Name="BtnRefresh" Content="🔄  Refresh Firebase Stats" Height="36"
                          Background="#1A2740" Foreground="#4FC3F7" BorderThickness="1"
                          BorderBrush="#2A4A70" FontSize="12" HorizontalAlignment="Left"
                          Padding="16,0" Cursor="Hand">
                    <Button.Template>
                      <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}"
                                BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="6">
                          <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                      </ControlTemplate>
                    </Button.Template>
                  </Button>
                </StackPanel>
              </Border>
            </Grid>

          </Grid>
        </ScrollViewer>

        <!-- Footer -->
        <Border Grid.Row="1" VerticalAlignment="Bottom" Padding="20,8"
                BorderBrush="#1A2535" BorderThickness="0,1,0,0" Background="#080D18">
          <Grid>
            <TextBlock HorizontalAlignment="Center" FontSize="10" Foreground="#1E2D40">
              <Run Text="ICE SCANNER" Foreground="#4FC3F7" FontWeight="Bold"/>
              <Run Text="  •  BUILT FOR SECURITY"/>
            </TextBlock>
          </Grid>
        </Border>
      </Grid>
    </Grid>
  </Border>
</Window>
'@

# ─────────────────────────────────────────────
#  Build Window
# ─────────────────────────────────────────────
$reader = New-Object System.Xml.XmlNodeReader $XAML
$global:Window = [Windows.Markup.XamlReader]::Load($reader)

# Wire up named elements
$global:LogDoc   = $global:Window.FindName("LogDoc")
$global:LogBox   = $global:Window.FindName("LogBox")

$pages = @{
    Dashboard = $global:Window.FindName("PageDashboard")
    Tools     = $global:Window.FindName("PageTools")
    Logs      = $global:Window.FindName("PageLogs")
    About     = $global:Window.FindName("PageAbout")
    Settings  = $global:Window.FindName("PageSettings")
}
$navBtns = @{
    Dashboard = $global:Window.FindName("BtnDashboard")
    Tools     = $global:Window.FindName("BtnTools")
    Logs      = $global:Window.FindName("BtnLogs")
    About     = $global:Window.FindName("BtnAbout")
    Settings  = $global:Window.FindName("BtnSettings")
}

# ─────────────────────────────────────────────
#  Navigation
# ─────────────────────────────────────────────
function Show-Page {
    param([string]$Name)
    $pages.Keys | ForEach-Object { $pages[$_].Visibility = "Collapsed" }
    $navBtns.Keys | ForEach-Object {
        $navBtns[$_].Style = $global:Window.FindResource("NavBtn")
    }
    $pages[$Name].Visibility = "Visible"
    if ($navBtns.ContainsKey($Name)) {
        $navBtns[$Name].Style = $global:Window.FindResource("NavBtnActive")
    }
    $titles = @{
        Dashboard = @("DASHBOARD", " • Welcome to ICE Scanner")
        Tools     = @("TOOLS", " • Browse & Launch Tools")
        Logs      = @("COMMAND LOGS", " • Execution History")
        About     = @("ABOUT US", " • ICE Scanner")
        Settings  = @("SETTINGS", " • Configuration")
    }
    $global:Window.FindName("PageTitle").Text = $titles[$Name][0]
    $global:Window.FindName("PageSub").Text   = $titles[$Name][1]
}

$navBtns.Dashboard.Add_Click({ Show-Page "Dashboard" })
$navBtns.Tools.Add_Click({     Show-Page "Tools"; Build-ToolsPanel })
$navBtns.Logs.Add_Click({      Show-Page "Logs" })
$navBtns.About.Add_Click({     Show-Page "About" })
$navBtns.Settings.Add_Click({  Show-Page "Settings" })

# Window drag
$global:Window.FindName("TitleBar").Add_MouseLeftButtonDown({
    $global:Window.DragMove()
})

# Min/Close
$global:Window.FindName("BtnMin").Add_Click({   $global:Window.WindowState = "Minimized" })
$global:Window.FindName("BtnClose").Add_Click({ $global:Window.Close() })

# Settings refresh
$global:Window.FindName("BtnRefresh").Add_Click({ Load-FirebaseStats })

# ─────────────────────────────────────────────
#  Build Tools Panel
# ─────────────────────────────────────────────
function Build-ToolsPanel {
    $panel = $global:Window.FindName("ToolsPanel")
    if ($panel.Children.Count -gt 0) { return }

    $categories = $global:Tools | Group-Object Category

    foreach ($cat in $categories) {
        # Category header
        $header = New-Object System.Windows.Controls.TextBlock
        $header.Text       = $cat.Name.ToUpper()
        $header.FontSize   = 10
        $header.FontWeight = "Bold"
        $header.Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#37474F")
        $header.Margin     = [System.Windows.Thickness]::new(0, 16, 0, 6)
        $header.SetValue([System.Windows.Documents.Typography]::CapitalsProperty, [System.Windows.FontCapitals]::AllSmallCaps)
        $panel.Children.Add($header)

        # Card container
        $card = New-Object System.Windows.Controls.Border
        $card.Background    = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#0D1520")
        $card.BorderBrush   = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#1A2535")
        $card.BorderThickness = [System.Windows.Thickness]::new(1)
        $card.CornerRadius  = [System.Windows.CornerRadius]::new(8)
        $card.Padding       = [System.Windows.Thickness]::new(12)

        $sp = New-Object System.Windows.Controls.StackPanel
        $card.Child = $sp

        foreach ($tool in $cat.Group) {
            $btn = New-Object System.Windows.Controls.Button
            $btn.Style   = $global:Window.FindResource("ToolBtn")
            $btn.Content = "  $($tool.Name)   [$($tool.Type)]"
            $btnTool = $tool

            $btn.Add_Click({
                $t = $btnTool
                Add-Log "Launching: $($t.Name)" "INFO"
                try {
                    if ($t.Type -eq "Cmd") {
                        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"$($t.Command)`""
                    } elseif ($t.Type -in @("GitHub","Web","Link")) {
                        Start-Process $t.URL
                    }
                    Add-Log "$($t.Name) launched successfully." "OK"
                } catch {
                    Add-Log "Failed to launch $($t.Name): $_" "ERROR"
                }
            }.GetNewClosure())

            $sp.Children.Add($btn)
        }
        $panel.Children.Add($card)
    }
}

# ─────────────────────────────────────────────
#  Load Firebase Stats
# ─────────────────────────────────────────────
function Load-FirebaseStats {
    $global:Window.Dispatcher.Invoke([action]{ Add-Log "Fetching Firebase stats..." "INFO" })
    $scans   = Get-FirebaseStat "stats/scansRun"
    $threats = Get-FirebaseStat "stats/threatsFound"
    $files   = Get-FirebaseStat "stats/filesScanned"
    $lastScan= Get-FirebaseStat "stats/lastScan"

    $global:Window.Dispatcher.Invoke([action]{
        $global:Window.FindName("StatScans").Text    = if ($scans)    { "$scans" }    else { "0" }
        $global:Window.FindName("StatThreats").Text  = if ($threats)  { "$threats" }  else { "0" }
        $global:Window.FindName("StatFiles").Text    = if ($files)    { "$files" }    else { "0" }
        $global:Window.FindName("StatLastScan").Text = if ($lastScan) { "$lastScan" } else { "--:--" }
        Add-Log "Firebase stats loaded." "OK"
    })
}

# ─────────────────────────────────────────────
#  Startup Sequence (background job)
# ─────────────────────────────────────────────
$global:Window.Add_Loaded({
    $sb = [System.Windows.Media.Animation.Storyboard]::new()

    # Run init on background thread
    $null = [System.Threading.Tasks.Task]::Run([action]{
        Start-Sleep -Milliseconds 200
        Add-Log "ICE Initializing..." "INFO"
        Start-Sleep -Milliseconds 400

        # Admin check
        $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        Add-Log "Administrator privileges $(if($isAdmin){'detected'}else{'NOT detected'})." $(if($isAdmin){"OK"}else{"WARN"})
        $global:Window.Dispatcher.Invoke([action]{
            if ($isAdmin) {
                $global:Window.FindName("AdminDesc").Text = "You have full administrative permissions."
                $global:Window.FindName("AdminText").Text = "Admin"
            } else {
                $global:Window.FindName("AdminDesc").Text = "Running without admin privileges."
                $global:Window.FindName("AdminPill").Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#2A0D0D")
                $global:Window.FindName("AdminPill").BorderBrush = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#5E1B1B")
                $global:Window.FindName("AdminPillText").Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#EF5350")
                $global:Window.FindName("AdminPillText").Text = "No Admin"
                $global:Window.FindName("AdminText").Text = "No Admin"
                $global:Window.FindName("AdminText").Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#EF5350")
                $global:Window.FindName("AdminStatus").Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#2A0D0D")
                $global:Window.FindName("AdminStatus").BorderBrush = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#5E1B1B")
            }
        })

        # Internet check
        Start-Sleep -Milliseconds 200
        try {
            $null = Invoke-RestMethod -Uri "https://1.1.1.1" -TimeoutSec 3 -Method HEAD
            $hasNet = $true
        } catch {
            $hasNet = $false
        }
        Add-Log "Internet connection $(if($hasNet){'stable'}else{'unavailable'})." $(if($hasNet){"OK"}else{"ERROR"})
        $global:Window.Dispatcher.Invoke([action]{
            if ($hasNet) {
                $global:Window.FindName("NetDesc").Text = "Your internet connection is stable."
            } else {
                $global:Window.FindName("NetDesc").Text = "No internet connection detected."
                $global:Window.FindName("NetPill").Background  = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#2A0D0D")
                $global:Window.FindName("NetPill").BorderBrush = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#5E1B1B")
                $global:Window.FindName("NetPillText").Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#EF5350")
                $global:Window.FindName("NetPillText").Text = "Offline"
                $global:Window.FindName("NetText").Text = "Offline"
                $global:Window.FindName("NetText").Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#EF5350")
                $global:Window.FindName("NetStatus").Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#2A0D0D")
                $global:Window.FindName("NetStatus").BorderBrush = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#5E1B1B")
            }
        })

        Start-Sleep -Milliseconds 200

        # Discord detection
        $dcAccounts = Get-DiscordAccounts
        if ($dcAccounts.Count -gt 0) {
            Add-Log "Discord detected ($($dcAccounts.Count) installation(s))." "INFO"
        } else {
            Add-Log "No Discord installation found." "WARN"
        }
        $global:Window.Dispatcher.Invoke([action]{
            if ($dcAccounts.Count -gt 0) {
                $global:Window.FindName("DcAccountsList").ItemsSource = $dcAccounts
            } else {
                $global:Window.FindName("DcNoAccounts").Visibility = "Visible"
            }
        })

        # Minecraft detection
        $mcAccounts = Get-MinecraftAccounts
        if ($mcAccounts.Count -gt 0) {
            Add-Log "Minecraft installation found ($($mcAccounts.Count) account(s))." "INFO"
        } else {
            Add-Log "No Minecraft accounts found." "WARN"
        }
        $global:Window.Dispatcher.Invoke([action]{
            if ($mcAccounts.Count -gt 0) {
                $global:Window.FindName("McAccountsList").ItemsSource = $mcAccounts
            } else {
                $global:Window.FindName("McNoAccounts").Visibility = "Visible"
            }
        })

        # Firebase stats
        Start-Sleep -Milliseconds 300
        if ($hasNet) { Load-FirebaseStats }

        Add-Log "ICE Ready." "READY"
    })
})

# ─────────────────────────────────────────────
#  Show Window
# ─────────────────────────────────────────────
$global:Window.ShowDialog() | Out-Null
