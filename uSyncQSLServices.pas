unit uSyncQSLServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvAnimatedImage, JvGIFCtrl, StdCtrls, ExtCtrls,KDaoTable,
  DB, uUtils;

const
  WM_AFTER_E_SHOW = WM_USER + 302;

type
  TSyncQSLServices = class(TForm)
    gaSync: TJvGIFAnimator;
    Button1: TButton;
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
    qryStationsSTATION_EQSL_LAST_CONF: TDateTimeField;
    qryRecords: TKADaoTable;
    lbUploaded: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_E_SHOW;
    procedure FormShow(Sender: TObject);
  private
    iCountExportedToeQSL:integer;
    procedure UploadEQSL;
  public
   TypeOperation:integer;
  end;

var
  SyncQSLServices: TSyncQSLServices;

implementation
{$R *.dfm}
uses uMainWindow, udmMain, uOptions;


procedure TSyncQSLServices.FormShow(Sender: TObject);
begin
 PostMessage(Self.Handle, WM_AFTER_E_SHOW, 0, 0);
end;


procedure TSyncQSLServices.UploadEQSL;
var
  iSelCount, HighBound, i: integer;
  vSelRecords: variant;
  sConnectStr, sUserStr, sLogin, sPassword, sURL, sResponce, sCountExported, sError, sCall: string;
  iOldStationId: integer;


  procedure UpdateServer;
  begin
    sURL:=sConnectStr+StringReplace(UrlEncode(sUserStr+GetAdifRow(qryRecords,true)), ':', '%3A', [rfReplaceAll,rfIgnoreCase]);
    try
     sResponce:=GetUrlContent(sURL);
     if Pos('Bad record', sResponce) > 0 then
      begin
       sError:=sResponce;
       Delete(sError,1,Pos('<BODY>',sError)+6);
       sError:=Copy(sError,1,Pos('</',sError)-1);
       sError := StringReplace(sError, #10, '', [rfReplaceAll]);
       sError := StringReplace(sError, #13, '', [rfReplaceAll]);
       sError := StringReplace(sError, '<BR>', ' ', [rfReplaceAll]);
//       sLogQSLExchangeError.Add(sCall+'  [eQSL Sent]: '+Trim(sError));
       if Pos('Duplicate',sError)>0 then
         // UpdateRecord(dmMain.qryQSLExport.FieldByName('LOG_ID').AsInteger);
       end;
      sCountExported:=sResponce;
      Delete(sCountExported,1,Pos('Result:',sCountExported)+7);
      sCountExported:=Trim(Copy(sCountExported,1,Pos('out',sCountExported)-1));
      if sCountExported='1' then
       begin
       //  UpdateRecord(dmMain.qryQSLExport.FieldByName('LOG_ID').AsInteger);
         Inc(iCountExportedToeQSL);
       end;
    except
      on E:Exception do
        sLogQSLExchangeError.Add(sCall+' [eQSL Sent]: '+E.Message);
    end;
  end;


begin
  iCountExportedToeQSL := 0;
  sConnectStr := 'http://www.eqsl.cc/qslcard/ImportADIF.cfm?ADIFData=';

  if (TypeOperation=eQSLExportUnexported) or (TypeOperation=eQSLSync) then
    begin
     try
      qryStations.Open;
      while not qryStations.Eof do
       begin
         sLogin:=qryStations.FieldByName('STATION_EQSL_LOGIN').AsString;
         sCall:=qryStations.FieldByName('STATION_CALL').AsString;
         sPassword:=Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,qryStations.FieldByName('STATION_EQSL_PASSWORD').asString);
         sUserStr:='<EQSL_USER:' + IntToStr(Length(sLogin))+ '>' + sLogin + '<EQSL_PSWD:' + IntToStr(Length(sPassword)) + '>' + sPassword+'<EOH>';
         qryRecords.SQL.Text:='SELECT * FROM LOG_'+sCall+' WHERE IIF(isNull(LOG_EQSL_QSL_SENT),''N'', LOG_EQSL_QSL_SENT) NOT IN (''Y'',''I'')';
         qryRecords.Open;
         while not qryRecords.Eof do
          begin
           UpdateServer;
           qryRecords.Next;
          end;
         dmMain.qryExportEQSLStations.Next;
       end;
     finally
     end;
    end;
end;


procedure TSyncQSLServices.WmAfterShow(var Msg: TMessage);
begin
 gaSync.Animate:=True;
 UploadEQSL;
 gaSync.Animate:=False;
end;


procedure TSyncQSLServices.Button1Click(Sender: TObject);
begin
 Close;
end;

end.
