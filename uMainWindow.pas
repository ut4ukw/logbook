unit uMainWindow;

interface

uses Dialogs, AbZipper, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, JvThread, DB, AbBase, AbBrowse, AbZBrows, AbUnzper,
  JvBaseDlg, JvProgressDialog, Graphics, ScreenTips, ActnMan, JvDialogs,
  ExtCtrls, LMDDckSite, ImgList, Controls, Classes, ActnList, JvAppStorage,
  JvAppIniStorage, JvComponentBase, JvFormPlacement, StdCtrls, ActnCtrls,
  Ribbon, ToolWin, ActnMenus, RibbonActnMenus, RibbonLunaStyleActnCtrls,
  ComCtrls, JvExComCtrls, JvStatusBar, Messages, Forms, Types, CallParser, uPlugins,
  uTranslator, uSplashWindow, PrefLst, uPluginHeaders, IniFiles, Sysutils, Windows,
  uUtils, Menus, Grids, NativeXml, Variants, KDaoTable, Ping, DateUtils, Math, uCancelDialog,
  LPControl, SLControlCollection, LPControlDrawLayers, LPTransparentControl,
  ULBasicControl, ILLed, ILMultiLed, IGDIPlus, DBGridEh;

const

  WM_AFTER_SHOW = WM_USER + 300; // custom message
  qtEQSL = 0;
  qtDQSL = 1;
  SubVersion = '.11';

type
  PExchangeQSLParams = ^TExchangeQSLParams;

  TExchangeQSLParams = record
    eType: integer;
    vRecords: variant;
  end;

  TMainWindow = class(TForm)
    FormStorage: TJvFormStorage;
    AppStorage: TJvAppIniFileStorage;
    ActionList: TActionList;
    aOptions: TAction;
    aSaveQSO: TAction;
    aCancelQSO: TAction;
    aOpenMap: TAction;
    aEditQSO: TAction;
    aDeleteQSO: TAction;
    aRefreshLog: TAction;
    aCallInfo: TAction;
    aExportToAdif: TAction;
    aEQSLUploadSelected: TAction;
    aImportFromAdif: TAction;
    aQSLIgnore: TAction;
    aQSLSent: TAction;
    aEQSLUploadUnexported: TAction;
    aEQSLDownload: TAction;
    ilMain: TImageList;
    DockSite: TLMDDockSite;
    DockPersister: TLMDDockPersister;
    sbMain: TJvStatusBar;
    aNewQSO: TAction;
    ilStatusBar: TImageList;
    aEQSLUploadDownload: TAction;
    aEQSLUploadCheck: TAction;
    aCallMistake: TAction;
    timCallComplete: TTimer;
    aDatabaseCompactRestore: TAction;
    aDatabaseMakeBackup: TAction;
    aDataBaseRestoreBackup: TAction;
    JvSaveDialog1: TJvSaveDialog;
    OpenDialog: TJvOpenDialog;
    amMain: TActionManager;
    stmMain: TScreenTipsManager;
    rbMain: TRibbon;
    rpMain: TRibbonPage;
    rgMainActions: TRibbonGroup;
    rgProfile: TRibbonGroup;
    cbProfile: TComboBox;
    aProfileSaveAs: TAction;
    aProfileSave: TAction;
    aProfileSetDefault: TAction;
    rgWindows: TRibbonGroup;
    ilMainLarge: TImageList;
    aWindowList: TAction;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    aExit: TAction;
    rgQSL: TRibbonGroup;
    rgGroupOperations: TRibbonGroup;
    aGroupFieldValueReplace: TAction;
    aGroupOperation: TAction;
    aRedefineGeoData: TAction;
    pdApplication: TJvProgressDialog;
    aRecordRemove: TAction;
    rpService: TRibbonPage;
    rgDatabase: TRibbonGroup;
    aUpdateFlash: TAction;
    aPrintQSLQueue: TAction;
    aReportDesign: TAction;
    aPrintQSLQueueAddQSO: TAction;
    aPrintQSLQueueClear: TAction;
    rgQSLPrint: TRibbonGroup;
    aPrintQSLQueueSettings: TAction;
    aDQSLUploadUnexported: TAction;
    aDQSLUploadSelected: TAction;
    aDQSLDownload: TAction;
    aDQSLUploadDownload: TAction;
    aQSLServicesExchange: TAction;
    ilMainLargeDisabled: TImageList;
    aDQSLManualConfirm: TAction;
    OpenDialogJpeg: TJvOpenDialog;
    ilMainDisabled: TImageList;
    DataSource1: TDataSource;
    aQSLRcvd: TAction;
    aRedefineMyData: TAction;
    rgUpdate: TRibbonGroup;
    rgAnalytics: TRibbonGroup;
    aAnalytics: TAction;
    aRecentReport: TAction;
    aLOTWUploadSelected: TAction;
    aLOTWUploadUnexported: TAction;
    aLOTWDownload: TAction;
    aLOTWUploadDownload: TAction;
    ReportActionList: TActionList;
    aHRDLogNetUploadSelected: TAction;
    thrSentInfo: TJvThread;
    IdHTTP: TIdHTTP;
    rgBooks: TRibbonGroup;
    aBookSelect: TAction;
    BooksActionList: TActionList;
    IdHTTPDownload: TIdHTTP;
    pdDownload: TJvProgressDialog;
    Zipper: TAbZipper;
    SaveDialog: TSaveDialog;
    aQSLRcvdPlusQueue: TAction;
    aLOTWUserUpdate: TAction;
    aEQSLUserUpdate: TAction;
    aOpenQRZCOM: TAction;
    aQSOEntryiiHamQTH: TAction;
    aQSOEntryiiQRZCom: TAction;
    ilmRxTx: TILMultiLed;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowWindow(Sender: TObject);
    procedure ShowPluginWindows;
    procedure FormShow(Sender: TObject);
    procedure PanelShow(Sender: TObject);
    procedure PanelHide(Sender: TObject);
    function GetPanelByName(PanelName: string): TLMDDockPanel;
    procedure CoreCommand(Sender: TObject);
    procedure DllCommand(IdCommand: integer; Sender: TObject; var lParam, wParam: variant);
    procedure DeleteQSO(SelectedRecords, wParam: variant);
    procedure EditQSO(LogId, StationId: integer);
    procedure CancelQSO;
    procedure NewQSO;
    procedure SaveQSO;
    procedure aSaveQSOUpdate(Sender: TObject);
    procedure aCancelQSOUpdate(Sender: TObject);
    procedure InitStatusBar;
    procedure sbMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure ImportFromAdif;
    procedure ExportToAdif;
    procedure ExchangeQSL(eType: integer);
    procedure CallChanged(vCall: variant);
    procedure ClearGeoData;
    procedure StatusIconClick(Sender: TObject);
    procedure bhMainBalloonClick(Sender: TObject);
    procedure timCallCompleteTimer(Sender: TObject);
    procedure DatabaseCompactAndRestore;
    procedure DatabaseMakeBackup(bExit: boolean = false);
    procedure DatabaseRestoreBackup;
    procedure rcbiDescktopContextPopup(Sender: TObject; MousePos: TPoint; var Handled: boolean);
    procedure cbProfileClick(Sender: TObject);
    procedure ChangeProfile(BackupFileName: string = '');
    procedure aExitExecute(Sender: TObject);
    procedure RedefineGeoData;
    procedure RedefineMyData;
    procedure RecordRemove;
    procedure stmMainCreateScreenTip(Manager: TObject; Item: TScreenTipItem);
    procedure frDesignerShow(Sender: TObject);
    procedure aEQSLUploadSelectedUpdate(Sender: TObject);
    procedure aEQSLUploadUnexportedUpdate(Sender: TObject);
    procedure aEQSLUploadCheckUpdate(Sender: TObject);
    procedure aEQSLDownloadUpdate(Sender: TObject);
    procedure aEQSLUploadDownloadUpdate(Sender: TObject);
    procedure aDQSLUploadSelectedUpdate(Sender: TObject);
    procedure aDQSLUploadUnexportedUpdate(Sender: TObject);
    procedure aDQSLDownloadUpdate(Sender: TObject);
    procedure aDQSLUploadDownloadUpdate(Sender: TObject);
    procedure aQSLServicesExchangeUpdate(Sender: TObject);
    procedure aDQSLManualConfirmUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowReport(Sender: TObject);
    procedure AddRecentReports(FileName: string);
    procedure rbMainTabChange(Sender: TObject; const NewIndex, OldIndex: integer; var AllowChange: boolean);
    procedure aLOTWUploadSelectedUpdate(Sender: TObject);
    procedure aLOTWUploadUnexportedUpdate(Sender: TObject);
    procedure aLOTWDownloadUpdate(Sender: TObject);
    procedure aLOTWUploadDownloadUpdate(Sender: TObject);
    procedure aHRDLogNetUploadSelectedUpdate(Sender: TObject);
    procedure thrSentInfoExecute(Sender: TObject; Params: Pointer);
    procedure ChangeBook(Sender: TObject);
    procedure UpdateSplash(Msg: string);
    procedure IdHTTPDownloadWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure IdHTTPDownloadWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure IdHTTPDownloadWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure pdDownloadCancel(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure aLOTWUserUpdateExecute(Sender: TObject);
    procedure aEQSLUserUpdateExecute(Sender: TObject);
    procedure aQSOEntryiiHamQTHExecute(Sender: TObject);
    procedure aQSOEntryiiQRZComExecute(Sender: TObject);
    procedure Minimize(Sender: TObject);
    procedure Restore(Sender: TObject);
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CurrentBand: real;
    sCurrentMode: string;
    imQSL, imError, imInfo, imMail: TImage;
    sLogQSLExchangeError: TStringList;
    CurrentManagers: array of string;
    bCallMistake: boolean;
    SentEveryEQSLResult: string;
    FDownloadTerminate, FDownloadOk: boolean;
    CallDescMappingList: TStringList;
    CallDescValueList: TStringList;
    FNextViewerHandle: THandle;
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure SaveProfileAs;
    procedure SetProfileDefault;
    procedure GroupFieldValueReplace;
    procedure UpdateFlash;
    procedure PrintQSLQueue;
    procedure ReportDesign;
    procedure dQSLManualConfirm;
    function IsShortCut(var Message: TWMKey): boolean; override;
    procedure CallInfo;
    function CallAdditionInfo(vCallSign: variant): string;
    procedure WMDrawClipboard(var message: TMessage); message WM_DRAWCLIPBOARD;
    procedure WMChangeCBCHain(var message: TMessage); message WM_CHANGECBCHAIN;
  public
    CallParser: TCallParser;
    Plugins: TPlugins;
    Translator: TTranslator;
    SelectedRows: variant;
    iCountExportedToeQSL: integer;
    iCountImportedFromeQSL: integer;
    CurrentStationId: integer;
    CurrentStationParentId: integer;
    CurrentStationBookName: string;
    CurrentStationCall: string;
    CurrentProfile: string;
    AdditionDataPath: string;
    Splash: TSplashWindow;
    LimitDateLo: string;
    LimitDateHi: string;
    CallDescList: TCallDescList;
    Delimeter: string;

    // procedure GetPrefixData(var TCallInfo; Call: string; aDate: TDateTime = 0);
    function GetPrefixData(Call: string; aDate: TDateTime = 0): TCallInfo;
    procedure LoadProfile;
    procedure SaveProfile;
    // procedure RegisterWindow(Id: integer; Name: string);
    procedure RegisterWindows(slWindows: TStringList);
    procedure UnRegisterWindow(Id: integer; Name: string);
    procedure GetDescktopFiles;
    procedure LoadPlugins;
    procedure PrintQSLQueueClear(bAllLogs: boolean; Value: string);
    procedure LoadManagers;
    procedure BuildReportsMenu;
    function CreateReportMenuItem(aParentItem: TActionClientItem; FileName: string): TActionClientItem;
    procedure AddReportToMenu(aFileName: string);
    procedure BuildBooksMenu;
    procedure AddBookToMenu(StationId: integer; BookName: string; isGroup: integer = 0);
    procedure EditBookInMenu(StationId: integer; BookName: string);
    procedure RemoveBookFromMenu(StationId: integer);
    procedure SelectNewBookMenu(StationId: integer);
    function GetBookCount: integer;
    procedure ChangeFont;
    procedure SortWindowList;
    procedure LotwUserListUpdate;
    procedure EQSLUserListUpdate;

  end;

function cDllCommand(IdCommand: integer; Sender: TObject; var lParam, wParam: variant): integer; stdcall;
procedure ModifyFontsFor(ctrl: TWinControl; FontSize: integer);

var
  MainWindow: TMainWindow;
  TmpSTR: string;

implementation

uses uOptions, udmMain, uImportFromADIFDialog,
  uExportToADIFDialog, uExchangeQSLServices, uEditProfileName,
  uFieldValueReplace, uRecordRemove, uPrintQSLSettings, TypInfo, LabeledControls;
{$R *.dfm}

procedure TrimWorkingSet;
var
  MainHandle: THandle;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, DWORD(-1), DWORD(-1));
    CloseHandle(MainHandle);
  end;
end;

function cDllCommand(IdCommand: integer; Sender: TObject; var lParam, wParam: variant): integer; stdcall;
begin
  TMainWindow(Application.MainForm).DllCommand(IdCommand, Sender, lParam, wParam);
end;

procedure ModifyFontsFor(ctrl: TWinControl; FontSize: integer);
  procedure ModifyFont(ctrl: TControl);
  var
    f: TFont;
  begin
    if ctrl is TComponent then
      if TComponent(ctrl).Name = 'ldeCall' then
        exit;
    { begin
      TLabeledDBEdit(ctrl).EditLabel.Font.Size:=FontSize;
      TLabeledDBEdit(ctrl).Font.Size:=FontSize+2;
      Exit;
      end; }
    if IsPublishedProp(ctrl, 'Parentfont') and (GetOrdProp(ctrl, 'Parentfont') = Ord(false)) and IsPublishedProp(ctrl, 'font') then
    begin
      f := TFont(GetObjectProp(ctrl, 'font', TFont));
      f.Size := FontSize;
      // f.Name := 'Symbol';
    end;
  end;

var
  i: integer;
begin
  ModifyFont(ctrl);
  for i := 0 to ctrl.controlcount - 1 do
  begin
    if (ctrl.Controls[i] is TDbGridEh) then
      continue;
    if (ctrl.Controls[i] is TWinControl) then
      ModifyFontsFor(TWinControl(ctrl.Controls[i]), FontSize)
    else
      ModifyFont(ctrl.Controls[i]);
  end;
end;

procedure TMainWindow.WmAfterShow(var Msg: TMessage);
begin
  { if dmMain.qryStations.IsEmpty  then
    begin
    Application.MessageBox(PWideChar(Options.msgInformationSetPersonalData.Caption), PWideChar(Options.msgInformation.Caption), MB_OK );
    Options.ShowModal;
    end; }
  CoreCommand(aNewQSO);
  TrimWorkingSet;
end;

procedure TMainWindow.aCancelQSOUpdate(Sender: TObject);
begin
  aCancelQSO.Enabled := dmMain.qryLogEdit.State in [dsEdit, dsInsert];
end;

procedure TMainWindow.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  FreeAndNil(CallDescList);
  FreeAndNil(CallDescMappingList);
  FreeAndNil(CallDescValueList);
  FreeAndNil(sLogQSLExchangeError);
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Logbook.ini');
  Ini.WriteBool('Main', 'RibbonMinimize', rbMain.Minimized);
  FreeAndNil(Ini);
  Plugins.CoreCommand(CC_LOG_EXIT, Self, 0, 0);
end;

procedure TMainWindow.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if MessageBox(Handle, PWideChar(Options.msgExitProgramm.Caption), PWideChar(Options.msgConfirmation.Caption), MB_SYSTEMMODAL or MB_SETFOREGROUND or MB_TOPMOST or mb_YesNo or mb_iconquestion) = mrYes then
  begin
    if Options.cbAutoBackupOnExit.Checked then
      // if GetFileCRC(ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.mdb')<>dmMain.DBCRC then
      DatabaseMakeBackup(true);
    CanClose := true;
  end
  else
    CanClose := false;
end;

procedure TMainWindow.FormCreate(Sender: TObject);
var
  i: integer;
begin
  Application.OnMinimize := Minimize;
  Application.OnRestore := Restore;
  Delimeter := GetDelimeter;

  CallParser := TCallParser.Create(Self);

  CallDescList := TCallDescList.Create;
  CallDescMappingList := TStringList.Create;
  CallDescMappingList.Delimiter := ';';
  CallDescValueList := TStringList.Create;
  CallDescValueList.Delimiter := ';';
  CallDescValueList.StrictDelimiter := true;

  LimitDateLo := '';
  LimitDateHi := '';

  for i := 1 to ParamCount do
  begin
    if Pos('LimitDateLo', ParamStr(i)) > 0 then
      LimitDateLo := Copy(ParamStr(i), 13, Length(ParamStr(i)) - 12);

    if Pos('LimitDateHi', ParamStr(i)) > 0 then
      LimitDateHi := Copy(ParamStr(i), 13, Length(ParamStr(i)) - 12);
  end;
end;

procedure TMainWindow.FormDestroy(Sender: TObject);
begin
  ChangeClipboardChain(Handle, FNextViewerHandle);
end;

procedure TMainWindow.FormShow(Sender: TObject);
var
  wParam, lParam: variant;
begin
  // MainWindow.rbMain.Minimized:=True;
  PostMessage(MainWindow.rbMain.Handle, WM_LBUTTONDOWN, 0, (1 shl 16) + 1);
  PostMessage(MainWindow.rbMain.Handle, WM_LBUTTONUP, 0, (1 shl 16) + 1);
  MainWindow.rbMain.UpdateControlState;
  MainWindow.LoadProfile;

  dmMain.SetStationId(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);

  BuildBooksMenu;

  wParam := 0;
  lParam := Options.FormStorageOnExit.StoredValue['Band'];
  MainWindow.DllCommand(DC_BAND_CHANGED, nil, lParam, wParam);
  lParam := Options.FormStorageOnExit.StoredValue['Mode'];
  MainWindow.DllCommand(DC_MODE_CHANGED, nil, lParam, wParam);
  rbMain.Caption := 'UT4UKW Logbook build ' + getAppVersion + SubVersion + ' - ' + dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) + ']';
  sLogQSLExchangeError := TStringList.Create;
  InitStatusBar;
  ShowPluginWindows;

  Options.GetActions;
  Options.LoadHotKeys;

  Options.TranslateGrid;
  Options.TranslatePluginName;

  ChangeFont;
  Application.ProcessMessages;
  // MainWindow.Plugins.CoreCommand(CC_STATION_CHANGED, nil, dmMain.qryStations.FieldByName('STATION_ID').AsInteger, dmMain.qryStations.FieldByName('STATION_CALL').AsString);

  FNextViewerHandle := SetClipboardViewer(Handle);

  Plugins.CoreCommand(CC_LOADED, nil, 0, 0);
  // ModifyFontsFor(Self);

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TMainWindow.FormStorageAfterRestorePlacement(Sender: TObject);
var
  slDim: TStringList;
  i: integer;
begin
  { slDim:=TStringList.Create;
    slDim.Delimiter:=',';
    try
    slDim.DelimitedText:=FormStorage.ReadString('NormPos');
    for i := 0 to slDim.Count - 1 do
    case i of
    0: Self.Left:=StrToInt(slDim[i]);
    1: Self.Top:=StrToInt(slDim[i]);
    2: Self.Width:=StrToInt(slDim[i]);
    3: Self.Height:=StrToInt(slDim[i]);
    end;
    finally
    slDim.Free;
    end; }

end;

procedure TMainWindow.frDesignerShow(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TMainWindow.InitStatusBar;
var
  im, im1, im2: TImage;
begin

  im := TImage.Create(Self);
  im.Parent := sbMain;
  im.AutoSize := true;
  im.Left := 2;
  im.Top := 2;
  ilStatusBar.GetIcon(0, im.Picture.Icon);

  im1 := TImage.Create(Self);
  im1.Parent := sbMain;
  im1.AutoSize := true;
  im1.Left := sbMain.Panels[0].Width + 2;
  im1.Top := 2;
  ilStatusBar.GetIcon(1, im1.Picture.Icon);

  im2 := TImage.Create(Self);
  im2.Parent := sbMain;
  im2.AutoSize := true;
  im2.Left := sbMain.Panels[0].Width + sbMain.Panels[1].Width + 2;
  im2.Top := 2;
  ilStatusBar.GetIcon(2, im2.Picture.Icon);

  { gfExchange.Top := 2;
    gfExchange.Left := sbMain.Width - 20;
    gfExchange.Parent := sbMain; }

  { imQSL := TImage.Create(Self);
    imQSL.Parent := sbMain;
    imQSL.AutoSize := True;
    imQSL.Left := gfExchange.Left - 16;
    imQSL.Top := 2;
    imQSL.Visible := False;
    ilStatusBar.GetIcon(3, imQSL.Picture.Icon);

    imError := TImage.Create(Self);
    imError.Parent := sbMain;
    imError.AutoSize := True;
    imError.Left := sbMain.Width - 20;
    imError.Top := 2;
    imError.Visible := False;
    imError.OnDblClick := bhMainBalloonClick;
    ilStatusBar.GetIcon(4, imError.Picture.Icon);

    imInfo := TImage.Create(Self);
    imInfo.Parent := sbMain;
    imInfo.Name := 'imInfo';
    imInfo.AutoSize := True;
    imInfo.Left := sbMain.Width - 36;
    imInfo.Top := 2;
    imInfo.ShowHint := True;
    imInfo.Visible := False;
    imInfo.OnDblClick := StatusIconClick;
    ilStatusBar.GetIcon(5, imInfo.Picture.Icon);

    imMail := TImage.Create(Self);
    imMail.Parent := sbMain;
    imMail.Name := 'imMail';
    imMail.AutoSize := True;
    imMail.Left := sbMain.Width - 36;
    imMail.Top := 2;
    imMail.ShowHint := True;
    imMail.Visible := False;
    imMail.OnDblClick := StatusIconClick;
    ilStatusBar.GetIcon(6, imMail.Picture.Icon); }

end;

procedure TMainWindow.bhMainBalloonClick(Sender: TObject);
begin
  { bhMain.CancelHint;
    sbMain.Canvas.FillRect(Bounds(imError.Left, 2, 16, 16));
    imError.Visible := false;
    if bhMain.DefaultIcon = ikWarning then
    ShellExecute(Handle, 'open', 'notepad.exe', PWideChar(GetTempDir + 'QSLExchangeError.log'), nil, SW_SHOWNORMAL);
    }
end;

// procedure TMainWindow.GetPrefixData(var TCallInfo; Call: string; aDate: TDateTime = 0);
function TMainWindow.GetPrefixData(Call: string; aDate: TDateTime = 0): TCallInfo;

var
  sContinent: string;
begin
  if aDate = 0 then
    aDate := Now;
  CallParser.SetDataByCallAndDate(Call, aDate);
  // CallParser.Call := Call;
  result.PrefixData.Location.X := 0;
  result.PrefixData.Location.Y := 0;

  if High(CallParser.HitList) <> -1 then
  begin
    sContinent := CallParser.HitList[0].Continent;
    if (CallParser.HitList[0].Continent = 'AS;EU') or ((sContinent = 'AS') and (CallParser.HitList[0].Territory = 'Turkey')) then
      sContinent := 'EU';

    if CallParser.HitList[0].Continent = 'EU;AF' then
      sContinent := 'EU';

    result.PrefixData.Location := CallParser.HitList[0].Location;
    result.PrefixData.Territory := CallParser.HitList[0].Territory;
    result.PrefixData.Prefix := CallParser.HitList[0].Prefix;
    result.PrefixData.CQ := CallParser.HitList[0].CQ;
    result.PrefixData.ITU := CallParser.HitList[0].ITU;
    result.PrefixData.Continent := sContinent;
    try
      result.PrefixData.ADIF := IntToStr(StrToInt(CallParser.HitList[0].ADIF));
    except
      result.PrefixData.ADIF := '-1'
    end;

    result.PrefixData.ProvinceCode := CallParser.HitList[0].ProvinceCode;
    result.PrefixData.TZ := CallParser.HitList[0].TZ;
  end
  else
  begin
    result.PrefixData.ADIF := '-1';
    result.PrefixData.Continent := 'UN';
  end;
end;

procedure TMainWindow.LoadProfile;

  function GetActionByName(Name: string): TAction;
  var
    j: integer;
  begin
    result := nil;
    for j := 0 to ActionList.ActionCount - 1 do
      if ActionList.Actions[j].Name = Name then
      begin
        result := TAction(ActionList.Actions[j]);
        exit;
      end;
  end;

var
  sStream: TStringStream;
  i: integer;
  Action: TAction;
  kk: integer;
  aItem: TActionClientItem;
begin
  { for i := 0 to Options.FormStorage.StoredValues.Count - 1 do
    begin
    Action := GetActionByName(Options.FormStorage.StoredValues.Items[i].Name);
    if Action <> nil then
    Action.ShortCut := TextToShortCut
    (Options.FormStorage.StoredValues.Items[i].Value);
    end; }

  // RestoreCoolBar;
  for i := 0 to ActionList.ActionCount - 1 do
  begin
    if TAction(ActionList.Actions[i]).Tag = 0 then
      TAction(ActionList.Actions[i]).Enabled := false;
    if not Assigned(TAction(ActionList.Actions[i]).OnExecute) then
      TAction(ActionList.Actions[i]).OnExecute := CoreCommand;
  end;

  sStream := TStringStream.Create(Options.FormStorage.StoredValue['Desktop']);
  DockPersister.LoadFromStream(sStream);

  for i := 0 to DockSite.ComponentCount - 1 do
  begin
    if (DockSite.Components[i].Name <> '') and (DockSite.Components[i] is TLMDDockPanel) then
    begin
      TLMDDockPanel(DockSite.Components[i]).OnShow := PanelShow;
      TLMDDockPanel(DockSite.Components[i]).OnHide := PanelHide;
    end;
  end;

  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i].Name <> '') and (Self.Components[i] is TLMDDockPanel) then
    begin
      TLMDDockPanel(Self.Components[i]).OnShow := PanelShow;
      TLMDDockPanel(Self.Components[i]).OnHide := PanelHide;
    end;
  end;
  FreeAndNil(sStream);

  { for i := 0 to Options.memRecentReports.Lines.Count - 1 do
    begin
    Action := TAction.Create(Self);
    Action.Name := 'aRecentReport' + IntToStr(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items.Count);
    Action.Caption := ExtractFileNameWithoutExt(ExtractFileName(Options.memRecentReports.Lines.Strings[i]));
    Action.OnExecute := ShowReport;
    Action.HelpKeyword := Options.memRecentReports.Lines.Strings[i];
    Action.Tag := -3;
    Action.ActionList := ActionList;
    aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items);
    aItem.Action := Action;
    end; }

  if not dmMain.qryStations.Locate('STATION_ID', Options.FormStorageOnExit.StoredValue['StationId'], []) then
    while not dmMain.qryStations.Eof do
    begin
      if dmMain.qryStations.FieldByName('IS_GROUP').AsInteger = 0 then
        break;
      dmMain.qryStations.Next;
    end
    else if dmMain.qryStations.FieldByName('IS_GROUP').AsInteger = 1 then
      while not dmMain.qryStations.Eof do
      begin
        if dmMain.qryStations.FieldByName('IS_GROUP').AsInteger = 0 then
          break;
        dmMain.qryStations.Next;
      end;

  { CallParser := TCallParser.Create(Self);
    try
    CallParser.PrefixFile := ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Prefix.lst';
    except
    on E: Exception do
    MessageBox(Application.Handle, PWideChar('Error load prefix file - ' + CallParser.PrefixFile+' : '+E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
    end;


    slManagers:=TStringList.Create;
    slManagerLine:=TStringList.Create;
    slManagerLine.Delimiter:=';';
    try
    if FileExists(ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Managers.csv') then
    slManagers.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Managers.csv');
    for kk:=0 to slManagers.Count - 1 do
    begin
    slManagerLine.DelimitedText:=slManagers.Strings[kk];
    dmMain.cdsManagers.Append;
    dmMain.cdsManagers.FieldByName('MANAGER_LOG_CALL').asString:=slManagerLine.Strings[0];
    dmMain.cdsManagers.FieldByName('MANAGER_MANAGER_CALL').asString:=slManagerLine.Strings[1];
    dmMain.cdsManagers.FieldByName('MANAGER_INFO').asString:=slManagerLine.Strings[2];
    dmMain.cdsManagers.Post;
    end;

    finally
    slManagerLine.Free;
    slManagers.Free;
    end; }

  { dmMain.cdsManagers.Open;
    dmMain.cdsManagers.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Managers.csv'); }

  if Trim(Options.deCallInfoDirectory.Text) <> '' then
  begin
    if DirectoryExists(GetAbsolutePathFromOptions(Options.deCallInfoDirectory.Text)) then
    begin
      CallDescList.Clear;
      CallDescList.LoadFiles(GetAbsolutePathFromOptions(Options.deCallInfoDirectory.Text));
      Plugins.CoreCommand(CC_CALLDESCRIPTION_LOADED, Self, integer(Pointer(CallDescList)), 0);
    end
    else
      MessageBox(Application.Handle, PWideChar('Directory not exists - ' + GetAbsolutePathFromOptions(Options.deCallInfoDirectory.Text)), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
  end;

  timCallComplete.Interval := Options.seTimeCallSecondaryData.Value;
  // FormStorage.RestoreFormPlacement;
end;

procedure TMainWindow.SaveProfile;
var
  mStream: TMemoryStream;

  function StreamToString(aStream: TStream): string;
  var
    SS: TStringStream;
  begin
    if aStream <> nil then
    begin
      SS := TStringStream.Create('');
      try
        aStream.Position := 0;
        SS.CopyFrom(aStream, aStream.Size);
        result := Copy(SS.DataString, 4, Length(SS.DataString));
      finally
        FreeAndNil(SS);
      end;
    end
    else
    begin
      result := '';
    end;
  end;

begin
  mStream := TMemoryStream.Create;
  DockPersister.SaveToStream(mStream);
  Options.FormStorage.StoredValue['Desktop'] := StringReplace(StringReplace(StreamToString(mStream), #10, '', [rfReplaceAll]), #13, '', [rfReplaceAll]);
  FreeAndNil(mStream);
  FormStorage.SaveFormPlacement;

end;

procedure TMainWindow.RegisterWindows(slWindows: TStringList);
var
  i: integer;
  Action: TAction;
  MenuItem: TMenuItem;
  aItem: TActionClientItem;
  StringGrid: TStringGrid;

  procedure SortGrid(var GenStrGrid: TStringGrid; ThatCol: integer);
  const
    // Define the Separator
    TheSeparator = '@';
  var
    CountItem, i, j, K, ThePosition: integer;
    MyList: TStringList;
    MyString, TempString: string;
  begin
    // Give the number of rows in the StringGrid
    CountItem := GenStrGrid.RowCount;
    // Create the List
    MyList := TStringList.Create;
    MyList.Sorted := false;
    try
      begin
        Application.ProcessMessages;
        for i := 0 to (CountItem - 1) do
        begin
          MyList.Add(GenStrGrid.Rows[i].Strings[ThatCol] + TheSeparator + GenStrGrid.Rows[i].Text);
        end;
        Application.ProcessMessages;
        // Sort the List
        MyList.Sort;
        for K := 1 to MyList.Count do
        begin
          Application.ProcessMessages;
          // Take the String of the line (K – 1)
          MyString := MyList.Strings[(K - 1)];
          // Find the position of the Separator in the String
          ThePosition := Pos(TheSeparator, MyString);
          TempString := '';
          { Eliminate the Text of the column on which we have sorted the StringGrid }
          TempString := Copy(MyString, (ThePosition + 1), Length(MyString));
          MyList.Strings[(K - 1)] := '';
          MyList.Strings[(K - 1)] := TempString;
        end;
        Application.ProcessMessages;
        // Refill the StringGrid
        for j := 0 to (CountItem - 1) do
          GenStrGrid.Rows[j].Text := MyList.Strings[(j)];
      end;
    finally
      // Free the List
      FreeAndNil(MyList);
    end;
  end;

begin
  if slWindows.Count = 0 then
    exit;

  StringGrid := TStringGrid.Create(nil);
  try
    StringGrid.ColCount := 3;
    StringGrid.RowCount := slWindows.Count;
    for i := 0 to slWindows.Count - 1 do
    begin
      StringGrid.Cells[0, i] := Translator.GetCaption('MainWindow', 'aShow' + slWindows.Strings[i]);
      StringGrid.Cells[1, i] := slWindows.Strings[i];
      StringGrid.Cells[2, i] := IntToStr(integer(slWindows.Objects[i]) + 1);
    end;
    SortGrid(StringGrid, 0);
    for i := 0 to StringGrid.RowCount - 1 do
    begin
      Action := TAction.Create(Self);
      Action.Name := 'aShow' + StringGrid.Cells[1, i];
      Action.OnExecute := ShowWindow;
      Action.Tag := StrToInt(StringGrid.Cells[2, i]);
      Action.ActionList := ActionList;
      // TActionBarItem(amMain.ActionBars.Items[11]).Items
      aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items);
      aItem.Action := Action;

    end;

  finally
    FreeAndNil(StringGrid);
  end;

  (*
    { for i := 0 to slWindows.Count - 1 do

    Translator.GetCaption() }
    for i := 0 to slWindows.Count - 1 do
    begin
    // TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items.Count
    Action := TAction.Create(Self);
    Action.Name := 'aShow' + slWindows.Strings[i];
    Action.OnExecute := ShowWindow;
    Action.Tag := integer(slWindows.Objects[i]) + 1;
    Action.ActionList := ActionList;
    // TActionBarItem(amMain.ActionBars.Items[11]).Items
    aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items);
    aItem.Action := Action;

    // TActionBarItem(amMain.ActionBars.Items[11]).Items[0];
    { MenuItem := TMenuItem.Create(Self);
    MenuItem.Action := Action;
    MainMenu.Items.Items[1].Add(MenuItem); }

    end;
    *)
end;
(*
  procedure TMainWindow.RegisterWindow(Id: integer; Name: string);
  var
  Action: TAction;
  MenuItem: TMenuItem;
  aItem: TActionClientItem;
  begin
  //TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items.Count
  Action := TAction.Create(Self);
  Action.Name := 'aShow' + Name;
  Action.OnExecute := ShowWindow;
  Action.Tag := Id + 1;
  Action.ActionList := ActionList;
  // TActionBarItem(amMain.ActionBars.Items[11]).Items
  aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items);
  aItem.Action := Action;

  // TActionBarItem(amMain.ActionBars.Items[11]).Items[0];
  { MenuItem := TMenuItem.Create(Self);
  MenuItem.Action := Action;
  MainMenu.Items.Items[1].Add(MenuItem); }
  end;
*)

procedure TMainWindow.UnRegisterWindow(Id: integer; Name: string);
var
  Action: TAction;
  i: integer;
begin
  Action := Options.FindActionByName('aShow' + Name);
  if Assigned(Action) then
  begin
    for i := 0 to TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items.Count - 1 do
    begin
      if TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[i].Action = Action then
      begin
        TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[i].Action := nil;
        TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[i].Free;
        break;
      end;
    end;
    FreeAndNil(Action);
  end;

  { for i := 0 to TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items.Count - 1 do
    begin
    if TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[i].Action = Action then
    begin
    TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[i].Action := nil;
    TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[i].Free;
    break;
    end;
    end; }

end;

function TMainWindow.GetPanelByName(PanelName: string): TLMDDockPanel;
var
  i: integer;
begin
  result := nil;
  for i := 0 to DockSite.ComponentCount - 1 do
    if DockSite.Components[i].Name = PanelName then
    begin
      result := TLMDDockPanel(DockSite.Components[i]);
      exit;
    end;

  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i].Name = PanelName then
    begin
      result := TLMDDockPanel(Self.Components[i]);
      exit;
    end;
  end;
end;

procedure TMainWindow.ShowWindow(Sender: TObject);
var
  pnl: TLMDDockPanel;
  PanelName: string;
  FloatingSite: TLMDFloatingForm;
begin
  if dmMain.dsLogEdit.State in [dsEdit] then
    if not((TAction(Sender).Index = CA_CANCEL_QSO) or (TAction(Sender).Index = CA_SAVE_QSO)) then
      exit;

  PanelName := Copy(TAction(Sender).Name, 6, Length(TAction(Sender).Name) - 5);
  pnl := GetPanelByName(PanelName);
  if pnl <> nil then
  begin
    pnl.Show;
    SetForegroundWindow(pnl.Handle);
    Plugins.ShowWindow(TAction(Sender).Tag - 1, pnl);
  end
  else
  begin
    pnl := TLMDDockPanel.Create(Self);
    pnl.name := PanelName;
    pnl.Font.Size := 10;
    FloatingSite := TLMDFloatingForm.Create(Application);
    FloatingSite.Top := 100;
    FloatingSite.Left := 100;
    FloatingSite.Width := 600;
    FloatingSite.Height := 300;
    FloatingSite.Font.Size := 10;
    FloatingSite.Site.DockControl(pnl);
    Plugins.ShowWindow(TAction(Sender).Tag - 1, pnl);
  end;
  DockSite.UpdateControlState;

  { SendMessage( TPlugin(Plugins.Items[TAction(Sender).Tag - 1]).PluginForm.Handle, WM_NEXTDLGCTL, 0, 0 );
    SendMessage(TPlugin(Plugins.Items[TAction(Sender).Tag - 1]).PluginForm.Handle, WM_KEYDOWN, VK_TAB,0);
    }
  Translator.TranslateWindow(pnl.Name, pnl);
end;

procedure TMainWindow.ShowPluginWindows;
var
  i, idPlugin: integer;
  Form: TForm;
  Component: TComponent;
begin
  i := 0;
  while i <= DockSite.ComponentCount - 1 do
  begin
    idPlugin := -1;
    if DockSite.Components[i].Name <> '' then
    begin
      idPlugin := Plugins.GetIdByNameWindow(DockSite.Components[i].Name + 'Form');
      if idPlugin <> -1 then
      begin
        Form := Plugins.ShowWindow(idPlugin, TCustomControl(DockSite.Components[i]));
        { if Form.Parent is TLMDDockPanel then
          TLMDDockPanel(Form.Parent).OnDblClick:=DockPanelDblClick; }
      end
      else
      begin
        Component := DockSite.Components[i];
        FreeAndNil(Component);
        Dec(i);
      end;
    end;
    inc(i);
  end;

  i := 0;
  while i <= Application.MainForm.ComponentCount - 1 do
  begin
    idPlugin := -1;
    if (Application.MainForm.Components[i] is TLMDDockPanel) then
    begin
      idPlugin := Plugins.GetIdByNameWindow(TLMDDockPanel(Application.MainForm.Components[i]).Name + 'Form');
      if idPlugin <> -1 then
        Form := Plugins.ShowWindow(idPlugin, TCustomControl(Application.MainForm.Components[i]))
      else
      begin
        Component := Application.MainForm.Components[i];
        FreeAndNil(Component);
        Dec(i);
      end;
    end;
    inc(i);
  end;

end;

procedure TMainWindow.PanelShow(Sender: TObject);
begin
  Plugins.PluginByName(TComponent(Sender).Name).CoreCommand(CC_WINDOW_SHOW, Sender, 0, 0);
end;

procedure TMainWindow.pdDownloadCancel(Sender: TObject);
begin
  FDownloadTerminate := true;
end;

procedure TMainWindow.rbMainTabChange(Sender: TObject; const NewIndex, OldIndex: integer; var AllowChange: boolean);
begin
  // ShowMessage(
end;

procedure TMainWindow.rcbiDescktopContextPopup(Sender: TObject; MousePos: TPoint; var Handled: boolean);
begin
  // ShowMessage('ddd');
end;

procedure TMainWindow.PanelHide(Sender: TObject);
begin
  Plugins.PluginByName(TComponent(Sender).Name).CoreCommand(CC_WINDOW_HIDE, Sender, 0, 0);
end;

procedure TMainWindow.aDQSLDownloadUpdate(Sender: TObject);
begin
  aDQSLDownload.Enabled := Options.bGlobalDQSLActive;
end;

procedure TMainWindow.aDQSLManualConfirmUpdate(Sender: TObject);
begin
  aDQSLManualConfirm.Enabled := dmMain.qryStations.FieldByName('STATION_DQSL_ACTIVE').AsInteger = 1;
end;

procedure TMainWindow.aDQSLUploadDownloadUpdate(Sender: TObject);
begin
  aDQSLUploadDownload.Enabled := Options.bGlobalDQSLActive;
end;

procedure TMainWindow.aDQSLUploadSelectedUpdate(Sender: TObject);
begin
  aDQSLUploadSelected.Enabled := dmMain.qryStations.FieldByName('STATION_DQSL_ACTIVE').AsInteger = 1;
end;

procedure TMainWindow.aDQSLUploadUnexportedUpdate(Sender: TObject);
begin
  aDQSLUploadUnexported.Enabled := Options.bGlobalDQSLActive;
end;

procedure TMainWindow.aEQSLDownloadUpdate(Sender: TObject);
begin
  aEQSLDownload.Enabled := Options.bGlobalEQSLActive;
end;

procedure TMainWindow.aEQSLUploadCheckUpdate(Sender: TObject);
begin
  aEQSLUploadCheck.Enabled := Options.bGlobalEQSLActive;
end;

procedure TMainWindow.aEQSLUploadDownloadUpdate(Sender: TObject);
begin
  aEQSLUploadDownload.Enabled := Options.bGlobalEQSLActive;
end;

procedure TMainWindow.aEQSLUploadSelectedUpdate(Sender: TObject);
begin
  aEQSLUploadSelected.Enabled := dmMain.qryStations.FieldByName('STATION_EQSL_ACTIVE').AsInteger = 1;
end;

procedure TMainWindow.aEQSLUploadUnexportedUpdate(Sender: TObject);
begin
  aEQSLUploadUnexported.Enabled := Options.bGlobalEQSLActive;
end;

procedure TMainWindow.aEQSLUserUpdateExecute(Sender: TObject);
begin
  EQSLUserListUpdate;
end;

procedure TMainWindow.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainWindow.aHRDLogNetUploadSelectedUpdate(Sender: TObject);
begin
  aHRDLogNetUploadSelected.Enabled := dmMain.qryStations.FieldByName('STATION_HRDLOG_ACTIVE').AsInteger = 1;
end;

procedure TMainWindow.aLOTWDownloadUpdate(Sender: TObject);
begin
  aLOTWDownload.Enabled := Options.bGlobalLOTWActive;
end;

procedure TMainWindow.aLOTWUploadDownloadUpdate(Sender: TObject);
begin
  aLOTWUploadDownload.Enabled := Options.bGlobalLOTWActive;
end;

procedure TMainWindow.aLOTWUploadSelectedUpdate(Sender: TObject);
begin
  aLOTWUploadSelected.Enabled := dmMain.qryStations.FieldByName('STATION_LOTW_ACTIVE').AsInteger = 1;
end;

procedure TMainWindow.aLOTWUploadUnexportedUpdate(Sender: TObject);
begin
  aLOTWUploadUnexported.Enabled := Options.bGlobalLOTWActive;
end;

procedure TMainWindow.aLOTWUserUpdateExecute(Sender: TObject);
begin
  LotwUserListUpdate;
end;

procedure TMainWindow.aQSLServicesExchangeUpdate(Sender: TObject);
begin
  aQSLServicesExchange.Enabled := Options.bGlobalEQSLActive or Options.bGlobalDQSLActive or Options.bGlobalLOTWActive or (dmMain.qryStations.FieldByName('STATION_HRDLOG_ACTIVE').AsInteger = 1);
end;

procedure TMainWindow.aQSOEntryiiHamQTHExecute(Sender: TObject);
var
  mXMLData: TMemoryStream;
  i: integer;
  SessionId: string;
  NativeXml: TNativeXml;
begin
  if Trim(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString) = '' then
    exit;

  mXMLData := TMemoryStream.Create;
  NativeXml := TNativeXml.Create;

  Screen.Cursor := crHourGlass;
  try
    try
      IdHTTP.Request.CacheControl := 'no-cache';
      IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)';
      TmpSTR := 'http://www.hamqth.com/xml.php?u=' + dmMain.qryStations.FieldByName('STATION_HAMQTH_LOGIN').asString + '&p=' + Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_HAMQTH_PASSWORD').asString);
      IdHTTP.Get('http://www.hamqth.com/xml.php?u=' + dmMain.qryStations.FieldByName('STATION_HAMQTH_LOGIN').asString + '&p=' + Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_HAMQTH_PASSWORD').asString),
        mXMLData);
      mXMLData.Position := 0;
      NativeXml.LoadFromStream(mXMLData);

      if NativeXml.Root.NodeByName('session').NodeByName('error') <> nil then
        MessageBox(Application.Handle, PWideChar(Utf8Decode(NativeXml.Root.NodeByName('session').NodeByName('error').ValueAsString)), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR)
      else
      begin
        SessionId := NativeXml.Root.NodeByName('session').NodeByName('session_id').ValueAsString;
        mXMLData.Clear;
        mXMLData.Position := 0;
        IdHTTP.Get('http://www.hamqth.com/xml.php?id=' + SessionId + '&callsign=' + GetOriginalCall(Trim(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString)) + '&prg=4ULog', mXMLData);
        mXMLData.Position := 0;
        NativeXml.Clear;
        NativeXml.LoadFromStream(mXMLData);
        if NativeXml.Root.NodeByName('search').NodeByName('qth') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_QTH').asString := NativeXml.Root.NodeByName('search').NodeByName('qth').ValueAsString;
        if NativeXml.Root.NodeByName('search').NodeByName('nick') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_NAME').asString := NativeXml.Root.NodeByName('search').NodeByName('nick').ValueAsString;
        if NativeXml.Root.NodeByName('search').NodeByName('grid') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_GRIDSQUARE').asString := UpperCase(NativeXml.Root.NodeByName('search').NodeByName('grid').ValueAsString);
        if NativeXml.Root.NodeByName('search').NodeByName('email') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_EMAIL').asString := NativeXml.Root.NodeByName('search').NodeByName('email').ValueAsString;
        if NativeXml.Root.NodeByName('search').NodeByName('web') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_WEB').asString := NativeXml.Root.NodeByName('search').NodeByName('web').ValueAsString;
        if NativeXml.Root.NodeByName('search').NodeByName('distinct') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_CNTY').asString := NativeXml.Root.NodeByName('search').NodeByName('distinct').ValueAsString;
        if NativeXml.Root.NodeByName('search').NodeByName('itu') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_ITUZ').asString := NativeXml.Root.NodeByName('search').NodeByName('itu').ValueAsString;
        if NativeXml.Root.NodeByName('search').NodeByName('cq') <> nil then
          dmMain.qryLogEdit.FieldByName('LOG_CQZ').asString := NativeXml.Root.NodeByName('search').NodeByName('cq').ValueAsString;
      end;

    except
      on E: Exception do
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
    end;
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(NativeXml);
    FreeAndNil(mXMLData);
  end;
end;

procedure TMainWindow.aQSOEntryiiQRZComExecute(Sender: TObject);
var
  mXMLData: TMemoryStream;
  i: integer;
  SessionId: string;
  NativeXml: TNativeXml;
begin
  if Trim(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString) = '' then
    exit;

  mXMLData := TMemoryStream.Create;
  NativeXml := TNativeXml.Create;
  Screen.Cursor := crHourGlass;
  try
    try
      IdHTTP.Request.CacheControl := 'no-cache';
      IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)';
      IdHTTP.Get('http://www.qrz.com/xml?username=' + dmMain.qryStations.FieldByName('STATION_QRZCOM_LOGIN').asString + ';password=' + Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,
          dmMain.qryStations.FieldByName('STATION_QRZCOM_PASSWORD').asString) + ';agent=q5.0', mXMLData);
      mXMLData.Position := 0;

      NativeXml.LoadFromStream(mXMLData);

      if NativeXml.Root.Nodes[0].Nodes[0].ValueAsString = '' then
        MessageBox(Application.Handle, PWideChar('Error connect to qrz.com.'), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR)
      else
      begin
        SessionId := NativeXml.Root.Nodes[0].Nodes[0].ValueAsString;
        mXMLData.Clear;
        mXMLData.Position := 0;
        IdHTTP.Get('http://www.qrz.com/xml?s=' + SessionId + ';callsign=' + GetOriginalCall(Trim(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString)), mXMLData);
        mXMLData.Position := 0;
        NativeXml.Clear;
        NativeXml.LoadFromStream(mXMLData);
        // NativeXml.SaveToFile('d:\1.xml');

        if Pos('Not found', NativeXml.Root.Nodes[0].Nodes[0].ValueAsString) = 0 then
          dmMain.qryLogEdit.FieldByName('LOG_NAME').asString := NativeXml.Root.Nodes[0].Nodes[1].ValueAsString + ' ' + NativeXml.Root.Nodes[0].Nodes[2].ValueAsString;
      end;

    except
      on E: Exception do
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
    end;
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(NativeXml);
    FreeAndNil(mXMLData);
  end;
end;

procedure TMainWindow.aSaveQSOUpdate(Sender: TObject);
begin
  aSaveQSO.Enabled := (dmMain.qryLogEdit.State in [dsEdit, dsInsert]) and (Trim(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString) <> '');
end;

procedure TMainWindow.CoreCommand(Sender: TObject);
var
  lParam, wParam: variant;
  vVariable: variant;
begin
  if dmMain.dsLogEdit.State in [dsEdit] then
    if not((TAction(Sender).Index = CA_CANCEL_QSO) or (TAction(Sender).Index = CA_SAVE_QSO)) then
      exit;

  case TAction(Sender).Index of
    CA_NEW_QSO:
      NewQSO;
    CA_CANCEL_QSO:
      CancelQSO;
    CA_SAVE_QSO:
      begin
        if dmMain.qryLogEdit.State in [dsInsert] then
        begin
          lParam := 1;
          wParam := -1;
        end;
        if dmMain.qryLogEdit.State in [dsEdit] then
          lParam := 2;
        vVariable := dmMain.qryLogEdit.FieldByName('LOG_CALL').AsVariant;
        SaveQSO;
        Plugins.CoreCommand(CA_REFRESH_LOG, aRefreshLog, lParam, wParam);
        Plugins.CoreCommand(CA_SAVE_QSO, aSaveQSO, vVariable, wParam);
        CoreCommand(aNewQSO);
        exit;
      end;
    CA_OPTIONS:
      begin
        Options.NodeSelectIndex := 1;
        Options.ShowModal;
      end;
    CA_IMPORT_FROM_ADIF:
      ImportFromAdif;
    CA_EXPORT_TO_ADIF:
      ExportToAdif;
    CA_EQSL_UPLOAD_SELECTED:
      ExchangeQSL(CA_EQSL_UPLOAD_SELECTED);
    CA_EQSL_UPLOAD_UNEXPORTED:
      ExchangeQSL(CA_EQSL_UPLOAD_UNEXPORTED);
    CA_EQSL_UPLOAD_CHECK:
      ExchangeQSL(CA_EQSL_UPLOAD_CHECK);
    CA_EQSL_DOWNLOAD:
      ExchangeQSL(CA_EQSL_DOWNLOAD);
    CA_EQSL_UPLOAD_DOWNLOAD:
      ExchangeQSL(CA_EQSL_UPLOAD_DOWNLOAD);

    CA_DQSL_UPLOAD_SELECTED:
      ExchangeQSL(CA_DQSL_UPLOAD_SELECTED);
    CA_DQSL_UPLOAD_UNEXPORTED:
      ExchangeQSL(CA_DQSL_UPLOAD_UNEXPORTED);
    CA_DQSL_DOWNLOAD:
      ExchangeQSL(CA_DQSL_DOWNLOAD);
    CA_DQSL_UPLOAD_DOWNLOAD:
      ExchangeQSL(CA_DQSL_UPLOAD_DOWNLOAD);
    CA_DQSL_MANUAL_CONFIRM:
      begin
        dQSLManualConfirm;
        exit;
      end;

    CA_LOTW_UPLOAD_SELECTED:
      ExchangeQSL(CA_LOTW_UPLOAD_SELECTED);
    CA_LOTW_UPLOAD_UNEXPORTED:
      ExchangeQSL(CA_LOTW_UPLOAD_UNEXPORTED);
    CA_LOTW_DOWNLOAD:
      ExchangeQSL(CA_LOTW_DOWNLOAD);
    CA_LOTW_UPLOAD_DOWNLOAD:
      ExchangeQSL(CA_LOTW_UPLOAD_DOWNLOAD);
    CA_HRDLOG_UPLOAD_SELECTED:
      ExchangeQSL(CA_HRDLOG_UPLOAD_SELECTED);

    CA_QSL_SERVICES_EXCHANGE:
      ExchangeQSL(CA_QSL_SERVICES_EXCHANGE);

    CA_DATABASE_COMPACT_AND_RESTORE:
      begin
        DatabaseCompactAndRestore;
      end;
    CA_DATABASE_MAKE_BACKUP:
      begin
        DatabaseMakeBackup;
      end;
    CA_DATABASE_RESTORE_BACKUP:
      begin
        DatabaseRestoreBackup;
      end;
    CA_Profile_SAVE:
      begin
        Screen.Cursor := crHourGlass;
        try
          SaveProfile;
          Options.FormStorage.SaveFormPlacement;
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    CA_Profile_SAVE_AS:
      begin
        SaveProfileAs;
      end;
    CA_Profile_SET_DEFAULT:
      begin
        SetProfileDefault;
        exit;
      end;
    CA_EXIT:
      begin
        Close;
      end;
    CA_GROUP_FIELD_VALUE_REPLACE:
      begin
        GroupFieldValueReplace;
        exit;
      end;
    CA_REDEFINE_GEO_DATA:
      begin
        RedefineGeoData;
        exit;
      end;
    CA_REDEFINE_MY_DATA:
      begin
        RedefineMyData;
        exit;
      end;
    CA_RECORD_REMOVE:
      begin
        RecordRemove;
        exit;
      end;
    CA_UPDATE_FLASH:
      begin
        UpdateFlash;
        exit;
      end;
    CA_PRINT_QSL_QUEUE:
      begin
        PrintQSLQueue;
        exit;
      end;
    CA_PRINT_QUEUE_CLEAR:
      begin
        PrintQSLQueueClear(false, 'N');
        MainWindow.CoreCommand(MainWindow.aRefreshLog);
        exit;
      end;
    CA_PRINT_QUEUE_SETTINGS:
      begin
        Application.CreateForm(TPrintQSLSettings, PrintQSLSettings);
        Translator.TranslateWindow('PrintQSLSettings', PrintQSLSettings);
        PrintQSLSettings.ShowModal;
        FreeAndNil(PrintQSLSettings);
        exit;
      end;
    CA_REPORT_DESIGN:
      begin
        ReportDesign;
        exit;
      end;

    CA_CALL_INFO:
      begin
        CallInfo;
        exit;
      end;

    CA_CALL_MISTAKE:
      bCallMistake := true;

  end;
  Plugins.CoreCommand(TAction(Sender).Index, Sender, 0, 0);

  case TAction(Sender).Index of
    CA_CANCEL_QSO:
      CoreCommand(aNewQSO);
  end;

  if TAction(Sender).Tag > 0 then
    ShowWindow(Sender);
end;

procedure TMainWindow.DllCommand(IdCommand: integer; Sender: TObject; var lParam, wParam: variant);
var
  lCallInfo: TCallInfo;
  i: integer;
begin
  case IdCommand of
    DC_TRANSLATE_WINDOW:
      begin
        if VarIsEmpty(lParam) then
          Translator.TranslateWindow(TComponent(Sender).Name, TComponent(Sender))
        else
          Translator.TranslateWindow(lParam, TComponent(Sender));
      end;
    DC_REFRESH_LOG:
      Plugins.CoreCommand(aRefreshLog.Index, Sender, lParam, wParam);
    // CoreCommand(aRefreshLog);
    DC_EDIT_QSO:
      begin
        EditQSO(lParam, wParam);
        Plugins.CoreCommand(CA_EDIT_QSO, Sender, lParam, wParam);
        if Options.cbAutoGetCalSecondaryDataOnEdit.Checked then
          CallInfo;
      end;
    DC_DELETE_QSO:
      begin
        DeleteQSO(lParam, wParam);
        Plugins.CoreCommand(CA_DELETE_QSO, Sender, lParam, wParam);
      end;
    DC_MODE_CHANGED:
      begin
        if dmMain.qryLogEdit.State in [dsEdit] then
        begin
          dmMain.qryLogEdit.FieldByName('LOG_MODE').asString := VarToStr(lParam);
          exit;
        end;
        Options.FormStorageOnExit.StoredValue['Mode'] := lParam;
        Plugins.CoreCommand(CC_MODE_CHANGED, Sender, lParam, wParam);
        sCurrentMode := VarToStr(lParam);
        { CurrentBandOld:=Options.FormStorage.StoredValue['Band'];
          sCurrentModeOld:=sCurrentMode; }

        if dmMain.qryLogEdit.State in [dsInsert, dsEdit] then
        begin
          dmMain.qryLogEdit.FieldByName('LOG_MODE').asString := VarToStr(lParam);
        end;
        sbMain.Repaint;
        { sbMain.Update;
          sbMain.Repaint; }
      end;
    DC_BAND_CHANGED:
      begin
        if dmMain.qryLogEdit.State in [dsEdit] then
        begin
          dmMain.qryLogEdit.FieldByName('LOG_BAND').asString := dmMain.GetADIFBandFromMhz(lParam);
          dmMain.qryLogEdit.FieldByName('LOG_BAND_MHZ').Value := lParam;
          exit;
        end;
        Options.FormStorageOnExit.StoredValue['Band'] := lParam;
        Plugins.CoreCommand(CC_BAND_CHANGED, Sender, lParam, wParam);
        CurrentBand := lParam;
        if dmMain.qryLogEdit.State in [dsInsert, dsEdit] then
        begin
          dmMain.qryLogEdit.FieldByName('LOG_BAND').asString := dmMain.GetADIFBandFromMhz(lParam);
          dmMain.qryLogEdit.FieldByName('LOG_BAND_MHZ').Value := lParam;
        end;
        sbMain.Repaint;
        { sbMain.Update;
          sbMain.Repaint; }
      end;
    DC_CALL_CHANGED:
      CallChanged(lParam);
    DC_SELECT_RECORDS:
      begin
        SelectedRows := Unassigned;
        SelectedRows := lParam;
      end;
    DC_SAVE_QSO:
      CoreCommand(aSaveQSO);
    DC_GET_SELECTED_RECORDS:
      Plugins.CoreGetData(CC_GET_SELECTED_RECORDS, lParam, wParam);
    DC_SET_RADIO_TO_SPOT:
      begin
        { if dmMain.dsLogEdit.DataSet.State in [dsInsert] then
          dmMain.dsLogEdit.DataSet.FieldByName('LOG_FREQ').AsFloat:=lParam/1000000; }
        Plugins.CoreCommand(CC_SET_RADIO_TO_SPOT, Sender, lParam, wParam);
      end;
    DC_GOTO_RECORD_BY_ID:
      begin
        Plugins.CoreCommand(CC_GOTO_RECORD_BY_ID, Sender, lParam, wParam);
      end;
    DC_CALL_INFO:
      begin
        CallInfo;
      end;
    DC_GET_CALL_DXCC_ID:
      begin
        lCallInfo := GetPrefixData(lParam, Now);
        wParam := lCallInfo.PrefixData.ADIF;
      end;
    DC_CANCEL_QSO:
      CoreCommand(aCancelQSO);
    DC_SENT_CW:
      Plugins.CoreCommand(CC_SENT_CW, Sender, lParam, wParam);

    DC_CLUSTER_WWW_CHANGED:
      Plugins.CoreCommand(CC_CLUSTER_WWW_CHANGED, Sender, lParam, wParam);

    DC_CLUSTER_TELNET_CHANGED:
      Plugins.CoreCommand(CC_CLUSTER_TELNET_CHANGED, Sender, lParam, wParam);

    DC_CLUSTER_WWW_CLEAR:
      Plugins.CoreCommand(CC_CLUSTER_WWW_CLEAR, Sender, lParam, wParam);

    DC_CLUSTER_TELNET_CLEAR:
      Plugins.CoreCommand(CC_CLUSTER_TELNET_CLEAR, Sender, lParam, wParam);

    DC_CLUSTER_WWW_LOADED:
      Plugins.CoreCommand(CC_CLUSTER_WWW_LOADED, Sender, lParam, wParam);

    DC_CLUSTER_TELNET_LOADED:
      Plugins.CoreCommand(CC_CLUSTER_TELNET_LOADED, Sender, lParam, wParam);

    DC_CALL_ADDITION_INFO:
      wParam := CallAdditionInfo(lParam);

    DC_SET_LOG_FILTER:
      begin
        Plugins.CoreCommand(CC_SET_LOG_FILTER, Sender, lParam, wParam);
      end;
    DC_RADIO_RX:
      begin
        sbMain.Panels[3].Text := 'RX';
        ilmRxTx.InactiveColor := aclSeaGreen;
        if not ilmRxTx.Visible then
          ilmRxTx.Visible := true;
        sbMain.Repaint;
      end;

    DC_RADIO_TX:
      begin
        sbMain.Panels[3].Text := 'TX';
        ilmRxTx.InactiveColor := aclRed;
        if not ilmRxTx.Visible then
          ilmRxTx.Visible := true;
        sbMain.Repaint;
      end;

    DC_GET_TRANSLATE_FILE:
      lParam:=Translator.FileName;


  end;
end;

procedure TMainWindow.DeleteQSO(SelectedRecords, wParam: variant);
var
  i, HighBound: integer;
begin
  if wParam = 1 then
  begin
    Screen.Cursor := crHourGlass;
    dmMain.qryLog.DisableControls;
    try
      dmMain.qryLog.EmptyTable;
    finally
      dmMain.qryLog.Close;
      dmMain.qryLog.Open;
      dmMain.qryLog.EnableControls;
      Screen.Cursor := crDefault;
    end;
    exit;
  end;

  Screen.Cursor := crHourGlass;
  dmMain.qryLog.DisableControls;
  try
    i := VarArrayLowBound(SelectedRecords, 1);
    HighBound := VarArrayHighBound(SelectedRecords, 1);
    while i <= HighBound do
      try
        dmMain.qryLog.First;
        if dmMain.qryLog.Locate('LOG_ID', SelectedRecords[i], []) then
          dmMain.qryLog.Delete;
        inc(i);
      except
        on E: Exception do
          MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
      end;
  finally
    { dmMain.qryLog.Close;
      dmMain.qryLog.Open; }
    dmMain.qryLog.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainWindow.EditQSO(LogId, StationId: integer);
var
  i: integer;
  qryTemp: TKADaoTable;
begin
  dmMain.qryLogEdit.DisableControls;
  dmMain.qryLogEdit.Cancel;
  dmMain.qryLogEdit.Append;

  if StationId = 0 then
  begin
    for i := 0 to dmMain.qryLog.FieldCount - 1 do
      dmMain.qryLogEdit.Fields[i].Value := dmMain.qryLog.Fields[i].Value;
    // dmMain.qryLogEdit.FieldByName('LOG_CALL_ORIGINAL').asString := GetOriginalCall(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString);
    dmMain.qryLogEdit.Post;
    dmMain.qryLogEdit.Edit;
  end
  else
  begin
    qryTemp := TKADaoTable.Create(nil);
    try
      qryTemp.Database := dmMain.DAODatabase;
      qryTemp.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_ID=' + IntToStr(LogId);
      qryTemp.Open;
      for i := 0 to dmMain.qryLogEdit.FieldCount - 1 do
        if dmMain.qryLogEdit.Fields[i].FieldName = 'STATION_ID' then
          dmMain.qryLogEdit.Fields[i].AsInteger := StationId
        else
          dmMain.qryLogEdit.Fields[i].Value := qryTemp.FieldByName(dmMain.qryLogEdit.Fields[i].FieldName).Value;
      // dmMain.qryLogEdit.FieldByName('LOG_CALL_ORIGINAL').asString := GetOriginalCall(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString);
      dmMain.qryLogEdit.Post;
      dmMain.qryLogEdit.Edit;
      dmMain.qryLogEdit.FieldByName('LOG_ID').Value := qryTemp.FieldByName('LOG_ID').Value;

    finally
      FreeAndNil(qryTemp);
    end;
  end;

  if dmMain.qryLogEdit.FieldByName('LOG_QSLSDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_QSLSDATE').AsDateTime := Date;

  if dmMain.qryLogEdit.FieldByName('LOG_QSLRDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_QSLRDATE').AsDateTime := Date;

  if dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLSDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLSDATE').AsDateTime := Date;

  if dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLRDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLRDATE').AsDateTime := Date;

  if dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLSDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLSDATE').AsDateTime := Date;

  if dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLRDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLRDATE').AsDateTime := Date;

  if dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLSDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLSDATE').AsDateTime := Date;

  if dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLRDATE').asString = '' then
    dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLRDATE').AsDateTime := Date;

  dmMain.qryLogEdit.EnableControls;

  { if Options.cbAutoGetCalSecondaryDataOnEdit.Checked then
    CoreCommand(aCallInfo); }
end;

procedure TMainWindow.CancelQSO;
var
  frmCancelDialog: TCancelDialog;
begin
  bCallMistake := false;
  if dmMain.qryLogEdit.State in [dsEdit] then
  begin
    try
      frmCancelDialog := TCancelDialog.Create(nil);
      frmCancelDialog.aCancel.ShortCut := aCancelQSO.ShortCut;
      frmCancelDialog.Caption := Options.msgConfirmation.Caption;
      frmCancelDialog.lbMessage.Caption := Options.msgCancelEdit.Caption;
      frmCancelDialog.btnOk.Caption := Translator.GetCaption('MainWindow', 'Yes');
      frmCancelDialog.btnCancel.Caption := Translator.GetCaption('MainWindow', 'No');
      frmCancelDialog.ShowModal;
      if frmCancelDialog.bResult then
        dmMain.qryLogEdit.Cancel
      else
        Abort;
    finally
      FreeAndNil(frmCancelDialog);
    end;
  end;
end;

procedure TMainWindow.cbProfileClick(Sender: TObject);
begin
  ChangeProfile;
end;

procedure TMainWindow.NewQSO;
begin
  ActionList.State := asNormal;
  if GetBookCount = 0 then
  begin
    Application.MessageBox(PWideChar(Options.msgInformationSetPersonalData.Caption), PWideChar(Options.msgInformation.Caption), MB_OK or MB_ICONINFORMATION);
    Options.NodeSelectIndex := 2;
    Options.ShowModal;
  end;

  if dmMain.qryLogEdit.Active and (dmMain.qryLogEdit.RecordCount > 0) then
    dmMain.qryLogEdit.EmptyTable;
  dmMain.qryLogEdit.Close;
  dmMain.qryLogEdit.Open;
  dmMain.qryLogEdit.Append;
  dmMain.qryLogEdit.FieldByName('LOG_BAND').asString := dmMain.GetADIFBandFromMhz(CurrentBand);
  dmMain.qryLogEdit.FieldByName('LOG_BAND_MHZ').Value := CurrentBand;
  dmMain.qryLogEdit.FieldByName('LOG_MODE').asString := sCurrentMode;
  dmMain.qryLogEdit.FieldByName('LOG_OPERATOR').asString := dmMain.qryStations.FieldByName('STATION_CALL').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_NAME').asString := dmMain.qryStations.FieldByName('STATION_NAME').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_POSTAL_CODE').asString := dmMain.qryStations.FieldByName('STATION_POSTAL_CODE').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_COUNTRY').asString := dmMain.MyCountryName;
  dmMain.qryLogEdit.FieldByName('LOG_MY_CITY').asString := dmMain.qryStations.FieldByName('STATION_CITY').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_STREET').asString := dmMain.qryStations.FieldByName('STATION_STREET').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_GRIDSQUARE').asString := dmMain.qryStations.FieldByName('STATION_GRIDSQUARE').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_LAT').asFloat := dmMain.qryStations.FieldByName('STATION_LAT').asFloat;
  dmMain.qryLogEdit.FieldByName('LOG_MY_LON').asFloat := dmMain.qryStations.FieldByName('STATION_LON').asFloat;
  dmMain.qryLogEdit.FieldByName('LOG_MY_CNTY').asString := dmMain.qryStations.FieldByName('STATION_CNTY').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_CQ_ZONE').asString := dmMain.qryStations.FieldByName('STATION_CQ_ZONE').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_IOTA').asString := dmMain.qryStations.FieldByName('STATION_IOTA').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_ITU_ZONE').asString := dmMain.qryStations.FieldByName('STATION_ITU_ZONE').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_RIG').asString := dmMain.qryStations.FieldByName('STATION_RIG').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_SIG').asString := dmMain.qryStations.FieldByName('STATION_SIG').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_SIG_INFO').asString := dmMain.qryStations.FieldByName('STATION_SIG_INFO').asString;
  dmMain.qryLogEdit.FieldByName('LOG_MY_STATE').asString := dmMain.qryStations.FieldByName('STATION_STATE').asString;
  // dmMain.qryLogEdit.FieldByName('LOG_FREQ').asFloat := 0;
  dmMain.qryLogEdit.FieldByName('LOG_DXCC').AsInteger := -1;
  dmMain.qryLogEdit.FieldByName('LOG_QSL_SENT').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_QSL_RCVD').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_SENT').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_RCVD').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSL_SENT').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSL_RCVD').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_SENT').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_RCVD').asString := 'N';
  dmMain.qryLogEdit.FieldByName('LOG_QSL_SENT_VIA').asString := 'B';
  dmMain.qryLogEdit.FieldByName('LOG_QSL_RCVD_VIA').asString := 'B';
  dmMain.qryLogEdit.FieldByName('LOG_QSLSDATE').Value := Date;
  dmMain.qryLogEdit.FieldByName('LOG_QSLRDATE').Value := Date;
  dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLSDATE').Value := Date;
  dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLRDATE').Value := Date;
  dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLSDATE').Value := Date;
  dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLRDATE').Value := Date;
  dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLSDATE').Value := Date;
  dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLRDATE').Value := Date;
  Plugins.CoreCommand(CC_CALL_CHANGED, Self, '', '');
  ClearGeoData;
  // sbMain.Panels[4].Text:=aNewQSO.Caption+' '+aSaveQSO.Caption+' / '+aCancelQSO.Caption;
end;

procedure TMainWindow.SaveQSO;
var
  i: integer;
  bNewManager: boolean;
  sConnectStr, sLogin, sPassword, sUserStr: string;
  qryTemp: TKADaoTable;
begin
  bCallMistake := false;
  if (dmMain.qryLogEdit.FieldByName('LOG_QSL_SENT').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_QSL_SENT').asString = 'R') or (dmMain.qryLogEdit.FieldByName('LOG_QSL_SENT').asString = 'I') or
    (dmMain.qryLogEdit.FieldByName('LOG_QSL_SENT').asString = '') then
    dmMain.qryLogEdit.FieldByName('LOG_QSLSDATE').asString := '';
  if (dmMain.qryLogEdit.FieldByName('LOG_QSL_RCVD').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_QSL_RCVD').asString = '') or (dmMain.qryLogEdit.FieldByName('LOG_QSL_RCVD').asString = 'I') then
    dmMain.qryLogEdit.FieldByName('LOG_QSLRDATE').asString := '';
  if (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_SENT').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_SENT').asString = '') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_SENT').asString = 'I') then
    dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLSDATE').asString := '';
  if (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_RCVD').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_RCVD').asString = '') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_RCVD').asString = 'I') then
    dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSLRDATE').asString := '';
  if (dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_SENT').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_SENT').asString = '') or (dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_SENT').asString = 'I') then
    dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLSDATE').asString := '';
  if (dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_RCVD').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_RCVD').asString = '') or (dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSL_RCVD').asString = 'I') then
    dmMain.qryLogEdit.FieldByName('LOG_LOTW_QSLRDATE').asString := '';
  if (dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSL_SENT').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_SENT').asString = '') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_SENT').asString = 'I') then
    dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLSDATE').asString := '';
  if (dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSL_RCVD').asString = 'N') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_RCVD').asString = '') or (dmMain.qryLogEdit.FieldByName('LOG_EQSL_QSL_RCVD').asString = 'I') then
    dmMain.qryLogEdit.FieldByName('LOG_DQSL_QSLRDATE').asString := '';

  dmMain.qryLogEdit.FieldByName('LOG_QSO_DATE').AsDateTime := StrToDate(DateToStr(dmMain.qryLogEdit.FieldByName('LOG_QSO_DATETIME').AsDateTime));
  dmMain.qryLogEdit.FieldByName('LOG_QSO_TIME').AsDateTime := StrToTime(FormatDateTime('hh:nn', dmMain.qryLogEdit.FieldByName('LOG_QSO_DATETIME').AsDateTime));

  // dmMain.qryLogEdit.FieldByName('LOG_CALL_ORIGINAL').asString := GetOriginalCall(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString);

  if not dmMain.qryLog.Active then
  begin
    dmMain.qryLog.TableName := 'LOG_' + IntToStr(CurrentStationId);
    dmMain.qryLog.Open;
  end;

  if dmMain.qryLogEdit.FieldByName('STATION_ID').AsInteger > 0 then
  begin
    qryTemp := TKADaoTable.Create(nil);
    try
      dmMain.qryLogEdit.Post;
      qryTemp.Database := dmMain.DAODatabase;
      qryTemp.TableName := 'LOG_' + IntToStr(dmMain.qryLogEdit.FieldByName('STATION_ID').AsInteger);
      qryTemp.Open;
      qryTemp.Locate('LOG_ID', dmMain.qryLogEdit.FieldByName('LOG_ID').AsInteger, []);
      qryTemp.Edit;
      for i := 0 to qryTemp.FieldCount - 1 do
      begin
        if qryTemp.Fields[i].FieldName <> 'LOG_ID' then
          if qryTemp.Fields[i].FieldName = 'LOG_CALL' then
            qryTemp.Fields[i].asString := Trim(dmMain.qryLogEdit.Fields[i].asString)
          else
            qryTemp.Fields[i].Value := dmMain.qryLogEdit.Fields[i].Value;
      end;
      dmMain.qryLog.Cancel;
      qryTemp.Post;
      qryTemp.Close;
    finally
      FreeAndNil(qryTemp);
    end;
    exit;
  end;

  if dmMain.qryLogEdit.State = dsInsert then
  begin
    dmMain.qryLogEdit.Post;
    dmMain.qryLog.Append;
  end
  else
  begin
    dmMain.qryLogEdit.Post;
    dmMain.qryLog.Edit;
  end;

  for i := 0 to dmMain.qryLog.FieldCount - 1 do
  begin
    if dmMain.qryLog.Fields[i].FieldName <> 'LOG_ID' then
      if dmMain.qryLog.Fields[i].FieldName = 'LOG_CALL' then
        dmMain.qryLog.Fields[i].asString := Trim(dmMain.qryLogEdit.Fields[i].asString)
      else
        dmMain.qryLog.Fields[i].Value := dmMain.qryLogEdit.Fields[i].Value;
  end;

  if Options.cbPartnerProgramm.Checked then
  begin
    bNewManager := false;
    if Trim(dmMain.qryLogEdit.FieldByName('LOG_QSL_VIA').asString) <> '' then
    begin
      for i := 0 to Length(CurrentManagers) - 1 do
        if Copy(CurrentManagers[i], 1, Pos(';', CurrentManagers[i]) - 1) = UpperCase(Trim(dmMain.qryLogEdit.FieldByName('LOG_QSL_VIA').asString)) then
        begin
          bNewManager := true;
          break;
        end;

      if not bNewManager then
      begin
        SentInetUrl('http://www.ut4ukw.com/logbook/web-reposit/add-manager.php?lc=' + dmMain.qryLogEdit.FieldByName('LOG_CALL').asString + '&mc=' + dmMain.qryLogEdit.FieldByName('LOG_QSL_VIA').asString + '&ui=' + dmMain.qryStations.FieldByName
            ('STATION_CALL').asString);
      end;
    end;
  end;

  { if (dmMain.qryLog.State in [dsInsert]) and (
    (dmMain.qryStations.FieldByName('STATION_EQSL_SENT_EVERY').AsInteger=1) or
    (dmMain.qryStations.FieldByName('STATION_HRDLOG_SENT_EVERY').AsInteger=1)) then
    thrSentInfo.Execute(nil); }

  if (dmMain.qryLog.State in [dsInsert]) then
    if dmMain.qryStations.FieldByName('STATION_EQSL_SENT_EVERY').AsInteger = 1 then
    begin
      sLogin := dmMain.qryStations.FieldByName('STATION_EQSL_LOGIN').asString;
      sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_EQSL_PASSWORD').asString);
      sConnectStr := 'http://www.eqsl.cc/qslcard/ImportADIF.cfm?ADIFData=';
      sUserStr := '<EQSL_USER:' + IntToStr(Length(sLogin)) + '>' + sLogin + '<EQSL_PSWD:' + IntToStr(Length(sPassword)) + '>' + sPassword + '<EOH>';
      SentEveryEQSLResult := GetUrlContent(sConnectStr + StringReplace(UrlEncode(sUserStr + GetAdifRow(dmMain.qryLogEdit, true)), ':', '%3A', [rfReplaceAll, rfIgnoreCase]));
      if Pos('1 records added', SentEveryEQSLResult) > 0 then
      begin
        dmMain.qryLog.FieldByName('LOG_EQSL_QSL_SENT').asString := 'Y';
        dmMain.qryLog.FieldByName('LOG_EQSL_QSLSDATE').AsDateTime := Date;
      end;
    end;
  if dmMain.qryStations.FieldByName('STATION_HRDLOG_SENT_EVERY').AsInteger = 1 then
    thrSentInfo.Execute(nil);

  try
    try
      dmMain.qryLog.Post;
    except
      on E: Exception do
      begin
        dmMain.qryLog.Cancel;
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
      end;
    end;
  finally
    // dmMain.qryLogEdit.EmptyTable;
    // dmMain.qryLog.EnableControls;
  end;
end;

procedure TMainWindow.sbMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  Y: integer;
begin
  // if dmMain.qryStations.IsEmpty then exit;

  Y := (StatusBar.Height - StatusBar.Canvas.TextHeight('D')) div 2;
  if Panel = StatusBar.Panels[0] then
  begin
    StatusBar.Canvas.FillRect(Rect);
    StatusBar.Canvas.TextOut(Rect.Left + 24, Y, CurrentStationBookName + ' [' + Trim(CurrentStationCall) + ']');
  end;
  if Panel = StatusBar.Panels[2] then
  begin
    StatusBar.Canvas.FillRect(Rect);
    StatusBar.Canvas.TextOut(Rect.Left + 24, Y, sCurrentMode);
  end;

  if Panel = StatusBar.Panels[1] then
  begin
    StatusBar.Canvas.FillRect(Rect);
    StatusBar.Canvas.TextOut(Rect.Left + 24, Y, FormatFloat('0.##', CurrentBand) + ' MHz')
  end;

  if Panel = StatusBar.Panels[3] then
  begin
    StatusBar.Canvas.FillRect(Rect);
    StatusBar.Canvas.TextOut(Rect.Left + 2, Y, StatusBar.Panels[3].Text);
    // StatusBar.Canvas.TextOut(Rect.Left + 2, Y, 'RX');
  end;

  if Panel = StatusBar.Panels[4] then
  begin
    StatusBar.Canvas.FillRect(Rect);
    StatusBar.Canvas.TextOut(Rect.Left + 2, Y, StatusBar.Panels[4].Text);
  end;

end;

procedure TMainWindow.IdHTTPDownloadWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  if FDownloadTerminate then
    Abort;
  pdDownload.Position := AWorkCount;
end;

procedure TMainWindow.IdHTTPDownloadWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  pdDownload.Max := AWorkCountMax;
  Application.ProcessMessages;
end;

procedure TMainWindow.IdHTTPDownloadWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  FDownloadOk := true;
  // pdDownload.Position := FileSize;
  { pdDownload.Hide;
    ApplyFlashUpdate; }
end;

procedure TMainWindow.ImportFromAdif;
begin
  Application.CreateForm(TImportFromADIFDialog, ImportFromADIFDialog);
  Translator.TranslateWindow(ImportFromADIFDialog.Name, ImportFromADIFDialog);
  ImportFromADIFDialog.Caption := aImportFromAdif.Caption;
  ImportFromADIFDialog.lbProgress.Caption := '';
  ImportFromADIFDialog.qryStations.Open;
  ImportFromADIFDialog.dbcStations.KeyValue := dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
  // ImportFromADIFDialog.feFile.FileName := 'D:\!\super_last.adi';
  ImportFromADIFDialog.ShowModal;
  FreeAndNil(ImportFromADIFDialog);
  // CoreCommand(aRefreshLog);
end;

procedure TMainWindow.ExportToAdif;
begin
  Application.CreateForm(TExportToADIFDialog, ExportToADIFDialog);
  Translator.TranslateWindow(ExportToADIFDialog.Name, ExportToADIFDialog);
  ExportToADIFDialog.Caption := aExportToAdif.Caption;
  // ExportToADIFDialog.feFile.FileName := 'D:\!\!TEST.adi';
  ExportToADIFDialog.lbProgress.Caption := '';
  ExportToADIFDialog.ShowModal;
  FreeAndNil(ExportToADIFDialog);
end;

procedure TMainWindow.CallChanged(vCall: variant);
var
  sCall: string;
  pData: PCallInfo;
  CallInfo: TCallInfo;
  v: variant;
begin
  if not(dmMain.dsLogEdit.DataSet.State in [dsEdit, dsInsert]) then
    exit;

  if not bCallMistake then
  begin
    dmMain.dsLogEdit.DataSet.FieldByName('LOG_NAME').asString := '';
    dmMain.dsLogEdit.DataSet.FieldByName('LOG_QTH').asString := '';
    dmMain.dsLogEdit.DataSet.FieldByName('LOG_STATE').asString := '';
    dmMain.dsLogEdit.DataSet.FieldByName('LOG_CNTY').asString := '';
    dmMain.dsLogEdit.DataSet.FieldByName('LOG_WEB').asString := '';
    dmMain.dsLogEdit.DataSet.FieldByName('LOG_EMAIL').asString := '';
  end;

  timCallComplete.Enabled := false;
  sCall := VarToStr(vCall);

  New(pData);
  pData^ := GetPrefixData(sCall, dmMain.dsLogEdit.DataSet.FieldByName('LOG_QSO_DATETIME').AsDateTime);

  dmMain.dsLogEdit.DataSet.FieldByName('LOG_CONT').asString := pData.PrefixData.Continent;
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_DXCC').asString := pData.PrefixData.ADIF;
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_PFX').asString := pData.PrefixData.Prefix;
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_COUNTRY').asString := pData.PrefixData.Territory;
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_CONTINENT').asString := dmMain.GetContinentName(pData.PrefixData.Continent);

  { dmMain.dsLogEdit.DataSet.FieldByName('LOG_LAT').AsString := FloatToStr(pData.PrefixData.Location.Y / 180);
    dmMain.dsLogEdit.DataSet.FieldByName('LOG_LON').AsString := FloatToStr(pData.PrefixData.Location.X / 180); }
  { ldsLogEdit.DataSet.FieldByName('LOG_CQZ').asString:=CallParser.HitList[0].CQ;
    ldsLogEdit.DataSet.FieldByName('LOG_ITUZ').asString:=CallParser.HitList[0].ITU; }

  TVarData(v).VType := VarByRef;
  TVarData(v).VPointer := pData;
  Plugins.CoreCommand(CC_CALL_CHANGED, Self, vCall, v);
  Dispose(pData);
  v := Unassigned;
  if timCallComplete.Interval > 0 then
    timCallComplete.Enabled := true;
end;

procedure TMainWindow.ClearGeoData;
begin
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_CONT').asString := 'UN';
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_PFX').asString := '';
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_LAT').asString := '';
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_LON').asString := '';
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_DXCC').AsInteger := -1;
  dmMain.dsLogEdit.DataSet.FieldByName('LOG_GRIDSQUARE').asString := '';
end;

procedure TMainWindow.ExchangeQSL(eType: integer);
var
  lParam, wParam: variant;
begin
  Application.CreateForm(TExchangeQSLServices, ExchangeQSLServices);
  Translator.TranslateWindow(ExchangeQSLServices.Name, ExchangeQSLServices);
  ExchangeQSLServices.TypeOperation := eType;

  if (eType = CA_EQSL_UPLOAD_SELECTED) or (eType = CA_DQSL_UPLOAD_SELECTED) or (eType = CA_LOTW_UPLOAD_SELECTED) or (eType = CA_HRDLOG_UPLOAD_SELECTED) then
  begin
    Plugins.CoreGetData(CC_GET_SELECTED_RECORDS, lParam, wParam);
    ExchangeQSLServices.SelectedAll := wParam = 1;
    if (varType(lParam) and varArray) = varArray then
      ExchangeQSLServices.SelectedRecords := lParam;
  end;
  ExchangeQSLServices.ShowModal;
  FreeAndNil(ExchangeQSLServices);
end;

procedure TMainWindow.StatusIconClick(Sender: TObject);
begin
  if TImage(Sender).Name = 'imInfo' then
  begin
    TImage(Sender).Visible := false;
    sbMain.Canvas.FillRect(Bounds(imQSL.Left, 2, 16, 16));
    MessageBox(Handle, PWideChar(IntToStr(iCountExportedToeQSL) + ' ' + Options.msgInformationQSLExchange.Caption), PWideChar(Options.msgInformation.Caption), MB_OK or MB_ICONINFORMATION);
  end;

  if TImage(Sender).Name = 'imMail' then
  begin
    TImage(Sender).Visible := false;
    sbMain.Canvas.FillRect(Bounds(imQSL.Left, 2, 16, 16));
    Plugins.CoreCommand(CC_SHOW_NEW_EQSL, Self, 0, 0);
  end;
end;

procedure TMainWindow.stmMainCreateScreenTip(Manager: TObject; Item: TScreenTipItem);
begin
  Item.ShowFooter := false;
end;

procedure TMainWindow.thrSentInfoExecute(Sender: TObject; Params: Pointer);
var
  sParams: TStringList;
begin
  sParams := TStringList.Create;
  try
    sParams.Add('Callsign=' + dmMain.qryStations.FieldByName('STATION_HRDLOG_LOGIN').asString);
    sParams.Add('Code=' + Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_HRDLOG_PASSWORD').asString));
    sParams.Add('ADIFData=' + GetAdifRow(dmMain.qryLogEdit, true));
    try
      IdHTTP.Post('http://www.hrdlog.net/NewEntry.aspx', sParams);
    except
      { on E: exception do
        HRDLogUploadResponce := E.Message; }
    end;
  finally
    FreeAndNil(sParams);
  end;
end;

procedure TMainWindow.timCallCompleteTimer(Sender: TObject);
begin
  timCallComplete.Enabled := false;
  CoreCommand(aCallInfo);
end;

procedure TMainWindow.DatabaseCompactAndRestore;
var
  OldStationId: integer;
begin
  Screen.Cursor := crHourGlass;
  OldStationId := CurrentStationId;
  try
    dmMain.qryLog.Close;
    dmMain.DAODatabase.Close;
    dmMain.DAODatabase.RepairAccessDatabase(dmMain.DAODatabase.Database, '');
    dmMain.DAODatabase.CompactAccessDatabase(dmMain.DAODatabase.Database, '');
    dmMain.DAODatabase.Open;
    dmMain.OpenDatasets;
    dmMain.SetStationId(OldStationId);
    CoreCommand(aNewQSO);
    Screen.Cursor := crDefault;
  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
      Close;
    end;
  end;
end;

procedure TMainWindow.DatabaseMakeBackup(bExit: boolean = false);
  procedure Backup(CheckModify: boolean = true);
  begin
    if CheckModify then
      if dmMain.DBLastModified = FileLastModified(dmMain.DAODatabase.Database) then
        exit;

    try
      Screen.Cursor := crHourGlass;
      try
        dmMain.DAODatabase.Close;
        Zipper.BaseDirectory := ExtractFilePath(Application.ExeName);
        if bExit then
        begin
          DeleteFile(PWideChar(ExtractFilePath(Application.ExeName) + 'Data\Temp\Logbook_backup_auto.zip'));
          Zipper.FileName := ExtractFilePath(Application.ExeName) + 'Data\Temp\Logbook_backup_auto.zip';
        end
        else
        begin
          DeleteFile(PWideChar(SaveDialog.FileName + '.zip'));
          Zipper.FileName := SaveDialog.FileName + '.zip';
        end;

        Zipper.AddFiles('Data\Database\' + ExtractFileName(dmMain.DAODatabase.Database), 0);
        if not Options.cbUseDropBox.Checked then
          Zipper.AddFiles('*.Profile', 0);
        Zipper.Save;
        Zipper.FileName := '';
        if bExit then
        begin
          uUtils.CopyFile(PWideChar(ExtractFilePath(Application.ExeName) + 'Data\Temp\Logbook_backup_auto.zip'), PWideChar(GetAbsolutePathFromOptions(Options.deBackupDirectory.Text) + 'Logbook_backup_auto.zip'));
          DeleteFile(PWideChar(ExtractFilePath(Application.ExeName) + 'Data\Temp\Logbook_backup_auto.zip'));
        end;
      except
        on E: Exception do
        begin
          MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
        end;
      end;
      if not bExit then
      begin
        dmMain.DAODatabase.Open;
        dmMain.OpenDatasets;
        dmMain.SetStationId(CurrentStationId);
        CoreCommand(aNewQSO);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

begin
  if Options.deBackupDirectory.Text = '' then
    SaveDialog.InitialDir := ExtractFilePath(Application.ExeName)
  else
    SaveDialog.InitialDir := GetAbsolutePathFromOptions(Options.deBackupDirectory.Text);
  SaveDialog.FileName := SaveDialog.InitialDir + '\Logbook_backup_' + FormatDateTime('ddmmyyyy', Date);
  if bExit then
    Backup
  else if Options.deBackupDirectory.Text = '' then
  begin
    if SaveDialog.Execute(Self.Handle) then
      Backup;
  end
  else
    Backup(false);
end;

procedure TMainWindow.DatabaseRestoreBackup;
var
  i: integer;
begin
  OpenDialog.Filter := 'Zip files|*.zip';
  if Options.deBackupDirectory.Text = '' then
    OpenDialog.InitialDir := ExtractFilePath(Application.ExeName)
  else
    OpenDialog.InitialDir := GetAbsolutePathFromOptions(Options.deBackupDirectory.Text);
  if OpenDialog.Execute(Self.Handle) then
  begin
    try
      ChangeProfile(OpenDialog.FileName);
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
        Close;
      end;
    end;
  end;
end;

procedure TMainWindow.GetDescktopFiles;
var
  slFiles: TStringList;
  i: integer;
  sFileName: string;
begin
  cbProfile.Items.Clear;
  slFiles := TStringList.Create;
  try
    FindFilesByMask(slFiles, ExtractFilePath(Application.ExeName), '*.Profile');
    for i := 0 to slFiles.Count - 1 do
    begin
      sFileName := ExtractFileName(slFiles.Strings[i]);
      cbProfile.Items.Add(Copy(sFileName, 1, Pos('.', sFileName) - 1));
    end;
  finally
    FreeAndNil(slFiles);
  end;
end;

procedure TMainWindow.SaveProfileAs;
var
  sNewProfileName: string;
begin
  Application.CreateForm(TEditProfileName, EditProfileName);
  Translator.TranslateWindow(EditProfileName.Name, EditProfileName);
  try
    if EditProfileName.ShowModal = mrOk then
    begin
      try
        CopyFile(ExtractFilePath(Application.ExeName) + CurrentProfile + '.profile', ExtractFilePath(Application.ExeName) + EditProfileName.leProfileName.Text + '.profile');
        AppStorage.FileName := EditProfileName.leProfileName.Text + '.profile';
        SaveProfile;
        Options.FormStorage.SaveFormPlacement;
        sNewProfileName := EditProfileName.leProfileName.Text;
        if cbProfile.Items.IndexOf(sNewProfileName) = -1 then
          cbProfile.Items.Add(sNewProfileName);
        cbProfile.ItemIndex := cbProfile.Items.IndexOf(sNewProfileName);
        CurrentProfile := sNewProfileName;
        FormStorage.SaveFormPlacement;
      except
        on E: Exception do
          MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
      end;
    end;
  finally
    FreeAndNil(EditProfileName);
  end;
end;

procedure TMainWindow.ChangeProfile(BackupFileName: string = '');
var
  sLangFileName: string;
  lParam, wParam: variant;
  i: integer;
begin
  if (cbProfile.Text <> CurrentProfile) or (BackupFileName <> '') then
  begin
    Screen.Cursor := crHourGlass;
    try

      { CallDescList.Free;
        CallDescMappingList.Free;
        CallDescValueList.Free; }
      dmMain.qryLogEdit.Cancel;
      dmMain.qryLog.Cancel;

      CurrentProfile := cbProfile.Text;
      Options.FormStorageOnExit.SaveFormPlacement;

      Plugins.UnRegisterWindows;
      Options.UnRegisterPluginsSettings;
      dmMain.DAODatabase.Close;
      Plugins.DeInitialize;
      Plugins.UnLoad;
      FreeAndNil(DockSite);

      for i := Self.ComponentCount - 1 downto 0 do
      begin
        if (Self.Components[i] is TLMDDockPanel) then
        begin
          TLMDDockPanel(Self.Components[i]).Free;
        end;
      end;

      if BackupFileName <> '' then
      begin

        dmMain.UnZipper.BaseDirectory := ExtractFilePath(Application.ExeName);
        dmMain.UnZipper.FileName := OpenDialog.FileName;

        for i := 0 to dmMain.UnZipper.Count - 1 do
        begin
          DeleteFile(PWideChar(ExtractFilePath(Application.ExeName) + dmMain.UnZipper.Items[i].FileName));
          dmMain.UnZipper.ExtractAt(i, dmMain.UnZipper.Items[i].FileName);
        end;
      end;

      DockSite := TLMDDockSite.Create(Self);
      DockSite.Name := 'DockSite';
      DockSite.Parent := Self;
      DockSite.Align := alClient;
      DockSite.Font.Size := 10;
      AppStorage.FileName := CurrentProfile + '.Profile';
      Options.GetLangs;
      Options.FormStorage.RestoreFormPlacement;
      Options.FormStorageOnExit.RestoreFormPlacement;
      MainWindow.FormStorage.RestoreFormPlacement;

      dmMain.DAODatabase.Open;

      dmMain.OpenDatasets;
      LoadPlugins;
      dmMain.GetAllTableForSelect;

      // !!!!!!!!!!!!!!!   Plugins.Load;


      // !!!!   Plugins.Initialize(Application,Screen,MainWindow.ActionList,MainWindow.AppStorage,MainWindow.ilMain,
      // !!!!      @cDllCommand,dmMain.DAODatabase,dmMain.dsLogEdit,dmMain.dsLog);

      { Plugins.RegisterWindows;
        Plugins.RegisterSettings;
        Plugins.RestoreSettings; }
      if Options.cbLang.Text = '' then
        sLangFileName := ExtractFilePath(Application.ExeName) + 'Lang\English.lng'
      else
        sLangFileName := ExtractFilePath(Application.ExeName) + 'Lang\' + Options.cbLang.Text + '.lng';

      Options.RegisterPluginsSettings;
      Translator.TranslateWindow(MainWindow.Name, MainWindow);
      Translator.TranslateWindow(Options.Name, Options);

      // dmMain.SetStationId(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
      wParam := 0;
      lParam := Options.FormStorageOnExit.StoredValue['Band'];
      MainWindow.DllCommand(DC_BAND_CHANGED, nil, lParam, wParam);
      lParam := Options.FormStorageOnExit.StoredValue['Mode'];
      MainWindow.DllCommand(DC_MODE_CHANGED, nil, lParam, wParam);
      // MainWindow.Plugins.CoreCommand(CC_LOADED, nil, 0, 0);
      Screen.Cursor := crHourGlass;
      FormShow(Self);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TMainWindow.SetProfileDefault;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'LogBook.ini');
  Screen.Cursor := crHourGlass;
  try
    Ini.WriteString('Main', 'ProfileFile', CurrentProfile + '.Profile');
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(Ini);
  end;
end;

procedure TMainWindow.GroupFieldValueReplace;
var
  lParam, wParam: variant;
  iSelCount, i, HighBound: integer;
  sValue: string;
  Bookmark: TBookmark;
  KeyValue: variant;
  slFile: TStringList;
  sVal: string;

begin
  Application.CreateForm(TFieldValueReplace, FieldValueReplace);
  Translator.TranslateWindow(FieldValueReplace.Name, FieldValueReplace);
  slFile := TStringList.Create;

  if FieldValueReplace.ShowModal = mrOk then
  begin
    if FieldValueReplace.rbFile.Checked then
    begin
      if not FileExists(FieldValueReplace.feFileName.FileName) then
      begin
        MessageBox(Application.Handle, PWideChar('Error open file - ' + FieldValueReplace.feFileName.FileName), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
        FreeAndNil(slFile);
        FreeAndNil(FieldValueReplace);
        exit;
      end;
      slFile.LoadFromFile(FieldValueReplace.feFileName.FileName);
    end;

    Screen.Cursor := crHourGlass;
    pdApplication.Show;
    Translator.TranslateWindow('ProgressWindow', pdApplication.Form);
    Application.ProcessMessages;
    dmMain.qryLog.DisableControls;
    KeyValue := dmMain.qryLog.FieldByName(dmMain.qryLog.KeyField).Value;
    try
      MainWindow.Plugins.CoreGetData(CC_GET_SELECTED_RECORDS, lParam, wParam);
      Screen.Cursor := crDefault;
      if wParam = 1 then
      begin
        pdApplication.Max := dmMain.qryLog.RecordCount;
        dmMain.qryLog.First;

        while not dmMain.qryLog.Eof do
        begin
          try
            if FieldValueReplace.rbCustom.Checked then
            begin
              if FieldValueReplace.FieldValue <> '' then
                dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + FieldValueReplace.FieldValue + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger)
              else
                dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=NULL WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
              dmMain.qryLogUpdate.ExecuteSQL;
            end;
            if FieldValueReplace.rbFile.Checked then
            begin
              if FieldValueReplace.cbReplaceAll.Checked then
              begin
                sVal := QuotedStr(slFile.Values[dmMain.qryLog.FieldByName('LOG_CALL').asString]);
                if sVal <> '' then
                begin
                  dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
                  dmMain.qryLogUpdate.ExecuteSQL;
                end;
              end
              else if dmMain.qryLog.FieldByName(FieldValueReplace.FieldName).IsNull then
              begin
                sVal := QuotedStr(slFile.Values[dmMain.qryLog.FieldByName('LOG_CALL').asString]);
                if sVal <> '' then
                begin
                  dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
                  dmMain.qryLogUpdate.ExecuteSQL;
                end;
              end;
            end;

            if FieldValueReplace.rbField.Checked and not dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).IsNull then
            begin
              if dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).DataType = ftString then
                sVal := QuotedStr(dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).asString)
              else
                sVal := dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).asString;

              if FieldValueReplace.cbReplaceAll.Checked then
              begin
                dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
                dmMain.qryLogUpdate.ExecuteSQL;
              end
              else if dmMain.qryLog.FieldByName(FieldValueReplace.FieldName).IsNull then
              begin
                dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
                dmMain.qryLogUpdate.ExecuteSQL;
              end;
            end;
          except
            on E: Exception do
              MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
          end;
          pdApplication.Position := i;
          Application.ProcessMessages;
          if pdApplication.Cancelled then
            break;
          inc(i);
          dmMain.qryLog.Next;
        end;

      end
      else
      begin
        if (varType(lParam) and varArray) = varArray then
        begin
          iSelCount := TVarData(lParam).VArray^.Bounds[0].ElementCount;
          if iSelCount > 0 then
          begin
            i := VarArrayLowBound(lParam, 1);
            HighBound := VarArrayHighBound(lParam, 1);
            pdApplication.Max := HighBound;
            while i <= HighBound do
            begin
              try
                if FieldValueReplace.rbCustom.Checked then
                begin
                  dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + FieldValueReplace.FieldValue + ' WHERE LOG_ID=' + IntToStr(lParam[i]);
                  dmMain.qryLogUpdate.ExecuteSQL;
                end;
                if FieldValueReplace.rbFile.Checked then
                begin
                  if FieldValueReplace.cbReplaceAll.Checked then
                  begin
                    sVal := QuotedStr(slFile.Values[dmMain.qryLog.FieldByName('LOG_CALL').asString]);
                    if sVal <> '' then
                    begin
                      dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(lParam[i]);
                      dmMain.qryLogUpdate.ExecuteSQL;
                    end;
                  end
                  else if dmMain.qryLog.FieldByName(FieldValueReplace.FieldName).IsNull then
                  begin
                    sVal := QuotedStr(slFile.Values[dmMain.qryLog.FieldByName('LOG_CALL').asString]);
                    if sVal <> '' then
                    begin
                      dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(lParam[i]);
                      dmMain.qryLogUpdate.ExecuteSQL;
                    end;
                  end;
                end;

                if FieldValueReplace.rbField.Checked and not dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).IsNull then
                begin
                  if dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).DataType = ftString then
                    sVal := QuotedStr(dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).asString)
                  else
                    sVal := dmMain.qryLog.FieldByName(FieldValueReplace.FieldFromName).asString;

                  if FieldValueReplace.cbReplaceAll.Checked then
                  begin
                    dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(lParam[i]);
                    dmMain.qryLogUpdate.ExecuteSQL;
                  end
                  else if dmMain.qryLog.FieldByName(FieldValueReplace.FieldName).IsNull then
                  begin
                    dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + FieldValueReplace.FieldName + '=' + sVal + ' WHERE LOG_ID=' + IntToStr(lParam[i]);
                    dmMain.qryLogUpdate.ExecuteSQL;
                  end;
                end;

              except
                on E: Exception do
                  MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
              end;
              pdApplication.Position := i;
              Application.ProcessMessages;
              if pdApplication.Cancelled then
                break;
              inc(i);
            end;
          end;
        end;
      end;
    finally
      pdApplication.Hide;
      // MainWindow.CoreCommand(MainWindow.aRefreshLog);
      dmMain.qryLog.Locate(dmMain.qryLog.KeyField, KeyValue, []);
      dmMain.qryLog.EnableControls;
    end;
  end;
  FreeAndNil(slFile);
  FreeAndNil(FieldValueReplace);
end;

procedure TMainWindow.RedefineGeoData;
var
  lParam, wParam: variant;
  iSelCount, i, HighBound: integer;
  sValue: string;
  Bookmark: TBookmark;
  CallInfo: TCallInfo;
  KeyValue: variant;
  Distance, Bearing: double;
begin
  Screen.Cursor := crHourGlass;
  pdApplication.Show;
  Translator.TranslateWindow('ProgressWindow', pdApplication.Form);
  Application.ProcessMessages;
  dmMain.qryLog.DisableControls;
  KeyValue := dmMain.qryLog.FieldByName(dmMain.qryLog.KeyField).Value;

  // Bookmark := dmMain.qryLog.GetBookmark;
  try
    Plugins.CoreGetData(CC_GET_SELECTED_RECORDS, lParam, wParam);
    Screen.Cursor := crDefault;
    if wParam = 1 then
    begin
      pdApplication.Max := dmMain.qryLog.RecordCount;
      dmMain.qryLog.First;
      while not dmMain.qryLog.Eof do
      begin
        try
          CallInfo := GetPrefixData(dmMain.qryLog.FieldByName('LOG_CALL').asString, dmMain.qryLog.FieldByName('LOG_QSO_DATETIME').AsDateTime);
          getBearing(dmMain.qryLog.FieldByName('LOG_MY_LAT').asFloat, dmMain.qryLog.FieldByName('LOG_MY_LON').asFloat, CallInfo.PrefixData.Location.Y / 180, CallInfo.PrefixData.Location.X / 180, Distance, Bearing);

          try
            dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + ' LOG_CONT=' + QuotedStr(CallInfo.PrefixData.Continent) + ', ' + ' LOG_DXCC=' + CallInfo.PrefixData.ADIF + ', ' + ' LOG_COUNTRY=' + QuotedStr
              (CallInfo.PrefixData.Territory) + ', ' + ' LOG_CONTINENT=' + QuotedStr(dmMain.GetContinentName(CallInfo.PrefixData.Continent)) + ', ' + ' LOG_LAT=' + StringReplace(FloatToStr(CallInfo.PrefixData.Location.Y / 180), ',', '.',
              [rfReplaceAll, rfIgnoreCase]) + ', ' + ' LOG_LON=' + StringReplace(FloatToStr(CallInfo.PrefixData.Location.X / 180), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ', ' + ' LOG_PFX=' + QuotedStr(CallInfo.PrefixData.Prefix)
              + ', LOG_DISTANCE= ' + StringReplace(FloatToStr(Round(Distance / 1000)), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
            dmMain.qryLogUpdate.ExecuteSQL;
          except
            on E: Exception do
              MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
          end;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
        end;
        pdApplication.Position := i;
        Application.ProcessMessages;
        if pdApplication.Cancelled then
          break;
        inc(i);
        dmMain.qryLog.Next;
      end;
    end
    else
    begin
      if (varType(lParam) and varArray) = varArray then
      begin
        iSelCount := TVarData(lParam).VArray^.Bounds[0].ElementCount;
        if iSelCount > 0 then
        begin
          try
            i := VarArrayLowBound(lParam, 1);
            HighBound := VarArrayHighBound(lParam, 1);
            pdApplication.Max := HighBound;
            while i <= HighBound do
            begin
              if dmMain.qryLog.Locate('LOG_ID', lParam[i], []) then
              begin
                CallInfo := GetPrefixData(dmMain.qryLog.FieldByName('LOG_CALL').asString, dmMain.qryLog.FieldByName('LOG_QSO_DATETIME').AsDateTime);
                getBearing(dmMain.qryLog.FieldByName('LOG_MY_LAT').asFloat, dmMain.qryLog.FieldByName('LOG_MY_LON').asFloat, CallInfo.PrefixData.Location.Y / 180, CallInfo.PrefixData.Location.X / 180, Distance, Bearing);
                try
                  dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + ' LOG_CONT=' + QuotedStr(CallInfo.PrefixData.Continent) + ', ' + ' LOG_DXCC=' + CallInfo.PrefixData.ADIF + ', ' + ' LOG_COUNTRY=' + QuotedStr
                    (CallInfo.PrefixData.Territory) + ', ' + ' LOG_CONTINENT=' + QuotedStr(dmMain.GetContinentName(CallInfo.PrefixData.Continent)) + ', ' + ' LOG_LAT=' + StringReplace(FloatToStr(CallInfo.PrefixData.Location.Y / 180), ',', '.',
                    [rfReplaceAll, rfIgnoreCase]) + ', ' + ' LOG_LON=' + StringReplace(FloatToStr(CallInfo.PrefixData.Location.X / 180), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ', ' + ' LOG_PFX=' + QuotedStr(CallInfo.PrefixData.Prefix)
                    + ', LOG_DISTANCE= ' + StringReplace(FloatToStr(Round(Distance / 1000)), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ' WHERE LOG_ID=' + IntToStr(lParam[i]);

                  dmMain.qryLogUpdate.ExecuteSQL;
                except
                  on E: Exception do
                    MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
                end;
              end;
              pdApplication.Position := i;
              Application.ProcessMessages;
              if pdApplication.Cancelled then
                break;
              inc(i);
            end;
          finally
          end;
        end;
      end;
    end;
  finally
    pdApplication.Hide;
    // CoreCommand(MainWindow.aRefreshLog);
    // dmMain.qryLog.First;
    dmMain.qryLog.Locate(dmMain.qryLog.KeyField, KeyValue, []);

    { if dmMain.qryLog.BookmarkValid(Bookmark) then
      dmMain.qryLog.GotoBookmark(Bookmark);
      dmMain.qryLog.FreeBookmark(Bookmark); }
    dmMain.qryLog.EnableControls;
  end;
end;

procedure TMainWindow.RedefineMyData;
var
  lParam, wParam: variant;
  iSelCount, i, HighBound: integer;
  sValue: string;
  Bookmark: TBookmark;
  CallInfo: TCallInfo;
  qryTmp: TKADaoTable;
  qryTer: TKADaoTable;
  KeyValue: variant;
  sLat, sLon, sCQZone, sITUZone: string;
begin

  { qryTmp := TKaDAOTable.Create(nil);
    qryTmp.Database := dmMain.DAODatabase;
    qryTer := TKaDAOTable.Create(nil);
    qryTer.Database := dmMain.DAODatabase;

    qryTmp.TableName := 'TEMP';
    qryTmp.Open;

    while not qryTmp.Eof do
    begin
    qryTer.Close;
    qryTer.SQL.Text := 'SELECT * FROM TEMP_TERRITORY WHERE ADIF=' + QuotedStr(qryTmp.FieldByName('ADIF_ORIGINAL').asString);
    qryTer.Open;
    qryTmp.Edit;
    qryTmp.FieldByName('ADIF').asString := qryTer.FieldByName('ADIF').asString;
    qryTmp.FieldByName('LAT').asFloat := StrToInt(qryTer.FieldByName('LAT').asString);
    qryTmp.FieldByName('LON').asFloat := StrToInt(qryTer.FieldByName('LON').asString);
    qryTmp.FieldByName('TERRITORY').asString := qryTer.FieldByName('TERRITORY').asString;
    qryTmp.FieldByName('CONTINENT').asString := qryTer.FieldByName('CONTINENT').asString;
    qryTmp.FieldByName('CQ').asString := qryTer.FieldByName('CQ').asString;
    qryTmp.FieldByName('ITU').asString := qryTer.FieldByName('ITU').asString;
    qryTmp.FieldByName('TZ').asString := qryTer.FieldByName('TZ').asString;
    qryTmp.Post;
    qryTmp.Next;
    end; }

  Screen.Cursor := crHourGlass;
  pdApplication.Show;
  Translator.TranslateWindow('ProgressWindow', pdApplication.Form);
  Application.ProcessMessages;
  dmMain.qryLog.DisableControls;
  KeyValue := dmMain.qryLog.FieldByName(dmMain.qryLog.KeyField).Value;
  try
    Plugins.CoreGetData(CC_GET_SELECTED_RECORDS, lParam, wParam);
    Screen.Cursor := crDefault;
    sLat := StringReplace(dmMain.qryStations.FieldByName('STATION_LAT').asString, ',', '.', [rfReplaceAll, rfIgnoreCase]);
    sLon := StringReplace(dmMain.qryStations.FieldByName('STATION_LON').asString, ',', '.', [rfReplaceAll, rfIgnoreCase]);
    if sLat = '' then
      sLat := '0';
    if sLon = '' then
      sLon := '0';
    sCQZone := dmMain.qryStations.FieldByName('STATION_CQ_ZONE').asString;
    if sCQZone = '' then
      sCQZone := '0';
    sITUZone := dmMain.qryStations.FieldByName('STATION_ITU_ZONE').asString;
    if sITUZone = '' then
      sITUZone := '0';

    if wParam = 1 then
    begin
      pdApplication.Max := dmMain.qryLog.RecordCount;
      dmMain.qryLog.First;
      while not dmMain.qryLog.Eof do
      begin
        try
          // CallInfo := GetPrefixData(dmMain.qryLog.FieldByName('LOG_CALL').AsString, dmMain.qryLog.FieldByName('LOG_QSO_DATE').AsDateTime);
          try

            dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + ' LOG_MY_CITY=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_CITY').asString) + ', ' + ' LOG_MY_CNTY=' + QuotedStr
              (dmMain.qryStations.FieldByName('STATION_CNTY').asString) + ', ' + ' LOG_MY_COUNTRY=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_COUNTRY').asString) + ', ' + ' LOG_MY_CQ_ZONE=' + sCQZone + ', ' + ' LOG_MY_GRIDSQUARE=' + QuotedStr
              (dmMain.qryStations.FieldByName('STATION_GRIDSQUARE').asString) + ', ' + ' LOG_MY_IOTA=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_IOTA_ISLAND_ID').asString)
              + ', ' + ' LOG_MY_ITU_ZONE=' + sITUZone + ', ' + ' LOG_MY_LAT=' + sLat + ', ' + ' LOG_MY_LON=' + sLon + ', ' + ' LOG_MY_NAME=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_NAME').asString) + ', ' + ' LOG_MY_POSTAL_CODE=' + QuotedStr
              (dmMain.qryStations.FieldByName('STATION_POSTAL_CODE').asString) + ', ' + ' LOG_MY_RIG=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_RIG').asString) + ', ' + ' LOG_MY_SIG=' + QuotedStr
              (dmMain.qryStations.FieldByName('STATION_SIG').asString) + ', ' + ' LOG_MY_SIG_INFO=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_SIG_INFO').asString) + ', ' + ' LOG_MY_STATE=' + QuotedStr
              (dmMain.qryStations.FieldByName('STATION_STATE').asString) + ', ' + ' LOG_MY_STREET=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_STREET').asString) + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
            dmMain.qryLogUpdate.ExecuteSQL;
          except
            on E: Exception do
              MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
          end;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
        end;
        pdApplication.Position := i;
        Application.ProcessMessages;
        if pdApplication.Cancelled then
          break;
        inc(i);
        dmMain.qryLog.Next;
      end;
    end
    else
    begin
      if (varType(lParam) and varArray) = varArray then
      begin
        iSelCount := TVarData(lParam).VArray^.Bounds[0].ElementCount;
        if iSelCount > 0 then
        begin
          try
            i := VarArrayLowBound(lParam, 1);
            HighBound := VarArrayHighBound(lParam, 1);
            pdApplication.Max := HighBound;
            while i <= HighBound do
            begin
              if dmMain.qryLog.Locate('LOG_ID', lParam[i], []) then
              begin
                // CallInfo := GetPrefixData(dmMain.qryLog.FieldByName('LOG_CALL').AsString, dmMain.qryLog.FieldByName('LOG_QSO_DATE').AsDateTime);
                try
                  dmMain.qryLogUpdate.SQL.Text := 'UPDATE ' + dmMain.qryLog.TableName + ' SET ' + ' LOG_MY_CITY=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_CITY').asString) + ', ' + ' LOG_MY_CNTY=' + QuotedStr
                    (dmMain.qryStations.FieldByName('STATION_CNTY').asString) + ', ' + ' LOG_MY_COUNTRY=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_COUNTRY').asString)
                    + ', ' + ' LOG_MY_CQ_ZONE=' + sCQZone + ', ' + ' LOG_MY_GRIDSQUARE=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_GRIDSQUARE').asString) + ', ' + ' LOG_MY_IOTA=' + QuotedStr
                    (dmMain.qryStations.FieldByName('STATION_IOTA_ISLAND_ID').asString) + ', ' + ' LOG_MY_ITU_ZONE=' + sITUZone + ', ' + ' LOG_MY_LAT=' + sLat + ', ' + ' LOG_MY_LON=' + sLon + ', ' + ' LOG_MY_NAME=' + QuotedStr
                    (dmMain.qryStations.FieldByName('STATION_NAME').asString) + ', ' + ' LOG_MY_POSTAL_CODE=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_POSTAL_CODE').asString) + ', ' + ' LOG_MY_RIG=' + QuotedStr
                    (dmMain.qryStations.FieldByName('STATION_RIG').asString) + ', ' + ' LOG_MY_SIG=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_SIG').asString) + ', ' + ' LOG_MY_SIG_INFO=' + QuotedStr
                    (dmMain.qryStations.FieldByName('STATION_SIG_INFO').asString) + ', ' + ' LOG_MY_STATE=' + QuotedStr(dmMain.qryStations.FieldByName('STATION_STATE').asString) + ', ' + ' LOG_MY_STREET=' + QuotedStr
                    (dmMain.qryStations.FieldByName('STATION_STREET').asString) + ' WHERE LOG_ID=' + IntToStr(lParam[i]);
                  dmMain.qryLogUpdate.ExecuteSQL;
                except
                  on E: Exception do
                    MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
                end;
              end;
              pdApplication.Position := i;
              Application.ProcessMessages;
              if pdApplication.Cancelled then
                break;
              inc(i);
            end;
          finally
          end;
        end;
      end;
    end;
  finally
    pdApplication.Hide;
    CoreCommand(MainWindow.aRefreshLog);
    dmMain.qryLog.Locate(dmMain.qryLog.KeyField, KeyValue, []);
    dmMain.qryLog.EnableControls;
  end;
end;

procedure TMainWindow.RecordRemove;
var
  lParam, wParam: variant;
  iSelCount, i, HighBound: integer;
  RecordRemove: TRecordRemove;
begin
  Application.CreateForm(TRecordRemove, RecordRemove);
  Translator.TranslateWindow(RecordRemove.Name, RecordRemove);
  if RecordRemove.ShowModal = mrOk then
  begin
    Screen.Cursor := crHourGlass;
    pdApplication.Show;
    Translator.TranslateWindow('ProgressWindow', pdApplication.Form);
    Application.ProcessMessages;
    dmMain.qryLog.DisableControls;
    try
      MainWindow.Plugins.CoreGetData(CC_GET_SELECTED_RECORDS, lParam, wParam);
      Screen.Cursor := crDefault;
      if wParam = 1 then
      begin
        pdApplication.Max := dmMain.qryLog.RecordCount;
        dmMain.qryLog.First;
        while not dmMain.qryLog.Eof do
        begin
          try

            dmMain.qryLogUpdate.SQL.Text := 'INSERT INTO LOG_' + VarToStr(RecordRemove.dbcStations.KeyValue) +
              '(LOG_GRIDSQUARE,LOG_QTH,LOG_OPERATOR,LOG_CALL,LOG_FREQ,LOG_QSO_DATE,LOG_RST_RCVD,LOG_RST_SENT,LOG_LAT,LOG_LON,LOG_COMMENT,LOG_QSLSDATE,LOG_QSLRDATE,LOG_ADDRESS,' +
              'LOG_AGE,LOG_ARRL_SECT,LOG_CNTY,LOG_CONTEST_ID,LOG_CQZ,LOG_DXCC,LOG_IOTA,LOG_ITUZ,LOG_NAME,LOG_NOTES,LOG_PFX,LOG_PROP_MODE,LOG_QSLMSG,LOG_QSL_RCVD,LOG_QSL_SENT,LOG_QSL_VIA,' +
              'LOG_RX_PWR,LOG_EQSL_QSLRDATE,LOG_EQSL_QSLSDATE,LOG_EQSL_QSL_RCVD,LOG_EQSL_QSL_SENT,LOG_LOTW_QSLRDATE,LOG_LOTW_QSLSDATE,LOG_LOTW_QSL_RCVD,LOG_LOTW_QSL_SENT,LOG_CONT,LOG_MY_NAME,' +
              'LOG_MY_POSTAL_CODE,LOG_MY_COUNTRY,LOG_BAND,LOG_MODE,LOG_COUNTRY,LOG_CONTINENT,LOG_MY_CITY,LOG_MY_STREET,LOG_MY_GRIDSQUARE,LOG_MY_LAT,LOG_MY_LON,LOG_QSL_SENT_VIA,LOG_QSL_RCVD_VIA,' +
              'LOG_BAND_MHZ,LOG_DQSL_QSL_SENT,LOG_DQSL_QSL_RCVD,LOG_DQSL_QSLRDATE,LOG_DQSL_QSLSDATE,LOG_EMAIL,LOG_A_INDEX,LOG_ANT_AZ,LOG_ANT_EL,LOG_ANT_PATH,LOG_BAND_RX,LOG_CHECK,LOG_CLASS,' +
              'LOG_CONTACTED_OP,LOG_CREDIT_SUBMITTED,LOG_CREDIT_GRANTED,LOG_DISTANCE,LOG_EQ_CALL,LOG_FORCE_INIT,LOG_FREQ_RX,LOG_GUEST_OP,LOG_IOTA_ISLAND_ID,LOG_K_INDEX,LOG_MAX_BURSTS,' + 'LOG_MS_SHOWER,LOG_MY_CNTY,LOG_MY_CQ_ZONE,' +
              'LOG_MY_IOTA,LOG_MY_IOTA_ISLAND_ID,LOG_MY_ITU_ZONE,LOG_MY_RIG,LOG_MY_SIG,LOG_MY_SIG_INFO,LOG_MY_STATE,LOG_NR_BURSTS,LOG_NR_PINGS,LOG_OWNER_CALLSIGN,LOG_PRECEDENCE,LOG_PUBLIC_KEY,LOG_QSO_COMPLETE,' +
              'LOG_QSO_DATE_OFF,LOG_QSO_RANDOM,LOG_RIG,LOG_SAT_MODE,LOG_SAT_NAME,LOG_SFI,LOG_SIG,LOG_SIG_INFO,LOG_SRX,LOG_SRX_STRING,LOG_STATE,LOG_STX,LOG_STX_STRING,LOG_SWL,LOG_TX_PWR,LOG_WEB,' +
              'LOG_QSO_TIME,LOG_QSO_DATETIME,LOG_CALL_ORIGINAL,LOG_CUSTOM_STAT1,LOG_CUSTOM_STAT2,LOG_CUSTOM_STAT3,LOG_CUSTOM_STAT4) ' +
              ' SELECT LOG_GRIDSQUARE,LOG_QTH,LOG_OPERATOR,LOG_CALL,LOG_FREQ,LOG_QSO_DATE,LOG_RST_RCVD,LOG_RST_SENT,LOG_LAT,LOG_LON,LOG_COMMENT,LOG_QSLSDATE,LOG_QSLRDATE,LOG_ADDRESS,' +
              'LOG_AGE,LOG_ARRL_SECT,LOG_CNTY,LOG_CONTEST_ID,LOG_CQZ,LOG_DXCC,LOG_IOTA,LOG_ITUZ,LOG_NAME,LOG_NOTES,LOG_PFX,LOG_PROP_MODE,LOG_QSLMSG,LOG_QSL_RCVD,LOG_QSL_SENT,LOG_QSL_VIA,' +
              'LOG_RX_PWR,LOG_EQSL_QSLRDATE,LOG_EQSL_QSLSDATE,LOG_EQSL_QSL_RCVD,LOG_EQSL_QSL_SENT,LOG_LOTW_QSLRDATE,LOG_LOTW_QSLSDATE,LOG_LOTW_QSL_RCVD,LOG_LOTW_QSL_SENT,LOG_CONT,LOG_MY_NAME,' +
              'LOG_MY_POSTAL_CODE,LOG_MY_COUNTRY,LOG_BAND,LOG_MODE,LOG_COUNTRY,LOG_CONTINENT,LOG_MY_CITY,LOG_MY_STREET,LOG_MY_GRIDSQUARE,LOG_MY_LAT,LOG_MY_LON,LOG_QSL_SENT_VIA,LOG_QSL_RCVD_VIA,' +
              'LOG_BAND_MHZ,LOG_DQSL_QSL_SENT,LOG_DQSL_QSL_RCVD,LOG_DQSL_QSLRDATE,LOG_DQSL_QSLSDATE,LOG_EMAIL,LOG_A_INDEX,LOG_ANT_AZ,LOG_ANT_EL,LOG_ANT_PATH,LOG_BAND_RX,LOG_CHECK,LOG_CLASS,LOG_CONTACTED_OP,' +
              'LOG_CREDIT_SUBMITTED,LOG_CREDIT_GRANTED,LOG_DISTANCE,LOG_EQ_CALL,LOG_FORCE_INIT,LOG_FREQ_RX,LOG_GUEST_OP,LOG_IOTA_ISLAND_ID,LOG_K_INDEX,LOG_MAX_BURSTS,LOG_MS_SHOWER,LOG_MY_CNTY,LOG_MY_CQ_ZONE,' +
              'LOG_MY_IOTA,LOG_MY_IOTA_ISLAND_ID,LOG_MY_ITU_ZONE,LOG_MY_RIG,LOG_MY_SIG,LOG_MY_SIG_INFO,LOG_MY_STATE,LOG_NR_BURSTS,LOG_NR_PINGS,LOG_OWNER_CALLSIGN,LOG_PRECEDENCE,LOG_PUBLIC_KEY,LOG_QSO_COMPLETE,' +
              'LOG_QSO_DATE_OFF,LOG_QSO_RANDOM,LOG_RIG,LOG_SAT_MODE,LOG_SAT_NAME,LOG_SFI,LOG_SIG,LOG_SIG_INFO,LOG_SRX,LOG_SRX_STRING,LOG_STATE,LOG_STX,LOG_STX_STRING,LOG_SWL,LOG_TX_PWR,LOG_WEB,' +
              'LOG_QSO_TIME,LOG_QSO_DATETIME,LOG_CALL_ORIGINAL,LOG_CUSTOM_STAT1,LOG_CUSTOM_STAT2,LOG_CUSTOM_STAT3,LOG_CUSTOM_STAT4 FROM LOG_' + IntToStr(CurrentStationId) + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);

            dmMain.qryLogUpdate.ExecuteSQL;
            dmMain.qryLogUpdate.SQL.Text := 'DELETE FROM LOG_' + IntToStr(CurrentStationId) + ' WHERE LOG_ID=' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
            dmMain.qryLogUpdate.ExecuteSQL;
          except
            on E: Exception do
              MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
          end;
          pdApplication.Position := i;
          Application.ProcessMessages;
          if pdApplication.Cancelled then
            break;
          inc(i);
          dmMain.qryLog.Next;
        end;
      end
      else
      begin
        if (varType(lParam) and varArray) = varArray then
        begin
          iSelCount := TVarData(lParam).VArray^.Bounds[0].ElementCount;
          if iSelCount > 0 then
          begin
            i := VarArrayLowBound(lParam, 1);
            HighBound := VarArrayHighBound(lParam, 1);
            pdApplication.Max := HighBound;
            while i <= HighBound do
            begin
              try
                dmMain.qryLogUpdate.SQL.Text := 'INSERT INTO LOG_' + VarToStr(RecordRemove.dbcStations.KeyValue) +
                  '(LOG_GRIDSQUARE,LOG_QTH,LOG_OPERATOR,LOG_CALL,LOG_FREQ,LOG_QSO_DATE,LOG_RST_RCVD,LOG_RST_SENT,LOG_LAT,LOG_LON,LOG_COMMENT,LOG_QSLSDATE,LOG_QSLRDATE,LOG_ADDRESS,' +
                  'LOG_AGE,LOG_ARRL_SECT,LOG_CNTY,LOG_CONTEST_ID,LOG_CQZ,LOG_DXCC,LOG_IOTA,LOG_ITUZ,LOG_NAME,LOG_NOTES,LOG_PFX,LOG_PROP_MODE,LOG_QSLMSG,LOG_QSL_RCVD,LOG_QSL_SENT,LOG_QSL_VIA,' +
                  'LOG_RX_PWR,LOG_EQSL_QSLRDATE,LOG_EQSL_QSLSDATE,LOG_EQSL_QSL_RCVD,LOG_EQSL_QSL_SENT,LOG_LOTW_QSLRDATE,LOG_LOTW_QSLSDATE,LOG_LOTW_QSL_RCVD,LOG_LOTW_QSL_SENT,LOG_CONT,LOG_MY_NAME,' +
                  'LOG_MY_POSTAL_CODE,LOG_MY_COUNTRY,LOG_BAND,LOG_MODE,LOG_COUNTRY,LOG_CONTINENT,LOG_MY_CITY,LOG_MY_STREET,LOG_MY_GRIDSQUARE,LOG_MY_LAT,LOG_MY_LON,LOG_QSL_SENT_VIA,LOG_QSL_RCVD_VIA,' +
                  'LOG_BAND_MHZ,LOG_DQSL_QSL_SENT,LOG_DQSL_QSL_RCVD,LOG_DQSL_QSLRDATE,LOG_DQSL_QSLSDATE,LOG_EMAIL,LOG_A_INDEX,LOG_ANT_AZ,LOG_ANT_EL,LOG_ANT_PATH,LOG_BAND_RX,LOG_CHECK,LOG_CLASS,' +
                  'LOG_CONTACTED_OP,LOG_CREDIT_SUBMITTED,LOG_CREDIT_GRANTED,LOG_DISTANCE,LOG_EQ_CALL,LOG_FORCE_INIT,LOG_FREQ_RX,LOG_GUEST_OP,LOG_IOTA_ISLAND_ID,LOG_K_INDEX,LOG_MAX_BURSTS,' + 'LOG_MS_SHOWER,LOG_MY_CNTY,LOG_MY_CQ_ZONE,' +
                  'LOG_MY_IOTA,LOG_MY_IOTA_ISLAND_ID,LOG_MY_ITU_ZONE,LOG_MY_RIG,LOG_MY_SIG,LOG_MY_SIG_INFO,LOG_MY_STATE,LOG_NR_BURSTS,LOG_NR_PINGS,LOG_OWNER_CALLSIGN,LOG_PRECEDENCE,LOG_PUBLIC_KEY,LOG_QSO_COMPLETE,' +
                  'LOG_QSO_DATE_OFF,LOG_QSO_RANDOM,LOG_RIG,LOG_SAT_MODE,LOG_SAT_NAME,LOG_SFI,LOG_SIG,LOG_SIG_INFO,LOG_SRX,LOG_SRX_STRING,LOG_STATE,LOG_STX,LOG_STX_STRING,LOG_SWL,LOG_TX_PWR,LOG_WEB,' +
                  'LOG_QSO_TIME,LOG_QSO_DATETIME,LOG_CALL_ORIGINAL,LOG_CUSTOM_STAT1,LOG_CUSTOM_STAT2,LOG_CUSTOM_STAT3,LOG_CUSTOM_STAT4) ' +
                  ' SELECT LOG_GRIDSQUARE,LOG_QTH,LOG_OPERATOR,LOG_CALL,LOG_FREQ,LOG_QSO_DATE,LOG_RST_RCVD,LOG_RST_SENT,LOG_LAT,LOG_LON,LOG_COMMENT,LOG_QSLSDATE,LOG_QSLRDATE,LOG_ADDRESS,' +
                  'LOG_AGE,LOG_ARRL_SECT,LOG_CNTY,LOG_CONTEST_ID,LOG_CQZ,LOG_DXCC,LOG_IOTA,LOG_ITUZ,LOG_NAME,LOG_NOTES,LOG_PFX,LOG_PROP_MODE,LOG_QSLMSG,LOG_QSL_RCVD,LOG_QSL_SENT,LOG_QSL_VIA,' +
                  'LOG_RX_PWR,LOG_EQSL_QSLRDATE,LOG_EQSL_QSLSDATE,LOG_EQSL_QSL_RCVD,LOG_EQSL_QSL_SENT,LOG_LOTW_QSLRDATE,LOG_LOTW_QSLSDATE,LOG_LOTW_QSL_RCVD,LOG_LOTW_QSL_SENT,LOG_CONT,LOG_MY_NAME,' +
                  'LOG_MY_POSTAL_CODE,LOG_MY_COUNTRY,LOG_BAND,LOG_MODE,LOG_COUNTRY,LOG_CONTINENT,LOG_MY_CITY,LOG_MY_STREET,LOG_MY_GRIDSQUARE,LOG_MY_LAT,LOG_MY_LON,LOG_QSL_SENT_VIA,LOG_QSL_RCVD_VIA,' +
                  'LOG_BAND_MHZ,LOG_DQSL_QSL_SENT,LOG_DQSL_QSL_RCVD,LOG_DQSL_QSLRDATE,LOG_DQSL_QSLSDATE,LOG_EMAIL,LOG_A_INDEX,LOG_ANT_AZ,LOG_ANT_EL,LOG_ANT_PATH,LOG_BAND_RX,LOG_CHECK,LOG_CLASS,LOG_CONTACTED_OP,' +
                  'LOG_CREDIT_SUBMITTED,LOG_CREDIT_GRANTED,LOG_DISTANCE,LOG_EQ_CALL,LOG_FORCE_INIT,LOG_FREQ_RX,LOG_GUEST_OP,LOG_IOTA_ISLAND_ID,LOG_K_INDEX,LOG_MAX_BURSTS,LOG_MS_SHOWER,LOG_MY_CNTY,LOG_MY_CQ_ZONE,' +
                  'LOG_MY_IOTA,LOG_MY_IOTA_ISLAND_ID,LOG_MY_ITU_ZONE,LOG_MY_RIG,LOG_MY_SIG,LOG_MY_SIG_INFO,LOG_MY_STATE,LOG_NR_BURSTS,LOG_NR_PINGS,LOG_OWNER_CALLSIGN,LOG_PRECEDENCE,LOG_PUBLIC_KEY,LOG_QSO_COMPLETE,' +
                  'LOG_QSO_DATE_OFF,LOG_QSO_RANDOM,LOG_RIG,LOG_SAT_MODE,LOG_SAT_NAME,LOG_SFI,LOG_SIG,LOG_SIG_INFO,LOG_SRX,LOG_SRX_STRING,LOG_STATE,LOG_STX,LOG_STX_STRING,LOG_SWL,LOG_TX_PWR,LOG_WEB,' +
                  'LOG_QSO_TIME,LOG_QSO_DATETIME,LOG_CALL_ORIGINAL,LOG_CUSTOM_STAT1,LOG_CUSTOM_STAT2,LOG_CUSTOM_STAT3,LOG_CUSTOM_STAT4 FROM LOG_' + IntToStr(CurrentStationId) + ' WHERE LOG_ID=' + IntToStr(lParam[i]);

                dmMain.qryLogUpdate.ExecuteSQL;
                dmMain.qryLogUpdate.SQL.Text := 'DELETE FROM LOG_' + IntToStr(CurrentStationId) + ' WHERE LOG_ID=' + IntToStr(lParam[i]);
                dmMain.qryLogUpdate.ExecuteSQL;
              except
                on E: Exception do
                  MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
              end;
              pdApplication.Position := i;
              Application.ProcessMessages;
              if pdApplication.Cancelled then
                break;
              inc(i);
            end;
          end;
        end;
      end;
    finally
      pdApplication.Hide;
      // dmMain.qryLog.Refresh;
      CoreCommand(MainWindow.aRefreshLog);
      dmMain.qryLog.EnableControls;
    end;
  end;
  FreeAndNil(RecordRemove);
end;

procedure TMainWindow.LoadPlugins;
var
  PluginPath: string;
  result: integer;
  i, X: integer;
  aItem: TActionClientItem;
  aAction: TAction;
begin
  Options.cdsPlugins.DisableControls;
  PluginPath := ExtractFilePath(Application.ExeName) + 'Plugins\';
  try
    Options.cdsPlugins.First;
    while not Options.cdsPlugins.Eof do
    begin
      try
        Plugins.LoadPlugin(PluginPath + Options.cdsPlugins.FieldByName('PLUGIN_NAME').asString + '\' + Options.cdsPlugins.FieldByName('PLUGIN_NAME').asString + '.dll');
        Plugins.InitializePlugin(Plugins.Items.Count - 1, Application, Screen, ActionList, AppStorage, ilMain, @cDllCommand, dmMain.DAODatabase, dmMain.dsLogEdit, dmMain.dsLog, Options.cdsPlugins.FieldByName('PLUGIN_SCRIPT').asString);
      except
        on E: Exception do
          MessageBox(0, PWideChar(E.Message), PWideChar('Error'), MB_SYSTEMMODAL or MB_SETFOREGROUND or MB_TOPMOST or MB_ICONHAND or MB_OK or mb_iconquestion);
      end;
      Options.cdsPlugins.Next;
    end;
    Options.RemoveSectionFromIni;
    Options.FormStorage.AppStorage.Reload;
    Plugins.RegisterWindows;

    { aAction:=TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[0].Action;
      TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[0].Action:=TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[1];
      TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[1]:=aItem; }

    Plugins.RegisterSettings;
    Plugins.RestoreSettings;
  finally
    Options.cdsPlugins.First;
    Options.cdsPlugins.EnableControls;
  end;

end;

procedure TMainWindow.UpdateSplash(Msg: string);
begin
  if Assigned(Splash) then
    if Splash.Visible then
    begin
      Splash.pnlStatus.Caption := Msg;
      Application.ProcessMessages;
    end;
end;

procedure TMainWindow.UpdateFlash;
var
  memStream: TMemoryStream;
  fileStream: TFileStream;
  Url: string;
  bFileNotFound: boolean;
  DateCurrentFile, DateInetFile: TDateTime;
  sDateInetFile: string;
  s: string;
begin
  FDownloadTerminate := false;
  Url := 'http://www.ut4ukw.com/logbook/files/repository/flash/flashupdate.zip';
  try
    if not Assigned(Splash) then
      Screen.Cursor := crHourGlass;

    if PingHost('www.ut4ukw.com') then
    begin
      try
        sDateInetFile := GetUrlContent('http://www.ut4ukw.com/logbook/files/repository/flash/check.php');
        DateInetFile := EncodeDateTime(StrToInt(Copy(sDateInetFile, 5, 4)), StrToInt(Copy(sDateInetFile, 3, 2)), StrToInt(Copy(sDateInetFile, 1, 2)), StrToInt(Copy(sDateInetFile, 9, 2)), StrToInt(Copy(sDateInetFile, 11, 2)),
          StrToInt(Copy(sDateInetFile, 13, 2)), 0);

        if FileExists(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip') then
          FileAge(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip', DateCurrentFile);
        if FormatDateTime('dd.mm.yyyy hh:nn', DateCurrentFile) <> FormatDateTime('dd.mm.yyyy hh:nn', DateInetFile) then
        begin
          if MessageBox(0, PWideChar(Options.msgFlashUpdateFound.Caption), PWideChar(Options.msgConfirmation.Caption), MB_SYSTEMMODAL or MB_SETFOREGROUND or MB_TOPMOST or MB_ICONHAND or mb_YesNo or mb_iconquestion) = mrYes then
          begin
            UpdateSplash('Download flash update...');
            // pdDownload.Max := GetUrlSize(Url);
            Screen.Cursor := crDefault;

            pdDownload.Show;
            SetWindowPos(pdDownload.Form.Handle, HWND_TOPMOST, pdDownload.Form.Left, pdDownload.Form.Top, pdDownload.Form.Width, pdDownload.Form.Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
            // SetForegroundWindow(pdDownload.Form.Handle);
            Translator.TranslateWindow('DownloadWindow', pdDownload.Form);
            Application.ProcessMessages;

            { pdDownload.Show;
              Translator.TranslateWindow('DownloadWindow', pdDownload.Form);
              pdDownload.Form.Update;
              Application.ProcessMessages; }

            fileStream := TFileStream.Create(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip', fmCreate);
            try
              IdHTTPDownload.Get(Url, fileStream);
            finally
              FreeAndNil(fileStream);
            end;
            pdDownload.Hide;

            if not FDownloadTerminate and FDownloadOk then
            begin
              if FileExists(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip') then
                SetFileDate(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip', DateInetFile);
              if FileExists(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip') then
              begin
                UpdateSplash('Apply flash update...');
                dmMain.UnZipper.FileName := ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip';
                dmMain.UnZipper.BaseDirectory := ExtractFilePath(Application.ExeName);
                dmMain.UnZipper.ExtractFiles('*.*');
                dmMain.UnZipper.FileName := '';
                UpdateSplash('Loading prefixes...');
                CallParser.PrefixFile := ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Prefix.lst';
                UpdateSplash('Loading managers...');
                LoadManagers;
                { pdDownload.Hide;
                  Application.MessageBox(PWideChar(Options.msgFlashUpdateCompleted.Caption), PWideChar(Options.msgInformation.Caption), MB_OK); }
              end;
            end;
            pdDownload.Hide;




            // HTTPGet.GetFile;

            { memStream := TMemoryStream.Create;
              try
              GetInetFile(Url, memStream);
              if memStream.Size > 0 then
              begin
              fileStream := TFileStream.Create(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip', fmCreate);
              try
              memStream.SaveToStream(fileStream);
              finally
              fileStream.Free;
              end;
              end;


              if FileExists(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip') then
              SetFileDate(ExtractFilePath(Application.ExeName) + 'Data\Downloads\Update\Flash\flashupdate.zip', DateInetFile);
              finally
              memStream.Free;
              end;
              }
          end;
        end
        else if not Assigned(Splash) then
          Application.MessageBox(PWideChar(Options.msgFlashUpdateNotNeed.Caption), PWideChar(Options.msgInformation.Caption), MB_OK);
      except
        pdDownload.Hide;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainWindow.PrintQSLQueue;
var
  lParam, wParam: variant;
  iSelCount, HighBound, i, j: integer;
  Bookmark: TBookmark;
  qryPrintQueue: TKADaoTable;
  bsCancel: boolean;

  fileStream: TFileStream;
  BlobStream: TStream;
  sr: TSearchRec;
  FileAttrs: integer;
  ssFileName: string;
  NextCall: string;
  b: integer;
begin
  dmMain.frxJPEGExport.ShowDialog := true;
  dmMain.frxJPEGExport.ShowProgress := true;
  Screen.Cursor := crHourGlass;
  dmMain.qryLog.DisableControls;
  Bookmark := dmMain.qryLog.GetBookmark;
  qryPrintQueue := TKADaoTable.Create(nil);
  try
    dmMain.cdsPrintQSL.EmptyTable;
    dmMain.cdsPrintQSL.Open;
    qryPrintQueue.Database := dmMain.DAODatabase;
    { for b := 0 to dmMain.BookTableList.Count - 1 do
      begin }

    // qryPrintQueue.SQL.Text := 'SELECT * FROM LOG_' + dmMain.BookTableList[b] + ' WHERE LOG_QSL_SENT=''Q''';
    qryPrintQueue.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(CurrentStationId) + ' WHERE LOG_QSL_SENT=''Q''';
    qryPrintQueue.Open;
    while not qryPrintQueue.Eof do
    begin
      dmMain.cdsPrintQSL.Append;
      for j := 0 to qryPrintQueue.FieldCount - 1 do
      begin
        try
          if qryPrintQueue.Fields[j].FieldName = 'STATION_ID' then
            continue;
          if qryPrintQueue.Fields[j].FieldName = 'LOG_BAND_MHZ' then
            dmMain.cdsPrintQSL.FieldByName(qryPrintQueue.Fields[j].FieldName).Value := SimpleRoundTo(qryPrintQueue.Fields[j].asFloat, -3)
          else
            dmMain.cdsPrintQSL.FieldByName(qryPrintQueue.Fields[j].FieldName).Value := qryPrintQueue.Fields[j].Value;
        except
          on E: Exception do
            ShowMessage(E.Message + ' : ' + qryPrintQueue.Fields[j].FieldName);
        end;
      end;

      { qryPrintQueue.Next;
        if not qryPrintQueue.Eof then
        begin
        dmMain.cdsPrintQSL.FieldByName('NEXT_CALL').AsString:=qryPrintQueue.FieldByName('LOG_CALL').AsString;
        end
        else
        begin
        dmMain.cdsPrintQSL.Post;
        break;
        end;
        qryPrintQueue.Prior; }

      { FileAttrs := faAnyFile;
        ssFileName:=Options.GetEQSLDirectory+'*'+dmMain.qryStations.FieldByName('STATION_ID').asString+'_'+qryPrintQueue.FieldByName('LOG_ID').AsString+'.jpg';
        if FindFirst(Options.GetEQSLDirectory+'*'+dmMain.qryStations.FieldByName('STATION_ID').asString+'_'+qryPrintQueue.FieldByName('LOG_ID').AsString+'.jpg', FileAttrs, sr) = 0 then
        begin
        repeat
        if (sr.Attr and FileAttrs) = sr.Attr then
        begin
        ssFileName:=Options.GetEQSLDirectory+sr.Name;
        end;
        until FindNext(sr) <> 0;
        FindClose(sr);
        end;

        try
        BlobStream := dmMain.cdsPrintQSL.CreateBlobStream(dmMain.cdsPrintQSL.FieldByName('LOG_USER_IMAGE'),bmWrite);
        FileStream := TFileStream.Create(ssFileName,fmOpenRead or fmShareDenyNone);
        BlobStream.CopyFrom(FileStream,FileStream.Size);
        FileStream.Free;
        BlobStream.Free;
        except
        end; }
      dmMain.cdsPrintQSL.Post;
      qryPrintQueue.Next;
    end;

    // end;

    if dmMain.cdsPrintQSL.RecordCount > 0 then
    begin
      dmMain.cdsPrintQSL.SortOnFields('LOG_DXCC;LOG_CALL');
      dmMain.cdsPrintQSL.First;
      while not dmMain.cdsPrintQSL.Eof do
      begin
        dmMain.cdsPrintQSL.Next;
        if not dmMain.cdsPrintQSL.Eof then
        begin
          NextCall := dmMain.cdsPrintQSL.FieldByName('LOG_CALL').asString;
        end
        else
        begin
          break;
        end;
        dmMain.cdsPrintQSL.Prior;
        dmMain.cdsPrintQSL.Edit;
        dmMain.cdsPrintQSL.FieldByName('NEXT_CALL').asString := NextCall;
        dmMain.cdsPrintQSL.Post;
        dmMain.cdsPrintQSL.Next;
      end;

      Application.CreateForm(TPrintQSLSettings, PrintQSLSettings);
      PrintQSLSettings.FormStorage.RestoreFormPlacement;
      bsCancel := true;
      Screen.Cursor := crDefault;
      try
        if PrintQSLSettings.cbShowWindowAdain.Checked then
        begin
          Translator.TranslateWindow('PrintQSLSettings', PrintQSLSettings);
          bsCancel := PrintQSLSettings.ShowModal = mrOk;
        end;

        if bsCancel then
        begin
          dmMain.Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Reports\QSL\' + PrintQSLSettings.cbTemplate.Text + '.fr3');
          dmMain.Report.PrepareReport;
          if PrintQSLSettings.cbPreview.Checked then
            dmMain.Report.ShowPreparedReport;
        end;
      finally
        FreeAndNil(PrintQSLSettings);
      end;
    end
    else
      Application.MessageBox(PWideChar(Options.msgPrintQSLQueueEmpty.Caption), PWideChar(Options.msgInformation.Caption), MB_OK or MB_ICONINFORMATION);
  finally
    FreeAndNil(qryPrintQueue);
    if dmMain.qryLog.BookmarkValid(Bookmark) then
      dmMain.qryLog.GotoBookmark(Bookmark);
    dmMain.qryLog.FreeBookmark(Bookmark);
    dmMain.qryLog.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainWindow.ReportDesign;
var
  i: integer;
begin
  Screen.Cursor := crHourGlass;
  dmMain.frDesigner.OpenDir := ExtractFilePath(Application.ExeName) + 'Data\Reports';
  dmMain.frDesigner.SaveDir := dmMain.frDesigner.OpenDir;
  if (dmMain.cdsPrintQSL.RecordCount = 0) and (dmMain.qryLog.RecordCount > 0) then
  begin
    dmMain.cdsPrintQSL.Open;
    dmMain.cdsPrintQSL.Append;
    for i := 0 to dmMain.qryLog.FieldCount - 1 do
      dmMain.cdsPrintQSL.Fields[i].Value := dmMain.qryLog.Fields[i].Value;
    dmMain.cdsPrintQSL.Post;
  end;
  dmMain.Report.DesignReport();
  dmMain.cdsPrintQSL.EmptyTable;
end;

procedure TMainWindow.PrintQSLQueueClear(bAllLogs: boolean; Value: string);
var
  qryPrintQueue: TKADaoTable;
  Bookmark: TBookmark;
  LogId: integer;

  procedure PrintQSLQueueClearByStation(StationId: integer);
  begin
    if Value = 'Y' then
      qryPrintQueue.SQL.Text := 'UPDATE LOG_' + IntToStr(StationId) + ' SET LOG_QSL_SENT=' + QuotedStr(Value) + ', LOG_QSL_SENT_VIA=''B'' WHERE LOG_QSL_SENT=''Q'''
    else
      qryPrintQueue.SQL.Text := 'UPDATE LOG_' + IntToStr(StationId) + ' SET LOG_QSL_SENT=' + QuotedStr(Value) + ' WHERE LOG_QSL_SENT=''Q''';
    qryPrintQueue.ExecuteSQL;
  end;

begin
  if MessageBox(Handle, PWideChar(aPrintQSLQueueClear.Caption + '?'), PWideChar(Options.msgConfirmation.Caption), MB_SYSTEMMODAL or MB_SETFOREGROUND or MB_TOPMOST or mb_YesNo or mb_iconquestion) = mrYes then
  begin

    qryPrintQueue := TKADaoTable.Create(nil);
    dmMain.qryLog.DisableControls;
    LogId := dmMain.qryLog.FieldByName('LOG_ID').AsInteger;
    try
      qryPrintQueue.Database := dmMain.DAODatabase;
      if not bAllLogs then
        PrintQSLQueueClearByStation(CurrentStationId)
      else
      begin

      end;
    finally
      FreeAndNil(qryPrintQueue);
      dmMain.qryLog.EnableControls;
      dmMain.qryLog.Locate('LOG_ID', LogId, []);
    end;
  end;
end;

procedure TMainWindow.dQSLManualConfirm;
var
  sDir, sFile: string;
  qryQSLImageFiles: TKADaoTable;
  iRowAffectedImage: integer;
begin
  if OpenDialogJpeg.Execute(Self.Handle) then
    if FileExists(OpenDialogJpeg.FileName) then
    begin
      qryQSLImageFiles := TKADaoTable.Create(nil);
      try
        qryQSLImageFiles.Database := dmMain.DAODatabase;
        try
          sDir := Options.GetDQSLDirectory;
          sFile := StringReplace(dmMain.qryLog.FieldByName('LOG_CALL').asString, '/', '!', [rfReplaceAll]) + '_' + dmMain.qryLog.FieldByName('LOG_BAND').asString + '_' + dmMain.qryLog.FieldByName('LOG_MODE').asString + '_' + FormatDateTime
            ('yyyymmddhhnn', dmMain.qryLog.FieldByName('LOG_QSO_DATE').AsDateTime) + '.jpg';
          if not DirectoryExists(sDir) then
            ForceDirectories(sDir);
          CopyFile(OpenDialogJpeg.FileName, sDir + '\' + sFile);
          DeleteFile(PWideChar(OpenDialogJpeg.FileName));
          dmMain.qryLog.DisableControls;
          dmMain.qryLog.Edit;
          dmMain.qryLog.FieldByName('LOG_DQSL_QSL_RCVD').asString := 'Y';
          dmMain.qryLog.FieldByName('LOG_DQSL_QSLRDATE').AsDateTime := Date;
          dmMain.qryLog.Post;
          dmMain.qryLog.EnableControls;
          qryQSLImageFiles.SQL.Text := 'UPDATE QSL_IMAGE_FILES SET IMAGE_DQSL_FILENAME=' + QuotedStr(sFile) + ' WHERE STATION_ID=' + dmMain.qryStations.FieldByName('STATION_ID').asString + ' AND LOG_ID=' + IntToStr
            (dmMain.qryLog.FieldByName('LOG_ID').AsInteger);
          iRowAffectedImage := qryQSLImageFiles.ExecuteSQL;
          if iRowAffectedImage = 0 then
          begin
            qryQSLImageFiles.SQL.Text := 'INSERT INTO QSL_IMAGE_FILES (STATION_ID,LOG_ID,IMAGE_DQSL_FILENAME) VALUES(' + dmMain.qryStations.FieldByName('STATION_ID').asString + ',' + IntToStr(dmMain.qryLog.FieldByName('LOG_ID').AsInteger)
              + ',' + QuotedStr(sFile) + ')';
            qryQSLImageFiles.ExecuteSQL;
          end;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
        end;
      finally
        FreeAndNil(qryQSLImageFiles);
      end;
    end;
end;

{ function TMainWindow.GetQSLImageFileName(iType:byte; StationId,LogId:integer): string;
  var
  sDir:string;
  sr: TSearchRec;
  FileAttrs: integer;
  begin
  if iType=qtEQSL then
  sDir:=Options.GetEQSLDirectory;
  if iType=qtDQSL then
  sDir:=Options.GetDQSLDirectory;
  FileAttrs := faAnyFile;
  ssFileName:=Options.GetEQSLDirectory+'*'+dmMain.qryStations.FieldByName('STATION_ID').asString+'_'+qryPrintQueue.FieldByName('LOG_ID').AsString+'.jpg';
  if FindFirst(sDir+'*'+IntToStr(StationID)+'_'+IntToStr(LogID)+'.jpg', FileAttrs, sr) = 0 then
  begin
  repeat
  if (sr.Attr and FileAttrs) = sr.Attr then
  begin
  result:=sDir+sr.Name;
  break;
  end;
  until FindNext(sr) <> 0;
  FindClose(sr);
  end;
  end; }

function TMainWindow.IsShortCut(var Message: TWMKey): boolean;
var
  i, j, K: integer;
begin
  result := inherited IsShortCut(Message);
  if result then
    exit;

  if (KeyDataToShiftState(Message.KeyData) = []) and (not((Message.CharCode >= 112) and (Message.CharCode <= 123))) and (not((Message.CharCode = 27))) and (not((Message.CharCode = 32))) then
  begin
    exit;
  end;
  if (Message.CharCode = 16) or (Message.CharCode = 17) or (Message.CharCode = 18) then
    exit;

  for i := 0 to Owner.ComponentCount - 1 do
    if Owner.Components[i] is TForm then
      for j := 0 to Owner.Components[i].ComponentCount - 1 do
        if Owner.Components[i].Components[j] is TActionList then
        begin
          for K := 0 to TActionList(Owner.Components[i].Components[j]).ActionCount - 1 do
            if TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]).ShortCut = ShortCut(Message.CharCode, KeyDataToShiftState(Message.KeyData)) then
              if Assigned(TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]).OnExecute) and TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]).Enabled then
              begin
                if dmMain.dsLogEdit.State in [dsEdit] then
                begin
                  if (TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]).Name = 'aCancelQSO') or (TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]).Name = 'aSaveQSO') then
                  begin
                    TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]).OnExecute(TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]));
                    result := true;
                  end;
                end
                else
                begin
                  TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]).OnExecute(TAction(TActionList(Owner.Components[i].Components[j]).Actions[K]));
                  result := true;
                end;

                exit;
              end;
          { TActionList(Owner.Components[i].Components[j]).IsShortCut(Message);
            if TAction(TActionList(Owner.Components[i].Components[j]).Actions[0]).Name='aFilter' then
            ShowMessage(ShortCutTOText(TAction(TActionList(Owner.Components[i].Components[j]).Actions[0]).ShortCut)); }

        end;
end;

procedure TMainWindow.CallInfo;
{ var
  lsCall:string; }
begin
  { lsCall:=dmMain.qryLogEdit.FieldByName('LOG_CALL').AsString;
    dmMain.qryLastContact.Close;
    dmMain.qryLastContact.SQL.Text:='SELECT * FROM   log_1'+
    ' WHERE (log_call='''+lsCall+'''  OR log_call LIKE ''*/'+lsCall+''' OR log_call LIKE '''+lsCall+'/*'' OR log_call LIKE ''*/'+lsCall+'/*'') AND '+
    ' LOG_QSO_DATETIME=(SELECT Max(LOG_QSO_DATETIME)   FROM   log_1 '+
    ' WHERE (log_call='''+lsCall+'''  OR log_call LIKE ''*/'+lsCall+''' OR log_call LIKE '''+lsCall+'/*'' OR log_call LIKE ''*/'+lsCall+'/*''))';
    dmMain.qryLastContact.SQL.SaveToFile('d:\!\1111');
    dmMain.qryLastContact.Open; }

  timCallComplete.Enabled := false;

  CurrentManagers := nil;
  dmMain.cdsManagers.Filtered := false;
  dmMain.cdsManagers.Filter := 'MANAGER_LOG_CALL = ' + QuotedStr(Trim(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString));
  dmMain.cdsManagers.Filtered := true;
  while not dmMain.cdsManagers.Eof do
  begin
    SetLength(CurrentManagers, Length(CurrentManagers) + 1);
    CurrentManagers[Length(CurrentManagers) - 1] := dmMain.cdsManagers.FieldByName('MANAGER_MANAGER_CALL').asString + ';' + dmMain.cdsManagers.FieldByName('MANAGER_INFO').asString + ';';
    dmMain.cdsManagers.Next;
  end;
  Plugins.CoreCommand(CA_CALL_INFO, Self, CurrentManagers, 0);
end;

function TMainWindow.CallAdditionInfo(vCallSign: variant): string;
var
  vRes: string;
begin
  if vCallSign <> '' then
  begin
    CallDescList.FindCall(vCallSign, vRes);
    result := vRes;
  end;
end;

procedure TMainWindow.LoadManagers;
var
  slManagers: TStringList;
  slManagerLine: TStringList;
  i: integer;
begin
  slManagers := TStringList.Create;
  slManagerLine := TStringList.Create;
  slManagerLine.Delimiter := ';';
  slManagerLine.StrictDelimiter := true;
  try
    dmMain.cdsManagers.EmptyTable;
    dmMain.cdsManagers.Open;
    if FileExists(ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Managers.csv') then
      slManagers.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Managers.csv');
    for i := 0 to slManagers.Count - 1 do
    begin
      slManagerLine.DelimitedText := slManagers.Strings[i];
      dmMain.cdsManagers.Append;
      dmMain.cdsManagers.FieldByName('MANAGER_LOG_CALL').asString := slManagerLine.Strings[0];
      dmMain.cdsManagers.FieldByName('MANAGER_MANAGER_CALL').asString := slManagerLine.Strings[1];
      dmMain.cdsManagers.FieldByName('MANAGER_INFO').asString := slManagerLine.Strings[2];
      dmMain.cdsManagers.Post;
    end;
  finally
    FreeAndNil(slManagerLine);
    FreeAndNil(slManagers);
  end;
end;

function TMainWindow.CreateReportMenuItem(aParentItem: TActionClientItem; FileName: string): TActionClientItem;
var
  Action: TAction;
  aItem: TActionClientItem;
  i: integer;
begin
  if aParentItem = nil then
    aParentItem := TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[0]);

  for i := 0 to aParentItem.Items.Count - 1 do
    if TAction(aParentItem.Items[i].Action).Caption = FileName then
    begin
      result := aParentItem.Items[i];
      exit;
    end;

  Action := TAction.Create(Self);
  // Action.Name := 'aReport' + IntToStr(aParentItem.Index) + '_' + IntToStr(aParentItem.Items.Count);
  Action.Caption := ExtractFileNameWithoutExt(FileName);
  Action.OnExecute := ShowReport;
  Action.HelpKeyword := TAction(aParentItem.Action).HelpKeyword + '\' + FileName;
  Action.Tag := -3;
  Action.ActionList := ReportActionList;
  aItem := TActionClientItem.Create(aParentItem.Items);
  aItem.Action := Action;
  result := aItem;
end;

procedure TMainWindow.BuildReportsMenu;
var
  aItem, aParentItem: TActionClientItem;
  Action: TAction;

  procedure ScanDirs(const DirName: String);
  var
    h: THandle;
    wfd: tWin32FindData;
  begin
    // Inc(DirCount); // просто для статистики
    // Сначала просмотрим текущий каталог по заданной маске
    h := Windows.FindFirstFile(PChar(DirName + '*.*'), wfd);
    try
      if h <> INVALID_HANDLE_VALUE then
      begin
        repeat
          if (wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
          begin
            CreateReportMenuItem(aParentItem, wfd.cFileName);

            { Action := TAction.Create(Self);
              Action.Name := 'aReport' + IntToStr(aParentItem.Index) + '_' + IntToStr(aParentItem.Items.Count);
              Action.Caption := ExtractFileNameWithoutExt(wfd.cFileName);
              Action.OnExecute := ShowReport;
              Action.HelpKeyword := TAction(aParentItem.Action).HelpKeyword + '\' + wfd.cFileName;
              Action.Tag := -3;
              Action.ActionList := ActionList;
              aItem := TActionClientItem.Create(aParentItem.Items);
              aItem.Action := Action; }
          end;

          if (wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 16 then
          begin
            if (wfd.cFileName[0] <> '.') and (wfd.cFileName <> 'QSL') then
            begin
              aParentItem := CreateReportMenuItem(aParentItem, wfd.cFileName);

              { Action := TAction.Create(Self);
                Action.Name := 'aReport' + IntToStr(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[0]).Items.Count);
                Action.Caption := wfd.cFileName;
                Action.HelpKeyword := wfd.cFileName;
                // Action.OnExecute := ShowWindow;
                Action.Tag := -3;
                Action.ActionList := ActionList;
                aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[0]).Items);
                aItem.Action := Action;
                aParentItem := aItem; }
            end;
          end;
        until not Windows.FindNextFile(h, wfd);
      end;
      // проверка кода ошибки и FindFirstFile и FindNextFile
      case GetLastError of
        ERROR_NO_MORE_FILES, // больше нет файлов и каталогов удовлетворяющих маске (но были)
        ERROR_FILE_NOT_FOUND, // вообще нет файлов и каталогов удовлетворяющих маске
        ERROR_SHARING_VIOLATION // возникает во время создания каталога (уже создан но еще недоступен)
          :
          ; // ничего не делаем, все Ok
      else // все остальные ошибки
        raise Exception.CreateFmt('Ошибка просмотра каталога "%s": %s', [DirName, SysErrorMessage(GetLastError)]);
      end;
    finally
      if h <> INVALID_HANDLE_VALUE then
        Windows.FindClose(h);
    end;

    // Теперь рекрсивно просмотрим подкаталоги
    h := Windows.FindFirstFile(PChar(DirName + '*.*'), wfd);
    try
      if h <> INVALID_HANDLE_VALUE then
      begin
        repeat
          if ((wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0) and (wfd.cFileName <> String('.')) and (wfd.cFileName <> '..') and (wfd.cFileName <> 'QSL') then
            ScanDirs(IncludeTrailingPathDelimiter(DirName + wfd.cFileName));
        until not Windows.FindNextFile(h, wfd);
      end;
      case GetLastError of
        ERROR_NO_MORE_FILES, // больше нет файлов и каталогов удовлетворяющих маске (но были)
        ERROR_FILE_NOT_FOUND, // вообще нет файлов и каталогов удовлетворяющих маске
        ERROR_SHARING_VIOLATION // возникает во время создания каталога (уже создан но еще недоступен)
          :
          ; // ничего не делаем, все Ok
      else // все остальные ошибки
        raise Exception.CreateFmt('Ошибка просмотра каталога "%s": %s', [DirName, SysErrorMessage(GetLastError)]);
      end;
    finally
      if h <> INVALID_HANDLE_VALUE then
        Windows.FindClose(h);
    end;
  end;

begin
  aParentItem := nil;
  ScanDirs(ExtractFilePath(Application.ExeName) + 'Data\Reports\');
  dmMain.Report.AddFunction('procedure ReportChangeSQL', 'Замена SQL запроса', 'Подменяет SQL запрос');
end;

procedure TMainWindow.ShowReport(Sender: TObject);
var
  i: integer;
  sScript: string;
begin
  dmMain.Report.Clear;
  dmMain.Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Reports\' + TAction(Sender).HelpKeyword);
  dmMain.Report.Variables.Variables['StationId'] := dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
  sScript := dmMain.Report.ScriptText.Text;
  if dmMain.Report.PrepareReport() then
  begin
    AddRecentReports(TAction(Sender).HelpKeyword);
    dmMain.Report.ShowPreparedReport;
  end;
  // ShowMessage(TAction(Sender).HelpKeyword);
  //
end;

procedure TMainWindow.AddRecentReports(FileName: string);
var
  aItem: TActionClientItem;
  Action, aOldAction, aNewAction: TAction;
  i: integer;
  iCount: integer;

  procedure Reorder(From: integer);
  var
    i: integer;
    oldS: string;
  begin
    for i := From downto 0 do
    begin
      aOldAction := TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[i].Action);
      aNewAction := TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[i - 1].Action);
      aOldAction.Caption := aNewAction.Caption;
      aOldAction.HelpKeyword := aNewAction.HelpKeyword;
      oldS := Options.memRecentReports.Lines.Strings[i];
      Options.memRecentReports.Lines.Strings[i] := Options.memRecentReports.Lines.Strings[i - 1];
      Options.memRecentReports.Lines.Strings[i - 1] := oldS;
    end;
  end;

begin
  (* if TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items.Count > 0 then
    if TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[0].Action).Caption = ExtractFileNameWithoutExt(ExtractFileName(FileName)) then
    exit;

    if TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items.Count >= 4 then
    begin
    Reorder(3);
    aNewAction := TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[0].Action);
    aNewAction.Caption := ExtractFileNameWithoutExt(ExtractFileName(FileName));
    aNewAction.HelpKeyword := FileName;
    Options.memRecentReports.Lines.Strings[0] := FileName;
    end
    else
    begin
    if Options.memRecentReports.Lines.IndexOf(FileName) = -1 then
    begin
    Options.memRecentReports.Lines.Insert(0, FileName);
    Action := TAction.Create(Self);
    Action.Name := 'aRecentReport' + IntToStr(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items.Count);
    Action.Caption := ExtractFileNameWithoutExt(ExtractFileName(FileName));
    Action.OnExecute := ShowReport;
    Action.HelpKeyword := FileName;
    Action.Tag := -3;
    Action.ActionList := ReportActionList;
    aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items);
    aItem.Action := Action;
    end;
    iCount := TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items.Count;
    if iCount >= 4 then
    Reorder(3);
    aNewAction := TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items[0].Action);
    aNewAction.Caption := ExtractFileNameWithoutExt(ExtractFileName(FileName));
    aNewAction.HelpKeyword := FileName;
    // Options.memRecentReports.Lines.Strings[0] := FileName;
    end;

    { if Options.memRecentReports.Lines.IndexOf(FileName)<>-1 then exit;
    if Options.memRecentReports.Lines.Count<5 then
    begin
    Options.memRecentReports.Lines.Insert(0,FileName);
    Action := TAction.Create(Self);
    Action.Name := 'aRecentReport'+IntToStr(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items.count);
    Action.Caption:=ExtractFileNameWithoutExt(ExtractFileName(FileName));
    Action.OnExecute := ShowReport;
    Action.HelpKeyword:=FileName;
    Action.Tag := -3;
    Action.ActionList := ActionList;
    aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[19]).Items[1]).Items);
    aItem.Action:=Action;
    end; }
    *)
end;

procedure TMainWindow.AddReportToMenu(aFileName: string);
var
  iPos: integer;
  slPath: TStringList;
  i: integer;
  sPath: string;
  aParentItem: TActionClientItem;
  sReportPath, sFullPath: string;
begin
  aParentItem := nil;
  sReportPath := ExtractFilePath(Application.ExeName) + 'Data\Reports\';
  iPos := Pos('Data\Reports\', aFileName);
  if iPos > 0 then
  begin
    sPath := Copy(aFileName, iPos + 13, Length(aFileName));
    slPath := TStringList.Create;
    try
      slPath.Delimiter := '\';
      slPath.StrictDelimiter := true;
      slPath.DelimitedText := sPath;
      for i := 0 to slPath.Count - 1 do
      begin
        if i = slPath.Count - 1 then
          CreateReportMenuItem(aParentItem, slPath.Strings[i])
        else
          aParentItem := CreateReportMenuItem(aParentItem, slPath.Strings[i]);
      end;
    finally
      FreeAndNil(slPath);
    end;
  end;
end;

procedure TMainWindow.BuildBooksMenu;

var
  Action: TAction;
  Bookmark: TBookmark;
  aItem: TActionClientItem;
  CurrentId: integer;
  qryTemp: TKADaoTable;
  i, From: integer;

begin
  if TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Count > 0 then
  begin
    From := TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Count - 1;
    TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Clear;
    From := BooksActionList.ActionCount - 1;
    for i := From downto 0 do
    begin
      TAction(BooksActionList.Actions[i]).Free;
    end;

    { for i := From downto 0 do
      begin
      aItem := TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[0];
      if aItem.CommandStyle<>csSeparator then
      begin
      Action:=TAction(aItem.Action);
      Action.OnExecute:=nil;
      FreeAndNil(Action);
      end;
      FreeAndNil(aItem);
      end;
      //    SelectNewBookMenu(CurrentStationId);
      //    exit;
      end; }
    { qryTemp:=TKaDaoTable.Create(nil);
      qryTemp.Database:=dmMain.DAODatabase;
      qryTemp.SQL.Text:='SELECT * FROM STATIONS ORDER BY IS_GROUP';
      qryTemp.Open; }
  end;

  Options.RefreshmdsStations(CurrentStationId);
  Options.mdsStations.DisableControls;
  Options.mdsStations.First;
  try
    while not Options.mdsStations.Eof do
    begin
      if Options.mdsStations.FieldByName('IS_GROUP').AsInteger = 1 then
      begin
        aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items);
        aItem.Caption := Options.mdsStations.FieldByName('STATION_BOOK_NAME').asString;
        aItem.CommandStyle := csSeparator;
        aItem.KeyTip := Options.mdsStations.FieldByName('STATION_ID').asString;
      end
      else
      begin
        Action := TAction.Create(Self);
        Action.Caption := Options.mdsStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(Options.mdsStations.FieldByName('STATION_CALL').asString) + ']';
        Action.OnExecute := ChangeBook;
        Action.Tag := -3;
        Action.HelpKeyword := Options.mdsStations.FieldByName('STATION_ID').asString;
        if CurrentStationId = Options.mdsStations.FieldByName('STATION_ID').AsInteger then
          Action.ImageIndex := 23
        else
          Action.ImageIndex := -1;
        Action.ActionList := BooksActionList;
        aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items);
        aItem.KeyTip := Options.mdsStations.FieldByName('STATION_ID').asString;
        aItem.Action := Action;
      end;
      Options.mdsStations.Next;
    end;
  finally
    Options.mdsStations.EnableControls;
    // qryTemp.Close;
  end;
end;

procedure TMainWindow.ChangeBook(Sender: TObject);
var
  i: integer;
begin
  Screen.Cursor := crHourGlass;
  try
    if TAction(Sender).ImageIndex <> -1 then
      exit;
    for i := 0 to TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Count - 1 do
    begin
      if TActionClientItem(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i]).CommandStyle = csSeparator then
        continue;
      if TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).HelpKeyword <> TAction(Sender).HelpKeyword then
      begin
        TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].ImageIndex := -1;
        TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).ImageIndex := -1
      end
      else
      begin
        TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].ImageIndex := 23;
        TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).ImageIndex := 23;
        TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Refresh;
      end;
    end;

    dmMain.qryStations.First;
    dmMain.qryStations.Locate('STATION_ID', StrToInt(TAction(Sender).HelpKeyword), []);
    rbMain.Caption := 'UT4UKW Logbook build ' + getAppVersion + SubVersion + ' - ' + dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) + ']';
    dmMain.SetStationId(StrToInt(TAction(Sender).HelpKeyword));
    CoreCommand(MainWindow.aNewQSO);
    Options.FormStorageOnExit.StoredValue['StationId'] := dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
    Options.FormStorageOnExit.SaveFormPlacement;
    MainWindow.sbMain.Update;
    MainWindow.sbMain.Repaint;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainWindow.AddBookToMenu(StationId: integer; BookName: string; isGroup: integer = 0);
var
  Action: TAction;
  aItem: TActionClientItem;
begin
  if isGroup = 1 then
  begin
    aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items);
    // aItem.Action := Action;
    aItem.Caption := BookName;
    aItem.CommandStyle := csSeparator;
    aItem.KeyTip := IntToStr(StationId);
  end
  else
  begin
    Action := TAction.Create(Self);
    Action.Caption := BookName;
    Action.OnExecute := ChangeBook;
    Action.Tag := -3;
    Action.HelpKeyword := IntToStr(StationId);
    if GetBookCount = 0 then
    begin
      Action.ImageIndex := 23;
      rbMain.Caption := 'UT4UKW Logbook build ' + getAppVersion + SubVersion + ' - ' + dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) + ']';
    end
    else
      Action.ImageIndex := -1;
    Action.ActionList := BooksActionList;
    aItem := TActionClientItem.Create(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items);
    aItem.Action := Action;
    aItem.KeyTip := IntToStr(StationId);
  end;
end;

procedure TMainWindow.EditBookInMenu(StationId: integer; BookName: string);
var
  i: word;
begin
  for i := 0 to TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Count - 1 do
    if TActionClientItem(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i]).KeyTip = IntToStr(StationId) then
    // if TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).HelpKeyword = IntToStr(StationId) then
    begin
      if TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action <> nil then
        TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).Caption := BookName
      else
        TActionClientItem(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i]).Caption := BookName;
      exit;
    end;
end;

procedure TMainWindow.RemoveBookFromMenu(StationId: integer);
var
  i: word;
  aAction: TAction;
begin
  for i := 0 to TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Count - 1 do
    // if TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).HelpKeyword = IntToStr(StationId) then
    if TActionClientItem(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i]).KeyTip = IntToStr(StationId) then
    begin
      aAction := TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action);
      TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action := nil;
      TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Free;
      FreeAndNil(aAction);
      exit;
    end;
end;

procedure TMainWindow.SelectNewBookMenu(StationId: integer);
var
  i: integer;
begin
  for i := 0 to TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Count - 1 do
  begin
    if TActionClientItem(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i]).CommandStyle = csSeparator then
      continue;
    if TActionClientItem(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i]).KeyTip <> IntToStr(StationId) then
    begin
      TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].ImageIndex := -1;
      TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).ImageIndex := -1
    end
    else
    begin
      TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].ImageIndex := 23;
      TAction(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Action).ImageIndex := 23;
      TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i].Refresh;
    end;
  end;
end;

function TMainWindow.GetBookCount: integer;
var
  i: integer;
begin
  result := 0;
  for i := 0 to TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items.Count - 1 do
  begin
    if TActionClientItem(TActionClientItem(TActionBarItem(amMain.ActionBars.Items[20]).Items[0]).Items[i]).CommandStyle = csSeparator then
      continue;
    inc(result);
  end;
end;

procedure TMainWindow.ChangeFont;
var
  i: integer;
begin
  for i := 0 to Plugins.Items.Count - 1 do
    if (TPlugin(Plugins.Items[i]).IMSName = '') and Assigned(TPlugin(Plugins.Items[i]).PluginForm) then
    begin
      if Assigned(TPlugin(Plugins.Items[i]).PluginForm) then
      begin
        if Assigned(TPlugin(Plugins.Items[i]).PluginForm.Parent) then
          ModifyFontsFor(TPlugin(Plugins.Items[i]).PluginForm.Parent, Options.seFontSize.Value);
        if TPlugin(Plugins.Items[i]).IMSName <> '' then
          TPlugin(Plugins.Items[i]).PluginForm.LoadIMS;
      end;
    end;
  DockSite.Font.Size := Options.seFontSize.Value;
  Self.Font.Size := Options.seFontSize.Value;
  sbMain.Font.Size := Options.seFontSize.Value;
end;

procedure TMainWindow.SortWindowList;
var
  i: integer;
begin
  { aAction:=TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[0].Action;
    TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[0].Action:=TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[1];
    TActionClientItem(TActionBarItem(amMain.ActionBars.Items[11]).Items[0]).Items[1]:=aItem; }

end;

procedure TMainWindow.LotwUserListUpdate;
var
  mUserList: TMemoryStream;
  slUserList: TStringList;
  i: integer;
begin
  if Trim(Options.deCallInfoDirectory.Text) = '' then
    exit;
  mUserList := TMemoryStream.Create;
  slUserList := TStringList.Create;
  Screen.Cursor := crHourGlass;
  try
    try
      IdHTTP.Request.CacheControl := 'no-cache';
      IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)';

      IdHTTP.Get('http://www.hb9bza.net/lotw/lotw1.txt', mUserList);
      mUserList.Position := 0;
      slUserList.LoadFromStream(mUserList);
      for i := 0 to slUserList.Count - 1 do
        slUserList.Strings[i] := slUserList.Strings[i] + '=LoTW';
      slUserList.SaveToFile(GetAbsolutePathFromOptions(Options.deCallInfoDirectory.Text) + 'LoTW.txt');
      CallDescList.ReLoadFiles(GetAbsolutePathFromOptions(Options.deCallInfoDirectory.Text));
      Plugins.CoreCommand(CC_CALLDESCRIPTION_LOADED, Self, integer(Pointer(CallDescList)), 0);
    except
      on E: Exception do
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
    end;
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(mUserList);
    FreeAndNil(slUserList);
  end;
end;

procedure TMainWindow.EQSLUserListUpdate;
var
  mUserList: TMemoryStream;
  slUserList: TStringList;
  i: integer;
begin
  if Trim(Options.deCallInfoDirectory.Text) = '' then
    exit;

  mUserList := TMemoryStream.Create;
  slUserList := TStringList.Create;
  Screen.Cursor := crHourGlass;
  try
    try
      IdHTTP.Request.CacheControl := 'no-cache';
      IdHTTP.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)';

      IdHTTP.Get('http://www.eqsl.cc/qslcard/DownloadedFiles/AGMemberList.txt', mUserList);
      mUserList.Position := 0;
      slUserList.LoadFromStream(mUserList);
      for i := 0 to slUserList.Count - 1 do
        slUserList.Strings[i] := Trim(slUserList.Strings[i]) + '=eQSL';
      slUserList.Delete(0);
      slUserList.SaveToFile(GetAbsolutePathFromOptions(Options.deCallInfoDirectory.Text) + 'eQSL.txt');
      CallDescList.ReLoadFiles(GetAbsolutePathFromOptions(Options.deCallInfoDirectory.Text));
      Plugins.CoreCommand(CC_CALLDESCRIPTION_LOADED, Self, integer(Pointer(CallDescList)), 0);
    except
      on E: Exception do
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
    end;
  finally
    Screen.Cursor := crDefault;
    FreeAndNil(mUserList);
    FreeAndNil(slUserList);
  end;
end;

procedure TMainWindow.Minimize(Sender: TObject);
begin
  DockSite.FMinimizing := true;
end;

procedure TMainWindow.Restore(Sender: TObject);
begin
  DockSite.FMinimizing := false;
end;

procedure TMainWindow.WMSysCommand(var Msg: TWMSysCommand);
begin
  if Msg.CmdType = SC_MINIMIZE then
    DockSite.FMinimizing := true;
  inherited;
end;

procedure TMainWindow.WMDrawClipboard(var message: TMessage);
begin
  // Вызывается при любом изменении содержимого буфера обмена
  Plugins.CoreCommand(CC_CLIPBOARD_CHANGE, Self, 0, 0);
  message.result := SendMessage(WM_DRAWCLIPBOARD, FNextViewerHandle, 0, 0);
end;

procedure TMainWindow.WMChangeCBCHain(var message: TMessage);
begin
  // Вызывается при любом изменении цепочек буфера обмена.
  if message.wParam = FNextViewerHandle then
  begin
    // Удаляем следующую цепочку просмотра. Корректируем внутреннюю переменную.
    FNextViewerHandle := message.lParam;
    // Возвращаем 0 чтобы указать, что сообщение было обработано
    message.result := 0;
  end
  else
  begin
    // Передаем сообщение следующему окну в цепочке.
    message.result := SendMessage(FNextViewerHandle, WM_CHANGECBCHAIN, message.wParam, message.lParam);
  end;
end;

end.
