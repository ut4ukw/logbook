unit uWindowQSODataForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExComCtrls, JvDateTimePicker, DBCtrls, Mask,
  JvExControls, JvgLabel, ExtCtrls, ActnList, DB, uPluginHeaders, pngimage,
  ImgList, TZDB,DateUtils,  uUtils, JvDBLookup,
  JvExMask, JvToolEdit, JvDBLookupComboEdit, JvAutoComplete, vlDBEdit,
  JvExStdCtrls, JvCombobox, JvDBCombobox,  KDaoTable, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvDBDatePickerEdit,uWindowPluginForm,
  LabeledControls, DTPEx;

type
  TWindowQSODataForm = class(TWindowPluginForm)
    lbOperator: TLabel;
    lbQTH: TLabel;
    lbDate: TLabel;
    lbTime: TLabel;
    cbRealTime: TCheckBox;
    dtpQSODate: TJvDateTimePicker;
    dtpQSOTime: TJvDateTimePicker;
    timTime: TTimer;
    pnlCallInfo: TPanel;
    imgTime: TImage;
    ilTime: TImageList;
    lbsTime: TLabel;
    lbDXCC: TLabel;
    lbDXCCBand: TLabel;
    lbDXCCMode: TLabel;
    dsNames: TDataSource;
    dsQTH: TDataSource;
    dbeOperator: TvlDBEdit;
    dbeQTH: TvlDBEdit;
    qryDXCC: TKADaoTable;
    qryNames: TKADaoTable;
    qryQTH: TKADaoTable;
    ldeCall: TLabeledDBEdit;
    ldeReportFrom: TLabeledDBComboBox;
    ldeReportTo: TLabeledDBComboBox;
    procedure ldeCallKeyPress(Sender: TObject; var Key: Char);
    procedure timTimeTimer(Sender: TObject);
    procedure cbRealTimeClick(Sender: TObject);
    procedure dtpQSODateChange(Sender: TObject);
    procedure dtpQSOTimeChange(Sender: TObject);
    procedure ldeCallChange(Sender: TObject);
    procedure ldeReportFromKeyPress(Sender: TObject; var Key: Char);
    procedure ldeReportToKeyPress(Sender: TObject; var Key: Char);
    procedure dtpQSOTimeKeyPress(Sender: TObject; var Key: Char);
    procedure ldeCallKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryNamesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbeOperatorCloseUp(Sender: TObject);
    procedure qryQTHFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbeQTHCloseUp(Sender: TObject);
    procedure dbeOperatorEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeOperatorExit(Sender: TObject);
    procedure dbeQTHEnter(Sender: TObject);
    procedure dbeQTHExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
   vKey:char;
   sOldKeyboardLayout:string;
   CurrMode:string;
   CurrBand:real;
   sCurrentCallAdif:string;
   StationId:integer;
   function GetNowDateUTCTime: TDateTime;
  public
   sLangList:TStringList;
   procedure ModeChanged;
   procedure BandChanged(Band:real);
   procedure NewQSO;
   procedure EditQSO;
   procedure aSaveQSOUpdate(Sender:TObject);
   procedure CallChanged(vCallInfo:variant);
   procedure OptionsChanged;
   procedure SetLang;
   procedure ReturnLang;
   procedure StationChanged(lParam:variant);
  end;

var
  WindowQSODataForm: TWindowQSODataForm;

implementation
uses uWindowQSOData;

{$R *.dfm}


procedure TWindowQSODataForm.FormCreate(Sender: TObject);
begin
 inherited;
 sLangList:=TStringList.Create;
 sLangList.Delimiter:=';';
 sCurrentCallAdif:='-1';
end;



procedure TWindowQSODataForm.FormDestroy(Sender: TObject);
begin
 sLangList.Free;
end;

procedure TWindowQSODataForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 vParam:variant;
begin
vParam:=0;
 if (Key=13) and WindowQSODataSettingsFrame.WindowQSOData_cbSaveRecordOnEnter.Checked
 and (Trim(ldeCall.Text)<>'')
 and (Trim(ldeReportFrom.Text)<>'')
 and (Trim(ldeReportTo.Text)<>'')
 and (Trim(dbeOperator.Text)<>'')
 and (Trim(dbeQTH.Text)<>'')
  then
   lDllCommand(DC_SAVE_QSO,Self,vParam,vParam);

end;

function TWindowQSODataForm.GetNowDateUTCTime: TDateTime;
var
  UTC: TSystemTime;
begin
  GetSystemTime(UTC);
  Result := SystemTimeToDateTime(UTC);
end;


procedure TWindowQSODataForm.ldeCallChange(Sender: TObject);
var
 lParam, wParam:variant;
begin
 if ldsLogEdit.DataSet.State in [dsInsert,dsEdit] then
   ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString:=ldeCall.Text;
 lParam:=ldeCall.Text;
 wParam:=0;
 lDllCommand(DC_CALL_CHANGED,nil,lParam,wParam);
 lbDXCC.Font.Color:=clSilver;
 lbDXCCBand.Font.Color:=clSilver;
 lbDXCCMode.Font.Color:=clSilver;
 if (ldsLogEdit.DataSet.FieldByName('LOG_DXCC').asInteger<>-1) and (ldeCall.Text<>'') and (ldsLogEdit.DataSet.State =dsInsert) then
  begin
    qryDXCC.Params.ParamByName('LOG_DXCC').AsInteger:=ldsLogEdit.DataSet.FieldByName('LOG_DXCC').asInteger;
    qryDXCC.Open;
    if qryDXCC.IsEmpty then
      lbDXCC.Font.Color:=clRed
    else
    begin
      qryDXCC.First;
      if not qryDXCC.Locate('LOG_BAND_MHZ',CurrBand,[]) then
         lbDXCCBand.Font.Color:=clRed
      else
      begin
       qryDXCC.First;
       if not qryDXCC.Locate('LOG_MODE',CurrMode,[]) then
         lbDXCCMode.Font.Color:=clRed;
      end;
    end;
    qryDXCC.Close;
  end;
end;

procedure TWindowQSODataForm.ldeCallKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 vKey:=CallKeyCodeToChar(Key);
end;

procedure TWindowQSODataForm.ldeCallKeyPress(Sender: TObject; var Key: Char);
begin
 if (vKey='') and (Key<>#8) and (Key<>#32) and (Key<>#13) then
  begin
   Key:=#0;
   exit;
  end;
  if (Ord(vKey) >= 97) and (Ord(vKey) <= 122) then
    Key := Chr(Ord(vKey) - 32);
 if (Key<>#8) and (Key<>#32) and (Key<>#13) then
   Key:=vKey;

 if (Key=#13) and  (Trim(ldeCall.Text)<>'') then
 begin
  if Self.Visible then
    ldeReportFrom.SetFocus;
  Key := #0;
 end;
end;

procedure PressKey(Key: Word);
begin
  keybd_event(Key,0,0,0);
end;

procedure ReleaseKey(Key: Word);
begin
  keybd_event(Key,0,KEYEVENTF_KEYUP,0);
end;

procedure TWindowQSODataForm.NewQSO;
var
 NowDate:TDateTime;
begin
 ldeReportTo.DataSource.DataSet.FieldByName(ldeReportTo.DataField).AsString:=ldeReportTo.Items.Strings[0];
 ldeReportFrom.DataSource.DataSet.FieldByName(ldeReportFrom.DataField).AsString:=ldeReportFrom.Items.Strings[0];
 cbRealtime.Checked:=True;
 timTime.Enabled:=True;
 NowDate:=GetNowDateUTCTime;
 dtpQSODate.Date := NowDate;
 dtpQSOTime.Time := NowDate;
 dtpQSODate.Time := dtpQSOTime.Time;
 ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime :=dtpQSODate.DateTime;
 ModeChanged;
 if Self.Visible and ldeCall.CanFocus then
  ldeCall.SetFocus;
end;

procedure TWindowQSODataForm.qryNamesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
s: string;
begin
s := Trim(dbeOperator.FilterStr);
if s = '' then
  Accept := true
else
  Accept := Pos(AnsiUpperCase(s),AnsiUpperCase(Trim(qryNames.FieldByName('OPERATOR_NAME').AsString))) = 1;
end;

procedure TWindowQSODataForm.qryQTHFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
s: string;
begin
s := Trim(dbeQTH.FilterStr);
if s = '' then
  Accept := true
else
  Accept := Pos(AnsiUpperCase(s),AnsiUpperCase(Trim(qryQTH.FieldByName('QTH_NAME').AsString))) = 1;
end;

procedure TWindowQSODataForm.EditQSO;
begin
  timTime.Enabled := False;
  cbRealTime.Checked := False;
  dtpQSODate.Date := ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime;
  dtpQSOTime.Time := ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime;
  if Self.Visible and ldeCall.CanFocus then
   ldeCall.SetFocus;
end;


procedure TWindowQSODataForm.ModeChanged;
var
 qrtTmp:TKadaoTable;
begin
 CurrMode:=lMode;
 qrtTmp:=TKadaoTable.Create(nil);
 qrtTmp.Database:=lDatabase;
 try
  qrtTmp.SQL.Text:='SELECT * FROM MODES WHERE MODE_NAME='+QuotedStr(CurrMode);
  qrtTmp.Open;
  ldeReportFrom.Items.Clear;
  ldeReportTo.Items.Clear;
  if (CurrMode <> 'SSB') and (CurrMode <> 'AM') and (CurrMode <> 'FM') then
  begin
    ldeReportFrom.Items.Add('599');
    ldeReportFrom.Items.Add('589');
    ldeReportFrom.Items.Add('579');
    ldeReportFrom.Items.Add('569');
    ldeReportFrom.Items.Add('559');
    ldeReportTo.Items.Add('599');
    ldeReportTo.Items.Add('589');
    ldeReportTo.Items.Add('579');
    ldeReportTo.Items.Add('569');
    ldeReportTo.Items.Add('559');
  end
  else
  begin
    ldeReportFrom.Items.Add('59');
    ldeReportFrom.Items.Add('58');
    ldeReportFrom.Items.Add('57');
    ldeReportFrom.Items.Add('56');
    ldeReportFrom.Items.Add('55');
    ldeReportTo.Items.Add('59');
    ldeReportTo.Items.Add('58');
    ldeReportTo.Items.Add('57');
    ldeReportTo.Items.Add('56');
    ldeReportTo.Items.Add('55');
  end;
  if ldeReportFrom.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString)<>-1 then
    ldeReportFrom.ItemIndex:=ldeReportFrom.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString)
  else
   begin
    ldeReportFrom.Items.Insert(0,qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString);
    ldeReportFrom.ItemIndex:=0;
   end;

  if ldeReportTo.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString)<>-1 then
    ldeReportTo.ItemIndex:=ldeReportTo.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString)
  else
   begin
    ldeReportTo.Items.Insert(0,qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString);
    ldeReportTo.ItemIndex:=0;
   end;
 finally
  qrtTmp.Free;
 end;
 if ldeReportTo.DataSource.DataSet.State in [dsEdit,dsInsert] then
  begin
   ldeReportTo.DataSource.DataSet.FieldByName(ldeReportTo.DataField).AsString:=ldeReportTo.Items.Strings[ldeReportTo.ItemIndex];
   ldeReportFrom.DataSource.DataSet.FieldByName(ldeReportFrom.DataField).AsString:=ldeReportFrom.Items.Strings[ldeReportFrom.ItemIndex];
  end;
end;

procedure TWindowQSODataForm.BandChanged(Band:real);
begin
 CurrBand:=Band;
end;


procedure TWindowQSODataForm.Button1Click(Sender: TObject);
begin
  inherited;
  TLabeledDBEdit(Self.FindComponent('ldeIota')).DataSource;
  TLabeledDBEdit(Self.FindComponent('ldeIota')).DataField;
  TLabeledDBEdit(Self.FindComponent('ldeIota')).DataField;
end;

procedure TWindowQSODataForm.timTimeTimer(Sender: TObject);
var
 NowDate:TDateTime;
 Hour, Min, Sec, Milli : Word;
begin
  NowDate:=GetNowDateUTCTime;
  DecodeTime(NowDate, Hour, Min, Sec, Milli);
  if Sec=0 then
   begin
    dtpQSODate.Date := NowDate;
    dtpQSOTime.Time := NowDate;
    dtpQSODate.Time := dtpQSOTime.Time;
   end;

  if ldsLogEdit.DataSet.State in [dsInsert,dsEdit] then
     ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime :=dtpQSODate.DateTime;
end;

procedure TWindowQSODataForm.cbRealTimeClick(Sender: TObject);
begin
 timTime.Enabled:=cbRealTime.Checked;
end;

procedure TWindowQSODataForm.ldeReportFromKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
begin
 if Self.Visible then
    ldeReportTo.SetFocus;
 Key := #0;
end;
end;

procedure TWindowQSODataForm.ldeReportToKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
begin
 if Self.Visible then
    dbeOperator.SetFocus;
 Key := #0;
end;
end;



procedure TWindowQSODataForm.dbeOperatorCloseUp(Sender: TObject);
begin
 if Self.Visible then
    dbeQTH.SetFocus;
end;

procedure TWindowQSODataForm.dbeOperatorEnter(Sender: TObject);
begin
 SetLang;
end;


procedure TWindowQSODataForm.dbeOperatorExit(Sender: TObject);
begin
 ReturnLang;
end;

procedure TWindowQSODataForm.dbeQTHCloseUp(Sender: TObject);
begin
 if Self.Visible then
    ldeCall.SetFocus;
end;

procedure TWindowQSODataForm.dbeQTHEnter(Sender: TObject);
begin
 SetLang;
end;

procedure TWindowQSODataForm.dbeQTHExit(Sender: TObject);
begin
 ReturnLang;
end;

procedure TWindowQSODataForm.dtpQSODateChange(Sender: TObject);
begin
  dtpQSODate.Time := dtpQSOTime.Time;
  ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime :=dtpQSODate.DateTime;
end;

procedure TWindowQSODataForm.dtpQSOTimeChange(Sender: TObject);
begin
  dtpQSODate.Time := dtpQSOTime.Time;
  ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime :=dtpQSODate.DateTime;
end;

procedure TWindowQSODataForm.dtpQSOTimeKeyPress(Sender: TObject; var Key: Char);
begin
 if Ord(Key)=32 then
  begin
    if Self.Visible then
       ldeCall.SetFocus;
    Key:=#0;
  end;
end;

procedure TWindowQSODataForm.aSaveQSOUpdate(Sender:TObject);
begin
 TAction(Sender).Enabled:=ldeCall.Text<>'';
end;

procedure TWindowQSODataForm.CallChanged(vCallInfo:Variant);
Var
CallTime: TTimeZone;
Hour, Min, Sec, Milli :word;
TZ:String;
pCall:PCallInfo;
begin
TZ:='';
sCurrentCallAdif:='-1';
pCall:=TVarData(vCallInfo).VPointer;
if pCall<>nil then
 begin
   TZ:=pCall.PrefixData.TZ;
   sCurrentCallAdif:=pCall.PrefixData.ADIF;
 end;

try
 if TZ<>'' then
  begin
  if Pos('>',TZ)>0 then
    CallTime:=TBundledTimeZone.Create(Copy(TZ,1,Pos('>',TZ)-1))
  else
  if Pos(',',TZ)>0 then
    CallTime:=TBundledTimeZone.Create(Copy(TZ,1,Pos(',',TZ)-1))
  else
    CallTime:=TBundledTimeZone.Create(TZ);
   CallTime.ToLocalTime(GetNowDateUTCTime);
   DecodeTime(CallTime.ToLocalTime(GetNowDateUTCTime),Hour, Min, Sec, Milli);
   if (Hour>=0) and (Hour<=6) then
    begin
      ilTime.GetIcon(0,imgTime.Picture.Icon);
      lbsTime.Caption:='GN';
    end;
   if (Hour>6) and (Hour<=11) then
    begin
      ilTime.GetIcon(1,imgTime.Picture.Icon);
      lbsTime.Caption:='GM';
    end;
   if (Hour>11) and (Hour<=18) then
    begin
      ilTime.GetIcon(2,imgTime.Picture.Icon);
      lbsTime.Caption:='GD';
    end;
   if (Hour>18) and (Hour<=24) then
    begin
      ilTime.GetIcon(3,imgTime.Picture.Icon);
      lbsTime.Caption:='GE';
    end;
  end
  else
  begin
   imgTime.Picture:=nil;
   lbsTime.Caption:='';
  end;
 except
   imgTime.Picture:=nil;
   lbsTime.Caption:='';
 end;
end;

procedure TWindowQSODataForm.OptionsChanged;
begin
//  sLangList.DelimitedText:=WindowQSODataSettingsFrame.WindowQSOData_leAutoChangeKeyLayout.Text;
end;


procedure TWindowQSODataForm.SetLang;
var
 ptr:PChar;
begin
 if sCurrentCallAdif='-1' then exit;
 if Trim(sLangList.Values[sCurrentCallAdif])='' then exit;
  GetMem(ptr, 100);
  GetKeyboardLayoutName(ptr);
  sOldKeyboardLayout:=ptr;
  FreeMem(ptr);
  ActivateKeyboardLayout(LoadKeyboardLayout(sLangList.Values[sCurrentCallAdif],0),0);
end;

procedure TWindowQSODataForm.ReturnLang;
begin
 if sOldKeyboardLayout<>'' then
  begin
    ActivateKeyboardLayout(LoadKeyboardLayout(sOldKeyboardLayout,0),0);
    sOldKeyboardLayout:='';
  end;
end;

procedure TWindowQSODataForm.StationChanged(lParam:variant);
begin
 StationId:=lParam;
 qryDxcc.Close;
 qryDxcc.SQL.Text:='SELECT LOG_MODE,LOG_BAND_MHZ FROM LOG_'+IntToStr(StationId)+' WHERE LOG_DXCC=:LOG_DXCC GROUP BY LOG_MODE,LOG_BAND_MHZ';
end;





end.
