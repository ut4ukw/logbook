unit uOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvComCtrls, StdCtrls,
  JvExControls, JvXPCore, JvXPButtons, JvComponentBase, JvFormPlacement,
  ExtCtrls, Spin, Mask, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls,
  JvMaskEdit, JvCipher, JvPageList, JvNavigationPane, JvButton,
  JvPageListTreeView, JvExStdCtrls, JvCtrls, JvFooter, JvExExtCtrls,
  JvExtComponent, JvGroupHeader, DBCtrlsEh, DBCtrls, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, uPluginHeaders, DB, JvDBLookup, uUtils, ImgList, ToolWin,
  ActnList, Menus, JvMemoryDataset, DBGridEhGrouping, GridsEh, DBGridEh, JvAppIniStorage,
  IniFiles, JvDialogs, JvCombobox, JvColorCombo, KDaoTable, EhLibMemData,
  MemTableDataEh, MemTableEh, Math, JvColorBox, JvColorButton;

const
  WM_AFTER_O_SHOW = WM_USER + 301; // custom message

type

  NewTypeNav = class(TDbNavigator);

    TOptions = class(TForm)FormStorage: TJvFormStorage;
    msgDeleteRecord: TLabel;
    msgLoadPhoto: TLabel;
    msgCancelEdit: TLabel;
    msgCheckeQSLSent: TLabel;
    msgExitProgramm: TLabel;
    msgError: TLabel;
    msgErrorQSLExchange: TLabel;
    msgInformation: TLabel;
    msgInformationQSLExchange: TLabel;
    msgInformationQSLReceive: TLabel;
    pnlOptions: TPanel;
    ftOptions: TJvFooter;
    plSettings: TJvPageList;
    pgGeneral: TJvStandardPage;
    JvGroupHeader1: TJvGroupHeader;
    JvGroupHeader2: TJvGroupHeader;
    ptvOptions: TJvSettingsTreeView;
    Splitter1: TSplitter;
    pgPluginsPage: TJvStandardPage;
    btnOk: TButton;
    btnCancel: TButton;
    pgPersonalData: TJvStandardPage;
    vcPwdCrypt: TJvVigenereCipher;
    msgConfirmation: TLabel;
    msgInformationSetPersonalData: TLabel;
    msgConfirmStationDelete: TLabel;
    msgFieldCallNotNull: TLabel;
    msgExitOptions: TLabel;
    ilOptions: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    alOptions: TActionList;
    aBookAdd: TAction;
    aBookEdit: TAction;
    aBookDelete: TAction;
    pgHotKeys: TJvStandardPage;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    dsHotKeys: TDataSource;
    aShortCutEdit: TAction;
    FormStorageOnExit: TJvFormStorage;
    pgManagePlugins: TJvStandardPage;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    dbgManagePlugins: TDBGridEh;
    aPluginAdd: TAction;
    aPluginEdit: TAction;
    aPluginDelete: TAction;
    cdsPlugins: TJvMemoryData;
    cdsPluginsNAME_PLUGIN: TStringField;
    dsPlugins: TDataSource;
    cdsPluginsSCRIPT_PLUGIN: TStringField;
    cdsPluginsSORT_ORDER: TIntegerField;
    msgConfirmPluginDelete: TLabel;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    aPluginUp: TAction;
    aPluginDown: TAction;
    msgRebootWarning: TLabel;
    dbgStations: TDBGridEh;
    dbgHotKey: TDBGridEh;
    msgPrintQSLQueueEmpty: TLabel;
    pcGeneral: TPageControl;
    tsGeneralInterface: TTabSheet;
    tsGeneralData: TTabSheet;
    gbGeneralInterface: TGroupBox;
    lbLang: TLabel;
    cbLang: TComboBox;
    gbGeneralCallInfo: TGroupBox;
    lbTimeCallSecondaryData: TLabel;
    cbAutoGetCallPrimaryData: TCheckBox;
    seTimeCallSecondaryData: TSpinEdit;
    gbGeneralUpdate: TGroupBox;
    cbAutoCheckFlashUpdate: TCheckBox;
    cbAutoCheckFullUpdate: TCheckBox;
    gbGeneralGridColor: TGroupBox;
    cbGeneralGridColor: TComboBox;
    lbColorQSLSent: TLabel;
    lbColorQSLQueue: TLabel;
    lbColorQSLIgnore: TLabel;
    lbColorQSLValidate: TLabel;
    lbColorQSLRcvd: TLabel;
    lbColorEQSLRcvd: TLabel;
    lbColorCondition: TLabel;
    lbColorBackground: TLabel;
    lbColorForeground: TLabel;
    gbGeneralColorFontStyle: TGroupBox;
    cbFontBold: TCheckBox;
    cbFontItalic: TCheckBox;
    cbFontUnderline: TCheckBox;
    cdsColors: TJvMemoryData;
    cdsColorsITEM_INDEX: TIntegerField;
    cdsColorsCOLOR_BACKGROUND: TIntegerField;
    cdsColorsCOLOR_FOREGROUND: TIntegerField;
    cdsColorsFONT_BOLD: TIntegerField;
    cdsColorsFONT_ITALIC: TIntegerField;
    cdsColorsFONT_UNDERLINE: TIntegerField;
    pgBandMode: TJvStandardPage;
    pcBandMode: TPageControl;
    tsBand: TTabSheet;
    tsMode: TTabSheet;
    tsBandGrid: TTabSheet;
    dsBands: TDataSource;
    dbgBands: TDBGridEh;
    dbgModes: TDBGridEh;
    dsModes: TDataSource;
    qryModes: TKADaoTable;
    qryBands: TKADaoTable;
    ToolBar4: TToolBar;
    ToolButton8: TToolButton;
    ToolBar5: TToolBar;
    ToolButton9: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    dbgBandGrid: TDBGridEh;
    qryBandGrid: TKADaoTable;
    dsBandGrid: TDataSource;
    aModeEdit: TAction;
    aBandGridAdd: TAction;
    aBandGridEdit: TAction;
    aBandGridDelete: TAction;
    msgConfirmBandGridDelete: TLabel;
    qryBandsBAND_ID: TAutoIncField;
    qryBandsBAND_MHZ: TFloatField;
    qryBandsBAND_METER: TFloatField;
    qryBandsBAND_ADIF: TStringField;
    qryBandsBAND_LOWER_FREQ: TFloatField;
    qryBandsBAND_UPPER_FREQ: TFloatField;
    qryBandsBAND_ACTIVE: TIntegerField;
    qryModesMODE_ID: TAutoIncField;
    qryModesMODE_NAME: TStringField;
    qryModesMODE_ACTIVE: TIntegerField;
    qryModesMODE_TITLE: TStringField;
    qryModesMODE_DEFAULT_REPORT: TStringField;
    qryBandGridBANDGRID_ID: TAutoIncField;
    qryBandGridBANDGRID_BAND_MHZ: TFloatField;
    qryBandGridBANDGRID_MODE_NAME: TStringField;
    qryBandGridBANDGRID_FREQ_BEGIN: TFloatField;
    qryBandGridBANDGRID_FREQ_END: TFloatField;
    qryBandGridBANDGRID_CAT_MODE: TStringField;
    tsQSLServices: TTabSheet;
    gbGeneralQSLServicesDQSL: TGroupBox;
    lbDQSLPictureDirectory: TLabel;
    deDQSLPictureDirectory: TJvDirectoryEdit;
    cbDQSLSentIdentifier: TCheckBox;
    msgHotKeyAssigned: TLabel;
    seJPEGQuality: TSpinEdit;
    lbJPEGQuality: TLabel;
    seJPEGDPI: TSpinEdit;
    lbJPEGDPI: TLabel;
    lbAllGridVisibleColumns: TLabel;
    lbAllGridSelectAll: TLabel;
    msgCheckPrintedRecords: TLabel;
    cbAutoGetCalSecondaryDataOnEdit: TCheckBox;
    msgFlashUpdateNotNeed: TLabel;
    msgFlashUpdateCompleted: TLabel;
    lbSTFilterListItem_Empties: TLabel;
    lbSSTFilterListItem_NotEmpties: TLabel;
    lbSSTFilterListItem_All: TLabel;
    lbSSTFilterListItem_ClearFilter: TLabel;
    lbSSTFilterListItem_ApplyFilter: TLabel;
    lbSSTFilterListItem_CustomFilter: TLabel;
    lbFilterCaption: TLabel;
    lbShowRecordsWhere: TLabel;
    lbAnd: TLabel;
    lbOr: TLabel;
    memRecentReports: TMemo;
    gbGeneralQSLServicesEQSL: TGroupBox;
    lbEQSLLastDownload: TLabel;
    lbEQSLPictureDirectory: TLabel;
    dtpEQSLLastDownload: TDateTimePicker;
    cbEQSLLoadPictures: TCheckBox;
    deEQSLPictureDirectory: TJvDirectoryEdit;
    gbGeneralQSLServicesLOTW: TGroupBox;
    lbLOTWLastDownload: TLabel;
    dtpLOTWLastDownload: TDateTimePicker;
    msgFlashUpdateFound: TLabel;
    cbPartnerProgramm: TCheckBox;
    gbGeneralBackup: TGroupBox;
    deBackupDirectory: TJvDirectoryEdit;
    lbBackupDirectory: TLabel;
    cbAutoBackupOnExit: TCheckBox;
    seFontSize: TSpinEdit;
    lbFontSize: TLabel;
    Panel1: TPanel;
    cbCheckNewOneForAllBook: TCheckBox;
    mdsHotKeys: TMemTableEh;
    mdsHotKeysACTION_NAME: TStringField;
    mdsHotKeysACTION_SHORTCUT: TStringField;
    mdsHotKeysACTION_CAPTION: TStringField;
    mdsHotKeysACTION_FOUND: TIntegerField;
    mdsHotKeysACTION_WINDOW: TStringField;
    mdsHotKeysACTION_WINDOW_PARENT: TStringField;
    mdsHotKeysACTION_POINTER: TIntegerField;
    qryModesMODE_BACKGROUND_COLOR: TStringField;
    cdsPluginsPLUGIN_CAPTION: TStringField;
    lbCallInfoDirectory: TLabel;
    deCallInfoDirectory: TJvDirectoryEdit;
    mdsStations: TMemTableEh;
    qryStations: TKADaoTable;
    qryStationsSTATION_ID: TAutoIncField;
    qryStationsSTATION_CALL: TStringField;
    qryStationsSTATION_STREET: TStringField;
    qryStationsSTATION_GRIDSQUARE: TStringField;
    qryStationsSTATION_LAT: TFloatField;
    qryStationsSTATION_LON: TFloatField;
    qryStationsSTATION_NAME: TStringField;
    qryStationsSTATION_CITY: TStringField;
    qryStationsSTATION_COUNTRY: TIntegerField;
    qryStationsSTATION_ITU_ZONE: TIntegerField;
    qryStationsSTATION_CQ_ZONE: TIntegerField;
    qryStationsSTATION_POSTAL_CODE: TStringField;
    qryStationsSTATION_RIG: TStringField;
    qryStationsSTATION_EQSL_LOGIN: TStringField;
    qryStationsSTATION_EQSL_PASSWORD: TStringField;
    qryStationsSTATION_BOOK_NAME: TStringField;
    qryStationsSTATION_BOOK_DESCRIPTION: TStringField;
    qryStationsSTATION_EQSL_ACTIVE: TIntegerField;
    qryStationsSTATION_DQSL_ACTIVE: TIntegerField;
    qryStationsSTATION_DQSL_SMTP_HOST: TStringField;
    qryStationsSTATION_DQSL_SMTP_PORT: TIntegerField;
    qryStationsSTATION_DQSL_MAIL_USERNAME: TStringField;
    qryStationsSTATION_DQSL_MAIL_PASSWORD: TStringField;
    qryStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField;
    qryStationsSTATION_DQSL_POP_HOST: TStringField;
    qryStationsSTATION_DQSL_POP_PORT: TIntegerField;
    qryStationsSTATION_CNTY: TStringField;
    qryStationsSTATION_IOTA: TStringField;
    qryStationsSTATION_IOTA_ISLAND_ID: TStringField;
    qryStationsSTATION_SIG: TStringField;
    qryStationsSTATION_SIG_INFO: TStringField;
    qryStationsSTATION_STATE: TStringField;
    qryStationsSTATION_LOTW_ACTIVE: TIntegerField;
    qryStationsSTATION_LOTW_LOGIN: TStringField;
    qryStationsSTATION_LOTW_PASSWORD: TStringField;
    qryStationsSTATION_LOTW_HOME: TStringField;
    qryStationsSTATION_HRDLOG_LOGIN: TStringField;
    qryStationsSTATION_HRDLOG_PASSWORD: TStringField;
    qryStationsSTATION_HRDLOG_ACTIVE: TIntegerField;
    qryStationsSTATION_EQSL_SENT_EVERY: TIntegerField;
    qryStationsSTATION_HRDLOG_SENT_EVERY: TIntegerField;
    qryStationsSTATION_PARENT_ID: TIntegerField;
    qryStationsIS_GROUP: TIntegerField;
    dsStations: TDataSource;
    ToolButton15: TToolButton;
    aBookGroupAdd: TAction;
    msgConfirmStationGroupDelete: TLabel;
    qryStationsSTATION_HAMQTH_LOGIN: TStringField;
    qryStationsSTATION_HAMQTH_PASSWORD: TStringField;
    qryStationsSTATION_QRZCOM_LOGIN: TStringField;
    qryStationsSTATION_QRZCOM_PASSWORD: TStringField;
    mdsStationsSTATION_ID: TAutoIncField;
    mdsStationsSTATION_CALL: TStringField;
    mdsStationsSTATION_STREET: TStringField;
    mdsStationsSTATION_GRIDSQUARE: TStringField;
    mdsStationsSTATION_LAT: TFloatField;
    mdsStationsSTATION_LON: TFloatField;
    mdsStationsSTATION_NAME: TStringField;
    mdsStationsSTATION_CITY: TStringField;
    mdsStationsSTATION_COUNTRY: TIntegerField;
    mdsStationsSTATION_ITU_ZONE: TIntegerField;
    mdsStationsSTATION_CQ_ZONE: TIntegerField;
    mdsStationsSTATION_POSTAL_CODE: TStringField;
    mdsStationsSTATION_RIG: TStringField;
    mdsStationsSTATION_EQSL_LOGIN: TStringField;
    mdsStationsSTATION_EQSL_PASSWORD: TStringField;
    mdsStationsSTATION_BOOK_NAME: TStringField;
    mdsStationsSTATION_BOOK_DESCRIPTION: TStringField;
    mdsStationsSTATION_EQSL_ACTIVE: TIntegerField;
    mdsStationsSTATION_DQSL_ACTIVE: TIntegerField;
    mdsStationsSTATION_DQSL_SMTP_HOST: TStringField;
    mdsStationsSTATION_DQSL_SMTP_PORT: TIntegerField;
    mdsStationsSTATION_DQSL_MAIL_USERNAME: TStringField;
    mdsStationsSTATION_DQSL_MAIL_PASSWORD: TStringField;
    mdsStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField;
    mdsStationsSTATION_DQSL_POP_HOST: TStringField;
    mdsStationsSTATION_DQSL_POP_PORT: TIntegerField;
    mdsStationsSTATION_CNTY: TStringField;
    mdsStationsSTATION_IOTA: TStringField;
    mdsStationsSTATION_IOTA_ISLAND_ID: TStringField;
    mdsStationsSTATION_SIG: TStringField;
    mdsStationsSTATION_SIG_INFO: TStringField;
    mdsStationsSTATION_STATE: TStringField;
    mdsStationsSTATION_LOTW_ACTIVE: TIntegerField;
    mdsStationsSTATION_LOTW_LOGIN: TStringField;
    mdsStationsSTATION_LOTW_PASSWORD: TStringField;
    mdsStationsSTATION_LOTW_HOME: TStringField;
    mdsStationsSTATION_HRDLOG_LOGIN: TStringField;
    mdsStationsSTATION_HRDLOG_PASSWORD: TStringField;
    mdsStationsSTATION_HRDLOG_ACTIVE: TIntegerField;
    mdsStationsSTATION_EQSL_SENT_EVERY: TIntegerField;
    mdsStationsSTATION_HRDLOG_SENT_EVERY: TIntegerField;
    mdsStationsSTATION_PARENT_ID: TIntegerField;
    mdsStationsIS_GROUP: TIntegerField;
    mdsStationsSTATION_HAMQTH_LOGIN: TStringField;
    mdsStationsSTATION_HAMQTH_PASSWORD: TStringField;
    mdsStationsSTATION_QRZCOM_LOGIN: TStringField;
    mdsStationsSTATION_QRZCOM_PASSWORD: TStringField;
    cbColorBackground: TJvColorButton;
    cbColorForeground: TJvColorButton;
    gbGeneralStatisticsColor: TGroupBox;
    cdsColorsStatistics: TJvMemoryData;
    cdsColorsStatisticsITEM_INDEX: TIntegerField;
    cdsColorsStatisticsCOLORBACKGROUND: TIntegerField;
    cdsColorsStatisticsCOLOR_FOREGROUND: TIntegerField;
    cbGeneralGridColorStatistics: TComboBox;
    cbColorStatisticsBackground: TJvColorButton;
    cbColorStatisticsForeground: TJvColorButton;
    lbColorStatisticsWorked: TLabel;
    lbColorStatisticsSended: TLabel;
    lbColorStatisticsConfirmed: TLabel;
    lbColorStatisticsNotWorked: TLabel;
    lbColorStatisticsCondition: TLabel;
    lbColorStatisticsBackground: TLabel;
    lbColorStatisticsForeground: TLabel;
    cbUseDropBox: TCheckBox;
    cbLoadManagers: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ptvOptionsChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
    procedure dbgStationsDblClick(Sender: TObject);
    procedure TLab(Sender: TObject; Button: TNavigateBtn);
    procedure tsStationDataGeoShow(Sender: TObject);
    procedure dbeGridSquareChange(Sender: TObject);
    procedure dbeGridSquareKeyPress(Sender: TObject; var Key: Char);
    procedure aBookAddExecute(Sender: TObject);
    procedure aBookDeleteExecute(Sender: TObject);
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_O_SHOW;
    procedure aBookEditExecute(Sender: TObject);
    procedure aBookEditUpdate(Sender: TObject);
    procedure aBookDeleteUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
    procedure aShortCutEditExecute(Sender: TObject);
    procedure pgHotKeysShow(Sender: TObject);
    procedure aPluginAddExecute(Sender: TObject);
    procedure aPluginEditExecute(Sender: TObject);
    procedure aPluginDeleteExecute(Sender: TObject);
    procedure aPluginUpExecute(Sender: TObject);
    procedure aPluginDownExecute(Sender: TObject);
    procedure dbgManagePluginsDblClick(Sender: TObject);
    procedure FormStorageOnExitAfterSavePlacement(Sender: TObject);
    procedure FormStorageOnExitAfterRestorePlacement(Sender: TObject);
    procedure dbgHotKeyDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbColorBackground1Click(Sender: TObject);
    procedure cbGeneralGridColorClick(Sender: TObject);
    procedure cbColorForegroundClick(Sender: TObject);
    procedure cbFontBoldClick(Sender: TObject);
    procedure cbFontItalicClick(Sender: TObject);
    procedure cbFontUnderlineClick(Sender: TObject);
    procedure dbgBandsCellClick(Column: TColumnEh);
    procedure SaveGrid(Grid: TDBGridEh);
    procedure aModeEditExecute(Sender: TObject);
    procedure dbgModesCellClick(Column: TColumnEh);
    procedure dbgModesDblClick(Sender: TObject);
    procedure aBandGridAddExecute(Sender: TObject);
    procedure aBandGridDeleteExecute(Sender: TObject);
    procedure aBandGridEditExecute(Sender: TObject);
    procedure dbgBandGridDblClick(Sender: TObject);
    procedure CheckQSLServicesActive;
    procedure FormCreate(Sender: TObject);
    procedure dbgHotKeyGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aShortCutEditUpdate(Sender: TObject);
    procedure dbgModesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbgStationsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aBookGroupAddExecute(Sender: TObject);
    procedure aBookAddUpdate(Sender: TObject);
    procedure cbColorBackgroundChange(Sender: TObject);
    procedure cbColorForegroundChange(Sender: TObject);
    procedure cbGeneralGridColorStatisticsClick(Sender: TObject);
    procedure cbColorStatisticsBackgroundChange(Sender: TObject);
    procedure cbColorStatisticsForegroundChange(Sender: TObject);
  private
    vKey: Char;
    bRebootNeeded: Boolean;
    bDontChangeColor:boolean;
    bDontChangeStatisticsColor:boolean;
    procedure SaveHotKeys;
    procedure SetColorParams;
    procedure GetColorParams;
    procedure SetColorStatisticsParams;
    procedure GetColorStatisticsParams;
  public
    NodeSelectIndex: Integer;
    OldStationID: Integer;
    bGlobalEQSLActive: Boolean;
    bGlobalDQSLActive: Boolean;
    bGlobalLOTWActive: Boolean;
    procedure GetLangs;
    procedure RegisterPluginsSettings;
    procedure UnRegisterPluginsSettings;
    procedure GetActions;
    function FindActionByName(ActionName: string): TAction;
    procedure RemoveSectionFromIni;
    function GetEQSLDirectory: string;
    function GetDQSLDirectory: string;
    procedure TranslateGrid;
    procedure LoadHotKeys;
    procedure TranslatePluginName;
    procedure RefreshmdsStations(StationId:integer=1);
  end;

var
  Options: TOptions;

implementation

uses uMainWindow, uPlugins, udmMain, uEditBook, uEditShortCut, uEditPlugin,
  uEditMode, uEditBandGrid, uEditBookGroup;
{$R *.dfm}

procedure TOptions.RefreshmdsStations(StationId:integer=1);
begin
  dmMain.qryStations.First;
  mdsStations.DisableControls;
  mdsStations.EmptyTable;
  mdsStations.LoadFromDataSet(dmMain.qryStations,dmMain.qryStations.RecordCount,lmCopy,False);
  mdsStations.Locate('STATION_ID',StationId,[]);
  dmMain.qryStations.Locate('STATION_ID',StationId,[]);
  mdsStations.EnableControls;
 { if Visible and (plSettings.ActivePage=pgPersonalData) and not dbgStations.Focused then
    dbgStations.SetFocus;  }
end;


procedure TOptions.GetLangs;
var
  slFiles: TStringList;
  i: Integer;
  sFileName: string;
begin
  cbLang.Items.Clear;
  slFiles := TStringList.Create;
  try
    FindFilesByMask(slFiles, ExtractFilePath(Application.ExeName) + 'Lang', '*.lng');
    for i := 0 to slFiles.Count - 1 do
    begin
      sFileName := ExtractFileName(slFiles.Strings[i]);
      cbLang.Items.Add(Copy(sFileName, 1, Pos('.', sFileName) - 1));
    end;
  finally
    slFiles.Free;
  end;
end;

procedure TOptions.TLab(Sender: TObject; Button: TNavigateBtn);
var
  i: Integer;
begin
  if Button = nbDelete then
    if Application.MessageBox(PWideChar(Options.msgConfirmStationDelete.Caption), PWideChar(Options.msgInformation.Caption), MB_YESNO or MB_ICONWARNING) <> IDYES then
      Abort;
end;

procedure TOptions.tsStationDataGeoShow(Sender: TObject);
begin
  { dbeGridSquare.SetFocus;
    dbcMyLat.Perform(CM_ENTER,0,0);
    dbcMyLon.Perform(CM_ENTER,0,0); }
end;

procedure TOptions.aBandGridAddExecute(Sender: TObject);
begin
  Application.CreateForm(TEditBandGrid, EditBandGrid);
  MainWindow.Translator.TranslateWindow(EditBandGrid.Name, EditBandGrid);
  EditBandGrid.Caption := aBandGridAdd.Caption;
  if EditBandGrid.ShowModal = mrOk then
  begin
    qryBandGrid.Append;
    qryBandGrid.FieldByName('BANDGRID_BAND_MHZ').asFloat := EditBandGrid.dblBands.KeyValue;
    qryBandGrid.FieldByName('BANDGRID_MODE_NAME').asString := EditBandGrid.dblModes.KeyValue;
    qryBandGrid.FieldByName('BANDGRID_CAT_MODE').asString := EditBandGrid.cbCatModes.Text;
    qryBandGrid.FieldByName('BANDGRID_FREQ_BEGIN').asFloat := EditBandGrid.ceFreqBegin.Value;
    qryBandGrid.FieldByName('BANDGRID_FREQ_END').asFloat := EditBandGrid.ceFreqEnd.Value;
    qryBandGrid.Post;
    bRebootNeeded := True;
  end;
  EditBandGrid.Free;
end;

procedure TOptions.aBandGridDeleteExecute(Sender: TObject);
begin
  if MessageBox(Application.Handle, PWideChar(msgConfirmBandGridDelete.Caption), PWideChar(msgInformation.Caption), MB_YESNO or MB_ICONWARNING) <> IDYES then
    exit;
  qryBandGrid.Delete;
  bRebootNeeded := True;
end;

procedure TOptions.aBandGridEditExecute(Sender: TObject);
begin
  Application.CreateForm(TEditBandGrid, EditBandGrid);
  MainWindow.Translator.TranslateWindow(EditBandGrid.Name, EditBandGrid);
  EditBandGrid.Caption := aBandGridEdit.Caption;
  EditBandGrid.dblBands.KeyValue := qryBandGrid.FieldByName('BANDGRID_BAND_MHZ').asFloat;
  EditBandGrid.dblModes.KeyValue := qryBandGrid.FieldByName('BANDGRID_MODE_NAME').asString;
  EditBandGrid.cbCatModes.ItemIndex := EditBandGrid.cbCatModes.Items.IndexOf(qryBandGrid.FieldByName('BANDGRID_CAT_MODE').asString);
  // EditBandGrid.cbCatModes.Text:=qryBandGrid.FieldByName('BANDGRID_CAT_MODE').asString;
  EditBandGrid.ceFreqBegin.Value := qryBandGrid.FieldByName('BANDGRID_FREQ_BEGIN').asFloat;
  EditBandGrid.ceFreqEnd.Value := qryBandGrid.FieldByName('BANDGRID_FREQ_END').asFloat;
  if EditBandGrid.ShowModal = mrOk then
  begin
    qryBandGrid.Edit;
    qryBandGrid.FieldByName('BANDGRID_BAND_MHZ').asFloat := EditBandGrid.dblBands.KeyValue;
    qryBandGrid.FieldByName('BANDGRID_MODE_NAME').asString := EditBandGrid.dblModes.KeyValue;
    qryBandGrid.FieldByName('BANDGRID_CAT_MODE').asString := EditBandGrid.cbCatModes.Text;
    qryBandGrid.FieldByName('BANDGRID_FREQ_BEGIN').asFloat := EditBandGrid.ceFreqBegin.Value;
    qryBandGrid.FieldByName('BANDGRID_FREQ_END').asFloat := EditBandGrid.ceFreqEnd.Value;
    qryBandGrid.Post;
  end;
  EditBandGrid.Free;
end;

procedure TOptions.aBookAddExecute(Sender: TObject);
begin
  Application.CreateForm(TEditBook, EditBook);
  MainWindow.Translator.TranslateWindow(EditBook.Name, EditBook);
  EditBook.Caption := aBookAdd.Caption;
  EditBook.ShowModal;
  RefreshmdsStations(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
  EditBook.Free;
end;

procedure TOptions.aBookAddUpdate(Sender: TObject);
begin
 aBookAdd.Enabled:=mdsStations.FieldByName('IS_GROUP').AsInteger=1;
end;

procedure TOptions.aPluginAddExecute(Sender: TObject);
begin
  Application.CreateForm(TEditPlugin, EditPlugin);
  MainWindow.Translator.TranslateWindow(EditPlugin.Name, EditPlugin);
  EditPlugin.Caption := aPluginAdd.Caption;
  EditPlugin.GetPlugins(False);
  if EditPlugin.ShowModal = mrOk then
  begin
    try
      cdsPlugins.Append;
      cdsPlugins.FieldByName('PLUGIN_NAME').asString := EditPlugin.PluginName;
      cdsPlugins.FieldByName('PLUGIN_CAPTION').asString := EditPlugin.cbPlugins.Text;
      cdsPlugins.FieldByName('PLUGIN_SCRIPT').asString := EditPlugin.cbScript.Text;
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := cdsPlugins.RecordCount + 1;
      cdsPlugins.Post;
      bRebootNeeded := True;
    finally
    end;
  end;
  EditPlugin.Free;
end;

procedure TOptions.aBookDeleteExecute(Sender: TObject);
var
  bNeedUpdate: Boolean;
  iDeleteStationId: Integer;
  bNewStationSelected:boolean;
begin
  if mdsStations.FieldByName('IS_GROUP').AsInteger = 1 then
  begin
  if MessageBox(Application.Handle, PWideChar(msgConfirmStationGroupDelete.Caption), PWideChar(msgInformation.Caption), MB_YESNO or MB_ICONWARNING) <> IDYES then
    exit;
//  mdsStations.DisableControls;
  dmMain.qryStations.DisableControls;
  try
  //  MainWindow.RemoveBookFromMenu(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
    dmMain.qryStations.Locate('STATION_ID',mdsStations.FieldByName('STATION_ID').AsInteger,[]);
    dmMain.qryStations.Delete;
    dmMain.qryStations.Refresh;
    RefreshmdsStations();
  except
      on E: Exception do
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
  end;
//  mdsStations.EnableControls;
  dmMain.qryStations.EnableControls;

  end
  else
  begin

  if MessageBox(Application.Handle, PWideChar(msgConfirmStationDelete.Caption), PWideChar(msgInformation.Caption), MB_YESNO or MB_ICONWARNING) <> IDYES then
    exit;
  try
    mdsStations.DisableControls;
    try
      dmMain.qryStations.Locate('STATION_ID', mdsStations.FieldByName('STATION_ID').AsInteger, []);

      bNeedUpdate := mdsStations.FieldByName('STATION_ID').AsInteger = MainWindow.CurrentStationId;
      if bNeedUpdate then
      begin
        iDeleteStationId := mdsStations.FieldByName('STATION_ID').AsInteger;
        qryStations.Close;
        qryStations.Open;

        qryStations.First;
        while not dmMain.qryStations.Eof do
         begin
          if dmMain.qryStations.FieldByName('IS_GROUP').AsInteger<>1 then
           begin
             dmMain.qryStations.Locate('STATION_ID',mdsStations.FieldByName('STATION_ID').AsInteger,[]);
             dmMain.SetStationId(qryStations.FieldByName('STATION_ID').AsInteger);
//             MainWindow.SelectNewBookMenu(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
             MainWindow.Plugins.CoreCommand(CC_STATION_CHANGED, nil, dmMain.qryStations.FieldByName('STATION_ID').AsInteger, dmMain.qryStations.FieldByName('STATION_CALL').asString);
             MainWindow.sbMain.Update;
             MainWindow.sbMain.Repaint;
             bNewStationSelected:=true;
             break;
           end;
          dmMain.qryStations.Next;
         end;
        if not bNewStationSelected then
          dmMain.SetStationId(-1);

//        OldStationID := dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
        qryStations.First;
        dmMain.qryStations.Locate('STATION_ID', iDeleteStationId, []);
      end;

      dmMain.DeleteTable(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
//      MainWindow.RemoveBookFromMenu(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
      dmMain.qryStations.Delete;
      if not dmMain.qryStations.Locate('STATION_ID', MainWindow.CurrentStationId, []) then
        dmMain.qryStations.First;
      RefreshmdsStations();
      MainWindow.BuildBooksMenu;
      dmMain.GetAllTableForSelect;
    except
      on E: Exception do
        MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
    end;
    RefreshmdsStations();
  finally
    mdsStations.EnableControls;
  end;
  end;
end;

procedure TOptions.aBookDeleteUpdate(Sender: TObject);
begin
 if  mdsStations.FieldByName('IS_GROUP').AsInteger <>1 then
   aBookDelete.Enabled := not dmMain.qryStations.IsEmpty
 else
   if not mdsStations.TreeNodeHasChildren and not dmMain.qryStations.IsEmpty and not (mdsStations.FieldByName('STATION_ID').AsInteger=1) then
      aBookDelete.Enabled := true
    else
      aBookDelete.Enabled := false;
end;

procedure TOptions.aPluginDeleteExecute(Sender: TObject);
var
  OldSortOrder: Integer;
begin
  if MessageBox(Application.Handle, PWideChar(msgConfirmPluginDelete.Caption), PWideChar(msgInformation.Caption), MB_YESNO or MB_ICONWARNING) <> IDYES then
    exit;
  cdsPlugins.DisableControls;
  try
    OldSortOrder := cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger;
    cdsPlugins.Delete;
    bRebootNeeded := True;
    cdsPlugins.First;
    if cdsPlugins.Locate('PLUGIN_SORT_ORDER', OldSortOrder + 1, []) then
    begin
      while not cdsPlugins.Eof do
      begin
        cdsPlugins.Edit;
        cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger - 1;
        cdsPlugins.Post;
        cdsPlugins.Next;
      end;
    end;
  finally
    cdsPlugins.First;
    cdsPlugins.EnableControls;
  end;
end;

procedure TOptions.aPluginDownExecute(Sender: TObject);
var
  OldSortOrder: Integer;
begin
  cdsPlugins.DisableControls;
  try
    OldSortOrder := cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger;
    if OldSortOrder < cdsPlugins.RecordCount then
    begin
      bRebootNeeded := True;
      cdsPlugins.First;
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', OldSortOrder + 1, []);

      cdsPlugins.Edit;
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := -1;
      cdsPlugins.Post;

      cdsPlugins.First;
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', OldSortOrder, []);

      cdsPlugins.Edit;
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := OldSortOrder + 1;
      cdsPlugins.Post;

      cdsPlugins.First;
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', -1, []);

      cdsPlugins.Edit;
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := OldSortOrder;
      cdsPlugins.Post;
      cdsPlugins.SortOnFields('PLUGIN_SORT_ORDER', False, False);
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', OldSortOrder + 1, []);
    end;
  finally
    cdsPlugins.EnableControls;
  end;
end;

procedure TOptions.aBookEditExecute(Sender: TObject);
var
 StationId:Integer;
begin
 dmMain.qryStations.Locate('STATION_ID',mdsStations.FieldByName('STATION_ID').AsInteger,[]);
 StationId:=mdsStations.FieldByName('STATION_ID').AsInteger;

 if mdsStations.FieldByName('IS_GROUP').AsInteger=1 then
 begin
  Application.CreateForm(TEditBookGroup, EditBookGroup);
  MainWindow.Translator.TranslateWindow(EditBookGroup.Name, EditBookGroup);
  EditBookGroup.leBookGroup.Text:=mdsStations.FieldByName('STATION_BOOK_NAME').AsString;
  EditBookGroup.isEdit:=True;
  EditBookGroup.ShowModal;
//  if EditBookGroup.ShowModal=mrOk then
    RefreshmdsStations(StationId);
  EditBookGroup.Free;
 end
 else
 begin
  Application.CreateForm(TEditBook, EditBook);
  MainWindow.Translator.TranslateWindow(EditBook.Name, EditBook);
  EditBook.Caption := aBookEdit.Caption;
  EditBook.isEdit := True;
  EditBook.ShowModal;
//  if EditBook.ShowModal=mrOk then
    RefreshmdsStations(StationId);
  EditBook.Free;
 end;
 MainWindow.sbMain.Update;
 MainWindow.sbMain.Repaint;
end;

procedure TOptions.aBookEditUpdate(Sender: TObject);
begin
  aBookEdit.Enabled := not dmMain.qryStations.IsEmpty;
end;

procedure TOptions.aBookGroupAddExecute(Sender: TObject);
begin
  Application.CreateForm(TEditBookGroup, EditBookGroup);
  MainWindow.Translator.TranslateWindow(EditBookGroup.Name, EditBookGroup);
  EditBookGroup.isEdit:=False;
  EditBookGroup.ShowModal;
  EditBookGroup.Free;
end;

procedure TOptions.aModeEditExecute(Sender: TObject);
begin
  Application.CreateForm(TEditMode, EditMode);
  MainWindow.Translator.TranslateWindow(EditMode.Name, EditMode);
  try
    EditMode.leModeTitle.Text := qryModes.FieldByName('MODE_TITLE').asString;
    EditMode.leModeDefaultReport.Text := qryModes.FieldByName('MODE_DEFAULT_REPORT').asString;
    EditMode.cbColorMode.ColorValue := HexToColor(qryModes.FieldByName('MODE_BACKGROUND_COLOR').asString);
    if EditMode.ShowModal = mrOk then
    begin
      qryModes.Edit;
      qryModes.FieldByName('MODE_TITLE').asString := EditMode.leModeTitle.Text;
      qryModes.FieldByName('MODE_DEFAULT_REPORT').asString := EditMode.leModeDefaultReport.Text;
      qryModes.FieldByName('MODE_BACKGROUND_COLOR').asString := ColorToHex(EditMode.cbColorMode.ColorValue);
      qryModes.Post;
      bRebootNeeded := True;
    end;
  finally
    EditMode.Free;
  end;
end;

procedure TOptions.aPluginEditExecute(Sender: TObject);
begin
  Application.CreateForm(TEditPlugin, EditPlugin);
  MainWindow.Translator.TranslateWindow(EditPlugin.Name, EditPlugin);
  EditPlugin.Caption := aPluginEdit.Caption;
  EditPlugin.GetPlugins(True);
  EditPlugin.cbPlugins.ItemIndex :=  EditPlugin.cbPlugins.Items.IndexOf(cdsPlugins.FieldByName('PLUGIN_CAPTION').asString);
  EditPlugin.cbPlugins.Enabled := False;
  EditPlugin.cbPlugins.OnClick(EditPlugin.cbPlugins);
  EditPlugin.cbScript.ItemIndex := EditPlugin.cbScript.Items.IndexOf(cdsPlugins.FieldByName('PLUGIN_SCRIPT').asString);
  if EditPlugin.ShowModal = mrOk then
  begin
    try
      cdsPlugins.Edit;
{      cdsPlugins.FieldByName('PLUGIN_CAPTION').asString := EditPlugin.cbPlugins.Text;
      cdsPlugins.FieldByName('PLUGIN_NAME').asString := EditPlugin.PluginName;}
      cdsPlugins.FieldByName('PLUGIN_SCRIPT').asString := EditPlugin.cbScript.Text;
      cdsPlugins.Post;
      bRebootNeeded := True;
    finally
    end;
  end;
  EditPlugin.Free;
end;

procedure TOptions.aShortCutEditExecute(Sender: TObject);
var
  Action: TAction;
begin
  Application.CreateForm(TEditShortCut, EditShortCut);
  MainWindow.Translator.TranslateWindow(EditShortCut.Name, EditShortCut);
  try
    EditShortCut.lbActionCaption.Caption := mdsHotKeys.FieldByName('ACTION_CAPTION').asString;
    EditShortCut.edShortCut.HotKey := TextToShortCut(mdsHotKeys.FieldByName('ACTION_SHORTCUT').asString);
  except
  end;
  if EditShortCut.ShowModal = mrOk then
  begin
    Action := FindActionByName(mdsHotKeys.FieldByName('ACTION_NAME').asString);
    if Action <> nil then
    begin
      mdsHotKeys.DisableControls;
      dbgHotKey.SaveBookmark;
      try
        mdsHotKeys.First;
        if (EditShortCut.edShortCut.HotKey <> 0) and mdsHotKeys.TreeList.Locate('ACTION_SHORTCUT', ShortCutToText(EditShortCut.edShortCut.HotKey), []) then
          MessageBox(Application.Handle, PWideChar(msgHotKeyAssigned.Caption + ' ' + mdsHotKeys.FieldByName('ACTION_CAPTION').asString), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR)
        else
        begin
          dbgHotKey.RestoreBookmark;
          try
            mdsHotKeys.Edit;
            mdsHotKeys.FieldByName('ACTION_SHORTCUT').asString := ShortCutToText(EditShortCut.edShortCut.HotKey);
            mdsHotKeys.Post;
            mdsHotKeys.Refresh;
            Action.ShortCut := EditShortCut.edShortCut.HotKey;
          except
          end;
        end;
      finally
        dbgHotKey.RestoreBookmark;
        mdsHotKeys.EnableControls;
      end;
    end;
  end;
  EditShortCut.Free;
end;

procedure TOptions.aShortCutEditUpdate(Sender: TObject);
begin
  aShortCutEdit.Enabled := mdsHotKeys.FieldByName('ACTION_WINDOW_PARENT').asString <> '-1';
end;

procedure TOptions.aPluginUpExecute(Sender: TObject);
var
  OldSortOrder: Integer;
begin
  cdsPlugins.DisableControls;
  try
    OldSortOrder := cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger;
    if OldSortOrder > 1 then
    begin
      bRebootNeeded := True;
      cdsPlugins.First;
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', OldSortOrder - 1, []);

      cdsPlugins.Edit;
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := -1;
      cdsPlugins.Post;

      cdsPlugins.First;
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', OldSortOrder, []);

      cdsPlugins.Edit;
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := OldSortOrder - 1;
      cdsPlugins.Post;

      cdsPlugins.First;
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', -1, []);

      cdsPlugins.Edit;
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := OldSortOrder;
      cdsPlugins.Post;
      cdsPlugins.SortOnFields('PLUGIN_SORT_ORDER', False, False);
      cdsPlugins.Locate('PLUGIN_SORT_ORDER', OldSortOrder - 1, []);
    end;
  finally
    cdsPlugins.EnableControls;
  end;

end;

procedure TOptions.btnCancelClick(Sender: TObject);
begin
  if dmMain.qryStations.State in [dsInsert, dsEdit] then
    dmMain.dsStations.DataSet.Cancel;
  // FormStorage.RestoreFormPlacement;
  // MainWindow.Plugins.RestoreSettings;
end;

procedure TOptions.btnOkClick(Sender: TObject);
var
  slPlugins, slColors, slColorsStatistics, slBands: TStringList;
  BookMark: TBookMark;
begin
  if bRebootNeeded then
  begin
    bRebootNeeded := False;
    Application.MessageBox(PWideChar(Options.msgRebootWarning.Caption), PWideChar(Options.msgInformation.Caption), MB_OK or MB_ICONINFORMATION);
  end;

  Screen.Cursor := crHourGlass;

  CheckQSLServicesActive;

  try
    slPlugins := TStringList.Create;
    cdsPlugins.DisableControls;
    BookMark := cdsPlugins.GetBookmark;
    try
      cdsPlugins.First;
      while not cdsPlugins.Eof do
      begin
        slPlugins.Add(cdsPlugins.FieldByName('PLUGIN_NAME').asString + '|' + cdsPlugins.FieldByName('PLUGIN_SCRIPT').asString + '|' + IntToStr(cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger));
        cdsPlugins.Next;
      end;
      FormStorage.AppStorage.WriteStringList('Options\Plugins', slPlugins);
    finally
      cdsPlugins.GotoBookmark(BookMark);
      cdsPlugins.FreeBookmark(BookMark);
      cdsPlugins.EnableControls;
      slPlugins.Free;
    end;

    slColors := TStringList.Create;
    try
      cdsColors.First;
      while not cdsColors.Eof do
      begin
        slColors.Add(IntToStr(cdsColors.FieldByName('COLOR_BACKGROUND').AsInteger) + '|' + IntToStr(cdsColors.FieldByName('COLOR_FOREGROUND').AsInteger) + '|' + IntToStr(cdsColors.FieldByName('FONT_BOLD').AsInteger) + '|' + IntToStr
            (cdsColors.FieldByName('FONT_ITALIC').AsInteger) + '|' + IntToStr(cdsColors.FieldByName('FONT_UNDERLINE').AsInteger));
        cdsColors.Next;
      end;
      FormStorage.AppStorage.WriteStringList('Options\GridColors', slColors);
    finally
      slColors.Free;
    end;

    slColorsStatistics := TStringList.Create;
    try
      cdsColorsStatistics.First;
      while not cdsColorsStatistics.Eof do
      begin
        slColorsStatistics.Add(IntToStr(cdsColorsStatistics.FieldByName('COLOR_BACKGROUND').AsInteger) + '|' + IntToStr(cdsColorsStatistics.FieldByName('COLOR_FOREGROUND').AsInteger));
        cdsColorsStatistics.Next;
      end;
      FormStorage.AppStorage.WriteStringList('Options\GridColorsStatistics', slColorsStatistics);
    finally
      slColorsStatistics.Free;
    end;


    SaveHotKeys;


    slBands := TStringList.Create;
    qryBands.DisableControls;
    BookMark := qryBands.GetBookmark;
    try
      qryBands.First;
      while not qryBands.Eof do
      begin
        slBands.Add(FloatToStr(SimpleRoundTo(qryBands.FieldByName('BAND_MHZ').asFloat,-3)) + '|' + qryBands.FieldByName('BAND_ACTIVE').AsString);
        qryBands.Next;
      end;
      FormStorage.AppStorage.WriteStringList('Options\ActiveBands', slBands);
    finally
      qryBands.GotoBookmark(BookMark);
      qryBands.FreeBookmark(BookMark);
      qryBands.EnableControls;
      slBands.Free;
    end;


    { FormStorageOnExit.StoredValue['StationId'] := dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
      FormStorageOnExit.SaveFormPlacement; }
    FormStorage.SaveFormPlacement;
    MainWindow.Plugins.SaveSettings;
    MainWindow.timCallComplete.Interval := seTimeCallSecondaryData.Value;
    if dmMain.qryLogEdit.State in [dsInsert, dsEdit] then
    begin
      dmMain.qryLogEdit.FieldByName('LOG_MY_NAME').asString := dmMain.qryStations.FieldByName('STATION_NAME').asString;
      dmMain.qryLogEdit.FieldByName('LOG_MY_POSTAL_CODE').asString := dmMain.qryStations.FieldByName('STATION_POSTAL_CODE').asString;
      dmMain.qryLogEdit.FieldByName('LOG_MY_COUNTRY').asString := dmMain.qryStations.FieldByName('STATION_COUNTRY').asString;
      dmMain.qryLogEdit.FieldByName('LOG_MY_CITY').asString := dmMain.qryStations.FieldByName('STATION_CITY').asString;
      dmMain.qryLogEdit.FieldByName('LOG_MY_STREET').asString := dmMain.qryStations.FieldByName('STATION_STREET').asString;
      dmMain.qryLogEdit.FieldByName('LOG_MY_GRIDSQUARE').asString := dmMain.qryStations.FieldByName('STATION_GRIDSQUARE').asString;
      dmMain.qryLogEdit.FieldByName('LOG_MY_LAT').asFloat := dmMain.qryStations.FieldByName('STATION_LAT').asFloat;
      dmMain.qryLogEdit.FieldByName('LOG_MY_LON').asFloat := dmMain.qryStations.FieldByName('STATION_LON').asFloat;
    end;
    MainWindow.ChangeFont;

  if Trim(deCallInfoDirectory.Text) <> '' then
  begin
    MainWindow.CallDescList.Clear;
    MainWindow.CallDescList.LoadFiles(GetAbsolutePathFromOptions(deCallInfoDirectory.Text));
  end;


    MainWindow.Plugins.CoreCommand(CC_OPTIONS_CHANGED, nil, 0, 0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TOptions.Button1Click(Sender: TObject);
begin
  // FontDialog1.Execute;
end;

procedure TOptions.cbColorBackground1Click(Sender: TObject);
begin
  SetColorParams;
end;

procedure TOptions.cbColorBackgroundChange(Sender: TObject);
begin
  SetColorParams;
end;

procedure TOptions.cbColorForegroundClick(Sender: TObject);
begin
  SetColorParams;
end;

procedure TOptions.cbColorStatisticsBackgroundChange(Sender: TObject);
begin
  SetColorStatisticsParams;
end;

procedure TOptions.cbColorStatisticsForegroundChange(Sender: TObject);
begin
  SetColorStatisticsParams;
end;

procedure TOptions.cbFontBoldClick(Sender: TObject);
begin
  SetColorParams;
end;

procedure TOptions.cbFontItalicClick(Sender: TObject);
begin
  SetColorParams;
end;

procedure TOptions.cbFontUnderlineClick(Sender: TObject);
begin
  SetColorParams;
end;

procedure TOptions.cbColorForegroundChange(Sender: TObject);
begin
  SetColorParams;
end;

procedure TOptions.cbGeneralGridColorClick(Sender: TObject);
begin
  GetColorParams;
end;

procedure TOptions.cbGeneralGridColorStatisticsClick(Sender: TObject);
begin
  GetColorStatisticsParams;
end;

procedure TOptions.dbeGridSquareChange(Sender: TObject);
var
  c: TCoordinate;
begin
  { if dmMain.qryStations.State in [dsInsert,dsEdit] then
    begin
    if Trim(dbeGridSquare.Text)<>'' then
    begin
    c:=GridToCoordinate(dbeGridSquare.Text);
    dmMain.qryStations.FieldByName('STATION_LAT').AsFloat:=c.Lat;
    dmMain.qryStations.FieldByName('STATION_LON').AsFloat:=c.Lon;
    end
    else
    begin
    dmMain.qryStations.FieldByName('STATION_LAT').AsFloat:=0;
    dmMain.qryStations.FieldByName('STATION_LON').AsFloat:=0;
    end;
    end; }
end;

procedure TOptions.dbeGridSquareKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) >= 97) and (Ord(Key) <= 122) then
    Key := Chr(Ord(Key) - 32);
end;

procedure TOptions.dbgHotKeyDblClick(Sender: TObject);
begin
  if aShortCutEdit.Enabled then
    aShortCutEdit.OnExecute(Self);
end;

procedure TOptions.dbgHotKeyGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['ACTION_WINDOW_PARENT'] = '-1') then
    Background := cl3Dlight;
  // AFont.Style := [fsBold];
end;

procedure TOptions.dbgManagePluginsDblClick(Sender: TObject);
begin
  aPluginEditExecute(Self);
end;

procedure TOptions.dbgModesCellClick(Column: TColumnEh);
begin
  if Column.FieldName = 'MODE_ACTIVE' then
  begin
    bRebootNeeded := True;
    qryModes.Edit;
    if qryModes.FieldByName('MODE_ACTIVE').AsInteger = 0 then
      qryModes.FieldByName('MODE_ACTIVE').AsInteger := 1
    else
      qryModes.FieldByName('MODE_ACTIVE').AsInteger := 0;
    qryModes.Post;
  end;
end;

procedure TOptions.dbgModesDblClick(Sender: TObject);
begin
  aModeEditExecute(Self);
end;

procedure TOptions.dbgModesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if Column.FieldName = 'MODE_BACKGROUND_COLOR' then
  begin
    // TDBGridEh(Sender).Canvas.Brush.Style := bsSolid;
    TDBGridEh(Sender).Canvas.Brush.Color := HexToColor(TDBGridEh(Sender).DataSource.DataSet.FieldByName('MODE_BACKGROUND_COLOR').asString);
    TDBGridEh(Sender).Canvas.Font.Color := TDBGridEh(Sender).Canvas.Brush.Color;
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TOptions.dbgBandGridDblClick(Sender: TObject);
begin
  aBandGridEditExecute(Self);
end;

procedure TOptions.dbgBandsCellClick(Column: TColumnEh);
begin
  if Column.FieldName = 'BAND_ACTIVE' then
  begin
    bRebootNeeded := True;
    qryBands.Edit;
    if qryBands.FieldByName('BAND_ACTIVE').AsInteger = 0 then
      qryBands.FieldByName('BAND_ACTIVE').AsInteger := 1
    else
      qryBands.FieldByName('BAND_ACTIVE').AsInteger := 0;
    qryBands.Post;
    bRebootNeeded := True;
  end;
end;

procedure TOptions.dbgStationsDblClick(Sender: TObject);
begin
  aBookEditExecute(Self);
end;

procedure TOptions.dbgStationsGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['IS_GROUP'] = '1') then
    Background := cl3Dlight;
end;

procedure TOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LoadHotKeys;
  dmMain.qryStations.DisableControls;
  dmMain.qryStations.First;
  dmMain.qryStations.Locate('STATION_ID', MainWindow.CurrentStationId, []);
  dmMain.qryStations.EnableControls;
  qryBands.Close;
  qryModes.Close;
  qryBandGrid.Close;


  MainWindow.BuildBooksMenu;

  MainWindow.sbMain.Update;
  MainWindow.sbMain.Repaint;
end;




procedure TOptions.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dmMain.qryStations.State in [dsInsert, dsEdit] then
    dmMain.dsStations.DataSet.Cancel;

  {if (ModalResult = mrOk) and (Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) = '') then
  begin
    Application.MessageBox(PWideChar(Options.msgFieldCallNotNull.Caption), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONWARNING);
    CanClose := False;
    exit;
  end;
   }
  if MainWindow.GetBookCount = 0 then
  begin
    if Application.MessageBox(PWideChar(Options.msgExitOptions.Caption), PWideChar(Options.msgInformation.Caption), MB_YESNO or MB_ICONWARNING) = IDYES then
      MainWindow.Close
    else
    begin
      CanClose := False;
      exit;
    end;
  end;

  FormStorage.RestoreFormPlacement;
  MainWindow.Plugins.RestoreSettings;
  dmMain.qryStations.DisableControls;
  dmMain.qryStations.First;
  dmMain.qryStations.Locate('STATION_ID', OldStationID, []);
  dmMain.qryStations.EnableControls;
  // dbgStations.Save;

end;

procedure TOptions.FormCreate(Sender: TObject);
begin
  CheckQSLServicesActive;
end;

procedure TOptions.FormShow(Sender: TObject);
begin
  RefreshmdsStations(MainWindow.CurrentStationId);
  // GetActions;

  qryBands.Open;
  qryBands.SortedBy.Add('BAND_MHZ');
  qryBands.Sort;
  qryModes.Open;
  qryModes.SortedBy.Add('MODE_NAME');
  qryModes.Sort;

  qryBandGrid.Open;
  qryBandGrid.SortedBy.Text := 'BANDGRID_FREQ_BEGIN';
  qryBandGrid.Sort;

  OldStationID := dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
  ptvOptions.Items[0].Expand(True);
  ptvOptions.Items[6].Expand(True);
  dmMain.qryStations.Refresh;
  cdsPlugins.Open;
  cdsPlugins.SortOnFields('PLUGIN_SORT_ORDER', False, False);
  ptvOptions.Items.Item[NodeSelectIndex].Selected := True;
  ptvOptions.SetFocus;

  cbGeneralGridColor.Items.Clear;
  cbGeneralGridColor.Items.Add(lbColorQSLSent.Caption);
  cbGeneralGridColor.Items.Add(lbColorQSLQueue.Caption);
  cbGeneralGridColor.Items.Add(lbColorQSLIgnore.Caption);
  cbGeneralGridColor.Items.Add(lbColorQSLValidate.Caption);
  cbGeneralGridColor.Items.Add(lbColorQSLRcvd.Caption);
  cbGeneralGridColor.Items.Add(lbColorEQSLRcvd.Caption);
  cbGeneralGridColor.ItemIndex := 0;
  GetColorParams;


  cbGeneralGridColorStatistics.Items.Clear;
  cbGeneralGridColorStatistics.Items.Add(lbColorStatisticsNotWorked.Caption);
  cbGeneralGridColorStatistics.Items.Add(lbColorStatisticsWorked.Caption);
  cbGeneralGridColorStatistics.Items.Add(lbColorStatisticsSended.Caption);
  cbGeneralGridColorStatistics.Items.Add(lbColorStatisticsConfirmed.Caption);
  cbGeneralGridColorStatistics.ItemIndex := 0;
  GetColorStatisticsParams;

  TranslatePluginName;
  { cdsHotKeys.First;
    cdsHotKeys.EnableControls; }
  PostMessage(Self.Handle, WM_AFTER_O_SHOW, 0, 0);
end;

procedure TOptions.FormStorageAfterRestorePlacement(Sender: TObject);
var
  i: Integer;
  iPosD: Integer;
  slPlugins: TStringList;
  slPluginLine: TStringList;
  slHotKeys: TStringList;
  slHotKeyLine: TStringList;
  slColors: TStringList;
  slColorLine: TStringList;
  slColorsStatistics: TStringList;
  slColorStatisticsLine: TStringList;
  slBands : TStringList;
  slBandLine: TStringList;
begin

  { cdsHotKeys.DisableControls;
    cdsHotKeys.Open;
    cdsHotKeys.EmptyTable;
    slHotKeys := TStringList.Create;
    slHotKeyLine := TStringList.Create;
    slHotKeyLine.Delimiter := '|';
    try
    FormStorage.AppStorage.ReadStringList('Options\HotKeys', slHotKeys);
    for i := 0 to slHotKeys.Count - 1 do
    begin
    slHotKeyLine.DelimitedText := slHotKeys.Strings[i];
    cdsHotKeys.Append;
    cdsHotKeys.FieldByName('ACTION_NAME').asString := slHotKeyLine.Strings[0];
    cdsHotKeys.FieldByName('ACTION_SHORTCUT').asString := slHotKeyLine.Strings[1];
    cdsHotKeys.FieldByName('ACTION_FOUND').AsInteger := 0;
    cdsHotKeys.Post;
    end;
    finally
    cdsHotKeys.First;
    cdsHotKeys.EnableControls;
    slHotKeyLine.Free;
    slHotKeys.Free;
    end; }

  cdsPlugins.DisableControls;
  cdsPlugins.Open;
  cdsPlugins.EmptyTable;
  slPlugins := TStringList.Create;
  slPluginLine := TStringList.Create;
  slPluginLine.Delimiter := '|';

  try
    FormStorage.AppStorage.ReadStringList('Options\Plugins', slPlugins);
    for i := 0 to slPlugins.Count - 1 do
    begin
      slPluginLine.DelimitedText := slPlugins.Strings[i];
      cdsPlugins.Append;
      cdsPlugins.FieldByName('PLUGIN_NAME').asString := slPluginLine.Strings[0];
      // cdsPlugins.FieldByName('PLUGIN_CAPTION').asString := MainWindow.Plugins.PluginByName(slPluginLine.Strings[0]).PluginForm.Caption;
      cdsPlugins.FieldByName('PLUGIN_SCRIPT').asString := slPluginLine.Strings[1];
      cdsPlugins.FieldByName('PLUGIN_SORT_ORDER').AsInteger := StrToInt(slPluginLine.Strings[2]);
      cdsPlugins.Post;
    end;
  finally
    cdsPlugins.First;
    cdsPlugins.EnableControls;
    slPluginLine.Free;
    slPlugins.Free;
  end;

  cdsColors.EmptyTable;
  slColors := TStringList.Create;
  slColorLine := TStringList.Create;
  slColorLine.Delimiter := '|';
  try
    FormStorage.AppStorage.ReadStringList('Options\GridColors', slColors);
    for i := 0 to slColors.Count - 1 do
    begin
      slColorLine.DelimitedText := slColors.Strings[i];
      cdsColors.Append;
      cdsColors.FieldByName('ITEM_INDEX').AsInteger := i;
      cdsColors.FieldByName('COLOR_BACKGROUND').AsInteger := StrToInt2(slColorLine.Strings[0]);
      cdsColors.FieldByName('COLOR_FOREGROUND').AsInteger := StrToInt2(slColorLine.Strings[1]);
      cdsColors.FieldByName('FONT_BOLD').AsInteger := StrToInt2(slColorLine.Strings[2]);
      cdsColors.FieldByName('FONT_ITALIC').AsInteger := StrToInt2(slColorLine.Strings[3]);
      cdsColors.FieldByName('FONT_UNDERLINE').AsInteger := StrToInt2(slColorLine.Strings[4]);
      cdsColors.Post;
    end;
  finally
    slColors.Free;
    slColorLine.Free;
  end;


  cdsColorsStatistics.EmptyTable;
  slColorsStatistics := TStringList.Create;
  slColorStatisticsLine := TStringList.Create;
  slColorStatisticsLine.Delimiter := '|';
  try
    FormStorage.AppStorage.ReadStringList('Options\GridColorsStatistics', slColorsStatistics);
    for i := 0 to slColorsStatistics.Count - 1 do
    begin
      slColorStatisticsLine.DelimitedText := slColorsStatistics.Strings[i];
      cdsColorsStatistics.Append;
      cdsColorsStatistics.FieldByName('ITEM_INDEX').AsInteger := i;
      cdsColorsStatistics.FieldByName('COLOR_BACKGROUND').AsInteger := StrToInt2(slColorStatisticsLine.Strings[0]);
      cdsColorsStatistics.FieldByName('COLOR_FOREGROUND').AsInteger := StrToInt2(slColorStatisticsLine.Strings[1]);
      cdsColorsStatistics.Post;
    end;
  finally
    slColorsStatistics.Free;
    slColorStatisticsLine.Free;
  end;


{
  slBands := TStringList.Create;
  slBandLine := TStringList.Create;
  slBandLine.Delimiter := '|';

  qryBands.DisableControls;
  try
    FormStorage.AppStorage.ReadStringList('Options\ActiveBands', slBands);
    for i := 0 to slBands.Count - 1 do
    begin
      slBandLine.DelimitedText := slBands.Strings[i];
      if qryBands.Locate('BAND_MHZ',slPluginLine.Strings[0],[]) then
      begin
        qryBands.Edit;
        if slPluginLine.Strings[1]='1' then
          qryBands.FieldByName('BAND_ACTIVE').AsInteger:=1
         else
          qryBands.FieldByName('BAND_ACTIVE').AsInteger:=0;
        qryBands.Post;
      end;
    end;
  finally
    qryBands.First;
    qryBands.EnableControls;
    slBandLine.Free;
    slBands.Free;
  end;
    }
end;

procedure TOptions.FormStorageOnExitAfterRestorePlacement(Sender: TObject);
procedure RestoreFontColor(Grid:TDBGridEh);
begin
    Grid.Font.Name:=MainWindow.AppStorage.ReadString('Options\'+Grid.Name+'.FontName');
    if MainWindow.AppStorage.ReadInteger('Options\'+Grid.Name+'.FontSize')<>0 then
      Grid.Font.Size:=MainWindow.AppStorage.ReadInteger('Options\'+Grid.Name+'.FontSize');
    if MainWindow.AppStorage.ReadString('Options\'+Grid.Name+'.FontColor')<>'' then
       Grid.Font.Color:=MainWindow.AppStorage.ReadInteger('Options\'+Grid.Name+'.FontColor')
    else
       Grid.Font.Color:=clWindowText;
    Grid.Font.Style:=IntToFontStyle(MainWindow.AppStorage.ReadInteger('Options\'+Grid.Name+'.FontStyle'));
    Grid.DrawGraphicData:=MainWindow.AppStorage.ReadBoolean('Options\'+Grid.Name+'.UseCustomColorFont',False);
    if Grid.DrawGraphicData then
     begin
      if MainWindow.AppStorage.ReadString('Options\'+Grid.Name+'.BackgroundColor')<>'' then
        Grid.Color:=MainWindow.AppStorage.ReadInteger('Options\'+Grid.Name+'.BackgroundColor');
     end;

end;
begin
  dbgManagePlugins.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorageOnExit.AppStorage).FileName, 'Options', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh,
    crpDropDownWidthEh, crpRowPanelColPlacementEh]);
  RestoreFontColor(dbgManagePlugins);

  dbgStations.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorageOnExit.AppStorage).FileName, 'Options', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh,
    crpRowPanelColPlacementEh]);
  RestoreFontColor(dbgStations);

  dbgHotKey.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorageOnExit.AppStorage).FileName, 'Options', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh,
    crpRowPanelColPlacementEh]);
  RestoreFontColor(dbgHotKey);

  dbgBands.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorageOnExit.AppStorage).FileName, 'Options', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh,
    crpRowPanelColPlacementEh]);
  RestoreFontColor(dbgBands);

  dbgModes.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorageOnExit.AppStorage).FileName, 'Options', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh,
    crpRowPanelColPlacementEh]);
  RestoreFontColor(dbgModes);

  dbgBandGrid.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorageOnExit.AppStorage).FileName, 'Options', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh,
    crpRowPanelColPlacementEh]);
  RestoreFontColor(dbgBandGrid);

end;

procedure TOptions.FormStorageOnExitAfterSavePlacement(Sender: TObject);
var
  S: string;
  i: Integer;
begin
  SaveGrid(dbgManagePlugins);
  SaveGrid(dbgStations);
  SaveGrid(dbgHotKey);
  SaveGrid(dbgBands);
  SaveGrid(dbgModes);
  SaveGrid(dbgBandGrid);
end;
{ with dbgManagePlugins.Columns do
  begin
  for I := 0 to Count - 1 do
  begin
  S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[I].Index, Items[I].Width, integer(Items[I].Title.SortMarker), integer(Items[I].Visible), Items[I].Title.SortIndex, Items[I].DropDownRows, Items[I].DropDownWidth, Items[I].InRowLinePos, Items[I].InRowLineHeight]);
  if S <> '' then
  begin
  if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
  S := '"' + S + '"';
  end;
  FormStorageOnExit.WriteString('dbgManagePlugins.' + Items[I].FieldName, S);
  end;
  end;

  with dbgStations.Columns do
  begin
  for I := 0 to Count - 1 do
  begin
  S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[I].Index, Items[I].Width, integer(Items[I].Title.SortMarker), integer(Items[I].Visible), Items[I].Title.SortIndex, Items[I].DropDownRows, Items[I].DropDownWidth, Items[I].InRowLinePos, Items[I].InRowLineHeight]);
  if S <> '' then
  begin
  if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
  S := '"' + S + '"';
  end;
  FormStorageOnExit.WriteString('dbgStations.' + Items[I].FieldName, S);
  end;
  end;

  with dbgHotKey.Columns do
  begin
  for I := 0 to Count - 1 do
  begin
  S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[I].Index, Items[I].Width, integer(Items[I].Title.SortMarker), integer(Items[I].Visible), Items[I].Title.SortIndex, Items[I].DropDownRows, Items[I].DropDownWidth, Items[I].InRowLinePos, Items[I].InRowLineHeight]);
  if S <> '' then
  begin
  if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
  S := '"' + S + '"';
  end;
  FormStorageOnExit.WriteString('dbgHotKey.' + Items[I].FieldName, S);
  end;
  end;
  end; }

procedure TOptions.RegisterPluginsSettings;
var
  i: Integer;
  sp: TJvStandardPage;
  tn: TJvPageIndexNode;
begin
  for i := 0 to MainWindow.Plugins.Items.Count - 1 do
  begin
    if Assigned(TPlugin(MainWindow.Plugins.Items[i]).SettingsFrame) then
    begin
      tn := TJvPageIndexNode.Create(ptvOptions.Items);
      tn := TJvPageIndexNode(ptvOptions.Items.AddChildFirst(TJvPageIndexNode(ptvOptions.Items.Item[6]), TPlugin(MainWindow.Plugins.Items[i]).Name));
      sp := TJvStandardPage.Create(Self);
      sp.PageList := plSettings;
      TPlugin(MainWindow.Plugins.Items[i]).SettingsFrame.Parent := sp;
      TPlugin(MainWindow.Plugins.Items[i]).SettingsFrame.Align:=alClient;
      tn.PageIndex := sp.PageList.Pages[sp.PageList.PageCount - 1].PageIndex;
      MainWindow.Translator.TranslateWindow('Options', TPlugin(MainWindow.Plugins.Items[i]).SettingsFrame);
    end;
  end;
end;

procedure TOptions.UnRegisterPluginsSettings;
var
  i: Integer;
  page: TJvPageIndexNode;
begin
  while ptvOptions.Items.Item[6].Count > 0 do
  begin
    { page:=TJvPageIndexNode(ptvOptions.Items.Item[5].Item[0]);
      page.Free; }
    ptvOptions.Items.Item[6].Item[0].Free;
  end;
end;

procedure TOptions.pgHotKeysShow(Sender: TObject);
begin
  mdsHotKeys.First;
  mdsHotKeys.EnableControls;
end;

procedure TOptions.ptvOptionsChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  AllowChange := Node.Parent <> nil;
end;

procedure TOptions.WmAfterShow(var Msg: TMessage);
begin
  if MainWindow.GetBookCount=0 then
    aBookAdd.Execute;
end;

procedure TOptions.GetActions;
var
  ParentWindow: string;

  procedure FindActions(Sender: TComponent);
  var
    i: Integer;
  begin
    if Sender is TForm then
    begin
      if TForm(Sender).Name='' then exit;

      if ParentWindow <> TForm(Sender).Caption then
      begin
        mdsHotKeys.Last;
        if mdsHotKeys.FieldByName('ACTION_WINDOW_PARENT').asString = '-1' then
          mdsHotKeys.Delete;
      end;

      ParentWindow := TForm(Sender).Caption;
      mdsHotKeys.Append;
      mdsHotKeys.FieldByName('ACTION_CAPTION').asString := ParentWindow;
      mdsHotKeys.FieldByName('ACTION_WINDOW').asString := ParentWindow;
      mdsHotKeys.FieldByName('ACTION_WINDOW_PARENT').asString := '-1';
      mdsHotKeys.Post;
    end;

    for i := 0 to Sender.ComponentCount - 1 do
    begin
      if TAction(Sender.Components[i]).Tag < -1 then
        Continue;

      if Sender.Components[i].ComponentCount > 0 then
        FindActions(Sender.Components[i]);

      mdsHotKeys.First;
      if (Sender.Components[i] is TAction) then
      begin
        if not TAction(Sender.Components[i]).Visible then
          Continue;
        if TAction(Sender.Components[i]).ActionList.Name = 'alOptions' then
          Continue;
        if (not mdsHotKeys.Locate('ACTION_NAME', TAction(Sender.Components[i]).Name, [])) then
        begin
          mdsHotKeys.Append;
          mdsHotKeys.FieldByName('ACTION_NAME').asString := TAction(Sender.Components[i]).Name;
          mdsHotKeys.FieldByName('ACTION_CAPTION').asString := TAction(Sender.Components[i]).Caption;
          mdsHotKeys.FieldByName('ACTION_SHORTCUT').asString := ShortCutToText(TAction(Sender.Components[i]).ShortCut);
          mdsHotKeys.FieldByName('ACTION_FOUND').AsInteger := 1;
          mdsHotKeys.FieldByName('ACTION_WINDOW_PARENT').asString := ParentWindow;
          mdsHotKeys.FieldByName('ACTION_POINTER').AsInteger := Integer(Pointer(TAction(Sender.Components[i])));
          mdsHotKeys.Post;
        end
        else
          try
            mdsHotKeys.Edit;
            mdsHotKeys.FieldByName('ACTION_CAPTION').asString := TAction(Sender.Components[i]).Caption;
            mdsHotKeys.FieldByName('ACTION_FOUND').AsInteger := 1;
            mdsHotKeys.FieldByName('ACTION_POINTER').AsInteger := Integer(Pointer(TAction(Sender.Components[i])));
            mdsHotKeys.Post;
            TAction(Sender.Components[i]).ShortCut := TextToShortCut(mdsHotKeys.FieldByName('ACTION_SHORTCUT').asString);
          except
          end;
      end;
    end;
  end;

begin
  mdsHotKeys.Open;
  mdsHotKeys.EmptyTable;
  FindActions(Application);
  mdsHotKeys.First;
  mdsHotKeys.SortByFields('ACTION_CAPTION');

  { mdsHotKeys.DisableControls;
    // cdsHotKeys.EmptyTable;
    FindActions(Application);
    mdsHotKeys.First;
    while not mdsHotKeys.Eof do
    begin
    if (mdsHotKeys.FieldByName('ACTION_FOUND').AsInteger = 0) and (mdsHotKeys.FieldByName('ACTION_WINDOW_PARENT').asString<>'-1') then
    mdsHotKeys.Delete
    else
    mdsHotKeys.Next;
    end;

    SaveHotKeys;
    FormStorage.AppStorage.Reload;

    //  mdsHotKeys.SortByFields('ACTION_CAPTION');
    mdsHotKeys.First;
    mdsHotKeys.EnableControls; }

  // ------------------------------------------------------------------
  { cdsHotKeys.DisableControls;
    // cdsHotKeys.EmptyTable;
    FindActions(Application);
    cdsHotKeys.First;
    while not cdsHotKeys.Eof do
    begin
    if cdsHotKeys.FieldByName('ACTION_FOUND').AsInteger = 0 then
    cdsHotKeys.Delete
    else
    cdsHotKeys.Next;
    end;

    SaveHotKeys;
    FormStorage.AppStorage.Reload;

    cdsHotKeys.SortOnFields('ACTION_CAPTION', False, False);
    cdsHotKeys.First;
    cdsHotKeys.EnableControls; }
end;

function TOptions.FindActionByName(ActionName: string): TAction;
  procedure FindActions(Sender: TComponent);
  var
    i: Integer;
  begin
    for i := 0 to Sender.ComponentCount - 1 do
    begin
      if Sender.Components[i].ComponentCount > 0 then
        FindActions(Sender.Components[i]);
      if (Sender.Components[i] is TAction) then
        if TAction(Sender.Components[i]).Name = ActionName then
        begin
          result := TAction(Sender.Components[i]);
          exit;
        end;
    end;
  end;

begin
  result := nil;
  FindActions(Application);
end;

procedure TOptions.RemoveSectionFromIni;
var
  Ini: TIniFile;
  slSections: TStringList;
  i, iPosForm, iPosSettings: Integer;
  PluginName: string;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorage.AppStorage).FileName);
  slSections := TStringList.Create;
  cdsPlugins.DisableControls;
  try
    Ini.ReadSections(slSections);
    for i := 0 to slSections.Count - 1 do
    begin
      PluginName := '';
      iPosForm := Pos('Form', slSections.Strings[i]);
      iPosSettings := Pos('SettingsFrame', slSections.Strings[i]);
      if iPosForm > 0 then
        PluginName := Copy(slSections.Strings[i], 1, iPosForm - 1);
      if iPosSettings > 0 then
        PluginName := Copy(slSections.Strings[i], 1, iPosSettings - 1);
      if PluginName <> '' then
      begin
        cdsPlugins.First;
        if not cdsPlugins.Locate('PLUGIN_NAME', PluginName, []) then
          Ini.EraseSection(slSections.Strings[i]);
      end;
    end;
  finally
    cdsPlugins.EnableControls;
    slSections.Free;
    Ini.Free;
  end;

end;

procedure TOptions.SaveHotKeys;
var
  slHotKey: TStringList;
  BookMark: TBookMark;
begin
  slHotKey := TStringList.Create;
  mdsHotKeys.DisableControls;
  BookMark := mdsHotKeys.GetBookmark;
  try
    mdsHotKeys.First;
    while not mdsHotKeys.Eof do
    begin
      if mdsHotKeys.FieldByName('ACTION_NAME').asString <> '' then
        slHotKey.Add(mdsHotKeys.FieldByName('ACTION_NAME').asString + '|' + mdsHotKeys.FieldByName('ACTION_SHORTCUT').asString);
      mdsHotKeys.Next;
    end;
    FormStorage.AppStorage.WriteStringList('Options\HotKeys', slHotKey);
  finally
    mdsHotKeys.GotoBookmark(BookMark);
    mdsHotKeys.FreeBookmark(BookMark);
    mdsHotKeys.EnableControls;
    slHotKey.Free;
  end;

  { slHotKey := TStringList.Create;
    cdsHotKeys.DisableControls;
    BookMark := cdsHotKeys.GetBookmark;
    try
    cdsHotKeys.First;
    while not cdsHotKeys.Eof do
    begin
    slHotKey.Add(cdsHotKeys.FieldByName('ACTION_NAME').asString + '|' + cdsHotKeys.FieldByName('ACTION_SHORTCUT').asString);
    cdsHotKeys.Next;
    end;
    FormStorage.AppStorage.WriteStringList('Options\HotKeys', slHotKey);
    finally
    cdsHotKeys.GotoBookmark(BookMark);
    cdsHotKeys.FreeBookmark(BookMark);
    cdsHotKeys.EnableControls;
    slHotKey.Free;
    end; }
end;

procedure TOptions.SetColorParams;
begin
  if bDontChangeColor then exit;
  cdsColors.First;
  if cdsColors.Locate('ITEM_INDEX', cbGeneralGridColor.ItemIndex, []) then
    cdsColors.Edit
  else
  begin
    cdsColors.Append;
    cdsColors.FieldByName('ITEM_INDEX').AsInteger := cbGeneralGridColor.ItemIndex;
  end;
  cdsColors.FieldByName('COLOR_BACKGROUND').AsInteger := cbColorBackground.Color;
  cdsColors.FieldByName('COLOR_FOREGROUND').AsInteger := cbColorForeground.Color;
  cdsColors.FieldByName('FONT_BOLD').AsInteger := Integer(cbFontBold.Checked);
  cdsColors.FieldByName('FONT_ITALIC').AsInteger := Integer(cbFontItalic.Checked);
  cdsColors.FieldByName('FONT_UNDERLINE').AsInteger := Integer(cbFontUnderline.Checked);
  cdsColors.Post;
end;

procedure TOptions.GetColorParams;
begin
  bDontChangeColor:=True;
  cbFontBold.OnClick := nil;
  cbFontItalic.OnClick := nil;
  cbFontUnderline.OnClick := nil;
  cdsColors.First;
  if cdsColors.Locate('ITEM_INDEX', cbGeneralGridColor.ItemIndex, []) then
  begin
    cbColorBackground.Color := cdsColors.FieldByName('COLOR_BACKGROUND').AsInteger;
    cbColorForeground.Color := cdsColors.FieldByName('COLOR_FOREGROUND').AsInteger;
    cbFontBold.Checked := Boolean(cdsColors.FieldByName('FONT_BOLD').AsInteger);
    cbFontItalic.Checked := Boolean(cdsColors.FieldByName('FONT_ITALIC').AsInteger);
    cbFontUnderline.Checked := Boolean(cdsColors.FieldByName('FONT_UNDERLINE').AsInteger);
  end
  else
  begin
    cbColorBackground.Color := 0;
    cbColorForeground.Color := 0;
    cbFontBold.Checked := False;
    cbFontItalic.Checked := False;
    cbFontUnderline.Checked := False;
  end;
  cbFontBold.OnClick := cbFontBoldClick;
  cbFontItalic.OnClick := cbFontItalicClick;
  cbFontUnderline.OnClick := cbFontUnderlineClick;
  bDontChangeColor:=False;
end;

procedure TOptions.SetColorStatisticsParams;
begin
  if bDontChangeStatisticsColor then exit;
  cdsColorsStatistics.First;
  if cdsColorsStatistics.Locate('ITEM_INDEX', cbGeneralGridColorStatistics.ItemIndex, []) then
    cdsColorsStatistics.Edit
  else
  begin
    cdsColorsStatistics.Append;
    cdsColorsStatistics.FieldByName('ITEM_INDEX').AsInteger := cbGeneralGridColorStatistics.ItemIndex;
  end;
  cdsColorsStatistics.FieldByName('COLOR_BACKGROUND').AsInteger := cbColorStatisticsBackground.Color;
  cdsColorsStatistics.FieldByName('COLOR_FOREGROUND').AsInteger := cbColorStatisticsForeground.Color;
  cdsColorsStatistics.Post;
end;

procedure TOptions.GetColorStatisticsParams;
begin
  bDontChangeStatisticsColor:=True;
  cdsColorsStatistics.First;
  if cdsColorsStatistics.Locate('ITEM_INDEX', cbGeneralGridColorStatistics.ItemIndex, []) then
  begin
    cbColorStatisticsBackground.Color := cdsColorsStatistics.FieldByName('COLOR_BACKGROUND').AsInteger;
    cbColorStatisticsForeground.Color := cdsColorsStatistics.FieldByName('COLOR_FOREGROUND').AsInteger;
  end
  else
  begin
    cbColorStatisticsBackground.Color := 0;
    cbColorStatisticsForeground.Color := 0;
  end;
  bDontChangeStatisticsColor:=False;
end;

procedure TOptions.SaveGrid(Grid: TDBGridEh);
var
  i: Integer;
  S: string;
begin
  with Grid.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, Integer(Items[i].Title.SortMarker), Integer(Items[i].Visible), Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth, Items[i].InRowLinePos,
        Items[i].InRowLineHeight]);
      if S <> '' then
      begin
        if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
          S := '"' + S + '"';
      end;
      FormStorageOnExit.WriteString(Grid.Name + '.' + Items[i].FieldName, S);
    end;
  end;
  FormStorage.WriteString(Grid.Name+'.FontName', Grid.Font.Name);
  FormStorage.WriteInteger(Grid.Name+'.FontColor', Grid.Font.Color);
  FormStorage.WriteInteger(Grid.Name+'.FontSize', Grid.Font.Size);
  FormStorage.WriteInteger(Grid.Name+'.FontStyle', FontStyleToInt(Grid.Font.Style));
  FormStorage.WriteInteger(Grid.Name+'.BackgroundColor', Grid.Color);
  FormStorage.WriteBoolean(Grid.Name+'.UseCustomColorFont', Grid.DrawGraphicData);
end;

function TOptions.GetEQSLDirectory: string;
begin
  if Trim(deEQSLPictureDirectory.Text) <> '' then
  begin
    if Pos(':', deEQSLPictureDirectory.Text) > 0 then
      result := deEQSLPictureDirectory.Text
    else
      result := ExtractFilePath(Application.ExeName) + deEQSLPictureDirectory.Text;
  end
  else
    result := ExtractFilePath(Application.ExeName) + deEQSLPictureDirectory.Text;
  if result[Length(result)] <> '\' then
    result := result + '\';
end;

function TOptions.GetDQSLDirectory: string;
begin
  if Trim(deDQSLPictureDirectory.Text) <> '' then
  begin
    if Pos(':', deDQSLPictureDirectory.Text) > 0 then
      result := deDQSLPictureDirectory.Text
    else
      result := ExtractFilePath(Application.ExeName) + deDQSLPictureDirectory.Text;
  end
  else
    result := ExtractFilePath(Application.ExeName) + deDQSLPictureDirectory.Text;
  if result[Length(result)] <> '\' then
    result := result + '\';
end;

procedure TOptions.TranslateGrid;
begin
  vSVisibleColumnsEh := lbAllGridVisibleColumns.Caption;
  vSSelectAllEh := lbAllGridSelectAll.Caption;

  vSSTFilterListItem_Empties := lbSTFilterListItem_Empties.Caption;
  vSSTFilterListItem_NotEmpties := lbSSTFilterListItem_NotEmpties.Caption;
  vSSTFilterListItem_All := lbSSTFilterListItem_All.Caption;
  vSSTFilterListItem_ClearFilter := lbSSTFilterListItem_ClearFilter.Caption;
  vSSTFilterListItem_ApplyFilter := lbSSTFilterListItem_ApplyFilter.Caption;
  vSSTFilterListItem_CustomFilter := lbSSTFilterListItem_CustomFilter.Caption;

  vFilterCaption := lbFilterCaption.Caption;
  vShowRecordsWhere := lbShowRecordsWhere.Caption;
  vAnd := lbAnd.Caption;
  vOr := lbOr.Caption;
  vCancel := btnCancel.Caption;

  vSSimpFilter_equals := '=';
  vSSimpFilter_does_not_equal := '<>';
  vSSimpFilter_is_greate_than := '>';
  vSSimpFilter_is_greate_than_or_equall_to := '>=';
  vSSimpFilter_is_less_than := '<';
  vSSimpFilter_is_less_than_or_equall_to := '<=';
  vSSimpFilter_begins_with := 'begins with';
  vSSimpFilter_does_not_begin_with := 'not begin with';
  vSSimpFilter_ends_with := 'ends with';
  vSSimpFilter_does_not_end_with := 'not ends with';
  vSSimpFilter_contains := 'contains';
  vSSimpFilter_does_not_contain := 'not contains';
  vSSimpFilter_like := 'like';
  vSSimpFilter_not_like := 'not like';
  vSSimpFilter_in_list := 'in list';
  vSSimpFilter_not_in_list := 'not in list';
  vSSimpFilter_is_blank := 'is blank';
  vSSimpFilter_is_not_blank := 'is not blank';


  vSColorBackground:=MainWindow.Translator.GetCaption('Options','vSColorBackground');
  vSFontEh:=MainWindow.Translator.GetCaption('Options','vSFontEh');
  vSColorUseCustom:=MainWindow.Translator.GetCaption('Options','vSColorUseCustom');


end;

procedure TOptions.CheckQSLServicesActive;
var
  qryTemp: TKADaoTable;
begin
  qryTemp := TKADaoTable.Create(nil);
  try
    qryTemp.Database := dmMain.DAODatabase;
    qryTemp.SQL.Text := 'SELECT SUM(STATIONS.STATION_EQSL_ACTIVE) as EQSL_ACTIVE, SUM(STATIONS.STATION_DQSL_ACTIVE) as DQSL_ACTIVE,SUM(STATIONS.STATION_LOTW_ACTIVE) as LOTW_ACTIVE FROM STATIONS';
    qryTemp.Open;
    bGlobalEQSLActive := qryTemp.FieldByName('EQSL_ACTIVE').AsInteger > 0;
    bGlobalDQSLActive := qryTemp.FieldByName('DQSL_ACTIVE').AsInteger > 0;
    bGlobalLOTWActive := qryTemp.FieldByName('LOTW_ACTIVE').AsInteger > 0;
  finally
    qryTemp.Close;
    qryTemp.Free;
  end;
end;

procedure TOptions.LoadHotKeys;
var
  slHotKeys: TStringList;
  slHotKeyLine: TStringList;
  i: Integer;
begin
  mdsHotKeys.DisableControls;
  { mdsHotKeys.Open;
    mdsHotKeys.EmptyTable; }
  // GetActions;
  slHotKeys := TStringList.Create;
  slHotKeyLine := TStringList.Create;
  slHotKeyLine.Delimiter := '|';
  slHotKeyLine.StrictDelimiter := True;
  mdsHotKeys.First;
  try
    FormStorage.AppStorage.ReadStringList('Options\HotKeys', slHotKeys);
    for i := 0 to slHotKeys.Count - 1 do
    begin
      slHotKeyLine.DelimitedText := slHotKeys.Strings[i];
      if (mdsHotKeys.Locate('ACTION_NAME', slHotKeyLine.Strings[0], [])) then
      begin
        mdsHotKeys.Edit;
        mdsHotKeys.FieldByName('ACTION_SHORTCUT').asString := slHotKeyLine.Strings[1];
        TAction(Pointer(mdsHotKeys.FieldByName('ACTION_POINTER').AsInteger)).ShortCut := TextToShortCut(mdsHotKeys.FieldByName('ACTION_SHORTCUT').asString);
        mdsHotKeys.Post;
      end;
    end;
  finally
    mdsHotKeys.First;
    mdsHotKeys.EnableControls;
    slHotKeyLine.Free;
    slHotKeys.Free;
  end;
end;

procedure TOptions.TranslatePluginName;
var
  Plugin: TPlugin;
  PluginCaption: string;
begin
  cdsPlugins.DisableControls;
  cdsPlugins.First;
  while not cdsPlugins.Eof do
  begin
    cdsPlugins.Edit;
    // Plugin := MainWindow.Plugins.PluginByName(cdsPlugins.FieldByName('PLUGIN_NAME').asString);
    PluginCaption := MainWindow.Translator.GetCaption(cdsPlugins.FieldByName('PLUGIN_NAME').asString + 'Form', cdsPlugins.FieldByName('PLUGIN_NAME').asString + 'Form');
    if PluginCaption = '' then
      PluginCaption := MainWindow.Translator.GetCaption('Options', cdsPlugins.FieldByName('PLUGIN_NAME').asString);
    cdsPlugins.FieldByName('PLUGIN_CAPTION').asString := PluginCaption;

    { if Plugin=nil then
      cdsPlugins.FieldByName('PLUGIN_CAPTION').asString := MainWindow.Translator.GetCaption('Options',cdsPlugins.FieldByName('PLUGIN_NAME').asString)
      else
      begin
      if Plugin.PluginForm<>nil then
      cdsPlugins.FieldByName('PLUGIN_CAPTION').asString := Plugin.PluginForm.Caption
      else
      cdsPlugins.FieldByName('PLUGIN_CAPTION').asString := MainWindow.Translator.GetCaption('Options',cdsPlugins.FieldByName('PLUGIN_NAME').asString);
      end; }
    cdsPlugins.Post;
    cdsPlugins.Next;
  end;
  cdsPlugins.First;
  cdsPlugins.EnableControls;
end;

end.
