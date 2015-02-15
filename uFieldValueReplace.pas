unit uFieldValueReplace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, DB, Mask,
  JvExMask, JvToolEdit, JvBaseEdits, ComCtrls, DTPEx, uPluginHeaders, KDaoTable,
  rkVistaProBar;

type

  TFieldRecord=record
    FieldName:string;
    DataType:TFieldType;
  end;

  PFieldRecord =^TFieldRecord;


  TFieldValueReplace = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    cbFields: TComboBox;
    lbField: TLabel;
    cbReplaceAll: TCheckBox;
    gbReplace: TGroupBox;
    rbCustom: TRadioButton;
    lbValue: TLabel;
    edtString: TEdit;
    edtNumber: TJvCalcEdit;
    edtDateTime: TDateTimePickerEx;
    rbFile: TRadioButton;
    feFileName: TJvFilenameEdit;
    rbField: TRadioButton;
    cbFieldsFrom: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure cbFieldsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbFromFileClick(Sender: TObject);
    procedure rbFileClick(Sender: TObject);
    procedure rbFieldClick(Sender: TObject);
    procedure rbCustomClick(Sender: TObject);
    procedure cbFieldsFromClick(Sender: TObject);
  private
  public
    FieldName:string;
    FieldValue:string;
    FieldFromName:string;
  end;

var
  FieldValueReplace: TFieldValueReplace;


implementation

uses udmMain, uMainWindow, uOptions;

{$R *.dfm}

procedure TFieldValueReplace.btnOkClick(Sender: TObject);
begin
if not rbFile.Checked then
begin
 if edtString.Visible then
   FieldValue:=QuotedStr(edtString.Text);
 if edtNumber.Visible then
   FieldValue:=StringReplace(edtNumber.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
 if edtDateTime.Visible then
   FieldValue:=QuotedStr(FormatDateTime('m/dd/yyyy hh:nn:ss',edtDateTime.DateTime));
end;
end;

procedure TFieldValueReplace.cbFieldsClick(Sender: TObject);
var
 FieldRecord:TFieldRecord;
begin
 if Assigned(cbFields.Items.Objects[cbFields.ItemIndex]) then
  begin
       edtString.Visible:=False;
       edtNumber.Visible:=False;
       edtDateTime.Visible:=False;
    if (PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftString) or (PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftMemo) then
       edtString.Visible:=True;
    if (PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftInteger) or (PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftSmallInt) then
     begin
       edtNumber.Visible:=True;
       edtNumber.DecimalPlaces:=0;
     end;
    if PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftFloat then
     begin
       edtNumber.Visible:=True;
       edtNumber.DecimalPlaces:=10;
     end;
    if PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftFloat then
     begin
       edtNumber.Visible:=True;
       edtNumber.DecimalPlaces:=10;
     end;
    if PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftDateTime then
    begin
     edtDateTime.DateTime:=Now;
     edtDateTime.Visible:=True;
     btnOk.Enabled:=True;
    end;
    FieldName:=PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.FieldName;
  end;
 btnOk.Enabled:=((Trim(cbFields.Text)<>'') and (rbCustom.Checked or rbFile.Checked)) or ((Trim(cbFields.Text)<>'') and (Trim(cbFieldsFrom.Text)<>'') and rbField.Checked );
end;

procedure TFieldValueReplace.cbFieldsFromClick(Sender: TObject);
begin
    FieldFromName:=PFieldRecord(cbFieldsFrom.Items.Objects[cbFieldsFrom.ItemIndex])^.FieldName;
 btnOk.Enabled:=((Trim(cbFields.Text)<>'') and (rbCustom.Checked or rbFile.Checked)) or ((Trim(cbFields.Text)<>'') and (Trim(cbFieldsFrom.Text)<>'') and rbField.Checked );
end;

procedure TFieldValueReplace.cbFromFileClick(Sender: TObject);
begin
{if cbFields.ItemIndex=-1 then exit;

 if Assigned(cbFields.Items.Objects[cbFields.ItemIndex]) then
  begin
       edtString.Visible:=False;
       edtNumber.Visible:=False;
       edtDateTime.Visible:=False;
    if (PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftString) or (PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftMemo) then
    begin
       edtString.Visible:=True;
       edtString.Enabled:=not rbFile.Checked;
    end;
    if PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftInteger then
     begin
       edtNumber.Visible:=True;
       edtNumber.DecimalPlaces:=0;
       edtNumber.Enabled:=not rbFile.Checked;
     end;
    if PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftFloat then
     begin
       edtNumber.Visible:=True;
       edtNumber.DecimalPlaces:=10;
       edtNumber.Enabled:=not rbFile.Checked;
     end;
    if PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftFloat then
     begin
       edtNumber.Visible:=True;
       edtNumber.DecimalPlaces:=10;
       edtNumber.Enabled:=not rbFile.Checked;
     end;
    if PFieldRecord(cbFields.Items.Objects[cbFields.ItemIndex])^.DataType=ftDateTime then
    begin
     edtDateTime.DateTime:=Now;
     edtDateTime.Visible:=True;
     edtDateTime.Enabled:=not rbFile.Checked;
     btnOk.Enabled:=True;
    end;
  end;}
end;

procedure TFieldValueReplace.FormShow(Sender: TObject);
var
 i:integer;
 vFieldRecord:PFieldRecord;
begin
feFileName.InitialDir:=ExtractFilePath(Application.ExeName);
 for i:=0 to dmMain.qryLog.FieldCount-1 do
  begin
    New(vFieldRecord);
    vFieldRecord.FieldName:=dmMain.qryLog.Fields[i].FieldName;
    vFieldRecord.DataType:=dmMain.qryLog.Fields[i].DataType;
    cbFields.Items.AddObject(dmMain.qryLog.Fields[i].DisplayLabel,TObject(vFieldRecord));
    cbFieldsFrom.Items.AddObject(dmMain.qryLog.Fields[i].DisplayLabel,TObject(vFieldRecord));
  end;
end;

procedure TFieldValueReplace.rbCustomClick(Sender: TObject);
begin
  feFileName.Enabled:=False;
  cbFieldsFrom.Enabled:=False;
  edtString.Enabled:=True;
  edtNumber.Enabled:=True;
  edtDateTime.Enabled:=True;
 btnOk.Enabled:=((Trim(cbFields.Text)<>'') and (rbCustom.Checked or rbFile.Checked)) or ((Trim(cbFields.Text)<>'') and (Trim(cbFieldsFrom.Text)<>'') and rbField.Checked );
end;

procedure TFieldValueReplace.rbFieldClick(Sender: TObject);
begin
  edtString.Enabled:=False;
  edtNumber.Enabled:=False;
  edtDateTime.Enabled:=False;
  feFileName.Enabled:=False;
  cbFieldsFrom.Enabled:=True;
 btnOk.Enabled:=((Trim(cbFields.Text)<>'') and (rbCustom.Checked or rbFile.Checked)) or ((Trim(cbFields.Text)<>'') and (Trim(cbFieldsFrom.Text)<>'') and rbField.Checked );
end;

procedure TFieldValueReplace.rbFileClick(Sender: TObject);
begin
  edtString.Enabled:=False;
  edtNumber.Enabled:=False;
  edtDateTime.Enabled:=False;
  cbFieldsFrom.Enabled:=False;
  feFileName.Enabled:=True;
 btnOk.Enabled:=((Trim(cbFields.Text)<>'') and (rbCustom.Checked or rbFile.Checked)) or ((Trim(cbFields.Text)<>'') and (Trim(cbFieldsFrom.Text)<>'') and rbField.Checked );
end;

end.
