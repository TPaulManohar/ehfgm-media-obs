; ================================================================
; EHFGM Media Stream — Inno Setup Installer Script
; OBS Studio 32.1.1 + Church Plugins
; ================================================================

#define AppName "EHFGM Media OBS"
#define AppVersion "1.0.0"
#define AppPublisher "EHFG Ministries Media"
#define AppURL "https://github.com/ehfgministries/ehfgm-media-obs"
#define OBSExe "obs64.exe"

[Setup]
AppId={{EHFGM-MEDIA-STREAM-2024}}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={autopf}\EHFGMMediaStream
DefaultGroupName={#AppName}
AllowNoIcons=no
LicenseFile=..\LICENSE
OutputDir=\output
OutputBaseFilename=EHFGM-Media-Stream-Setup-v{#AppVersion}
;SetupIconFile=..\assets\icon.ico
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
;WizardImageFile=..\assets\welcome.bmp
;WizardSmallImageFile=..\assets\banner.bmp
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64
MinVersion=10.0
UninstallDisplayName={#AppName}
UninstallDisplayIcon={app}\bin\64bit\{#OBSExe}

; ================================================================
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

; ================================================================
[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional icons:"
Name: "quicklaunch"; Description: "Create a &Quick Launch shortcut"; GroupDescription: "Additional icons:"

; ================================================================
[Types]
Name: "full";    Description: "Full Installation (Recommended)"
Name: "compact"; Description: "Compact Installation (OBS + Essential Plugins Only)"
Name: "custom";  Description: "Custom Installation"; Flags: iscustom

; ================================================================
[Components]
Name: "obs";           Description: "OBS Studio 32.1.1 (Required)";          Types: full compact custom; Flags: fixed
Name: "distroav";      Description: "DistroAV NDI Plugin (Slide Input)";      Types: full
Name: "loudness";      Description: "Loudness Dock (Audio Metering EBU R128)";Types: full
Name: "sourcedock";    Description: "Source Dock (Camera Preview Panel)";     Types: full
Name: "downstream";    Description: "Downstream Keyer (Persistent Overlay)";  Types: full
Name: "sceneswitcher"; Description: "Advanced Scene Switcher (Automation)";   Types: full

; ================================================================
[Dirs]
Name: "{app}\obs-plugins\64bit"
Name: "{app}\data\obs-plugins\distroav\locale"
Name: "{app}\data\obs-plugins\loudness-dock\locale"
Name: "{app}\data\obs-plugins\source-dock\locale"
Name: "{app}\data\obs-plugins\downstream-keyer\locale"
Name: "{app}\data\obs-plugins\advanced-scene-switcher\locale"
Name: "{app}\obs-plugins\64bit\advanced-scene-switcher-plugins"

; ================================================================
[Files]

; ── OBS BASE ────────────────────────────────────────────────────
Source: "..\obs-base\*"; DestDir: "{app}"; \
  Flags: ignoreversion recursesubdirs createallsubdirs; \
  Components: obs

; ── DISTROAV (NDI) ──────────────────────────────────────────────
Source: "..\plugins\distroav\bin\64bit\distroav.dll"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: distroav

Source: "..\plugins\distroav\bin\64bit\distroav.pdb"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: distroav

Source: "..\plugins\distroav\data\locale\*"; \
  DestDir: "{app}\data\obs-plugins\distroav\locale"; \
  Flags: ignoreversion recursesubdirs; Components: distroav

; ── LOUDNESS DOCK ───────────────────────────────────────────────
Source: "..\plugins\loudness-dock\bin\64bit\loudness-dock.dll"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: loudness

Source: "..\plugins\loudness-dock\bin\64bit\loudness-dock.pdb"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: loudness

Source: "..\plugins\loudness-dock\data\locale\*"; \
  DestDir: "{app}\data\obs-plugins\loudness-dock\locale"; \
  Flags: ignoreversion recursesubdirs; Components: loudness

Source: "..\plugins\loudness-dock\data\libebur128-COPYING"; \
  DestDir: "{app}\data\obs-plugins\loudness-dock"; \
  Flags: ignoreversion; Components: loudness

Source: "..\plugins\loudness-dock\data\LICENSE"; \
  DestDir: "{app}\data\obs-plugins\loudness-dock"; \
  Flags: ignoreversion; Components: loudness

; ── SOURCE DOCK ─────────────────────────────────────────────────
Source: "..\plugins\source-dock\obs-plugins\64bit\source-dock.dll"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: sourcedock

Source: "..\plugins\source-dock\obs-plugins\64bit\source-dock.pdb"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: sourcedock

Source: "..\plugins\source-dock\data\obs-plugins\source-dock\locale\*"; \
  DestDir: "{app}\data\obs-plugins\source-dock\locale"; \
  Flags: ignoreversion recursesubdirs; Components: sourcedock

; ── DOWNSTREAM KEYER ────────────────────────────────────────────
Source: "..\plugins\downstream-keyer\obs-plugins\64bit\downstream-keyer.dll"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: downstream

Source: "..\plugins\downstream-keyer\obs-plugins\64bit\downstream-keyer.pdb"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: downstream

Source: "..\plugins\downstream-keyer\data\obs-plugins\downstream-keyer\locale\*"; \
  DestDir: "{app}\data\obs-plugins\downstream-keyer\locale"; \
  Flags: ignoreversion recursesubdirs; Components: downstream

; ── ADVANCED SCENE SWITCHER ─────────────────────────────────────
Source: "..\plugins\advanced-scene-switcher\obs-plugins\64bit\advanced-scene-switcher.dll"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: sceneswitcher

Source: "..\plugins\advanced-scene-switcher\obs-plugins\64bit\advanced-scene-switcher.pdb"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: sceneswitcher

Source: "..\plugins\advanced-scene-switcher\obs-plugins\64bit\advanced-scene-switcher-lib.dll"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: sceneswitcher

Source: "..\plugins\advanced-scene-switcher\obs-plugins\64bit\advanced-scene-switcher-lib.pdb"; \
  DestDir: "{app}\obs-plugins\64bit"; \
  Flags: ignoreversion; Components: sceneswitcher

Source: "..\plugins\advanced-scene-switcher\obs-plugins\64bit\advanced-scene-switcher-plugins\*"; \
  DestDir: "{app}\obs-plugins\64bit\advanced-scene-switcher-plugins"; \
  Flags: ignoreversion recursesubdirs; Components: sceneswitcher

Source: "..\plugins\advanced-scene-switcher\data\obs-plugins\advanced-scene-switcher\locale\*"; \
  DestDir: "{app}\data\obs-plugins\advanced-scene-switcher\locale"; \
  Flags: ignoreversion recursesubdirs; Components: sceneswitcher

; ================================================================
[Icons]
Name: "{group}\{#AppName}";          Filename: "{app}\bin\64bit\{#OBSExe}"
Name: "{group}\Uninstall {#AppName}";Filename: "{uninstallexe}"
Name: "{autodesktop}\{#AppName}";    Filename: "{app}\bin\64bit\{#OBSExe}"; \
  Tasks: desktopicon

; ================================================================
[Run]
Filename: "{app}\bin\64bit\{#OBSExe}"; \
  Description: "Launch EHFGM Media Stream now"; \
  Flags: nowait postinstall skipifsilent

; ================================================================
[Messages]
WelcomeLabel1=Welcome to EHFGM Media Stream Setup
WelcomeLabel2=This will install OBS Studio 32.1.1 with church plugins pre-configured for Telugu church livestreaming.%n%nClick Next to continue.
FinishedHeadingLabel=EHFGM Media Stream Installation Complete!
FinishedLabel=OBS Studio with all church plugins has been installed successfully.%n%nClick Finish to launch EHFGM Media Stream.