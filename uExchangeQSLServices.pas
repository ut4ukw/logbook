unit uExchangeQSLServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvAnimatedImage, JvGIFCtrl, StdCtrls, ExtCtrls,
  KDaoTable,
  DB, uUtils, ShellApi, DateUtils, JvComponentBase, JvThread, uPluginHeaders,
  URLMon,
  ComCtrls, rkVistaProBar, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdMessage, IdAttachmentfile, IdIntercept, IdInterceptSimLog, IdText,
  JvMemoryDataset, IdPOP3, frxClass, Math, Registry, IdHTTP, IdMultipartFormData,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdCookieManager;

const
  WM_AFTER_E_SHOW = WM_USER + 302;
  EQSL_UPLOAD = 1;
  EQSL_DOWNLOAD = 2;
  DQSL_UPLOAD = 3;
  DQSL_DOWNLOAD = 4;
  LOTW_UPLOAD = 5;
  LOTW_DOWNLOAD = 6;

type
  TExchangeQSLServices = class(TForm)
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
    qryRecords: TKADaoTable;
    msgEQSLUpload: TLabel;
    qryUpdateQSL: TKADaoTable;
    pnlMain: TPanel;
    gaSync: TJvGIFAnimator;
    lbTasks: TLabel;
    btnClose: TButton;
    Bevel1: TBevel;
    btnMore: TButton;
    pnlLog: TPanel;
    lbMore: TLabel;
    gbLog: TGroupBox;
    memLog: TMemo;
    msgEQSLUploadDone: TLabel;
    msgEQSLDownloadDone: TLabel;
    msgEQSLDownload: TLabel;
    thrEQSLDownload: TJvThread;
    thrEQSLDownloadContent: TJvThread;
    btnOpenLog: TButton;
    thrEQSLUpload: TJvThread;
    thrEQSLDownloadImage: TJvThread;
    thrEQSLDownloadImageFile: TJvThread;
    lbBreak: TLabel;
    lbClose: TLabel;
    lbTasksInfo: TLabel;
    qryStationsSTATION_BOOK_NAME: TStringField;
    qryStationsSTATION_BOOK_DESCRIPTION: TStringField;
    thrEQSLUploadCheck: TJvThread;
    msgEQSLUploadCheck: TLabel;
    msgEQSLUploadCheckDone: TLabel;
    thrEQSLUploadCheckContent: TJvThread;
    pgProcess: TVistaProBar;
    smtpSendMail: TIdSMTP;
    mesgMessage: TIdMessage;
    qryStationsSTATION_EQSL_ACTIVE: TIntegerField;
    qryStationsSTATION_DQSL_ACTIVE: TIntegerField;
    qryStationsSTATION_DQSL_SMTP_HOST: TStringField;
    qryStationsSTATION_DQSL_SMTP_PORT: TIntegerField;
    qryStationsSTATION_DQSL_MAIL_USERNAME: TStringField;
    qryStationsSTATION_DQSL_MAIL_PASSWORD: TStringField;
    qryStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField;
    qryStationsSTATION_DQSL_POP_HOST: TStringField;
    qryStationsSTATION_DQSL_POP_PORT: TIntegerField;
    msgDQSLUpload: TLabel;
    msgDQSLUploadDone: TLabel;
    msgDQSLConnectError: TLabel;
    thrDQSLUpload: TJvThread;
    cdsLog: TJvMemoryData;
    popReceiveMail: TIdPOP3;
    msgDQSLDownload: TLabel;
    msgDQSLDownloadDone: TLabel;
    thrDQSLDownload: TJvThread;
    pgProcessCurrent: TVistaProBar;
    lbOpendQSLDir: TLabel;
    lbOpeneQSLDir: TLabel;
    qryQSLImageFiles: TKADaoTable;
    msgLOTWUpload: TLabel;
    msgLOTWUploadDone: TLabel;
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
    msgLoTWDownload: TLabel;
    msgLoTWDownloadDone: TLabel;
    thrLOTWDownload: TJvThread;
    cdsLogLOG_ID: TAutoIncField;
    cdsLogLOG_GRIDSQUARE: TStringField;
    cdsLogLOG_QTH: TStringField;
    cdsLogLOG_OPERATOR: TStringField;
    cdsLogLOG_CALL: TStringField;
    cdsLogLOG_FREQ: TFloatField;
    cdsLogLOG_QSO_DATE: TDateTimeField;
    cdsLogLOG_RST_RCVD: TStringField;
    cdsLogLOG_RST_SENT: TStringField;
    cdsLogLOG_LAT: TFloatField;
    cdsLogLOG_LON: TFloatField;
    cdsLogLOG_COMMENT: TStringField;
    cdsLogLOG_QSLSDATE: TDateTimeField;
    cdsLogLOG_QSLRDATE: TDateTimeField;
    cdsLogLOG_ADDRESS: TMemoField;
    cdsLogLOG_AGE: TSmallintField;
    cdsLogLOG_ARRL_SECT: TStringField;
    cdsLogLOG_CNTY: TStringField;
    cdsLogLOG_CONTEST_ID: TStringField;
    cdsLogLOG_CQZ: TSmallintField;
    cdsLogLOG_DXCC: TSmallintField;
    cdsLogLOG_IOTA: TStringField;
    cdsLogLOG_ITUZ: TSmallintField;
    cdsLogLOG_NAME: TStringField;
    cdsLogLOG_NOTES: TMemoField;
    cdsLogLOG_PFX: TStringField;
    cdsLogLOG_PROP_MODE: TStringField;
    cdsLogLOG_QSLMSG: TStringField;
    cdsLogLOG_QSL_RCVD: TStringField;
    cdsLogLOG_QSL_SENT: TStringField;
    cdsLogLOG_QSL_VIA: TStringField;
    cdsLogLOG_RX_PWR: TSmallintField;
    cdsLogLOG_EQSL_QSLRDATE: TDateTimeField;
    cdsLogLOG_EQSL_QSLSDATE: TDateTimeField;
    cdsLogLOG_EQSL_QSL_RCVD: TStringField;
    cdsLogLOG_EQSL_QSL_SENT: TStringField;
    cdsLogLOG_LOTW_QSLRDATE: TDateTimeField;
    cdsLogLOG_LOTW_QSLSDATE: TDateTimeField;
    cdsLogLOG_LOTW_QSL_RCVD: TStringField;
    cdsLogLOG_LOTW_QSL_SENT: TStringField;
    cdsLogLOG_CONT: TStringField;
    cdsLogLOG_MY_NAME: TStringField;
    cdsLogLOG_MY_POSTAL_CODE: TStringField;
    cdsLogLOG_MY_COUNTRY: TStringField;
    cdsLogLOG_BAND: TStringField;
    cdsLogLOG_MODE: TStringField;
    cdsLogLOG_COUNTRY: TStringField;
    cdsLogLOG_CONTINENT: TStringField;
    cdsLogLOG_MY_CITY: TStringField;
    cdsLogLOG_MY_STREET: TStringField;
    cdsLogLOG_MY_GRIDSQUARE: TStringField;
    cdsLogLOG_MY_LAT: TFloatField;
    cdsLogLOG_MY_LON: TFloatField;
    cdsLogLOG_QSL_SENT_VIA: TStringField;
    cdsLogLOG_QSL_RCVD_VIA: TStringField;
    cdsLogLOG_BAND_MHZ: TFloatField;
    cdsLogLOG_DQSL_QSL_SENT: TStringField;
    cdsLogLOG_DQSL_QSL_RCVD: TStringField;
    cdsLogLOG_DQSL_QSLRDATE: TDateTimeField;
    cdsLogLOG_DQSL_QSLSDATE: TDateTimeField;
    cdsLogLOG_EMAIL: TStringField;
    cdsLogLOG_A_INDEX: TSmallintField;
    cdsLogLOG_ANT_AZ: TFloatField;
    cdsLogLOG_ANT_EL: TSmallintField;
    cdsLogLOG_ANT_PATH: TStringField;
    cdsLogLOG_BAND_RX: TStringField;
    cdsLogLOG_CHECK: TStringField;
    cdsLogLOG_CLASS: TStringField;
    cdsLogLOG_CONTACTED_OP: TStringField;
    cdsLogLOG_CREDIT_SUBMITTED: TStringField;
    cdsLogLOG_CREDIT_GRANTED: TStringField;
    cdsLogLOG_DISTANCE: TFloatField;
    cdsLogLOG_EQ_CALL: TStringField;
    cdsLogLOG_FORCE_INIT: TStringField;
    cdsLogLOG_FREQ_RX: TFloatField;
    cdsLogLOG_GUEST_OP: TStringField;
    cdsLogLOG_IOTA_ISLAND_ID: TStringField;
    cdsLogLOG_K_INDEX: TFloatField;
    cdsLogLOG_MAX_BURSTS: TFloatField;
    cdsLogLOG_MS_SHOWER: TStringField;
    cdsLogLOG_MY_CNTY: TStringField;
    cdsLogLOG_MY_CQ_ZONE: TSmallintField;
    cdsLogLOG_MY_IOTA: TStringField;
    cdsLogLOG_MY_IOTA_ISLAND_ID: TStringField;
    cdsLogLOG_MY_ITU_ZONE: TSmallintField;
    cdsLogLOG_MY_RIG: TStringField;
    cdsLogLOG_MY_SIG: TStringField;
    cdsLogLOG_MY_SIG_INFO: TStringField;
    cdsLogLOG_MY_STATE: TStringField;
    cdsLogLOG_NR_BURSTS: TSmallintField;
    cdsLogLOG_NR_PINGS: TSmallintField;
    cdsLogLOG_OWNER_CALLSIGN: TStringField;
    cdsLogLOG_PRECEDENCE: TStringField;
    cdsLogLOG_PUBLIC_KEY: TStringField;
    cdsLogLOG_QSO_COMPLETE: TStringField;
    cdsLogLOG_QSO_DATE_OFF: TDateTimeField;
    cdsLogLOG_QSO_RANDOM: TStringField;
    cdsLogLOG_RIG: TStringField;
    cdsLogLOG_SAT_MODE: TStringField;
    cdsLogLOG_SAT_NAME: TStringField;
    cdsLogLOG_SFI: TSmallintField;
    cdsLogLOG_SIG: TStringField;
    cdsLogLOG_SIG_INFO: TStringField;
    cdsLogLOG_SRX: TSmallintField;
    cdsLogLOG_SRX_STRING: TStringField;
    cdsLogLOG_STATE: TStringField;
    cdsLogLOG_STX: TSmallintField;
    cdsLogLOG_STX_STRING: TStringField;
    cdsLogLOG_SWL: TStringField;
    cdsLogLOG_TX_PWR: TSmallintField;
    cdsLogLOG_WEB: TStringField;
    cdsLogLOG_QSO_TIME: TDateTimeField;
    cdsLogLOG_QSO_DATETIME: TDateTimeField;
    thrLOTWUpload: TJvThread;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdCookieManager1: TIdCookieManager;
    msgLOTWPrepareFile: TLabel;
    msgLOTWAuthorization: TLabel;
    msgLOTWUploadFile: TLabel;
    msgHRDLogUpload: TLabel;
    msgHRDLogUploadDone: TLabel;
    thrHRDLogUpload: TJvThread;
    thrLOTWUploadFile: TJvThread;
    procedure btnCloseClick(Sender: TObject);
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_E_SHOW;
    procedure FormShow(Sender: TObject);
    procedure btnMoreClick(Sender: TObject);
    procedure thrEQSLDownloadExecute(Sender: TObject; Params: Pointer);
    procedure thrEQSLDownloadContentExecute(Sender: TObject; Params: Pointer);
    procedure btnOpenLogClick(Sender: TObject);
    procedure thrEQSLUploadExecute(Sender: TObject; Params: Pointer);
    procedure thrEQSLDownloadImageExecute(Sender: TObject; Params: Pointer);
    procedure thrEQSLDownloadImageFileExecute(Sender: TObject; Params: Pointer);
    procedure thrEQSLUploadCheckExecute(Sender: TObject; Params: Pointer);
    procedure thrEQSLUploadCheckContentExecute(Sender: TObject; Params: Pointer);
    procedure SMTPStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
    procedure thrDQSLUploadExecute(Sender: TObject; Params: Pointer);
    procedure popReceiveMailStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
    procedure thrDQSLDownloadExecute(Sender: TObject; Params: Pointer);
    procedure lbOpendQSLDirClick(Sender: TObject);
    procedure lbOpeneQSLDirClick(Sender: TObject);
    procedure thrLOTWDownloadExecute(Sender: TObject; Params: Pointer);
    procedure thrLOTWUploadExecute(Sender: TObject; Params: Pointer);
    procedure IdIOHandlerStack1Status(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
    procedure thrHRDLogUploadExecute(Sender: TObject; Params: Pointer);
    procedure thrLOTWUploadFileExecute(Sender: TObject; Params: Pointer);
  private
    bEQSLException: boolean;
    bGeneralBreak: boolean;
    bRunProcess: boolean;
    iCountUploadedToeQSL: integer;
    EQSLUploadURL, EQSLUploadResponce, EQSLUploadCheckURL, EQSLUploadCheckResponce, EQSLUploadCheckURLContent, EQSLUploadCheckContentResponce, EQSLDownloadURL, EQSLDownloadResponce, EQSLDownloadURLContent, EQSLDownloadContentResponce,
      EQSLDownloadImageURL, EQSLDownloadImageResponce, EQSLDownloadImageFileURL, EQSLDownloadImageFileName, DQSLEmailTo, DQSLCall, DQSLSubjectIdentifier, DQSLFileName, DQSLImageFileName, LOTWDownloadURL: string;
    LOTWDownloadResponce: TStringList;
    LOTWUploadFilename, LOTWUploadLogin, LOTWUploadPassword, HRDLogADIFData, HRDLogLogin, HRDLogPassword, HRDLogUploadResponce: string;
    LOTWUploadResult, LOTWUploadFileResult: boolean;
    DQSLMessageId: integer;
    EQSLDownloadImageFileResult, DQSLUploadMessageResult, DQSLDownloadMessageResult: boolean;
    DQSLBookId: integer;
    AllSyncOperation: array of integer;
    procedure MsgWaitForSingleObject(Handle: THandle);
    procedure UploadCheckEQSL;
    procedure UploadEQSL;
    procedure ChangeType;
    procedure DownloadEQSL;
    procedure UploadDQSL;
    function UploadDQSLMessage: boolean;
    procedure DownloadDQSL;
    function DownloadDQSLMessage: boolean;
    procedure UploadLOTW;
    procedure DownloadLOTW;
    procedure UploadHRDLog;
  public
    TypeOperation: integer;
    SelectedRecords: variant;
    SelectedAll: boolean;
    StationId: integer;
    Login, Password: string;
  end;

var
  ExchangeQSLServices: TExchangeQSLServices;

implementation

{$R *.dfm}

uses uMainWindow, udmMain, uOptions;

procedure TExchangeQSLServices.WmAfterShow(var Msg: TMessage);
var
  TaskCount, TaskOffset: integer;
  i: integer;
begin
  bRunProcess := True;
  gaSync.Animate := True;
  btnClose.Caption := lbBreak.Caption;
  Application.ProcessMessages;
  TaskOffset := 0;
  try
    case TypeOperation of
      CA_EQSL_UPLOAD_UNEXPORTED:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          UploadEQSL;
        end;
      CA_EQSL_UPLOAD_SELECTED:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          UploadEQSL;
        end;
      CA_EQSL_DOWNLOAD:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          DownloadEQSL;
        end;

      CA_EQSL_UPLOAD_DOWNLOAD:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '2']);
          Application.ProcessMessages;
          UploadEQSL;
          if bGeneralBreak then
            exit;
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['2', '2']);
          Application.ProcessMessages;
          DownloadEQSL;
        end;

      CA_EQSL_UPLOAD_CHECK:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          Application.ProcessMessages;
          UploadCheckEQSL;
        end;

      CA_DQSL_UPLOAD_UNEXPORTED:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          UploadDQSL;
        end;

      CA_DQSL_UPLOAD_SELECTED:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          UploadDQSL;
        end;

      CA_DQSL_DOWNLOAD:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          DownloadDQSL;
        end;

      CA_DQSL_UPLOAD_DOWNLOAD:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '2']);
          Application.ProcessMessages;
          UploadDQSL;
          if bGeneralBreak then
            exit;
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['2', '2']);
          Application.ProcessMessages;
          DownloadDQSL;
        end;

      CA_LOTW_UPLOAD_UNEXPORTED:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          UploadLOTW;
        end;
      CA_LOTW_UPLOAD_SELECTED:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          UploadLOTW;
        end;
      CA_LOTW_DOWNLOAD:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          DownloadLOTW;
        end;

      CA_LOTW_UPLOAD_DOWNLOAD:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '2']);
          Application.ProcessMessages;
          UploadLOTW;
          if bGeneralBreak then
            exit;
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['2', '2']);
          Application.ProcessMessages;
          DownloadLOTW;
        end;

      CA_HRDLOG_UPLOAD_SELECTED:
        begin
          lbTasks.Caption := Format(lbTasksInfo.Caption, ['1', '1']);
          UploadHRDLog;
        end;

      CA_QSL_SERVICES_EXCHANGE:
        begin
          if Options.bGlobalEQSLActive then
          begin
            SetLength(AllSyncOperation, Length(AllSyncOperation) + 2);
            AllSyncOperation[Length(AllSyncOperation)-2] := EQSL_UPLOAD;
            AllSyncOperation[Length(AllSyncOperation)-1] := EQSL_DOWNLOAD;
          end;
          if Options.bGlobalDQSLActive then
          begin
            SetLength(AllSyncOperation, Length(AllSyncOperation) + 2);
            AllSyncOperation[Length(AllSyncOperation)-2] := DQSL_UPLOAD;
            AllSyncOperation[Length(AllSyncOperation)-1] := DQSL_DOWNLOAD;
          end;
          if Options.bGlobalLOTWActive then
          begin
            SetLength(AllSyncOperation, Length(AllSyncOperation) + 2);
            AllSyncOperation[Length(AllSyncOperation)-2] := LOTW_UPLOAD;
            AllSyncOperation[Length(AllSyncOperation)-1] := LOTW_DOWNLOAD;
          end;
          // Inc(TaskCount, 2);

          if Options.bGlobalEQSLActive or Options.bGlobalDQSLActive or Options.bGlobalLOTWActive then
            for i := 0 to Length(AllSyncOperation) - 1 do
            begin
              if bGeneralBreak then
                exit;
              lbTasks.Caption := Format(lbTasksInfo.Caption, [IntToStr(i + 1), IntToStr(Length(AllSyncOperation))]);
              Application.ProcessMessages;
              case AllSyncOperation[i] of
                EQSL_UPLOAD:
                  begin
                    TypeOperation := CA_EQSL_UPLOAD_UNEXPORTED;
                    UploadEQSL;
                  end;
                EQSL_DOWNLOAD:
                  DownloadEQSL;
                DQSL_UPLOAD:
                  begin
                    TypeOperation := CA_DQSL_UPLOAD_UNEXPORTED;
                    UploadDQSL;
                  end;
                DQSL_DOWNLOAD:
                  DownloadDQSL;

                LOTW_UPLOAD:
                  begin
                    TypeOperation := CA_LOTW_UPLOAD_UNEXPORTED;
                    UploadLOTW;

                  end;
                LOTW_DOWNLOAD:
                  DownloadLOTW;

              end;

              { if Options.bGlobalEQSLActive then
                begin
                if i = 1 then
                begin
                TypeOperation:=CA_EQSL_UPLOAD_UNEXPORTED;
                UploadEQSL;
                end;
                if i = 2 then
                DownloadEQSL;
                if i=2 then
                TaskOffset := 2;
                end;

                if Options.bGlobalDQSLActive then
                begin
                if i = TaskOffset + 1 then
                begin
                TypeOperation:=CA_DQSL_UPLOAD_UNEXPORTED;
                UploadDQSL;
                end;
                if i = TaskOffset + 2 then
                DownloadDQSL;
                if i=TaskOffset+2 then
                TaskOffset := TaskOffset + 2
                end;

                if Options.bGlobalLOTWActive then
                begin
                if i = TaskOffset + 1 then
                begin
                TypeOperation:=CA_LOTW_UPLOAD_UNEXPORTED;
                UploadLOTW;
                end;
                if i = TaskOffset + 2 then
                DownloadLOTW;
                end;
                }
            end;
        end;
    end;
  finally
    gaSync.Animate := False;
    btnClose.Caption := lbClose.Caption;
    Application.ProcessMessages;
    bRunProcess := False;
  end;
end;

procedure TExchangeQSLServices.ChangeType;
begin
  if Options.FormStorageOnExit.StoredValue['ExchangeQSLServicesWindowShort'] then
  begin
    pnlLog.Visible := False;
    btnMore.Caption := lbMore.Caption + ' >>';
    Height := 118;
    Options.FormStorageOnExit.StoredValue['ExchangeQSLServicesWindowShort'] := False;
  end
  else
  begin
    pnlLog.Visible := True;
    btnMore.Caption := '<<' + lbMore.Caption;
    Height := 364;
    Options.FormStorageOnExit.StoredValue['ExchangeQSLServicesWindowShort'] := True;
  end
end;

procedure TExchangeQSLServices.MsgWaitForSingleObject(Handle: THandle);
begin
  repeat
    if MsgWaitForMultipleObjects(1, Handle, False, INFINITE, QS_ALLINPUT) = WAIT_OBJECT_0 + 1 then
      Application.ProcessMessages
    else
      BREAK;
  until True = False;
end;

procedure TExchangeQSLServices.popReceiveMailStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
begin
  if ParamStr(1) = 'debug' then
    memLog.Lines.Add(AStatusText);
end;

procedure TExchangeQSLServices.SMTPStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
begin
  if ParamStr(1) = 'debug' then
    memLog.Lines.Add(AStatusText);
end;

procedure TExchangeQSLServices.btnMoreClick(Sender: TObject);
begin
  ChangeType;
end;

procedure TExchangeQSLServices.btnOpenLogClick(Sender: TObject);
var
  sFileName: string;
begin
  sFileName := 'UT4UKWLogBook_ExchangeQSLService.log';
  memLog.Lines.SaveToFile(GetTempDir + sFileName);
  ShellExecute(Handle, 'open', 'notepad.exe', PWideChar(GetTempDir + sFileName), nil, SW_SHOWNORMAL);
end;

procedure TExchangeQSLServices.FormShow(Sender: TObject);
begin
  if Options.FormStorageOnExit.StoredValue['ExchangeQSLServicesWindowShort'] then
  begin
    pnlLog.Visible := True;
    btnMore.Caption := '<<' + lbMore.Caption;
    Height := 364;
  end
  else
  begin
    pnlLog.Visible := False;
    btnMore.Caption := lbMore.Caption + ' >>';
    Height := 118;
  end;
  PostMessage(Self.Handle, WM_AFTER_E_SHOW, 0, 0);
end;

procedure TExchangeQSLServices.IdIOHandlerStack1Status(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
begin
  ShowMessage(AStatusText);
end;

procedure TExchangeQSLServices.lbOpendQSLDirClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('Explorer'), PChar(Options.GetDQSLDirectory), nil, SW_SHOWNORMAL);
end;

procedure TExchangeQSLServices.lbOpeneQSLDirClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('Explorer'), PChar(Options.GetEQSLDirectory), nil, SW_SHOWNORMAL);
end;

procedure TExchangeQSLServices.thrDQSLDownloadExecute(Sender: TObject; Params: Pointer);
begin
  DQSLDownloadMessageResult := DownloadDQSLMessage;
end;

procedure TExchangeQSLServices.thrDQSLUploadExecute(Sender: TObject; Params: Pointer);
begin
  DQSLUploadMessageResult := UploadDQSLMessage;
end;

procedure TExchangeQSLServices.thrEQSLDownloadContentExecute(Sender: TObject; Params: Pointer);
begin
  try
    EQSLDownloadContentResponce := GetUrlContent(EQSLDownloadURLContent);
  finally

  end;
end;

procedure TExchangeQSLServices.thrEQSLDownloadExecute(Sender: TObject; Params: Pointer);
begin
  try
    EQSLDownloadResponce := GetUrlContent(EQSLDownloadURL);
  except
    on E: exception do
    begin
      bEQSLException := True;
      EQSLDownloadResponce := E.Message;
    end;
  end;
end;

procedure TExchangeQSLServices.thrEQSLDownloadImageExecute(Sender: TObject; Params: Pointer);
begin
  EQSLDownloadImageResponce := GetUrlContent(EQSLDownloadImageURL);
end;

procedure TExchangeQSLServices.thrEQSLDownloadImageFileExecute(Sender: TObject; Params: Pointer);
begin
  EQSLDownloadImageFileResult := UrlDownloadToFile(nil, PChar(EQSLDownloadImageFileURL), PChar(EQSLDownloadImageFileName), 0, nil) = 0;
end;

procedure TExchangeQSLServices.thrEQSLUploadCheckExecute(Sender: TObject; Params: Pointer);
begin
  try
    EQSLUploadCheckResponce := GetUrlContent(EQSLUploadCheckURL);
  except
    on E: exception do
      EQSLUploadCheckResponce := E.Message;
  end;
end;

procedure TExchangeQSLServices.thrEQSLUploadCheckContentExecute(Sender: TObject; Params: Pointer);
begin
  EQSLUploadCheckContentResponce := GetUrlContent(EQSLUploadCheckURLContent);
end;

procedure TExchangeQSLServices.thrEQSLUploadExecute(Sender: TObject; Params: Pointer);
begin
  try
    EQSLUploadResponce := GetUrlContent(EQSLUploadURL);
  except
    on E: exception do
      EQSLUploadResponce := E.Message;
  end;
end;

procedure TExchangeQSLServices.thrHRDLogUploadExecute(Sender: TObject; Params: Pointer);
var
  sParams: TStringList;
begin
  sParams := TStringList.Create;
  try
    sParams.Add('Callsign=' + HRDLogLogin);
    sParams.Add('Code=' + HRDLogPassword);
    sParams.Add('ADIFData=' + HRDLogADIFData);
    try
      HRDLogUploadResponce := IdHTTP.Post('http://www.hrdlog.net/NewEntry.aspx', sParams);
    except
      on E: exception do
        HRDLogUploadResponce := E.Message;
    end;
  finally
    sParams.Free;
  end;
end;

procedure TExchangeQSLServices.thrLOTWDownloadExecute(Sender: TObject; Params: Pointer);
var
  Stream: TMemoryStream;
  bResult: boolean;
begin
  Stream := TMemoryStream.Create;
  try
    try
      bResult := GetInetFile(LOTWDownloadURL, Stream);
      if bResult then
      begin
        Stream.Position := 0;
        LOTWDownloadResponce.LoadFromStream(Stream);
      end
      else
        LOTWDownloadResponce.Text := 'Cannot open URL';
    except
      LOTWDownloadResponce.Text := 'Cannot open URL';
    end;
  finally
    Stream.Free;
  end;
end;

procedure TExchangeQSLServices.thrLOTWUploadExecute(Sender: TObject; Params: Pointer);
begin
  LOTWUploadResult := RunAppHidden(LOTWUploadFilename, True);
end;

procedure TExchangeQSLServices.thrLOTWUploadFileExecute(Sender: TObject; Params: Pointer);
var
  Data: TStringList;
  sResponce, sResponceFile: string;
  Multi: Tidmultipartformdatastream;
begin
  LOTWUploadFileResult := False;
  Data := TStringList.Create;
  try
    Data.Add('login=' + LOTWUploadLogin);
    Data.Add('password=' + LOTWUploadPassword);
    Data.Add('acct_sel=');
    memLog.Lines.Add(LOTWUploadLogin + ' [LoTW Upload]: ' + msgLOTWAuthorization.Caption);
    sResponce := IdHTTP.Post('https://p1k.arrl.org/lotwuser/upload', Data);
    if Pos('Username/password incorrect', sResponce) = 0 then
    begin
      Multi := Tidmultipartformdatastream.Create;
      try
        Multi.addfile('upfile', LOTWUploadFilename, 'application/octet-stream');
        memLog.Lines.Add(LOTWUploadLogin + ' [LoTW Upload]: ' + msgLOTWUploadFile.Caption);
        sResponceFile := IdHTTP.Post('https://p1k.arrl.org/lotwuser/upload', Multi);
        if Pos('queued for processing', sResponceFile) > 0 then
          LOTWUploadFileResult := True
        else
          memLog.Lines.Add('[LoTW Upload]: ' + sResponceFile);
      finally
        Multi.Free;
      end;
    end
    else
    begin
      memLog.Lines.Add(LOTWUploadLogin + ' [LoTW Upload]: Username/password incorrect');
      LOTWUploadFileResult := False;
    end;
  finally
    Data.Free;
  end;

end;

{ ********************************************** EQSL Download ********************************************************* }

procedure TExchangeQSLServices.DownloadEQSL;
var
  sLogin, sPassword, sDate: string;
  sResponce, sCall: string;
  OldStationCall: string;
  sSelectQuery: string;
  sAdif: TStringList;
  iCountDownloadedFromeQSL: integer;

  function GetQSLImage(Call, Band, Mode, Date, Time: string; LogId: integer; BookName: string; StationId: integer; var FileName: string): boolean;
  var
    // CallInfo: TCallInfo;
    sDir, sFile,ext: string;
  begin
    try
      EQSLDownloadImageURL := 'http://www.eqsl.cc/qslcard/GeteQSL.cfm?Username=' + sCall + '&Password=' + sPassword + '&CallsignFrom=' + UrlEncode(Call) + '&QSOBand=' + Band + '&QSOMode=' + Mode + '&QSOYear=' + Copy(Date, 1, 4) + '&QSOMonth=' + Copy(Date,
        5, 2) + '&QSODay=' + Copy(Date, 7, 2) + '&QSOHour=' + Copy(Time, 1, 2) + '&QSOMinute=' + Copy(Time, 1, 2);
      MsgWaitForSingleObject(thrEQSLDownloadImage.Execute(nil).Handle);
      sResponce := EQSLDownloadImageResponce;
      Delete(sResponce, 1, Pos('<IMG SRC="', UpperCase(sResponce)) + 10);
      EQSLDownloadImageFileURL := 'http://www.eqsl.cc/' + Copy(sResponce, 1, Pos('"', sResponce) - 1);
      ext:=ExtractFileExt(EQSLDownloadImageFileURL);
      sFile := StringReplace(Call, '/', '!', [rfReplaceAll]) + '_' + Band + '_' + Mode + '_' + Date + Time + ext;
      FileName := sFile;
      // CallInfo := MainWindow.GetPrefixData(Call);
      sDir := Options.GetEQSLDirectory;
      // sDir := Options.GetEQSLDirectory + StringReplace(BookName, '/', '_', [rfReplaceAll]) + '_' + StringReplace(sCall, '/', '_', [rfReplaceAll]) +'_'+IntToStr(StationId) + '\' + CallInfo.PrefixData.Continent + '\' + CallInfo.PrefixData.Territory;
      if not DirectoryExists(sDir) then
        ForceDirectories(sDir);
      EQSLDownloadImageFileName := sDir + sFile;
      MsgWaitForSingleObject(thrEQSLDownloadImageFile.Execute(nil).Handle);
      Result := EQSLDownloadImageFileResult;
    except
      on E: exception do
        memLog.Lines.Add(sCall + '  [eQSL Download]: ' + E.Message);
    end;
  end;

  procedure UpdateRecord;
  var
    i, iRowAffected, iRowAffectedImage: integer;
    slStr, slCall, slDate, slTime, slBand, slMode: string;
    dDate, dDateFrom, dDateTo: TDateTime;
    sImageFileName: string;
  begin
    for i := 0 to 6 do
      sAdif.Delete(0);
    // pgProcess.Max := sAdif.Count - 1;
    pgProcessCurrent.Position:=0;
//    pgProcessCurrent.Max := sAdif.Count - 1;
    pgProcessCurrent.Max := sAdif.Count;
    Application.ProcessMessages;
    for i := 0 to sAdif.Count - 1 do
    begin
      try
        try
          if bGeneralBreak then
            BREAK;
          slStr := sAdif.Strings[i];
          Delete(slStr, 1, Pos('>', slStr));
          slCall := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slDate := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slTime := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slBand := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slMode := Copy(slStr, 1, Pos('<', slStr) - 1);
          try
            dDate := EncodeDateTime(StrToInt(Copy(slDate, 1, 4)), StrToInt(Copy(slDate, 5, 2)), StrToInt(Copy(slDate, 7, 2)), StrToInt(Copy(slTime, 1, 2)), StrToInt(Copy(slTime, 3, 2)), 0, 0);
            dDateFrom := IncMinute(dDate, -10);
            qryRecords.close;
            qryRecords.Params.ParamByName('DATEFROM').Value := dDateFrom;
            dDateTo := IncMinute(dDate, 10);
            qryRecords.Params.ParamByName('DATETO').Value := dDateTo;
            qryRecords.Params.ParamByName('LOG_CALL').asString := #39 + slCall + #39;
            qryRecords.Params.ParamByName('BAND').asString := #39 + slBand + #39;
            qryRecords.Params.ParamByName('MODE').asString := #39 + slMode + #39;
            qryRecords.Open;
            Application.ProcessMessages;
            if not qryRecords.IsEmpty then
            begin
              { if qryRecords.FieldByName('LOG_EQSL_QSL_RCVD').asString='Y' then
                Continue; }

              qryUpdateQSL.close;
              qryUpdateQSL.SQL.Text := 'UPDATE ' + qryRecords.FieldByName('BOOK_TABLE_NAME').asString + ' SET LOG_EQSL_QSL_RCVD=:LOG_EQSL_QSL_RCVD, LOG_EQSL_QSLRDATE=:LOG_EQSL_QSLRDATE WHERE LOG_ID=' + IntToStr(qryRecords.FieldByName('LOG_ID').AsInteger);
              qryUpdateQSL.Params.ParamByName('LOG_EQSL_QSL_RCVD').asString := #39 + 'Y' + #39;
              qryUpdateQSL.Params.ParamByName('LOG_EQSL_QSLRDATE').Value := Date;
              iRowAffected := qryUpdateQSL.ExecuteSQL;
              if Options.cbEQSLLoadPictures.Checked then
                if not GetQSLImage(slCall, slBand, slMode, slDate, slTime, qryRecords.FieldByName('LOG_ID').AsInteger, qryRecords.FieldByName('BOOK_NAME').asString, qryRecords.FieldByName('STATION_ID').AsInteger, sImageFileName) then
                  memLog.Lines.Add(sCall + '  [eQSL Download]: Error download image from ' + sAdif.Strings[i])
                else
                begin
                  memLog.Lines.Add(sCall + '  [eQSL Download]: ' + slCall);
                  qryQSLImageFiles.SQL.Text := 'UPDATE QSL_IMAGE_FILES SET IMAGE_EQSL_FILENAME=' + QuotedStr(sImageFileName) + ' WHERE STATION_ID=' + IntToStr(qryRecords.FieldByName('STATION_ID').AsInteger) + ' AND LOG_ID=' + IntToStr
                    (qryRecords.FieldByName('LOG_ID').AsInteger);
                  try
                    iRowAffectedImage := qryQSLImageFiles.ExecuteSQL;
                    if iRowAffectedImage = 0 then
                    begin
                      qryQSLImageFiles.SQL.Text := 'INSERT INTO QSL_IMAGE_FILES (STATION_ID,LOG_ID,IMAGE_EQSL_FILENAME) VALUES(' + IntToStr(qryRecords.FieldByName('STATION_ID').AsInteger) + ',' + IntToStr(qryRecords.FieldByName('LOG_ID').AsInteger)
                        + ',' + QuotedStr(sImageFileName) + ')';
                      qryQSLImageFiles.ExecuteSQL;
                    end;
                  except
                    on E: exception do
                      memLog.Lines.Add(sCall + '  [eQSL Download]: ' + E.Message);
                  end;
                end;
              iCountDownloadedFromeQSL := iCountDownloadedFromeQSL + 1;
            end
            else
              memLog.Lines.Add(sCall + '  [eQSL Download]: QSO not found ' + sAdif.Strings[i]);
          except
            on E: exception do
              memLog.Lines.Add(sCall + '  [eQSL Download]: ' + E.Message);
          end;
        except
          on E: exception do
            memLog.Lines.Add(sCall + '  [eQSL Download]: ' + E.Message);
        end;
      finally
        // pgProcess.Position := pgProcess.Position + 1;
        pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
        Application.ProcessMessages;
      end;
    end;
  end;

  procedure GetADIFromServer;
  var
    iLimitDateLoPos: integer;
    sLimitDateLo: string;
  begin
    try
      if Trim(sPassword) = '' then
      begin
        memLog.Lines.Add(sCall + '  [eQSL Download]: Password is empty');
        exit;
      end;
      if Trim(sLogin) = '' then
      begin
        memLog.Lines.Add(sCall + '  [eQSL Download]: Login is empty');
        exit;
      end;
      qryRecords.close;
      qryRecords.SQL.Text := 'SELECT * FROM (' + sSelectQuery + ') WHERE LOG_CALL=:LOG_CALL AND LOG_QSO_DATETIME BETWEEN :DATEFROM AND :DATETO AND LOG_BAND=:BAND AND LOG_MODE=:MODE';
      // qryRecords.SQL.SaveToFile('D:\!\4.sql');
      // EQSLDownloadURL := 'http://www.eqsl.cc/qslcard/DownloadInBox.cfm?UserName=' + sLogin + '&Password=' + UrlEncode(sPassword) + '&RcvdSince=' + sDate;
      if (MainWindow.LimitDateLo <> '') and (MainWindow.LimitDateHi <> '') then
        EQSLDownloadURL := 'http://www.eqsl.cc/qslcard/DownloadInBox.cfm?UserName=' + sLogin + '&Password=' + UrlEncode(sPassword) + '&LimitDateLo=' + MainWindow.LimitDateLo + '&LimitDateHi=' + MainWindow.LimitDateHi
      else
       if sDate='19000101' then
        EQSLDownloadURL := 'http://www.eqsl.cc/qslcard/DownloadInBox.cfm?UserName=' + sLogin + '&Password=' + UrlEncode(sPassword)
       else
        EQSLDownloadURL := 'http://www.eqsl.cc/qslcard/DownloadInBox.cfm?UserName=' + sLogin + '&Password=' + UrlEncode(sPassword) + '&RcvdSince=' + sDate;

      MsgWaitForSingleObject(thrEQSLDownload.Execute(nil).Handle);
      sResponce := EQSLDownloadResponce;
      if Pos('Cannot open URL', sResponce) > 0 then
        memLog.Lines.Add(sCall + '  [eQSL Download]: ' + 'Cannot open URL. Check internet connection.')
      else if Pos('You are not yet logged in', sResponce) > 0 then
        memLog.Lines.Add(sCall + '  [eQSL Download]: You are not yet logged in. Check login or password.')
      else if Pos('Error', sResponce) > 0 then
      begin
        Delete(sResponce, 1, Pos('Error', sResponce) + 6);
        sResponce := StringReplace(sResponce, #10, '', [rfReplaceAll]);
        sResponce := StringReplace(sResponce, #13, '', [rfReplaceAll]);
        sResponce := StringReplace(sResponce, '</H3>', ' ', [rfReplaceAll]);
        memLog.Lines.Add(sCall + '  [eQSL Download]: ' + Trim(Copy(sResponce, 1, Pos('</', sResponce) - 1)));
      end
      else if sResponce = 'The service is unavailable.' then
        memLog.Lines.Add(sCall + '  [eQSL Download]: ' + sResponce)
      else if Pos('You can only download 10000 records', sResponce) > 0 then
      begin
        memLog.Lines.Add(sCall + '  [eQSL Download]: You can only download 10000 records. Please use parameter [eqsllomitlo].');
      end
      else
      begin
        Delete(sResponce, 1, Pos('downloadedfiles', sResponce) - 1);
        EQSLDownloadURLContent := 'http://www.eqsl.cc/qslcard/' + Copy(sResponce, 1, Pos('"', sResponce) - 1);
        MsgWaitForSingleObject(thrEQSLDownloadContent.Execute(nil).Handle);
        sAdif.Text := EQSLDownloadContentResponce;
        if sAdif.Count > 6 then
          UpdateRecord;
      end;
    except
      on E: exception do
        memLog.Lines.Add(sCall + '  [eQSL Download]: ' + E.Message);
    end;
  end;

begin
  iCountDownloadedFromeQSL := 0;
  bEQSLException := False;
  OldStationCall := '';
  memLog.Lines.Add(msgEQSLDownload.Caption);
  pgProcess.Position := 0;
  pgProcess.Max := 0;
  pgProcess.Visible := False;
  pgProcessCurrent.Position := 0;
  pgProcessCurrent.Max := 0;
  Application.ProcessMessages;
  sAdif := TStringList.Create;
  try
    qryStations.Open;
    qryStations.SortedBy.Text := 'STATION_CALL ASC';
    qryStations.Sort;
    sDate := DateToAdif(Options.dtpEQSLLastDownload.Date);

    while not qryStations.Eof do
    begin
      if bGeneralBreak then
        BREAK;
      if qryStations.FieldByName('STATION_EQSL_ACTIVE').AsInteger = 1 then
      begin

        if OldStationCall <> qryStations.FieldByName('STATION_CALL').asString then
        begin
          if OldStationCall <> '' then
            GetADIFromServer;
          sLogin := qryStations.FieldByName('STATION_EQSL_LOGIN').asString;
          sCall := qryStations.FieldByName('STATION_CALL').asString;
          sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, qryStations.FieldByName('STATION_EQSL_PASSWORD').asString);
          sSelectQuery := '';
          OldStationCall := qryStations.FieldByName('STATION_CALL').asString;
        end;
        if sSelectQuery <> '' then
          sSelectQuery := sSelectQuery + ' UNION ALL ';
        sSelectQuery := sSelectQuery + 'SELECT "' + qryStations.FieldByName('STATION_BOOK_NAME').asString + '" as BOOK_NAME, ' + qryStations.FieldByName('STATION_ID').asString + ' as STATION_ID,  "LOG_' + IntToStr
          (qryStations.FieldByName('STATION_ID').AsInteger) + '" as BOOK_TABLE_NAME, LOG_ID,LOG_CALL,LOG_QSO_DATETIME,LOG_BAND,LOG_MODE,LOG_EQSL_QSL_RCVD FROM LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger);
      end;
      qryStations.Next;
    end;
    GetADIFromServer;

  finally
    sAdif.Free;
    qryStations.close;
  end;
  { if pgProcess.Max = 0 then
    pgProcess.Max := 1;
    pgProcess.Position := pgProcess.Max; }
  if not bGeneralBreak and not bEQSLException then
  begin
    Options.dtpEQSLLastDownload.Date := Date;
    Options.FormStorage.SaveFormPlacement;
  end;
  if pgProcessCurrent.Max = 0 then
    pgProcessCurrent.Max := 1;
  pgProcessCurrent.Position := pgProcessCurrent.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgEQSLDownloadDone.Caption, [IntToStr(iCountDownloadedFromeQSL)]));
  dmMain.qryLog.Refresh;
end;

procedure TExchangeQSLServices.UploadCheckEQSL;
var
  sLogin, sPassword: string;
  sResponce, sCall: string;
  OldStationCall: string;
  sSelectQuery: string;
  sAdif: TStringList;
  iCountUploadedCheckFromeQSL: integer;
  Bookmark: TBookmark;

  procedure UpdateRecord;
  var
    i, iRowAffected: integer;
    slStr, slCall, slDate, slTime, slBand, slMode: string;
    dDate, dDateFrom, dDateTo: TDateTime;
  begin
    for i := 0 to 6 do
      sAdif.Delete(0);
    pgProcessCurrent.Max := sAdif.Count - 1;
    Application.ProcessMessages;
    for i := 0 to sAdif.Count - 1 do
    begin
      try
        try
          if bGeneralBreak then
            BREAK;
          slStr := sAdif.Strings[i];
          Delete(slStr, 1, Pos('>', slStr));
          slCall := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slDate := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slTime := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slBand := Copy(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('<', slStr) - 1);
          Delete(slStr, 1, Pos('>', slStr));
          slMode := Copy(slStr, 1, Pos('<', slStr) - 1);
          try
            dDate := EncodeDateTime(StrToInt(Copy(slDate, 1, 4)), StrToInt(Copy(slDate, 5, 2)), StrToInt(Copy(slDate, 7, 2)), StrToInt(Copy(slTime, 1, 2)), StrToInt(Copy(slTime, 3, 2)), 0, 0);
            dDateFrom := IncMinute(dDate, -3);
            qryRecords.close;
            qryRecords.Params.ParamByName('DATEFROM').Value := dDateFrom;
            dDateTo := IncMinute(dDate, 3);
            qryRecords.Params.ParamByName('DATETO').Value := dDateTo;
            qryRecords.Params.ParamByName('LOG_CALL').asString := #39 + slCall + #39;
            qryRecords.Params.ParamByName('BAND').asString := #39 + slBand + #39;
            qryRecords.Params.ParamByName('MODE').asString := #39 + slMode + #39;
            qryRecords.Open;
            Application.ProcessMessages;
            if not qryRecords.IsEmpty then
            begin
              qryUpdateQSL.close;
              qryUpdateQSL.SQL.Text := 'UPDATE ' + qryRecords.FieldByName('BOOK_TABLE_NAME').asString + ' SET LOG_EQSL_QSL_SENT=:LOG_EQSL_QSL_SENT, LOG_EQSL_QSLSDATE=:LOG_EQSL_QSLSDATE WHERE LOG_ID=' + IntToStr(qryRecords.FieldByName('LOG_ID').AsInteger);
              qryUpdateQSL.Params.ParamByName('LOG_EQSL_QSL_SENT').asString := #39 + 'Y' + #39;
              qryUpdateQSL.Params.ParamByName('LOG_EQSL_QSLSDATE').Value := Date;
              iRowAffected := qryUpdateQSL.ExecuteSQL;
              iCountUploadedCheckFromeQSL := iCountUploadedCheckFromeQSL + 1;
            end
            else
              memLog.Lines.Add(sCall + '  [eQSL Upload check]: QSO not found ' + sAdif.Strings[i]);
          except
            on E: exception do
              memLog.Lines.Add(sCall + '  [eQSL Upload check]: ' + E.Message);
          end;
        except
          on E: exception do
            memLog.Lines.Add(sCall + '  [eQSL Upload check]: ' + E.Message);
        end;
      finally
        pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
        Application.ProcessMessages;
      end;
    end;
  end;

  procedure GetADIFromServer;
  begin
    try
      if Trim(sPassword) = '' then
      begin
        memLog.Lines.Add(sCall + '  [eQSL Upload check]: Password is empty');
        exit;
      end;
      if Trim(sLogin) = '' then
      begin
        memLog.Lines.Add(sCall + '  [eQSL Upload check]: Login is empty');
        exit;
      end;
      qryRecords.close;
      qryRecords.SQL.Text := 'SELECT * FROM (' + sSelectQuery + ') WHERE LOG_CALL=:LOG_CALL AND LOG_QSO_DATETIME BETWEEN :DATEFROM AND :DATETO AND LOG_BAND=:BAND AND LOG_MODE=:MODE';
      EQSLUploadCheckURL := 'http://www.eqsl.cc/qslcard/DownloadADIF.cfm?UserName=' + sLogin + '&Password=' + UrlEncode(sPassword);
      MsgWaitForSingleObject(thrEQSLUploadCheck.Execute(nil).Handle);
      sResponce := EQSLUploadCheckResponce;
      if Pos('You are not yet logged in', sResponce) > 0 then
        memLog.Lines.Add(sCall + '  [eQSL Upload check]: You are not yet logged in. Check login or password.')
      else if Pos('Error', sResponce) > 0 then
      begin
        Delete(sResponce, 1, Pos('Error', sResponce) + 6);
        sResponce := StringReplace(sResponce, #10, '', [rfReplaceAll]);
        sResponce := StringReplace(sResponce, #13, '', [rfReplaceAll]);
        sResponce := StringReplace(sResponce, '</H3>', ' ', [rfReplaceAll]);
        memLog.Lines.Add(sCall + '  [eQSL Upload check]: ' + Trim(Copy(sResponce, 1, Pos('</', sResponce) - 1)));
      end
      else if sResponce = 'The service is unavailable.' then
        memLog.Lines.Add(sCall + '  [eQSL Upload check]: ' + sResponce)
      else if Pos('Cannot open URL', sResponce) > 0 then
        memLog.Lines.Add(sCall + '  [eQSL Upload check]: ' + 'Cannot open URL. Check internet connection.')
      else
      begin
        Delete(sResponce, 1, Pos('downloadedfiles', sResponce) - 1);
        EQSLUploadCheckURLContent := 'http://www.eqsl.cc/qslcard/' + Copy(sResponce, 1, Pos('"', sResponce) - 1);
        MsgWaitForSingleObject(thrEQSLUploadCheckContent.Execute(nil).Handle);
        sAdif.Text := EQSLUploadCheckContentResponce;
        if sAdif.Count > 6 then
          UpdateRecord;
      end;

    except
      on E: exception do
        memLog.Lines.Add(sCall + '  [eQSL Upload check]: ' + E.Message);
    end;
  end;

begin
  iCountUploadedCheckFromeQSL := 0;
  OldStationCall := '';
  memLog.Lines.Add(msgEQSLUploadCheck.Caption);
  pgProcessCurrent.Position := 0;
  pgProcessCurrent.Max := 0;
  pgProcess.Visible := False;
  Application.ProcessMessages;
  sAdif := TStringList.Create;
  try
    qryStations.Open;
    qryStations.SortedBy.Text := 'STATION_CALL ASC';
    qryStations.Sort;
    while not qryStations.Eof do
    begin
      if bGeneralBreak then
        BREAK;
      if OldStationCall <> qryStations.FieldByName('STATION_CALL').asString then
      begin
        if OldStationCall <> '' then
          GetADIFromServer;
        sLogin := qryStations.FieldByName('STATION_EQSL_LOGIN').asString;
        sCall := qryStations.FieldByName('STATION_CALL').asString;
        sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, qryStations.FieldByName('STATION_EQSL_PASSWORD').asString);
        sSelectQuery := '';
        OldStationCall := qryStations.FieldByName('STATION_CALL').asString;
      end;
      if sSelectQuery <> '' then
        sSelectQuery := sSelectQuery + ' UNION ALL ';
      sSelectQuery := sSelectQuery + 'SELECT "' + qryStations.FieldByName('STATION_BOOK_NAME').asString + '" as BOOK_NAME, "LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger)
        + '" as BOOK_TABLE_NAME, LOG_ID,LOG_CALL,LOG_QSO_DATETIME,LOG_BAND,LOG_MODE FROM LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger);
      qryStations.Next;
    end;
    GetADIFromServer;
  finally
    sAdif.Free;
    qryStations.close;
  end;
  if pgProcessCurrent.Max = 0 then
    pgProcessCurrent.Max := 1;
  pgProcessCurrent.Position := pgProcessCurrent.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgEQSLUploadCheckDone.Caption, [IntToStr(iCountUploadedCheckFromeQSL)]));
  dmMain.qryLog.Refresh;
end;

{ ********************************************** EQSL Upload ********************************************************* }

procedure TExchangeQSLServices.UploadEQSL;
var
  iSelCount, HighBound, i: integer;
  vSelRecords: variant;
  Bookmark: TBookmark;
  sConnectStr, sUserStr, sLogin, sPassword, sResponce, sCountExported, sError, sBook, sStationId: string;

  procedure UpdateRecord(LogId: integer);
  begin
    try
      qryUpdateQSL.Params.ParamByName('LOG_EQSL_QSLSDATE').Value := Date;
      qryUpdateQSL.Params.ParamByName('LOG_ID').AsInteger := LogId;
      qryUpdateQSL.ExecuteSQL;
    except
      on E: exception do
        memLog.Lines.Add(sBook + '  [eQSL Upload]: ' + E.Message);
    end;
  end;

  procedure UpdateServer;
  begin
    if bGeneralBreak then
      exit;
    try
      EQSLUploadURL := sConnectStr + StringReplace(UrlEncode(sUserStr + GetAdifRow(qryRecords, True)), ':', '%3A', [rfReplaceAll, rfIgnoreCase]);
      try
        MsgWaitForSingleObject(thrEQSLUpload.Execute(nil).Handle);
       // memLog.Lines.Add(sBook + '  [eQSL Upload]: ' + EQSLUploadResponce);
        sResponce := EQSLUploadResponce;
        if Pos('Error:', sResponce) > 0 then
        begin
          sError := sResponce;
          Delete(sError, 1, Pos('Error:', sError) + 6);
          sError := StringReplace(sError, #10, '', [rfReplaceAll]);
          sError := StringReplace(sError, #13, '', [rfReplaceAll]);
          memLog.Lines.Add(sBook + '  [eQSL Upload]: ' + Trim(Copy(sError, 1, Pos('<', sError) - 1)));
        end;
        if Pos('Cannot open URL', sResponce) > 0 then
        begin
          sError := sResponce;
          memLog.Lines.Add(sBook + '  [eQSL Upload]: ' + 'Cannot open URL. Check internet connection.');
        end;

        if Pos('Bad record', sResponce) > 0 then
        begin
          sError := sResponce;
          Delete(sError, 1, Pos('<BODY>', sError) + 6);
          sError := Copy(sError, 1, Pos('</', sError) - 1);
          sError := StringReplace(sError, #10, '', [rfReplaceAll]);
          sError := StringReplace(sError, #13, '', [rfReplaceAll]);
          sError := StringReplace(sError, '<BR>', ' ', [rfReplaceAll]);
          memLog.Lines.Add(sBook + '  [eQSL Upload]: ' + Trim(sError));
          if Pos('Duplicate', sError) > 0 then
            UpdateRecord(qryRecords.FieldByName('LOG_ID').AsInteger);
        end;

        sCountExported := sResponce;
        Delete(sCountExported, 1, Pos('Result:', sCountExported) + 7);
        sCountExported := Trim(Copy(sCountExported, 1, Pos('out', sCountExported) - 1));
        if sCountExported = '1' then
        begin
          UpdateRecord(qryRecords.FieldByName('LOG_ID').AsInteger);
          Inc(iCountUploadedToeQSL);
        end;
      except
        on E: exception do
          memLog.Lines.Add(sBook + ' [eQSL Upload]: ' + E.Message);
      end;
    finally
    end;
  end;

begin
  iCountUploadedToeQSL := 0;
  sConnectStr := 'http://www.eqsl.cc/qslcard/ImportADIF.cfm?ADIFData=';
  memLog.Lines.Add(msgEQSLUpload.Caption);
  if (TypeOperation = CA_EQSL_UPLOAD_UNEXPORTED) or (TypeOperation = CA_EQSL_UPLOAD_DOWNLOAD) then
  begin
    try
      qryStations.Open;
      pgProcess.Position := 0;
      pgProcess.Max := qryStations.RecordCount;
      pgProcessCurrent.Position := 0;
      pgProcessCurrent.Max := 0;
      pgProcess.Visible := True;
      Application.ProcessMessages;
      while not qryStations.Eof do
      begin
        if qryStations.FieldByName('STATION_EQSL_ACTIVE').AsInteger = 1 then
        begin
          try
            sLogin := qryStations.FieldByName('STATION_EQSL_LOGIN').asString;
            sBook := qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + qryStations.FieldByName('STATION_CALL').asString + ']';
            sStationId := IntToStr(qryStations.FieldByName('STATION_ID').AsInteger);
            sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, qryStations.FieldByName('STATION_EQSL_PASSWORD').asString);
            sUserStr := '<EQSL_USER:' + IntToStr(Length(sLogin)) + '>' + sLogin + '<EQSL_PSWD:' + IntToStr(Length(sPassword)) + '>' + sPassword + '<EOH>';
            qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + sStationId + ' SET LOG_EQSL_QSL_SENT=''Y'', LOG_EQSL_QSLSDATE=:LOG_EQSL_QSLSDATE WHERE LOG_ID=:LOG_ID';
            qryRecords.close;
            qryRecords.SQL.Text := 'SELECT * FROM LOG_' + sStationId + ' WHERE IIF(isNull(LOG_EQSL_QSL_SENT),''N'', LOG_EQSL_QSL_SENT) NOT IN (''Y'',''I'')';
            // qryRecords.SQL.SaveToFile('D:\!\!1.sql');
            qryRecords.Open;
            pgProcessCurrent.Position := 0;
            pgProcessCurrent.Max := qryRecords.RecordCount;
            Application.ProcessMessages;
            while not qryRecords.Eof do
            begin
              try
                UpdateServer;
                Application.ProcessMessages;
                qryRecords.Next;
              finally
                pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                Application.ProcessMessages;
              end;
            end;
          finally
            pgProcess.Position := pgProcess.Position + 1;
            Application.ProcessMessages;
          end;
        end;
        qryStations.Next;
      end;
    finally
      qryStations.close;
    end;
  end;

  if TypeOperation = CA_EQSL_UPLOAD_SELECTED then
  begin
    if SelectedAll then
      iSelCount := dmMain.qryLog.RecordCount
    else
    begin
      vSelRecords := SelectedRecords;
      iSelCount := TVarData(vSelRecords).VArray^.Bounds[0].ElementCount;
    end;

    if iSelCount > 0 then
    begin
      pgProcessCurrent.Position := 0;
      pgProcessCurrent.Max := 0;
      pgProcess.Visible := False;
      Application.ProcessMessages;

      dmMain.qryLog.DisableControls;
      Bookmark := dmMain.qryLog.GetBookmark;
      try
        pgProcessCurrent.Position := 0;
        pgProcessCurrent.Max := iSelCount;
        Application.ProcessMessages;
        sLogin := dmMain.qryStations.FieldByName('STATION_EQSL_LOGIN').asString;
        sBook := dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + dmMain.qryStations.FieldByName('STATION_CALL').asString + ']';
        sStationId := IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
        sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_EQSL_PASSWORD').asString);
        sUserStr := '<EQSL_USER:' + IntToStr(Length(sLogin)) + '>' + sLogin + '<EQSL_PSWD:' + IntToStr(Length(sPassword)) + '>' + sPassword + '<EOH>';
        qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + sStationId + ' SET LOG_EQSL_QSL_SENT=''Y'', LOG_EQSL_QSLSDATE=:LOG_EQSL_QSLSDATE WHERE LOG_ID=:LOG_ID';
        qryRecords.close;
        qryRecords.SQL.Text := 'SELECT * FROM LOG_' + sStationId + ' WHERE IIF(isNull(LOG_EQSL_QSL_SENT),''N'', LOG_EQSL_QSL_SENT) NOT IN (''Y'',''I'')';
        qryRecords.Open;
        try
          if SelectedAll then
          begin
            qryRecords.First;
            while not qryRecords.Eof do
            begin
              try
                UpdateServer;
              finally
                pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                Application.ProcessMessages;
                qryRecords.Next;
              end;
            end;
          end
          else
          begin
            i := VarArrayLowBound(vSelRecords, 1);
            HighBound := VarArrayHighBound(vSelRecords, 1);
            while i <= HighBound do
            begin
              try
                qryRecords.First;
                if not qryRecords.Locate('LOG_ID', vSelRecords[i], []) then
                begin
                  Inc(i);
                  continue;
                end;
                UpdateServer;
                Inc(i);
              finally
                pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                Application.ProcessMessages;
              end;
            end;
          end;
        except
          on E: exception do
            memLog.Lines.Add(sBook + '  [eQSL Upload]: ' + E.Message);
        end;
      finally
        if dmMain.qryLog.BookmarkValid(Bookmark) then
          dmMain.qryLog.GotoBookmark(Bookmark);
        dmMain.qryLog.FreeBookmark(Bookmark);
        dmMain.qryLog.EnableControls;
      end;
    end;
    vSelRecords := Unassigned;
  end;
  if pgProcess.Max = 0 then
    pgProcess.Max := 1;
  pgProcess.Position := pgProcess.Max;
  if pgProcessCurrent.Max = 0 then
    pgProcessCurrent.Max := 1;
  pgProcessCurrent.Position := pgProcessCurrent.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgEQSLUploadDone.Caption, [IntToStr(iCountUploadedToeQSL)]));
  dmMain.qryLog.Refresh;
end;

procedure TExchangeQSLServices.btnCloseClick(Sender: TObject);
begin
  bGeneralBreak := True;
  if not bRunProcess then
    close;
end;

{ ********************************************** DQSL Upload ********************************************************* }

procedure TExchangeQSLServices.UploadDQSL;
var
  sCall, sEmailTo: string;
  i, j: integer;
  Attach: TidAttachmentFile;
  iCountUploadedToDQSL: integer;
  sBook: string;
  iSelCount, HighBound: integer;
  vSelRecords: variant;
  Bookmark: TBookmark;
  pi: integer;
  bMasterDatafound: boolean;

  procedure UpdateRecords(LogId: integer);
  begin
    try
      qryUpdateQSL.Params.ParamByName('LOG_DQSL_QSLSDATE').Value := Date;
      qryUpdateQSL.Params.ParamByName('LOG_ID').Value := LogId;
      qryUpdateQSL.ExecuteSQL;
      Inc(iCountUploadedToDQSL);
    except
      on E: exception do
        memLog.Lines.Add(sCall + '  [dQSL Upload]: ' + E.Message);
    end;
  end;

begin
  sCall := '';
  bMasterDatafound := False;
  iCountUploadedToDQSL := 0;
  memLog.Lines.Add(msgDQSLUpload.Caption);
  dmMain.frxJPEGExport.ShowDialog := False;
  dmMain.frxJPEGExport.ShowProgress := False;
  dmMain.frxJPEGExport.JPEGQuality := Options.seJPEGQuality.Value;
  dmMain.frxJPEGExport.Resolution := Options.seJPEGDPI.Value;

  if (TypeOperation = CA_DQSL_UPLOAD_UNEXPORTED) or (TypeOperation = CA_DQSL_UPLOAD_DOWNLOAD) then
  begin
    qryStations.Open;
    try
      pgProcess.Position := 0;
      pgProcess.Max := qryStations.RecordCount;
      pgProcess.Visible := True;
      pgProcessCurrent.Position := 0;
      pgProcessCurrent.Max := 0;
      Application.ProcessMessages;
      while not qryStations.Eof do
      begin
        if bGeneralBreak then
          BREAK;

        if qryStations.FieldByName('STATION_DQSL_ACTIVE').AsInteger = 1 then
        begin
          sBook := qryStations.FieldByName('STATION_BOOK_NAME').asString;
          DQSLBookId := qryStations.FieldByName('STATION_ID').AsInteger;
          if Trim(qryStations.FieldByName('STATION_DQSL_DEFAULT_TEMPLATE').asString) = '' then
          begin
            memLog.Lines.Add(sBook + '  [dQSL Upload]: STATION_DQSL_DEFAULT_TEMPLATE is null');
            pgProcess.Position := pgProcess.Position + 1;
            Application.ProcessMessages;
            qryStations.Next;
            continue;
          end;

          try
            qryRecords.close;
            qryRecords.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger) + ' WHERE LOG_EMAIL IS NOT NULL AND LOG_DQSL_QSL_SENT=''N'' ORDER BY LOG_CALL';
            qryRecords.Open;
            if qryRecords.RecordCount > 0 then
            begin
              pgProcessCurrent.Position := 0;
              pgProcessCurrent.Max := qryRecords.RecordCount;
              Application.ProcessMessages;
              try
                qryUpdateQSL.close;
                if bGeneralBreak then
                  BREAK;
                qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger) + ' SET LOG_DQSL_QSL_SENT=''Y'', LOG_DQSL_QSLSDATE=:LOG_DQSL_QSLSDATE WHERE LOG_ID = :LOG_ID';
                smtpSendMail.Host := qryStations.FieldByName('STATION_DQSL_SMTP_HOST').asString;
                smtpSendMail.Port := qryStations.FieldByName('STATION_DQSL_SMTP_PORT').AsInteger;
                smtpSendMail.Username := qryStations.FieldByName('STATION_DQSL_MAIL_USERNAME').asString;
                smtpSendMail.Password := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, qryStations.FieldByName('STATION_DQSL_MAIL_PASSWORD').asString);
                smtpSendMail.Connect;
                dmMain.cdsPrintQSL.EmptyTable;
                dmMain.cdsPrintQSL.Open;
                dmMain.Report.Clear;
                dmMain.Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Reports\QSL\' + qryStations.FieldByName('STATION_DQSL_DEFAULT_TEMPLATE').asString + '.fr3');
                if dmMain.Report.PagesCount = 0 then
                  raise exception.Create('Error report Page not found');
                for pi := 0 to dmMain.Report.ComponentCount - 1 do
                begin
                  if dmMain.Report.Components[pi] is TfrxMasterData then
                  begin
                    bMasterDatafound := True;
                    BREAK;
                  end;
                end;
                if not bMasterDatafound then
                  raise exception.Create('Error report MasterData band not found');

                while not qryRecords.Eof do
                begin
                  try
                    if bGeneralBreak then
                      BREAK;
                    DQSLCall := qryRecords.FieldByName('LOG_CALL').asString;
                    DQSLEmailTo := qryRecords.FieldByName('LOG_EMAIL').asString;
                    dmMain.cdsPrintQSL.Open;
                    dmMain.cdsPrintQSL.Append;

                    for i := 0 to qryRecords.FieldCount - 1 do
                      if qryRecords.Fields[i].FieldName = 'LOG_BAND_MHZ' then
                        dmMain.cdsPrintQSL.Fields[i].Value := SimpleRoundTo(qryRecords.Fields[i].asFloat, -3)
                      else
                        dmMain.cdsPrintQSL.Fields[i].Value := qryRecords.Fields[i].Value;

                    dmMain.cdsPrintQSL.Post;

                    if Options.cbDQSLSentIdentifier.Checked then
                      DQSLSubjectIdentifier := 'dQSL[' + DQSLCall + ':' + FormatDateTime('yyyymmddhhnn', qryRecords.FieldByName('LOG_QSO_DATETIME').asDateTime) + ':' + qryRecords.FieldByName('LOG_BAND').asString + ':' + qryRecords.FieldByName('LOG_MODE')
                        .asString + ']'
                    else
                      DQSLSubjectIdentifier := '';

                    DQSLFileName := ExtractFilePath(Application.ExeName) + 'Data\Temp\' + 'dQSL_' + StringReplace(DQSLCall, '/', '!', [rfReplaceAll]);
                    dmMain.Report.PrepareReport(True);
                    dmMain.frxJPEGExport.FileName := DQSLFileName;
                    dmMain.Report.Export(dmMain.frxJPEGExport);

                    MsgWaitForSingleObject(thrDQSLUpload.Execute(nil).Handle);
                    if DQSLUploadMessageResult then
                      UpdateRecords(qryRecords.FieldByName('LOG_ID').AsInteger);
                  finally
                    pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                    Application.ProcessMessages;
                    dmMain.cdsPrintQSL.EmptyTable;
                    dmMain.cdsPrintQSL.close;
                    qryRecords.Next;
                  end;
                end;
                dmMain.cdsPrintQSL.EmptyTable;
                dmMain.cdsPrintQSL.close;

              except
                on E: exception do
                begin
                  if not smtpSendMail.Connected and (Trim(E.Message) = '') then
                    memLog.Lines.Add(sBook + '  [dQSL Upload]: ' + msgDQSLConnectError.Caption)
                  else
                    memLog.Lines.Add(sBook + '  [dQSL Upload]: ' + E.Message);
                end;
              end;
              if smtpSendMail.Connected then
                smtpSendMail.Disconnect;
            end;
          finally
            pgProcess.Position := pgProcess.Position + 1;
            Application.ProcessMessages;
          end;
        end;
        qryStations.Next;
      end;
    finally
      qryRecords.close;
      qryStations.close;
    end;
  end;

  if TypeOperation = CA_DQSL_UPLOAD_SELECTED then
  begin
    if Trim(dmMain.qryStations.FieldByName('STATION_DQSL_DEFAULT_TEMPLATE').asString) = '' then
    begin
      memLog.Lines.Add(sBook + '  [dQSL Upload]: STATION_DQSL_DEFAULT_TEMPLATE is null');
      if pgProcess.Max = 0 then
        pgProcess.Max := 1;
      pgProcess.Position := pgProcess.Max;
      pgProcess.Visible := False;
      pgProcessCurrent.Position := pgProcess.Position;
      pgProcessCurrent.Max := pgProcess.Max;
      Application.ProcessMessages;
      memLog.Lines.Add(Format(msgDQSLUploadDone.Caption, [IntToStr(iCountUploadedToDQSL)]));
      exit;
    end;
    sBook := dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString;
    DQSLBookId := dmMain.qryStations.FieldByName('STATION_ID').AsInteger;

    if SelectedAll then
      iSelCount := dmMain.qryLog.RecordCount
    else
    begin
      vSelRecords := SelectedRecords;
      if VarType(vSelRecords) = varEmpty then
        iSelCount := 0
      else
        iSelCount := TVarData(vSelRecords).VArray^.Bounds[0].ElementCount;
    end;

    if iSelCount > 0 then
    begin
      cdsLog.EmptyTable;
      cdsLog.Open;
      dmMain.qryLog.DisableControls;
      Bookmark := dmMain.qryLog.GetBookmark;
      try
        pgProcess.Position := 0;
        pgProcess.Max := iSelCount;
        Application.ProcessMessages;
        smtpSendMail.Host := dmMain.qryStations.FieldByName('STATION_DQSL_SMTP_HOST').asString;
        smtpSendMail.Port := dmMain.qryStations.FieldByName('STATION_DQSL_SMTP_PORT').AsInteger;
        smtpSendMail.Username := dmMain.qryStations.FieldByName('STATION_DQSL_MAIL_USERNAME').asString;
        smtpSendMail.Password := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_DQSL_MAIL_PASSWORD').asString);
        try
          if SelectedAll then
          begin
            dmMain.qryLog.First;
            while not dmMain.qryLog.Eof do
            begin
              try
                if bGeneralBreak then
                  BREAK;
                if not dmMain.qryLog.FieldByName('LOG_EMAIL').IsNull then
                begin
                  cdsLog.Append;
                  for i := 0 to dmMain.qryLog.FieldCount - 1 do
                    if dmMain.qryLog.Fields[i].FieldName = 'LOG_BAND_MHZ' then
                      cdsLog.Fields[i].Value := SimpleRoundTo(dmMain.qryLog.Fields[i].asFloat, -3)
                    else
                      cdsLog.Fields[i].Value := dmMain.qryLog.Fields[i].Value;
                  cdsLog.Post;
                end;
              finally
                pgProcess.Position := pgProcess.Position + 1;
                pgProcessCurrent.Position := pgProcess.Position;
                Application.ProcessMessages;
                dmMain.qryLog.Next;
              end;
            end;
          end
          else
          begin
            qryRecords.close;
            qryRecords.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(DQSLBookId) + ' WHERE LOG_EMAIL IS NOT NULL ORDER BY LOG_CALL';
            qryRecords.Open;
            i := VarArrayLowBound(vSelRecords, 1);
            HighBound := VarArrayHighBound(vSelRecords, 1);
            while i <= HighBound do
            begin
              try
                if bGeneralBreak then
                  BREAK;
                qryRecords.First;
                if not qryRecords.Locate('LOG_ID', vSelRecords[i], []) then
                begin
                  Inc(i);
                  continue;
                end;
                cdsLog.Append;

                for j := 0 to qryRecords.FieldCount - 1 do
                begin
                  if qryRecords.Fields[j].FieldName = 'LOG_BAND_MHZ' then
                    cdsLog.Fields[j].Value := SimpleRoundTo(qryRecords.Fields[j].asFloat, -3)
                  else
                    cdsLog.Fields[j].Value := qryRecords.Fields[j].Value;
                end;
                { cdsLog.FieldByName('LOG_ID').Value:= qryRecords.FieldByName('LOG_ID').Value;
                  cdsLog.FieldByName('LOG_CALL').Value:= qryRecords.FieldByName('LOG_CALL').Value;
                  cdsLog.FieldByName('LOG_QSO_DATE').Value:= qryRecords.FieldByName('LOG_QSO_DATE').Value;
                  cdsLog.FieldByName('LOG_QSL_RCVD').Value:= qryRecords.FieldByName('LOG_QSL_RCVD').Value;
                  cdsLog.FieldByName('LOG_QSL_SENT').Value:= qryRecords.FieldByName('LOG_QSL_SENT').Value;

                  cdsLog.FieldByName('LOG_EQSL_QSL_RCVD').Value:= qryRecords.FieldByName('LOG_EQSL_QSL_RCVD').Value;
                  cdsLog.FieldByName('LOG_EQSL_QSL_SENT').Value:= qryRecords.FieldByName('LOG_EQSL_QSL_SENT').Value;
                  cdsLog.FieldByName('LOG_DQSL_QSL_RCVD').Value:= qryRecords.FieldByName('LOG_DQSL_QSL_RCVD').Value;
                  cdsLog.FieldByName('LOG_DQSL_QSL_SENT').Value:= qryRecords.FieldByName('LOG_DQSL_QSL_SENT').Value;
                  cdsLog.FieldByName('LOG_LOTW_QSL_RCVD').Value:= qryRecords.FieldByName('LOG_LOTW_QSL_RCVD').Value;
                  cdsLog.FieldByName('LOG_LOTW_QSL_SENT').Value:= qryRecords.FieldByName('LOG_LOTW_QSL_SENT').Value; }

                cdsLog.Post;
                Inc(i);
              finally
                { pgProcess.Position := pgProcess.Position + 1;
                  pgProcessCurrent.Position := pgProcess.Position;
                  Application.ProcessMessages; }
              end;
            end;
          end;

          // Start upload;
          if cdsLog.RecordCount > 0 then
          begin
            pgProcess.Max := cdsLog.RecordCount;
            pgProcessCurrent.Max := cdsLog.RecordCount;
            Application.ProcessMessages;
            try
              qryUpdateQSL.close;
              qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger) + ' SET LOG_DQSL_QSL_SENT=''Y'', LOG_DQSL_QSLSDATE=:LOG_DQSL_QSLSDATE WHERE LOG_ID=:LOG_ID';
              dmMain.cdsPrintQSL.EmptyTable;
              dmMain.cdsPrintQSL.Open;
              dmMain.Report.Clear;
              dmMain.Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\Reports\QSL\' + dmMain.qryStations.FieldByName('STATION_DQSL_DEFAULT_TEMPLATE').asString + '.fr3');
              if dmMain.Report.PagesCount = 0 then
                raise exception.Create('Error report Page not found');
              for pi := 0 to dmMain.Report.ComponentCount - 1 do
              begin
                if dmMain.Report.Components[pi] is TfrxMasterData then
                begin
                  bMasterDatafound := True;
                  BREAK;
                end;
              end;
              if not bMasterDatafound then
                raise exception.Create('Error report MasterData band not found');
              cdsLog.SortOnFields('LOG_CALL', False, False);
              cdsLog.First;
              smtpSendMail.Connect;
              cdsLog.First;
              while not cdsLog.Eof do
              begin
                try
                  DQSLCall := cdsLog.FieldByName('LOG_CALL').asString;
                  DQSLEmailTo := cdsLog.FieldByName('LOG_EMAIL').asString;
                  dmMain.cdsPrintQSL.Open;
                  dmMain.cdsPrintQSL.Append;
                  for i := 0 to cdsLog.FieldCount - 1 do
                    dmMain.cdsPrintQSL.Fields[i].Value := cdsLog.Fields[i].Value;
                  dmMain.cdsPrintQSL.Post;

                  if Options.cbDQSLSentIdentifier.Checked then
                    DQSLSubjectIdentifier := 'dQSL[' + DQSLCall + ':' + FormatDateTime('yyyymmddhhnn', cdsLog.FieldByName('LOG_QSO_DATETIME').asDateTime) + ':' + cdsLog.FieldByName('LOG_BAND').asString + ':' + cdsLog.FieldByName('LOG_MODE').asString + ']'
                  else
                    DQSLSubjectIdentifier := '';

                  DQSLFileName := ExtractFilePath(Application.ExeName) + 'Data\Temp\' + 'dQSL_' + StringReplace(DQSLCall, '/', '!', [rfReplaceAll]);
                  dmMain.Report.PrepareReport(True);
                  dmMain.frxJPEGExport.FileName := DQSLFileName;
                  // dmMain.frxJPEGExport.JPEGQuality:=100;
                  // dmMain.frxJPEGExport.Resolution := 300;
                  dmMain.Report.Export(dmMain.frxJPEGExport);
                  MsgWaitForSingleObject(thrDQSLUpload.Execute(nil).Handle);
                  if DQSLUploadMessageResult then
                    UpdateRecords(cdsLog.FieldByName('LOG_ID').AsInteger);
                finally
                  dmMain.cdsPrintQSL.EmptyTable;
                  dmMain.cdsPrintQSL.close;
                  pgProcess.Position := pgProcess.Position + 1;
                  pgProcessCurrent.Position := pgProcess.Position;
                  Application.ProcessMessages;
                  cdsLog.Next;
                end;
              end;
              cdsLog.EmptyTable;
            except
              on E: exception do
              begin
                if not smtpSendMail.Connected and (Trim(E.Message) = '') then
                  memLog.Lines.Add(sBook + '  [dQSL Upload]: ' + msgDQSLConnectError.Caption)
                else
                  memLog.Lines.Add(sBook + '  [dQSL Upload]: ' + E.Message);
              end;
            end;
          end;
        except
          on E: exception do
            memLog.Lines.Add(sBook + '  [dQSL Upload]: ' + E.Message);
        end;
      finally
        if dmMain.qryLog.BookmarkValid(Bookmark) then
          dmMain.qryLog.GotoBookmark(Bookmark);
        dmMain.qryLog.FreeBookmark(Bookmark);
        dmMain.qryLog.EnableControls;
      end;
    end;
    vSelRecords := Unassigned;
  end;

  if pgProcess.Max = 0 then
    pgProcess.Max := 1;
  pgProcess.Position := pgProcess.Max;
  if pgProcessCurrent.Max = 0 then
    pgProcessCurrent.Max := 1;
  pgProcessCurrent.Position := pgProcessCurrent.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgDQSLUploadDone.Caption, [IntToStr(iCountUploadedToDQSL)]));
  dmMain.qryLog.Refresh;
  dmMain.frxJPEGExport.ShowDialog := True;
  dmMain.frxJPEGExport.ShowProgress := True;
  dmMain.frxJPEGExport.JPEGQuality := 90;
  dmMain.frxJPEGExport.Resolution := 96;
end;

function TExchangeQSLServices.UploadDQSLMessage: boolean;
var
  sFileName: string;
  sr: TSearchRec;
  FileAttrs: integer;
  Attach: TidAttachmentFile;
  txt: TIdText;
  slFiles: TStringList;
  i: integer;
begin
  Result := False;
  if bGeneralBreak then
    exit;

  mesgMessage.Clear;
  mesgMessage.From.Text := Trim(dmMain.Report.ReportOptions.Author);
  mesgMessage.Recipients.Add.Text := Trim(DQSLEmailTo);
  mesgMessage.Subject := Trim(dmMain.Report.ReportOptions.Name) + ' ' + DQSLSubjectIdentifier;
  mesgMessage.Body.Text := dmMain.Report.ReportOptions.Description.Text;
  FileAttrs := faAnyFile;

  if FileExists(DQSLFileName + '.1.jpg') then
    Attach := TidAttachmentFile.Create(mesgMessage.MessageParts, DQSLFileName + '.1.jpg')
  else
  begin
    memLog.Lines.Add(DQSLCall + '  [dQSL Upload]: Error read file - ' + DQSLFileName + '.1.jpg');
    Result := False;
    exit;
  end;

  try
    try
      smtpSendMail.Send(mesgMessage);
      Result := True;
    except
      on E: exception do
        memLog.Lines.Add(DQSLCall + '  [dQSL Upload]: ' + E.Message);
    end;
  finally
    slFiles := TStringList.Create;
    try
      FindFilesByMask(slFiles, ExtractFilePath(Application.ExeName) + 'Data\Temp', '*.jpg');
      for i := 0 to slFiles.Count - 1 do
      begin
        DeleteFile(slFiles.Strings[i]);
      end;
    finally
      slFiles.Free;
    end;
    FreeAndNil(Attach);
  end;

end;

{ ********************************************** DQSL Download ********************************************************* }

procedure TExchangeQSLServices.DownloadDQSL;
var
  MessageCount, i, j: integer;
  MailCount: integer;
  iPosIdentifierStart, iPosIdentifierEnd: integer;
  sIdentifier: string;
  sStationId, sLogId: string;
  CallInfo: TCallInfo;
  sCall, sDir, sFile: string;
  iCountDownloadedToDQSL: integer;
  sBook: string;
  bPopConnected: boolean;
  slIdentifier: TStringList;
  sinCall, sinDateTime, sinBand, sinMode: string;
  dDateFrom, dDateTo, dDate: TDateTime;
  sldQSLMailList: TStringList;
  iRowAffectedImage: integer;

  procedure UpdateRecords;
  begin
    try
      Inc(iCountDownloadedToDQSL);
      qryUpdateQSL.Params.ParamByName('LOG_DQSL_QSLRDATE').Value := Date;
      qryUpdateQSL.ExecuteSQL;
    except
      on E: exception do
        memLog.Lines.Add(sCall + '  [dQSL Download]: ' + E.Message);
    end;
  end;

begin
  iCountDownloadedToDQSL := 0;
  memLog.Lines.Add(msgDQSLDownload.Caption);
  sldQSLMailList := TStringList.Create;
  qryStations.Open;
  try
    pgProcess.Position := 0;
    pgProcessCurrent.Position := 0;
    pgProcessCurrent.Max := 0;
    pgProcess.Max := qryStations.RecordCount;
    pgProcess.Visible := True;
    Application.ProcessMessages;
    while not qryStations.Eof do
    begin
      if bGeneralBreak then
        BREAK;
      if qryStations.FieldByName('STATION_DQSL_ACTIVE').AsInteger = 1 then
      begin
        try
          try
            sldQSLMailList.Clear;
            sBook := qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + qryStations.FieldByName('STATION_CALL').asString + ']';
            popReceiveMail.Host := qryStations.FieldByName('STATION_DQSL_POP_HOST').asString;
            popReceiveMail.Port := qryStations.FieldByName('STATION_DQSL_POP_PORT').AsInteger;
            popReceiveMail.Username := qryStations.FieldByName('STATION_DQSL_MAIL_USERNAME').asString;
            popReceiveMail.Password := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, qryStations.FieldByName('STATION_DQSL_MAIL_PASSWORD').asString);
            bPopConnected := False;
            popReceiveMail.Connect;
            bPopConnected := True;

            if popReceiveMail.Connected then
            begin
              MailCount := popReceiveMail.CheckMessages;
              if MailCount > 0 then
                for i := 1 to MailCount do
                begin
                  if bGeneralBreak then
                    BREAK;
                  try
                    popReceiveMail.RetrieveHeader(i, mesgMessage);
                    iPosIdentifierStart := Pos('DQSL[', UpperCase(mesgMessage.Subject));
                    if iPosIdentifierStart > 0 then
                    begin
                      { --------- Parse identifier header------------------------ }
                      iPosIdentifierEnd := Pos(']', mesgMessage.Subject);
                      if not iPosIdentifierEnd > 0 then
                      begin
                        memLog.Lines.Add(sBook + '  [dQSL Download]: Bad identifier in subject - ' + mesgMessage.Subject);
                        pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                        Application.ProcessMessages;
                        continue;
                      end;
                      sIdentifier := Copy(mesgMessage.Subject, iPosIdentifierStart, iPosIdentifierEnd);
                      Delete(sIdentifier, 1, 5);
                      Delete(sIdentifier, Length(sIdentifier), 1);
                      sldQSLMailList.Add(IntToStr(i) + '=' + sIdentifier);
                    end;
                  except
                    on E: exception do
                      memLog.Lines.Add(sBook + '  [dQSL Download]: ' + E.Message);
                  end;
                end;

              { --------- Parse identifier ------------------------ }
              if sldQSLMailList.Count > 0 then
              begin
                pgProcessCurrent.Position := 0;
                pgProcessCurrent.Max := sldQSLMailList.Count;
                Application.ProcessMessages;
                for i := 0 to sldQSLMailList.Count - 1 do
                begin
                  try
                    slIdentifier := TStringList.Create;
                    try
                      slIdentifier.Delimiter := ':';
                      slIdentifier.DelimitedText := sldQSLMailList.Values[sldQSLMailList.Names[i]];
                      sinCall := '';
                      if slIdentifier.Count < 3 then
                        memLog.Lines.Add(sBook + '  [dQSL Download]: Error parse identifier in subject - ' + mesgMessage.Subject)
                      else
                      begin
                        sinCall := slIdentifier.Strings[0];
                        sinDateTime := slIdentifier.Strings[1];
                        sinBand := slIdentifier.Strings[2];
                        sinMode := slIdentifier.Strings[3];
                      end;
                    finally
                      slIdentifier.Free;
                    end;

                    if sinCall = '' then
                    begin
                      pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                      Application.ProcessMessages;
                      continue;
                    end;
                    { --------- Get QSO ------------------------ }
                    try
                      qryRecords.close;
                      qryRecords.SQL.Text := 'SELECT LOG_QSO_DATETIME,LOG_ID,LOG_CALL,LOG_BAND,LOG_MODE FROM LOG_' + qryStations.FieldByName('STATION_ID').asString +
                        ' WHERE LOG_CALL=:LOG_CALL AND LOG_QSO_DATETIME BETWEEN :DATEFROM AND :DATETO AND LOG_BAND=:BAND AND LOG_MODE=:MODE';
                      dDate := EncodeDateTime(StrToInt(Copy(sinDateTime, 1, 4)), StrToInt(Copy(sinDateTime, 5, 2)), StrToInt(Copy(sinDateTime, 7, 2)), StrToInt(Copy(sinDateTime, 9, 2)), StrToInt(Copy(sinDateTime, 11, 2)), 0, 0);
                      dDateFrom := IncMinute(dDate, -3);
                      qryRecords.Params.ParamByName('DATEFROM').Value := dDateFrom;
                      dDateTo := IncMinute(dDate, 3);
                      qryRecords.Params.ParamByName('DATETO').Value := dDateTo;
                      qryRecords.Params.ParamByName('LOG_CALL').asString := QuotedStr(sinCall);
                      qryRecords.Params.ParamByName('BAND').asString := QuotedStr(sinBand);
                      qryRecords.Params.ParamByName('MODE').asString := QuotedStr(sinMode);
                      qryRecords.Open;
                      if qryRecords.RecordCount > 0 then
                      begin
                        qryUpdateQSL.close;
                        qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + qryStations.FieldByName('STATION_ID').asString + ' SET LOG_DQSL_QSL_RCVD=''Y'', LOG_DQSL_QSLRDATE=:LOG_DQSL_QSLRDATE WHERE LOG_ID=' + IntToStr(qryRecords.FieldByName('LOG_ID').AsInteger);
                        // Загрузка мыла
                        DQSLMessageId := StrToInt(sldQSLMailList.Names[i]);
                        MsgWaitForSingleObject(thrDQSLDownload.Execute(nil).Handle);
                        if DQSLDownloadMessageResult then
                        begin
                          qryQSLImageFiles.SQL.Text := 'UPDATE QSL_IMAGE_FILES SET IMAGE_DQSL_FILENAME=' + QuotedStr(DQSLImageFileName) + ' WHERE STATION_ID=' + qryStations.FieldByName('STATION_ID').asString + ' AND LOG_ID=' + IntToStr
                            (qryRecords.FieldByName('LOG_ID').AsInteger);
                          try
                            iRowAffectedImage := qryQSLImageFiles.ExecuteSQL;
                            if iRowAffectedImage = 0 then
                            begin
                              qryQSLImageFiles.SQL.Text := 'INSERT INTO QSL_IMAGE_FILES (STATION_ID,LOG_ID,IMAGE_DQSL_FILENAME) VALUES(' + qryStations.FieldByName('STATION_ID').asString + ',' + IntToStr(qryRecords.FieldByName('LOG_ID').AsInteger)
                                + ',' + QuotedStr(DQSLImageFileName) + ')';
                              qryQSLImageFiles.ExecuteSQL;
                            end;
                            UpdateRecords;
                          except
                            on E: exception do
                              memLog.Lines.Add(sCall + '  [dQSL Download]: ' + E.Message);
                          end;
                          popReceiveMail.Delete(DQSLMessageId);
                        end;
                      end
                      else
                      begin
                        memLog.Lines.Add(sBook + '  [dQSL Download]: QSO not found - ' + sIdentifier);
                      end;
                    except
                      on E: exception do
                        memLog.Lines.Add(sBook + '  [dQSL Download]: QSO not found - Station:' + sLogId + ' LogId:' + sLogId);
                    end;
                  finally
                    pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                    Application.ProcessMessages;
                  end;
                end;
              end;
            end;

            if popReceiveMail.Connected then
              popReceiveMail.Disconnect;
          except
            on E: exception do
            begin
              if not popReceiveMail.Connected and (Trim(E.Message) = '') then
                memLog.Lines.Add(sBook + '  [dQSL Download]: ' + msgDQSLConnectError.Caption)
              else
                memLog.Lines.Add(sBook + '  [dQSL Download]: ' + E.Message);
            end;
          end;
        finally
          pgProcess.Position := pgProcess.Position + 1;
          Application.ProcessMessages;
          if bPopConnected then
            popReceiveMail.Disconnect;
        end;
      end;
      qryStations.Next;
    end;
  finally
    sldQSLMailList.Free;
    qryRecords.close;
    qryStations.close;
  end;

  if pgProcess.Max = 0 then
    pgProcess.Max := 1;
  pgProcess.Position := pgProcess.Max;
  pgProcessCurrent.Max := pgProcess.Max;
  pgProcessCurrent.Position := pgProcess.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgDQSLDownloadDone.Caption, [IntToStr(iCountDownloadedToDQSL)]));
  dmMain.qryLog.Refresh;
end;

function TExchangeQSLServices.DownloadDQSLMessage: boolean;
var
  j: integer;
  sCall, sFile, sDir: string;
  // CallInfo: TCallInfo;
begin
  Result := False;
  if bGeneralBreak then
    exit;
  popReceiveMail.Retrieve(DQSLMessageId, mesgMessage);
  for j := 0 to Pred(mesgMessage.MessageParts.Count) do
  begin
    if (mesgMessage.MessageParts.Items[j] is TidAttachmentFile) then
    begin
      try
        sCall := qryRecords.FieldByName('LOG_CALL').asString;
        // CallInfo := MainWindow.GetPrefixData(sCall);
        sFile := StringReplace(sCall, '/', '!', [rfReplaceAll]) + '_' + qryRecords.FieldByName('LOG_BAND').asString + '_' + qryRecords.FieldByName('LOG_MODE').asString + '_' + FormatDateTime('yyyymmddhhnn',
          qryRecords.FieldByName('LOG_QSO_DATETIME').asDateTime) + '.jpg';
        sDir := Options.GetDQSLDirectory;
        if not DirectoryExists(sDir) then
          ForceDirectories(sDir);
        DQSLImageFileName := sFile;
        TidAttachmentFile(mesgMessage.MessageParts.Items[j]).SaveToFile(sDir + sFile);
        memLog.Lines.Add('[dQSL Download]: ' + sCall);
        Result := True;
      except
        on E: exception do
          memLog.Lines.Add(sCall + '  [dQSL Download]: ' + E.Message)
      end;
    end;
  end;
end;

procedure TExchangeQSLServices.UploadLOTW;
var
  Reg: TRegistry;
  InstallPath: string;
  iCountUploadedToLoTW: integer;
  slAdif: TStringList;
  slLogId: TStringList;
  sLogin, sPassword, sBook, sStationId, sHome: string;
  sFileName: string;
  si: TStartupInfo;
  pi: TProcessInformation;
  Multi: Tidmultipartformdatastream;
  HTTP: TIdHTTP;
  iSelCount, HighBound, i: integer;
  vSelRecords: variant;
  Bookmark: TBookmark;
begin
  Reg := TRegistry.Create;
  with Reg do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('SOFTWARE\TrustedQSL\TQSLCert', True);
    InstallPath := ReadString('InstallPath');
    CloseKey;
    Free;
  end;
  iCountUploadedToLoTW := 0;
  // sConnectStr := 'http://www.eqsl.cc/qslcard/ImportADIF.cfm?ADIFData=';
  memLog.Lines.Add(msgLOTWUpload.Caption);
  if InstallPath <> '' then
  begin
    if (TypeOperation = CA_LOTW_UPLOAD_UNEXPORTED) or (TypeOperation = CA_LOTW_UPLOAD_DOWNLOAD) then
    begin
      try
        qryStations.Open;
        pgProcess.Position := 0;
        pgProcess.Max := qryStations.RecordCount;
        pgProcessCurrent.Position := 0;
        pgProcessCurrent.Max := 0;
        pgProcess.Visible := True;
        Application.ProcessMessages;
        slAdif := TStringList.Create;
        while not qryStations.Eof do
        begin
          if bGeneralBreak then
            BREAK;
          try
            if qryStations.FieldByName('STATION_LOTW_ACTIVE').AsInteger = 1 then
            begin
              slAdif.Clear;
              sLogin := qryStations.FieldByName('STATION_LOTW_LOGIN').asString;
              sHome := qryStations.FieldByName('STATION_LOTW_HOME').asString;
              sBook := qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + qryStations.FieldByName('STATION_CALL').asString + ']';
              sStationId := IntToStr(qryStations.FieldByName('STATION_ID').AsInteger);
              sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, qryStations.FieldByName('STATION_LOTW_PASSWORD').asString);
              // sUserStr := '<EQSL_USER:' + IntToStr(Length(sLogin)) + '>' + sLogin + '<EQSL_PSWD:' + IntToStr(Length(sPassword)) + '>' + sPassword + '<EOH>';
              qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + sStationId + ' SET LOG_LOTW_QSL_SENT=''Y'', LOG_LOTW_QSLSDATE=:LOG_LOTW_QSLSDATE WHERE IIF(isNull(LOG_LOTW_QSL_SENT),''N'', LOG_LOTW_QSL_SENT) NOT IN (''Y'',''I'')';

              qryRecords.close;
              qryRecords.SQL.Text := 'SELECT * FROM LOG_' + sStationId + ' WHERE IIF(isNull(LOG_LOTW_QSL_SENT),''N'', LOG_LOTW_QSL_SENT) NOT IN (''Y'',''I'')';
              // qryRecords.SQL.SaveToFile('D:\!\!1.sql');
              qryRecords.Open;
              if qryRecords.RecordCount > 0 then
              begin
                pgProcessCurrent.Position := 0;
                pgProcessCurrent.Max := qryRecords.RecordCount;
                Application.ProcessMessages;
                while not qryRecords.Eof do
                begin
                  try
                    if bGeneralBreak then
                      BREAK;
                    // UpdateServer;
                    slAdif.Add(GetAdifRow(qryRecords, True));
                    Application.ProcessMessages;
                    qryRecords.Next;
                  finally
                    pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                    Application.ProcessMessages;
                  end;
                end;
                if bGeneralBreak then
                  exit;

                sFileName := ExtractFilePath(Application.ExeName) + 'Data\Temp\lotw_upload_' + FormatDateTime('yyyymmddhhnnss', now) + '.adi';
                slAdif.SaveToFile(sFileName);
                LOTWUploadFilename := '"' + InstallPath + '\tqsl.exe" -l ' + sHome + ' "' + sFileName + '" -x';

                memLog.Lines.Add(sLogin + ' [LoTW Upload]: ' + msgLOTWPrepareFile.Caption);
                MsgWaitForSingleObject(thrLOTWUpload.Execute(nil).Handle);
                if bGeneralBreak then
                  exit;

                if LOTWUploadResult then
                begin
                  if FileExists(ExtractFilePath(Application.ExeName) + 'Data\Temp\' + ExtractFileNameWithoutExt(sFileName) + '.tq8') then
                  begin
                    LOTWUploadLogin := sLogin;
                    LOTWUploadPassword := sPassword;
                    LOTWUploadFilename := ExtractFilePath(Application.ExeName) + 'Data\Temp\' + ExtractFileNameWithoutExt(sFileName) + '.tq8';
                    IdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5';
                    IdHTTP.HandleRedirects := True;
                    if bGeneralBreak then
                      exit;

                    MsgWaitForSingleObject(thrLOTWUploadFile.Execute(nil).Handle);
                  end
                  else
                    memLog.Lines.Add('[LoTW Upload]: File not found - ' + ExtractFilePath(Application.ExeName) + 'Data\Temp\' + ExtractFileNameWithoutExt(sFileName) + '.tq8');
                end
                else
                  memLog.Lines.Add('[LoTW Upload]: Error execute tqsl - ' + LOTWUploadFilename);
                if LOTWUploadFileResult then
                begin
                  iCountUploadedToLoTW := iCountUploadedToLoTW + pgProcessCurrent.Max;
                  DeleteFile(sFileName);
                  DeleteFile(LOTWUploadFilename);
                  qryUpdateQSL.Params.ParamByName('LOG_LOTW_QSLSDATE').AsDate := Date;
                  qryUpdateQSL.ExecuteSQL;
                end;
              end;
            end;
            qryStations.Next;
          finally
            pgProcess.Position := pgProcess.Position + 1;
            Application.ProcessMessages;
          end;
        end;
      finally
        slAdif.Free;
        qryStations.close;
      end;
    end;

    if TypeOperation = CA_LOTW_UPLOAD_SELECTED then
    begin
      if SelectedAll then
        iSelCount := dmMain.qryLog.RecordCount
      else
      begin
        vSelRecords := SelectedRecords;
        iSelCount := TVarData(vSelRecords).VArray^.Bounds[0].ElementCount;
      end;

      if iSelCount > 0 then
      begin
        slAdif := TStringList.Create;
        slLogId := TStringList.Create;
        pgProcessCurrent.Position := 0;
        pgProcessCurrent.Max := 0;
        pgProcess.Visible := False;
        Application.ProcessMessages;

        dmMain.qryLog.DisableControls;
        Bookmark := dmMain.qryLog.GetBookmark;
        try
          if bGeneralBreak then
            exit;
          pgProcessCurrent.Position := 0;
          pgProcessCurrent.Max := iSelCount;
          Application.ProcessMessages;
          sLogin := dmMain.qryStations.FieldByName('STATION_LOTW_LOGIN').asString;
          sHome := dmMain.qryStations.FieldByName('STATION_LOTW_HOME').asString;
          sBook := dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + dmMain.qryStations.FieldByName('STATION_CALL').asString + ']';
          sStationId := IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
          sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_LOTW_PASSWORD').asString);
          // sUserStr := '<EQSL_USER:' + IntToStr(Length(sLogin)) + '>' + sLogin + '<EQSL_PSWD:' + IntToStr(Length(sPassword)) + '>' + sPassword + '<EOH>';
          qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + sStationId + ' SET LOG_LOTW_QSL_SENT=''Y'', LOG_LOTW_QSLSDATE=:LOG_LOTW_QSLSDATE WHERE LOG_ID=:LOG_ID';
          qryRecords.close;
          qryRecords.SQL.Text := 'SELECT * FROM LOG_' + sStationId + ' WHERE IIF(isNull(LOG_LOTW_QSL_SENT),''N'', LOG_LOTW_QSL_SENT) NOT IN (''Y'',''I'')';
          qryRecords.Open;
          try
            if SelectedAll then
            begin
              dmMain.qryLog.First;
              while not dmMain.qryLog.Eof do
              begin
                if bGeneralBreak then
                  BREAK;
                try
                  slAdif.Add(GetAdifRow(dmMain.qryLog, True));
                  slLogId.Add(dmMain.qryLog.FieldByName('LOG_ID').asString);
                finally
                  pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                  Application.ProcessMessages;
                  dmMain.qryLog.Next;
                end;
              end;
            end
            else
            begin
              i := VarArrayLowBound(vSelRecords, 1);
              HighBound := VarArrayHighBound(vSelRecords, 1);
              while i <= HighBound do
              begin
                if bGeneralBreak then
                  BREAK;

                try
                  qryRecords.First;
                  if not qryRecords.Locate('LOG_ID', vSelRecords[i], []) then
                  begin
                    Inc(i);
                    continue;
                  end;
                  slAdif.Add(GetAdifRow(qryRecords, True));
                  slLogId.Add(IntToStr(vSelRecords[i]));
                  Inc(i);
                finally
                  pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
                  Application.ProcessMessages;
                end;
              end;
            end;
          except
            on E: exception do
              memLog.Lines.Add(sBook + '  [LoTW Upload]: ' + E.Message);
          end;
          if bGeneralBreak then
            exit;

          if slAdif.Count > 0 then
          begin

            sFileName := ExtractFilePath(Application.ExeName) + 'Data\Temp\lotw_upload_' + FormatDateTime('yyyymmddhhnnss', now) + '.adi';
            slAdif.SaveToFile(sFileName);
            LOTWUploadFilename := '"' + InstallPath + '\tqsl.exe" -l ' + sHome + ' "' + sFileName + '" -x';

            memLog.Lines.Add(sLogin + ' [LoTW Upload]: ' + msgLOTWPrepareFile.Caption);
            MsgWaitForSingleObject(thrLOTWUpload.Execute(nil).Handle);
            if bGeneralBreak then
              exit;

            if LOTWUploadResult then
            begin
              if bGeneralBreak then
                exit;

              if FileExists(ExtractFilePath(Application.ExeName) + 'Data\Temp\' + ExtractFileNameWithoutExt(sFileName) + '.tq8') then
              begin
                LOTWUploadLogin := sLogin;
                LOTWUploadPassword := sPassword;
                LOTWUploadFilename := ExtractFilePath(Application.ExeName) + 'Data\Temp\' + ExtractFileNameWithoutExt(sFileName) + '.tq8';
                IdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5';
                IdHTTP.HandleRedirects := True;
                MsgWaitForSingleObject(thrLOTWUploadFile.Execute(nil).Handle);
              end
              else
                memLog.Lines.Add('[LoTW Upload]: File not found - ' + ExtractFilePath(Application.ExeName) + 'Data\Temp\' + ExtractFileNameWithoutExt(sFileName) + '.tq8');
            end
            else
              memLog.Lines.Add('[LoTW Upload]: Error execute tqsl - ' + LOTWUploadFilename);
            if LOTWUploadFileResult then
            begin
              if bGeneralBreak then
                exit;
              iCountUploadedToLoTW := slLogId.Count;
              DeleteFile(sFileName);
              DeleteFile(LOTWUploadFilename);
              for i := 0 to slLogId.Count - 1 do
              begin
                qryUpdateQSL.Params.ParamByName('LOG_ID').AsInteger := StrToInt(slLogId.Strings[i]);
                qryUpdateQSL.Params.ParamByName('LOG_LOTW_QSLSDATE').AsDate := Date;
                qryUpdateQSL.ExecuteSQL;
              end;
            end;
          end;
        finally
          slAdif.Free;
          slLogId.Free;
          if dmMain.qryLog.BookmarkValid(Bookmark) then
            dmMain.qryLog.GotoBookmark(Bookmark);
          dmMain.qryLog.FreeBookmark(Bookmark);
          dmMain.qryLog.EnableControls;
        end;
      end;
      vSelRecords := Unassigned;
    end;
  end
  else
    memLog.Lines.Add('[LoTW Upload]: TrustedQSL not installed.');
  if pgProcess.Max = 0 then
    pgProcess.Max := 1;
  pgProcess.Position := pgProcess.Max;
  if pgProcessCurrent.Max = 0 then
    pgProcessCurrent.Max := 1;
  pgProcessCurrent.Position := pgProcessCurrent.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgLOTWUploadDone.Caption, [IntToStr(iCountUploadedToLoTW)]));
  dmMain.qryLog.Refresh;
  //
end;

procedure TExchangeQSLServices.DownloadLOTW;
var
  iCountDownloadedFromLoTW: integer;
  OldStationLoTWLogin: string;
  sLogin, sPassword, sDate: string;
  sResponce, sCall: string;
  sSelectQuery: String;
  slAdif: TStringList;
  qryLotwStations: TKADaoTable;

  procedure GetADIFromServer;
  var
    sResponce, sIdentifier, slOwnerCall, slCall, slDate, slTime, slBand, slMode, slQSLDate: string;
    i, iIdentifier: integer;
    dDate, dDateFrom, dDateTo, dQSLDate: TDateTime;
    iRowAffected: integer;
  begin
    pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
    Application.ProcessMessages;
    LOTWDownloadURL := 'https://p1k.arrl.org/lotwuser/lotwreport.adi?login=' + sLogin + '&password=' + sPassword + '&qso_query=1&qso_withown=yes&qso_qslsince=' + FormatDateTime('yyyy-mm-dd', Options.dtpLOTWLastDownload.Date);
    LOTWDownloadResponce := TStringList.Create;
    MsgWaitForSingleObject(thrLOTWDownload.Execute(nil).Handle);
    // LOTWDownloadResponce.SaveToFile('D:\!\22');
    try

      iIdentifier := 0;
      if Pos('Cannot open URL', LOTWDownloadResponce.Text) > 0 then
        memLog.Lines.Add(sLogin + ' [LoTW Download]: Cannot open URL. Check internet connection.')
      else if Pos('Username/password incorrect', LOTWDownloadResponce.Text) = 0 then
      begin
        // slAdif.Text:=sResponce;
        // slAdif.SaveToFile('d:\!\11');
        qryRecords.close;
        qryRecords.SQL.Text := 'SELECT * FROM ' + dmMain.SelectFromAllLogClause + ' WHERE LOG_CALL=:LOG_CALL AND LOG_QSO_DATETIME BETWEEN :DATEFROM AND :DATETO AND LOG_BAND=:BAND AND LOG_MODE=:MODE';
        // qryRecords.SQL.SaveToFile('D:\33');

        // LOTWDownloadResponce.LoadFromFile('d:\!\22');
        for i := 0 to 13 do
          LOTWDownloadResponce.Delete(0);
        pgProcessCurrent.Max := Trunc((LOTWDownloadResponce.Count - 2) / 11);
        Application.ProcessMessages;
        for i := 0 to LOTWDownloadResponce.Count - 1 do
        begin
          if bGeneralBreak then
            BREAK;
          sIdentifier := LOTWDownloadResponce.Strings[i];
          case iIdentifier of
            1:
              slOwnerCall := Copy(sIdentifier, 21, Length(sIdentifier) - 20);
            2:
              slCall := Copy(sIdentifier, 9, Length(sIdentifier) - 8);
            3:
              slBand := Copy(sIdentifier, 9, Length(sIdentifier) - 8);
            4:
              slMode := Copy(sIdentifier, 9, Length(sIdentifier) - 8);
            5:
              slDate := Copy(sIdentifier, 13, Length(sIdentifier) - 12);
            6:
              slTime := Copy(sIdentifier, 12, Length(sIdentifier) - 11);
            8:
              slQSLDate := Copy(sIdentifier, 13, Length(sIdentifier) - 12);
          end;
          Inc(iIdentifier);

          if iIdentifier = 11 then
          begin
            iIdentifier := 0;
            try
              try
                dDate := EncodeDateTime(StrToInt(Copy(slDate, 1, 4)), StrToInt(Copy(slDate, 5, 2)), StrToInt(Copy(slDate, 7, 2)), StrToInt(Copy(slTime, 1, 2)), StrToInt(Copy(slTime, 3, 2)), 0, 0);
                dQSLDate := EncodeDateTime(StrToInt(Copy(slQSLDate, 1, 4)), StrToInt(Copy(slQSLDate, 5, 2)), StrToInt(Copy(slQSLDate, 7, 2)), 0, 0, 0, 0);
                dDateFrom := IncMinute(dDate, -3);
                qryRecords.close;
                qryRecords.Params.ParamByName('DATEFROM').Value := dDateFrom;
                dDateTo := IncMinute(dDate, 3);
                qryRecords.Params.ParamByName('DATETO').Value := dDateTo;
                qryRecords.Params.ParamByName('LOG_CALL').asString := #39 + slCall + #39;
                qryRecords.Params.ParamByName('BAND').asString := #39 + slBand + #39;
                qryRecords.Params.ParamByName('MODE').asString := #39 + slMode + #39;
                qryRecords.Open;
                Application.ProcessMessages;
                if not qryRecords.IsEmpty then
                begin
                  qryUpdateQSL.close;
                  qryUpdateQSL.SQL.Text := 'UPDATE LOG_' + qryRecords.FieldByName('STATION_ID').asString + ' SET LOG_LOTW_QSL_RCVD=:LOG_LOTW_QSL_RCVD, LOG_LOTW_QSLRDATE=:LOG_LOTW_QSLRDATE WHERE LOG_ID=' + IntToStr
                    (qryRecords.FieldByName('LOG_ID').AsInteger);
                  qryUpdateQSL.Params.ParamByName('LOG_LOTW_QSL_RCVD').asString := #39 + 'Y' + #39;
                  qryUpdateQSL.Params.ParamByName('LOG_LOTW_QSLRDATE').Value := dQSLDate;
                  iRowAffected := qryUpdateQSL.ExecuteSQL;
                  if iRowAffected > 0 then
                    memLog.Lines.Add(slOwnerCall + '  [LoTW Download]: ' + slCall)
                  else
                    memLog.Lines.Add(slOwnerCall + '  [LoTW Download]: ERROR!!! ' + slCall);

                  Inc(iCountDownloadedFromLoTW);
                end
                else
                  memLog.Lines.Add(slOwnerCall + '  [LoTW Download]: QSO not found ' + slCall + ' ' + slBand + ' ' + slMode + ' ' + slDate + ' ' + slTime);

              except
                on E: exception do
                  memLog.Lines.Add(slOwnerCall + '  [LoTW Download]: ' + E.Message);
              end;
            finally
              pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
              Application.ProcessMessages;
            end;

          end;
        end;

      end
      else
        memLog.Lines.Add(sLogin + ' [LoTW Download]: Username/password incorrect ');
    finally
      LOTWDownloadResponce.Free;
    end;
  end;

begin
  iCountDownloadedFromLoTW := 0;
  OldStationLoTWLogin := '';
  memLog.Lines.Add(msgLoTWDownload.Caption);
  pgProcess.Position := 0;
  pgProcess.Max := 0;
  pgProcess.Visible := False;
  pgProcessCurrent.Position := 0;
  pgProcessCurrent.Max := 0;
  Application.ProcessMessages;
  // sAdif := TStringList.Create;
  qryLotwStations := TKADaoTable.Create(nil);

  try
    qryLotwStations.Database := dmMain.DAODatabase;
    qryLotwStations.SQL.Text := 'SELECT DISTINCT STATION_LOTW_LOGIN, STATION_LOTW_PASSWORD FROM STATIONS WHERE STATION_LOTW_ACTIVE=1 AND IS_GROUP=0';
    qryLotwStations.Open;
    pgProcess.Max := qryLotwStations.RecordCount;
    Application.ProcessMessages;

    { qryStations.Open;
      qryStations.SortedBy.Text := 'STATION_LOTW_LOGIN ASC';
      qryStations.Sort; }
    // sDate := DateToAdif(Options.dtpLoTWLastDownload.Date);

    while not qryLotwStations.Eof do
    begin
      if bGeneralBreak then
        BREAK;
      if (qryLotwStations.FieldByName('STATION_LOTW_LOGIN').asString <> '') and (qryLotwStations.FieldByName('STATION_LOTW_PASSWORD').asString <> '') then
      begin
        {
          if OldStationLoTWLogin <> qryStations.FieldByName('STATION_LOTW_LOGIN')
          .asString then
          begin
          GetADIFromServer;
          end;
          }
        sLogin := qryLotwStations.FieldByName('STATION_LOTW_LOGIN').asString;
        // sCall := qryStations.FieldByName('STATION_CALL').asString;
        sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, qryLotwStations.FieldByName('STATION_LOTW_PASSWORD').asString);
        // sSelectQuery := '';
        // OldStationLoTWLogin := qryStations.FieldByName('STATION_LOTW_LOGIN').asString;
        GetADIFromServer;

      end;
      pgProcess.Position := pgProcess.Position + 1;
      Application.ProcessMessages;
      qryLotwStations.Next;
    end;
  finally
    if not bGeneralBreak then
    begin
      Options.dtpLOTWLastDownload.Date := Date;
      Options.FormStorage.SaveFormPlacement;
    end;
    // sAdif.Free;
    // qryStations.close;
    qryLotwStations.close;
    qryLotwStations.Free;
  end;
  if pgProcess.Max = 0 then
    pgProcess.Max := 1;
  pgProcess.Position := pgProcess.Max;
  if pgProcessCurrent.Max = 0 then
    pgProcessCurrent.Max := 1;
  pgProcessCurrent.Position := pgProcessCurrent.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgLoTWDownloadDone.Caption, [IntToStr(iCountDownloadedFromLoTW)]));
  dmMain.qryLog.Refresh;
end;

procedure TExchangeQSLServices.UploadHRDLog;
var
  iCountUploadedToHRDLog: integer;
  iSelCount, HighBound, i: integer;
  vSelRecords: variant;
  sLogin, sPassword, sResponce: string;

  procedure UpdateServer;
  begin
    if bGeneralBreak then
      exit;
    HRDLogADIFData := GetAdifRow(dmMain.qryLog, True);
    HRDLogLogin := sLogin;
    HRDLogPassword := sPassword;
    MsgWaitForSingleObject(thrHRDLogUpload.Execute(nil).Handle);
    sResponce := HRDLogUploadResponce;
    if Pos('error', sResponce) = 0 then
      Inc(iCountUploadedToHRDLog)
    else
      memLog.Lines.Add(sLogin + '  [HRDLog Upload]: ' + sResponce);
  end;

begin
  iCountUploadedToHRDLog := 0;
  memLog.Lines.Add(msgHRDLogUpload.Caption);
  if SelectedAll then
    iSelCount := dmMain.qryLog.RecordCount
  else
  begin
    vSelRecords := SelectedRecords;
    iSelCount := TVarData(vSelRecords).VArray^.Bounds[0].ElementCount;
  end;

  if iSelCount > 0 then
  begin
    pgProcessCurrent.Position := 0;
    pgProcessCurrent.Max := 0;
    pgProcess.Visible := False;
    Application.ProcessMessages;

    dmMain.qryLog.DisableControls;
    try
      pgProcessCurrent.Position := 0;
      pgProcessCurrent.Max := iSelCount;
      Application.ProcessMessages;
      sLogin := dmMain.qryStations.FieldByName('STATION_HRDLOG_LOGIN').asString;
      sPassword := Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key, dmMain.qryStations.FieldByName('STATION_HRDLOG_PASSWORD').asString);
      try
        if SelectedAll then
        begin
          dmMain.qryLog.First;
          while not dmMain.qryLog.Eof do
          begin
            if bGeneralBreak then
              BREAK;
            try
              UpdateServer;
            finally
              pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
              Application.ProcessMessages;
              dmMain.qryLog.Next;
            end;
          end;
        end
        else
        begin
          i := VarArrayLowBound(vSelRecords, 1);
          HighBound := VarArrayHighBound(vSelRecords, 1);
          while i <= HighBound do
          begin
            try
              dmMain.qryLog.First;
              if not dmMain.qryLog.Locate('LOG_ID', vSelRecords[i], []) then
              begin
                Inc(i);
                continue;
              end;
              UpdateServer;
              Inc(i);
            finally
              pgProcessCurrent.Position := pgProcessCurrent.Position + 1;
              Application.ProcessMessages;
            end;
          end;
        end;
      except
        on E: exception do
          memLog.Lines.Add(sLogin + '  [HRDLog Upload]: ' + E.Message);
      end;
    finally
      dmMain.qryLog.EnableControls;
    end;
  end;
  vSelRecords := Unassigned;
  if pgProcess.Max = 0 then
    pgProcess.Max := 1;
  pgProcess.Position := pgProcess.Max;
  if pgProcessCurrent.Max = 0 then
    pgProcessCurrent.Max := 1;
  pgProcessCurrent.Position := pgProcessCurrent.Max;
  Application.ProcessMessages;
  memLog.Lines.Add(Format(msgHRDLogUploadDone.Caption, [IntToStr(iCountUploadedToHRDLog)]));
end;

end.
