unit uWindowQSLInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker,
  StdCtrls, Mask, DBCtrls, JvComCtrls, DB, JvExControls,
  JvDBLookup, uWindowPluginForm, JvMemoryDataset;

type
  TWindowQSLInfoForm = class(TWindowPluginForm)
    ScrollBox1: TScrollBox;
    pgQSL: TPageControl;
    tsQSL: TTabSheet;
    gbQSLSent: TGroupBox;
    lbQSLSentType: TLabel;
    lbQSLSentDate: TLabel;
    lbQSLSentVia: TLabel;
    lbQSLSentViaRoute: TLabel;
    dbQSLSentType: TJvDBLookupCombo;
    dbQSLSentViaRoute: TDBEdit;
    dbdQSLSentDate: TJvDBDateTimePicker;
    gbQSLRcv: TGroupBox;
    lbQSLRcvType: TLabel;
    lbQSLRcvDate: TLabel;
    lbQSLRcvVia: TLabel;
    dbQSLRcvType: TJvDBLookupCombo;
    dbQSLRcvVia: TJvDBLookupCombo;
    dbdQSLRcvDate: TJvDBDateTimePicker;
    tsEQSL: TTabSheet;
    gbEQSLSent: TGroupBox;
    lbEQSLSentType: TLabel;
    lbEQSLSentDate: TLabel;
    dbEQSLSentType: TJvDBLookupCombo;
    dbdEQSLSentDate: TJvDBDateTimePicker;
    gbEQSLRcv: TGroupBox;
    lbEQSLRcvType: TLabel;
    lbEQSLRcvDate: TLabel;
    dbEQSLRcvType: TJvDBLookupCombo;
    dbdEQSLRcvDate: TJvDBDateTimePicker;
    tsLOTW: TTabSheet;
    gbLQSLSent: TGroupBox;
    lbLQSLSentType: TLabel;
    lbLQSLSentDate: TLabel;
    dbLQSLSentType: TJvDBLookupCombo;
    dbdLQSLSentDate: TJvDBDateTimePicker;
    gbLQSLRcv: TGroupBox;
    lbLQSLRcvType: TLabel;
    lbLQSLRcvDate: TLabel;
    dbLQSLRcvType: TJvDBLookupCombo;
    dbdLQSLRcvDate: TJvDBDateTimePicker;
    dsQSLSentType: TDataSource;
    dsQSLRcvType: TDataSource;
    dsQSLSentVia: TDataSource;
    dsQSLRcvVia: TDataSource;
    dsEQSLSentType: TDataSource;
    dsEQSLRcvType: TDataSource;
    dsLQSLSentType: TDataSource;
    dsLQSLRcvType: TDataSource;
    cdsQSLSentType: TJvMemoryData;
    cdsQSLSentTypeQSL_SENT_TYPE_ID: TStringField;
    cdsQSLSentTypeQSL_SENT_TYPE_NAME: TStringField;
    lbSentTypeY: TLabel;
    lbSentTypeN: TLabel;
    lbSentTypeI: TLabel;
    lbSentTypeR: TLabel;
    lbSentTypeV: TLabel;
    cdsQSLRcvdType: TJvMemoryData;
    cdsQSLRcvdTypeQSL_SENT_TYPE_ID: TStringField;
    cdsQSLRcvdTypeQSL_SENT_TYPE_NAME: TStringField;
    cdsEQSLSentType: TJvMemoryData;
    cdsEQSLRcvdType: TJvMemoryData;
    cdsLQSLSentType: TJvMemoryData;
    cdsLQSLRcvdType: TJvMemoryData;
    lbSentViaB: TLabel;
    lbSentViaD: TLabel;
    lbSentViaE: TLabel;
    lbSentViaM: TLabel;
    cdsQSLSentVia: TJvMemoryData;
    cdsQSLSentViaQSL_SENT_VIA_NAME: TStringField;
    cdsQSLSentViaQSL_SENT_VIA_ID: TStringField;
    cdsQSLRcvdVia: TJvMemoryData;
    dbQSLSentVia: TJvDBLookupCombo;
    cdsEQSLSentTypeQSL_SENT_TYPE_ID: TStringField;
    cdsEQSLSentTypeQSL_SENT_TYPE_NAME: TStringField;
    lbSentTypeQ: TLabel;
    tsDQSL: TTabSheet;
    gbDQSLSent: TGroupBox;
    lbDQSLSentType: TLabel;
    lbDQSLSentDate: TLabel;
    dbDQSLSentType: TJvDBLookupCombo;
    dbdDQSLSentDate: TJvDBDateTimePicker;
    gbDQSLRcv: TGroupBox;
    lbDQSLRcvType: TLabel;
    lbDQSLRcvDate: TLabel;
    dbDQSLRcvType: TJvDBLookupCombo;
    dbdDQSLRcvDate: TJvDBDateTimePicker;
    dsDQSLSentType: TDataSource;
    dsDQSLRcvType: TDataSource;
    cdsDQSLSentType: TJvMemoryData;
    cdsDQSLRcvdType: TJvMemoryData;
    procedure dsQSLSentTypeDataChange(Sender: TObject; Field: TField);
    procedure dsQSLRcvTypeDataChange(Sender: TObject; Field: TField);
    procedure dsEQSLSentTypeDataChange(Sender: TObject; Field: TField);
    procedure dsEQSLRcvTypeDataChange(Sender: TObject; Field: TField);
    procedure dsLQSLSentTypeDataChange(Sender: TObject; Field: TField);
    procedure dsLQSLRcvTypeDataChange(Sender: TObject; Field: TField);
    procedure dsDQSLSentTypeDataChange(Sender: TObject; Field: TField);
    procedure dsDQSLRcvTypeDataChange(Sender: TObject; Field: TField);
  private
  public
    procedure InitData;
  end;

var
  WindowQSLInfoForm: TWindowQSLInfoForm;

implementation

uses uWindowQSLInfo;
{$R *.dfm}

procedure TWindowQSLInfoForm.dsDQSLRcvTypeDataChange(Sender: TObject;
  Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbdDQSLRcvDate.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_DQSL_QSL_RCVD').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_DQSL_QSL_RCVD').asString <> 'I');
end;

procedure TWindowQSLInfoForm.dsDQSLSentTypeDataChange(Sender: TObject;
  Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbdDQSLSentDate.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_DQSL_QSL_SENT').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_DQSL_QSL_SENT').asString <> 'I');
end;

procedure TWindowQSLInfoForm.dsEQSLRcvTypeDataChange(Sender: TObject; Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbdEQSLRcvDate.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_EQSL_QSL_RCVD').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_EQSL_QSL_RCVD').asString <> 'I');
end;

procedure TWindowQSLInfoForm.dsEQSLSentTypeDataChange(Sender: TObject; Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbdEQSLSentDate.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_EQSL_QSL_SENT').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_EQSL_QSL_SENT').asString <> 'I');
end;

procedure TWindowQSLInfoForm.dsLQSLRcvTypeDataChange(Sender: TObject; Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbdLQSLRcvDate.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_LOTW_QSL_RCVD').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_LOTW_QSL_RCVD').asString <> 'I');
end;

procedure TWindowQSLInfoForm.dsLQSLSentTypeDataChange(Sender: TObject; Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbdLQSLSentDate.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_LOTW_QSL_SENT').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_LOTW_QSL_SENT').asString <> 'I');
end;

procedure TWindowQSLInfoForm.dsQSLRcvTypeDataChange(Sender: TObject; Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbQSLRcvVia.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_QSL_RCVD').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_QSL_RCVD').asString <> 'I');
  dbdQSLRcvDate.Enabled := dbQSLRcvVia.Enabled;
end;

procedure TWindowQSLInfoForm.dsQSLSentTypeDataChange(Sender: TObject; Field: TField);
begin
  if not ldsLogEdit.DataSet.Active then
    exit;
  dbQSLSentVia.Enabled := (ldsLogEdit.DataSet.FieldByName('LOG_QSL_SENT').asString <> 'N') and (ldsLogEdit.DataSet.FieldByName('LOG_QSL_SENT').asString <> 'I');
  dbdQSLSentDate.Enabled := dbQSLSentVia.Enabled;
  dbQSLSentViaRoute.Enabled := dbQSLSentVia.Enabled;
end;

procedure TWindowQSLInfoForm.InitData;
var
 i : integer;
begin
  if not cdsQSLSentType.IsEmpty then  exit;
  cdsQSLSentType.Append;
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_ID').asString := 'Y';
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_NAME').asString := lbSentTypeY.Caption;
  cdsQSLSentType.Post;
  cdsQSLSentType.Append;
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_ID').asString := 'N';
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_NAME').asString := lbSentTypeN.Caption;
  cdsQSLSentType.Post;
  cdsQSLSentType.Append;
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_ID').asString := 'R';
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_NAME').asString := lbSentTypeR.Caption;
  cdsQSLSentType.Post;
  cdsQSLSentType.Append;
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_ID').asString := 'I';
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_NAME').asString := lbSentTypeI.Caption;
  cdsQSLSentType.Post;
  cdsQSLSentType.Append;
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_ID').asString := 'Q';
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_NAME').asString := lbSentTypeQ.Caption;
  cdsQSLSentType.Post;
  cdsQSLSentType.Append;
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_ID').asString := 'V';
  cdsQSLSentType.FieldByName('QSL_SENT_TYPE_NAME').asString := lbSentTypeV.Caption;
  cdsQSLSentType.Post;
  cdsQSLSentType.First;
  while not cdsQSLSentType.Eof do
  begin
    cdsQSLRcvdType.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsQSLRcvdType.Fields[i].Value:=cdsQSLSentType.Fields[i].Value;
    cdsQSLRcvdType.Post;
    cdsQSLSentType.Next;
  end;

  cdsQSLSentType.First;
  while not cdsQSLSentType.Eof do
  begin
    cdsEQSLSentType.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsEQSLSentType.Fields[i].Value:=cdsQSLSentType.Fields[i].Value;
    cdsEQSLSentType.Post;
    cdsQSLSentType.Next;
  end;
  cdsQSLSentType.First;
  while not cdsQSLSentType.Eof do
  begin
    cdsEQSLRcvdType.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsEQSLRcvdType.Fields[i].Value:=cdsQSLSentType.Fields[i].Value;
    cdsEQSLRcvdType.Post;
    cdsQSLSentType.Next;
  end;

  cdsQSLSentType.First;
  while not cdsQSLSentType.Eof do
  begin
    cdsDQSLSentType.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsDQSLSentType.Fields[i].Value:=cdsQSLSentType.Fields[i].Value;
    cdsDQSLSentType.Post;
    cdsQSLSentType.Next;
  end;
  cdsQSLSentType.First;
  while not cdsQSLSentType.Eof do
  begin
    cdsDQSLRcvdType.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsDQSLRcvdType.Fields[i].Value:=cdsQSLSentType.Fields[i].Value;
    cdsDQSLRcvdType.Post;
    cdsQSLSentType.Next;
  end;


  cdsQSLSentType.First;
  while not cdsQSLSentType.Eof do
  begin
    cdsLQSLSentType.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsLQSLSentType.Fields[i].Value:=cdsQSLSentType.Fields[i].Value;
    cdsLQSLSentType.Post;
    cdsQSLSentType.Next;
  end;
  cdsQSLSentType.First;
  while not cdsQSLSentType.Eof do
  begin
    cdsLQSLRcvdType.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsLQSLRcvdType.Fields[i].Value:=cdsQSLSentType.Fields[i].Value;
    cdsLQSLRcvdType.Post;
    cdsQSLSentType.Next;
  end;

  cdsQSLSentVia.Append;
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_ID').asString := 'B';
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_NAME').asString := lbSentViaB.Caption;
  cdsQSLSentVia.Post;
  cdsQSLSentVia.Append;
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_ID').asString := 'D';
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_NAME').asString := lbSentViaD.Caption;
  cdsQSLSentVia.Post;
  cdsQSLSentVia.Append;
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_ID').asString := 'E';
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_NAME').asString := lbSentViaE.Caption;
  cdsQSLSentVia.Post;
  cdsQSLSentVia.Append;
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_ID').asString := 'M';
  cdsQSLSentVia.FieldByName('QSL_SENT_VIA_NAME').asString := lbSentViaM.Caption;
  cdsQSLSentVia.Post;
  cdsQSLSentVia.First;
  while not cdsQSLSentVia.Eof do
  begin
    cdsQSLRcvdVia.Append;
    for i:=0 to cdsQSLSentType.FieldCount-1 do
      cdsQSLRcvdVia.Fields[i].Value:=cdsQSLSentVia.Fields[i].Value;
    cdsQSLRcvdVia.Post;
    cdsQSLSentVia.Next;
  end;
end;

end.
