unit uEditBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrlsEh, StdCtrls, JvExMask, JvToolEdit, JvBaseEdits,
  JvDBControls, ExtCtrls, JvExControls, JvDBLookup, DBCtrls, ComCtrls,
  JvExStdCtrls, JvButton, JvCtrls, JvFooter, JvExExtCtrls, JvExtComponent, DB,
  uUtils, KDaoTable, JvMemoryDataset, JvCombobox, JvDBCombobox, LabeledControls,uPluginHeaders;

type
  TEditBook = class(TForm)
    pgPersonalRecord: TPageControl;
    tsStationDataMain: TTabSheet;
    tsStationDataEQSL: TTabSheet;
    gbEQSLParams: TGroupBox;
    lbStationeQSLLogin: TLabel;
    lbStationeQSLPassword: TLabel;
    dbeEQSLLogin: TDBEdit;
    meStationeQSLPassword: TMaskEdit;
    cdsStations: TJvMemoryData;
    dsStations: TDataSource;
    qryTerritory: TKADaoTable;
    qryTerritoryTERRITORY_ID: TIntegerField;
    qryTerritoryTERRITORY_NAME: TStringField;
    qryTerritoryADIF_ID: TIntegerField;
    qryTerritoryCONTINENT_ID: TIntegerField;
    dsTerritory: TDataSource;
    qryStationsUpdate: TKADaoTable;
    tsStationDataDQSL: TTabSheet;
    tsStationDataLOTW: TTabSheet;
    Panel1: TPanel;
    dbcEQSLActive: TDBCheckBox;
    JvFooter2: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    Panel3: TPanel;
    dbcDQSLActive: TDBCheckBox;
    gbDQSLMailParams: TGroupBox;
    Label3: TLabel;
    gbDQSLParams: TGroupBox;
    lbStationDQSLSMTPHost: TLabel;
    DBEdit7: TDBEdit;
    lbStationDQSLSMTPPort: TLabel;
    JvDBCalcEdit1: TJvDBCalcEdit;
    lbStationDQSLUsername: TLabel;
    lbStationDQSLPassword: TLabel;
    DBEdit8: TDBEdit;
    meStationDQSLPassword: TMaskEdit;
    lbStationDQSLPOPHost: TLabel;
    DBEdit9: TDBEdit;
    lbStationDQSLPOPPort: TLabel;
    JvDBCalcEdit2: TJvDBCalcEdit;
    lbStationDQSLDefaultTemplate: TLabel;
    dbcbTemplate: TJvDBComboBox;
    gbStationDataMainBook: TGroupBox;
    lbStationCall: TLabel;
    lbStationName: TLabel;
    lbStationBookName: TLabel;
    lbStationBookDescription: TLabel;
    dbeMyCall: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    gbStationDataMainGeo: TGroupBox;
    lbStationPostalCode: TLabel;
    lbStationCity: TLabel;
    lbStationAddress: TLabel;
    lbStationCountry: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dblCountry: TJvDBLookupCombo;
    lbStationGridSquare: TLabel;
    lbStationLon: TLabel;
    lbStationLat: TLabel;
    dbcMyLat: TJvDBCalcEdit;
    dbeGridSquare: TDBEdit;
    dbcMyLon: TJvDBCalcEdit;
    tsStationAdditionData: TTabSheet;
    gbStationAdditionData: TGroupBox;
    ldeStationState: TLabeledDBEdit;
    ldeStationCNTY: TLabeledDBEdit;
    ldeCQZone: TLabeledDBEdit;
    ldeITUZone: TLabeledDBEdit;
    gbStationRIG: TGroupBox;
    ldeStationRIG: TLabeledDBEdit;
    gbStationIOTA: TGroupBox;
    ldeStationIOTA: TLabeledDBEdit;
    ldeStationIOTAIslandId: TLabeledDBEdit;
    gbStationEvents: TGroupBox;
    ldeStationSIG: TLabeledDBEdit;
    ldeStationSIGInfo: TLabeledDBEdit;
    Panel2: TPanel;
    dbcLoTWActive: TDBCheckBox;
    gbLoTWParams: TGroupBox;
    lbStationLoTWLogin: TLabel;
    lbStationLoTWPassword: TLabel;
    dbeLoTWLogin: TDBEdit;
    meStationLoTWPassword: TMaskEdit;
    ldeStationLoTWHome: TLabeledDBEdit;
    tsStationDataHRDLog: TTabSheet;
    Panel4: TPanel;
    dbcHRDLogActive: TDBCheckBox;
    gbHRDLogParams: TGroupBox;
    lbStationHRDLogLogin: TLabel;
    lbStationHRDLogPassword: TLabel;
    DBEdit10: TDBEdit;
    meStationHrdLogPassword: TMaskEdit;
    dbcEQSLSentEvery: TDBCheckBox;
    dbcHRDLogSentEvery: TDBCheckBox;
    tsStationDataHAMQTH: TTabSheet;
    gbHamQTHParams: TGroupBox;
    lbStationHamQTHLogin: TLabel;
    lbStationHamQTHPassword: TLabel;
    dbeHamQTHLogin: TDBEdit;
    meStationHAMQTHPassword: TMaskEdit;
    cdsStationsSTATION_ID: TAutoIncField;
    cdsStationsSTATION_CALL: TStringField;
    cdsStationsSTATION_STREET: TStringField;
    cdsStationsSTATION_GRIDSQUARE: TStringField;
    cdsStationsSTATION_LAT: TFloatField;
    cdsStationsSTATION_LON: TFloatField;
    cdsStationsSTATION_NAME: TStringField;
    cdsStationsSTATION_CITY: TStringField;
    cdsStationsSTATION_COUNTRY: TIntegerField;
    cdsStationsSTATION_ITU_ZONE: TIntegerField;
    cdsStationsSTATION_CQ_ZONE: TIntegerField;
    cdsStationsSTATION_POSTAL_CODE: TStringField;
    cdsStationsSTATION_RIG: TStringField;
    cdsStationsSTATION_EQSL_LOGIN: TStringField;
    cdsStationsSTATION_EQSL_PASSWORD: TStringField;
    cdsStationsSTATION_BOOK_NAME: TStringField;
    cdsStationsSTATION_BOOK_DESCRIPTION: TStringField;
    cdsStationsSTATION_EQSL_ACTIVE: TIntegerField;
    cdsStationsSTATION_DQSL_ACTIVE: TIntegerField;
    cdsStationsSTATION_DQSL_SMTP_HOST: TStringField;
    cdsStationsSTATION_DQSL_SMTP_PORT: TIntegerField;
    cdsStationsSTATION_DQSL_MAIL_USERNAME: TStringField;
    cdsStationsSTATION_DQSL_MAIL_PASSWORD: TStringField;
    cdsStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField;
    cdsStationsSTATION_DQSL_POP_HOST: TStringField;
    cdsStationsSTATION_DQSL_POP_PORT: TIntegerField;
    cdsStationsSTATION_CNTY: TStringField;
    cdsStationsSTATION_IOTA: TStringField;
    cdsStationsSTATION_IOTA_ISLAND_ID: TStringField;
    cdsStationsSTATION_SIG: TStringField;
    cdsStationsSTATION_SIG_INFO: TStringField;
    cdsStationsSTATION_STATE: TStringField;
    cdsStationsSTATION_LOTW_ACTIVE: TIntegerField;
    cdsStationsSTATION_LOTW_LOGIN: TStringField;
    cdsStationsSTATION_LOTW_PASSWORD: TStringField;
    cdsStationsSTATION_LOTW_HOME: TStringField;
    cdsStationsSTATION_HRDLOG_LOGIN: TStringField;
    cdsStationsSTATION_HRDLOG_PASSWORD: TStringField;
    cdsStationsSTATION_HRDLOG_ACTIVE: TIntegerField;
    cdsStationsSTATION_EQSL_SENT_EVERY: TIntegerField;
    cdsStationsSTATION_HRDLOG_SENT_EVERY: TIntegerField;
    cdsStationsSTATION_PARENT_ID: TIntegerField;
    cdsStationsIS_GROUP: TIntegerField;
    cdsStationsSTATION_HAMQTH_LOGIN: TStringField;
    cdsStationsSTATION_HAMQTH_PASSWORD: TStringField;
    cdsStationsSTATION_QRZCOM_LOGIN: TStringField;
    cdsStationsSTATION_QRZCOM_PASSWORD: TStringField;
    tsStationDataQRZCOM: TTabSheet;
    gbQRZCOMParams: TGroupBox;
    lbStationQrzComLogin: TLabel;
    lbStationQrzComPassword: TLabel;
    dbeQRZComLogin: TDBEdit;
    meStationQrzComPassword: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbeMyCallKeyPress(Sender: TObject; var Key: Char);
    procedure dbeEQSLLoginKeyPress(Sender: TObject; var Key: Char);
    procedure dbeGridSquareChange(Sender: TObject);
    procedure dbeEQSLLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeMyCallKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeGridSquareKeyPress(Sender: TObject; var Key: Char);
    procedure dbeMyCallChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure dbeGridSquareKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    vKey:char;
    OldCall:string;
    procedure GetPatterns;
  public
    isEdit:boolean;
  end;

var
  EditBook: TEditBook;

implementation

uses udmMain, uOptions, uMainWindow;

{$R *.dfm}

procedure TEditBook.btnCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TEditBook.btnOkClick(Sender: TObject);
var
 i:integer;
 bFirst:boolean;
 ParentId:integer;
begin
 bFirst:=MainWindow.GetBookCount=0;
    try
     if not isEdit then
     begin
        ParentId:=Options.mdsStations.FieldByName('STATION_ID').AsInteger;
        dmMain.qryStations.Append;
        try
            dmMain.qryStations.FieldByName('STATION_PARENT_ID').AsInteger:=ParentId;
            dmMain.qryStations.Post;
//          dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
          dmMain.CreateTable(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
        except
         dmMain.qryStations.Delete;
        end;
     end;
     cdsStations.FieldByName('IS_GROUP').asInteger:=0;
     cdsStations.Post;
     dmMain.qryStations.Edit;
     for i := 0 to dmMain.qryStations.FieldCount-1 do
     begin
      if i>0 then

       if dmMain.qryStations.Fields[i].FieldName='STATION_PARENT_ID' then
         Continue;

       dmMain.qryStations.Fields[i].Value:=cdsStations.Fields[i].Value;

      if dmMain.qryStations.Fields[i].FieldName='STATION_DQSL_DEFAULT_TEMPLATE' then
       dmMain.qryStations.FieldByName('STATION_DQSL_DEFAULT_TEMPLATE').AsString:=dbcbTemplate.Text;

      if dmMain.qryStations.Fields[i].FieldName='STATION_EQSL_PASSWORD' then
       dmMain.qryStations.FieldByName('STATION_EQSL_PASSWORD').AsString:=Options.vcPwdCrypt.EncodeString(Options.vcPwdCrypt.Key,meStationeQSLPassword.Text);
      if dmMain.qryStations.Fields[i].FieldName='STATION_LOTW_PASSWORD' then
       dmMain.qryStations.FieldByName('STATION_LOTW_PASSWORD').AsString:=Options.vcPwdCrypt.EncodeString(Options.vcPwdCrypt.Key,meStationLOTWPassword.Text);
      if dmMain.qryStations.Fields[i].FieldName='STATION_HRDLOG_PASSWORD' then
       dmMain.qryStations.FieldByName('STATION_HRDLOG_PASSWORD').AsString:=Options.vcPwdCrypt.EncodeString(Options.vcPwdCrypt.Key,meStationHRDLogPassword.Text);
      if dmMain.qryStations.Fields[i].FieldName='STATION_DQSL_MAIL_PASSWORD' then
       dmMain.qryStations.FieldByName('STATION_DQSL_MAIL_PASSWORD').AsString:=Options.vcPwdCrypt.EncodeString(Options.vcPwdCrypt.Key,meStationDQSLPassword.Text);
      if dmMain.qryStations.Fields[i].FieldName='STATION_HAMQTH_PASSWORD' then
       dmMain.qryStations.FieldByName('STATION_HAMQTH_PASSWORD').AsString:=Options.vcPwdCrypt.EncodeString(Options.vcPwdCrypt.Key,meStationHamQTHPassword.Text);
      if dmMain.qryStations.Fields[i].FieldName='STATION_QRZCOM_PASSWORD' then
       dmMain.qryStations.FieldByName('STATION_QRZCOM_PASSWORD').AsString:=Options.vcPwdCrypt.EncodeString(Options.vcPwdCrypt.Key,meStationQrzComPassword.Text);

     end;
     dmMain.qryStations.Post;

     if isEdit and (dmMain.qryStations.FieldByName('STATION_ID').AsInteger=MainWindow.CurrentStationId) then
       begin
        MainWindow.rbMain.Caption := 'UT4UKW Logbook build ' + getAppVersion + ' - ' + dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) + ']';
         MainWindow.sbMain.Update;
         MainWindow.sbMain.Repaint;
       end;

      if isEdit then
         MainWindow.EditBookInMenu(dmMain.qryStations.FieldByName('STATION_ID').AsInteger,dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) + ']')
      else
         MainWindow.AddBookToMenu(dmMain.qryStations.FieldByName('STATION_ID').AsInteger,dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) + ']');

      qryStationsUpdate.SQL.Text:='UPDATE STATIONS SET STATION_EQSL_LOGIN ='+#39+dmMain.qryStations.FieldByName('STATION_EQSL_LOGIN').AsString+#39+
      ', STATION_EQSL_PASSWORD='+#39+dmMain.qryStations.FieldByName('STATION_EQSL_PASSWORD').AsString+#39+' WHERE STATION_CALL='+#39+dmMain.qryStations.FieldByName('STATION_CALL').AsString+#39;
      qryStationsUpdate.ExecuteSQL;
      dmMain.qryStations.Refresh;
      if bFirst and not isEdit then
      begin
       dmMain.qryLog.TableName := 'LOG_' + IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
       dmMain.qryLog.Open;
       dmMain.SetStationId(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
      end;

      dmMain.GetAllTableForSelect;
     // Options.RefreshmdsStations();
     Close;
    except
    on E:Exception do
       MessageBox(Application.Handle, PWideChar(E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
    end;
end;

procedure TEditBook.dbeEQSLLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  vKey:=CallKeyCodeToChar(Key);
end;

procedure TEditBook.dbeEQSLLoginKeyPress(Sender: TObject; var Key: Char);
begin
 if (vKey='') and (Key<>#8) then
  begin
   Key:=#0;
   exit;
  end;
  if (Ord(vKey) >= 97) and (Ord(vKey) <= 122) then
    Key := Chr(Ord(vKey) - 32);
 if (Key<>#8) then
   Key:=vKey;
end;

procedure TEditBook.dbeGridSquareChange(Sender: TObject);
var
 c:TCoordinate;
begin
 if cdsStations.State in [dsInsert,dsEdit] then
  begin
    if Trim(dbeGridSquare.Text)<>'' then
     begin
       c:=GridToCoordinate(dbeGridSquare.Text);
       cdsStations.FieldByName('STATION_LAT').AsFloat:=c.Lat;
       cdsStations.FieldByName('STATION_LON').AsFloat:=c.Lon;
     end
     else
     begin
       cdsStations.FieldByName('STATION_LAT').AsFloat:=0;
       cdsStations.FieldByName('STATION_LON').AsFloat:=0;
     end;
  end;
end;

procedure TEditBook.dbeGridSquareKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 vKey:=CallKeyCodeToChar(Key);
end;

procedure TEditBook.dbeGridSquareKeyPress(Sender: TObject; var Key: Char);
begin
 if (vKey='') and (Key<>#8) and (Key<>#32) then
  begin
   Key:=#0;
   exit;
  end;
  if (Ord(vKey) >= 97) and (Ord(vKey) <= 122) then
    Key := Chr(Ord(vKey) - 32);
 if (Key<>#8) and (Key<>#32) then
   Key:=vKey;
end;

procedure TEditBook.dbeMyCallChange(Sender: TObject);
var
CallInfo:TCallInfo;
begin
 if not isEdit  then
   cdsStations.FieldByName('STATION_EQSL_LOGIN').AsString:=dbeMyCall.Text;
 CallInfo:=MainWindow.GetPrefixData(Trim(dbeMyCall.Text));
 dblCountry.KeyValue:=CallInfo.PrefixData.ADIF;
 btnOk.Enabled:=Trim(dbeMyCall.Text)<>'';
end;

procedure TEditBook.dbeMyCallKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 vKey:=CallKeyCodeToChar(Key);
end;

procedure TEditBook.dbeMyCallKeyPress(Sender: TObject; var Key: Char);
begin
 if (vKey='') and (Key<>#8) then
  begin
   Key:=#0;
   exit;
  end;
  if (Ord(vKey) >= 97) and (Ord(vKey) <= 122) then
    Key := Chr(Ord(vKey) - 32);
 if (Key<>#8) then
   Key:=vKey;
end;

procedure TEditBook.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{ if Key=13 then
  btnOk.OnClick(Self);    }
end;

procedure TEditBook.FormShow(Sender: TObject);
var
 i:integer;
begin
 GetPatterns;
 cdsStations.Append;
 qryTerritory.Open;
 qryTerritory.SortedBy.Text:='TERRITORY_NAME ASC';
 qryTerritory.Sort;

 if isEdit then
 begin
  for i := 0 to Options.mdsStations.FieldCount-1 do
   if i>0 then
     cdsStations.Fields[i].Value:=Options.mdsStations.Fields[i].Value;
  meStationeQSLPassword.Text:=Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,Options.mdsStations.FieldByName('STATION_EQSL_PASSWORD').asString);
  meStationLoTWPassword.Text:=Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,Options.mdsStations.FieldByName('STATION_LOTW_PASSWORD').asString);
  meStationDQSLPassword.Text:=Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,Options.mdsStations.FieldByName('STATION_DQSL_MAIL_PASSWORD').asString);
  meStationHRDLogPassword.Text:=Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,Options.mdsStations.FieldByName('STATION_HRDLOG_PASSWORD').asString);
  meStationHamQTHPassword.Text:=Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,Options.mdsStations.FieldByName('STATION_HAMQTH_PASSWORD').asString);
  meStationQrzComPassword.Text:=Options.vcPwdCrypt.DecodeString(Options.vcPwdCrypt.Key,Options.mdsStations.FieldByName('STATION_QRZCOM_PASSWORD').asString);
  dbcbTemplate.ItemIndex:=dbcbTemplate.Items.IndexOf(Options.mdsStations.FieldByName('STATION_DQSL_DEFAULT_TEMPLATE').AsString);
  OldCall:=Options.mdsStations.FieldByName('STATION_CALL').asString;
 end;

 if not isEdit then
 begin
  cdsStations.FieldByName('STATION_COUNTRY').AsInteger:=-1;
  cdsStations.FieldByName('STATION_EQSL_ACTIVE').AsInteger:=0;
  cdsStations.FieldByName('STATION_DQSL_ACTIVE').AsInteger:=0;
  cdsStations.FieldByName('STATION_LOTW_ACTIVE').AsInteger:=0;
  cdsStations.FieldByName('STATION_HRDLOG_ACTIVE').AsInteger:=0;
  cdsStations.FieldByName('STATION_EQSL_SENT_EVERY').AsInteger:=0;
  cdsStations.FieldByName('STATION_HRDLOG_SENT_EVERY').AsInteger:=0;
 end;
end;

procedure TEditBook.GetPatterns;
var
  slFiles:TStringList;
  i:integer;
  sFileName:string;
begin
 dbcbTemplate.Items.Clear;
 slFiles:=TStringList.Create;
  try
    FindFilesByMask(slFiles,ExtractFilePath(Application.ExeName)+'Data\Reports\QSL','*.fr3');
    for i := 0 to slFiles.Count - 1 do
    begin
       sFileName:=ExtractFileName(slFiles.Strings[i]);
       dbcbTemplate.Items.Add(Copy(sFileName,1,Pos('.',sFileName)-1));
    end;
  finally
   slFiles.Free;
  end;
end;


end.
