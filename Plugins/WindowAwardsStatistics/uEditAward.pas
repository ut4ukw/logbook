unit uEditAward;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, LabeledControls, Mask, DTPEx,
  DBGridEhGrouping, GridsEh, DBGridEh, ToolWin, DB, JvMemoryDataset,
  KDaoDataBase, KDaoTable, JvExExtCtrls, JvExtComponent, JvFooter, JvDBControls,
  ImgList, ActnList, Buttons, JvExControls, JvSpeedButton, ShellApi, JvDBLookup,
  JvComponentBase, JvFormPlacement;

type
  TEditAward = class(TForm)
    PageControl1: TPageControl;
    AWARDSSTATISTICS_tsAward: TTabSheet;
    AWARDSSTATISTICS_tsData: TTabSheet;
    AWARDSSTATISTICS_gbAward: TGroupBox;
    AWARDSSTATISTICS_gbAwardRule: TGroupBox;
    AWARDSSTATISTICS_leAwardName: TLabeledDBEdit;
    AWARDSSTATISTICS_leAwardUrl: TLabeledDBEdit;
    AWARDSSTATISTICS_lmAwardDescription: TLabeledDBMemo;
    AWARDSSTATISTICS_dtpStart: TDateTimePickerEx;
    AWARDSSTATISTICS_dtpEnd: TDateTimePickerEx;
    dbgAwardsData: TDBGridEh;
    lbSSTFilterListItem_All: TLabel;
    lbSSTFilterListItem_ClearFilter: TLabel;
    lbSSTFilterListItem_ApplyFilter: TLabel;
    lbSSTFilterListItem_CustomFilter: TLabel;
    lbFilterCaption: TLabel;
    lbShowRecordsWhere: TLabel;
    lbAnd: TLabel;
    lbOr: TLabel;
    AWARDSSTATISTICS_cbActive: TDBCheckBox;
    AWARDSSTATISTICS_leAwardFilterDXCC: TLabeledDBEdit;
    qryAwards: TKADaoTable;
    qryAwardsAWARD_ID: TAutoIncField;
    qryAwardsAWARD_NAME: TStringField;
    qryAwardsAWARD_DATA_FIELD: TStringField;
    qryAwardsAWARD_RULES: TMemoField;
    qryAwardsAWARD_DATE_START: TDateTimeField;
    qryAwardsAWARD_DATE_END: TDateTimeField;
    qryAwardsAWARD_URL: TStringField;
    qryAwardsAWARD_ACTIVE: TIntegerField;
    qryAwardsAWARD_DATA_FIELD_CAPTION: TStringField;
    JvFooter1: TJvFooter;
    AWARDSSTATISTICS_btnOk: TButton;
    AWARDSSTATISTICS_btnCancel: TButton;
    qryAwardsData: TKADaoTable;
    dsAwardsData: TDataSource;
    dsAwards: TDataSource;
    qryAwardsAWARD_QUICK_STATS: TIntegerField;
    AWARDSSTATISTICS_cbQuickStats: TDBCheckBox;
    cbDataField: TComboBox;
    qryAwardsDataAWARD_DATA_ID: TAutoIncField;
    qryAwardsDataAWARD_ID: TIntegerField;
    qryAwardsDataAWARD_DATA_FIELD_VALUE: TStringField;
    qryAwardsDataAWARD_DATA_FIELD_DESCRIPTION: TStringField;
    qryAwardsDataAWARD_DATA_START_DATE: TDateTimeField;
    qryAwardsDataAWARD_DATA_END_DATE: TDateTimeField;
    qryAwardsDataAWARD_DATA_SCORE: TIntegerField;
    AWARDSSTATISTICS_lbPeriod: TLabel;
    AWARDSSTATISTICS_lbDataField: TLabel;
    qryAwardsAWARD_FILTER_DXCC: TStringField;
    qryAwardsAWARD_FILTER_CALL: TStringField;
    qryAwardsAWARD_QSL: TSmallintField;
    qryAwardsAWARD_EQSL: TSmallintField;
    qryAwardsAWARD_LOTW: TSmallintField;
    qryAwardsAWARD_DQSL: TSmallintField;
    AWARDSSTATISTICS_gbQSLType: TGroupBox;
    AWARDSSTATISTICS_cbQSL: TDBCheckBox;
    AWARDSSTATISTICS_cbEQSL: TDBCheckBox;
    AWARDSSTATISTICS_cbLoTW: TDBCheckBox;
    AWARDSSTATISTICS_cbDQSL: TDBCheckBox;
    qryAwardsAWARD_STATS_FOR_ALL: TSmallintField;
    AWARDSSTATISTICS_cbQuickStatsForAll: TDBCheckBox;
    cbFilterField: TComboBox;
    AWARDSSTATISTICS_lbFilterField: TLabel;
    qryAwardsAWARD_FILTER_FIELD: TStringField;
    qryAwardsDataAWARD_DATA_FILTER_VALUE: TStringField;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ilAwardStatisticsEdit: TImageList;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    alAwardsStatisticsEdit: TActionList;
    AwardsStatistics_aAddAwardStatisctic: TAction;
    AwardsStatistics_aEditAwardStatistic: TAction;
    AwardsStatistics_aDeleteAwardStatistic: TAction;
    AwardsStatistics_aPostAwardStatistic: TAction;
    AwardsStatistics_aCancelAwardStatistic: TAction;
    sbUrl: TJvSpeedButton;
    lbDXCC: TListBox;
    AWARDSSTATISTICS_lbAwardFilterDXCC: TLabel;
    dblCountry: TJvDBLookupCombo;
    JvSpeedButton2: TJvSpeedButton;
    JvSpeedButton3: TJvSpeedButton;
    qryTerritory: TKADaoTable;
    qryTerritoryTERRITORY_ID: TIntegerField;
    qryTerritoryTERRITORY_NAME: TStringField;
    qryTerritoryADIF_ID: TIntegerField;
    qryTerritoryCONTINENT_ID: TIntegerField;
    dsTerritory: TDataSource;
    FormStorage: TJvFormStorage;
    procedure AWARDSSTATISTICS_btnOkClick(Sender: TObject);
    procedure AWARDSSTATISTICS_leAwardNameChange(Sender: TObject);
    procedure qryAwardsDataNewRecord(DataSet: TDataSet);
    procedure AwardsStatistics_aAddAwardStatiscticUpdate(Sender: TObject);
    procedure AwardsStatistics_aEditAwardStatisticUpdate(Sender: TObject);
    procedure AwardsStatistics_aDeleteAwardStatisticUpdate(Sender: TObject);
    procedure AwardsStatistics_aPostAwardStatisticUpdate(Sender: TObject);
    procedure AwardsStatistics_aCancelAwardStatisticUpdate(Sender: TObject);
    procedure AwardsStatistics_aAddAwardStatiscticExecute(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure sbUrlClick(Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
    procedure JvSpeedButton3Click(Sender: TObject);
    procedure FormStorageSavePlacement(Sender: TObject);
  private
  public
   bEditMode:boolean;
   procedure Init;
  end;

var
  EditAward: TEditAward;

implementation

uses uWindowAwardsStatistics;

{$R *.dfm}

procedure TEditAward.AWARDSSTATISTICS_leAwardNameChange(Sender: TObject);
begin
 AWARDSSTATISTICS_btnOk.Enabled:=Trim(AWARDSSTATISTICS_leAwardName.Text)<>'';
end;


procedure TEditAward.FormStorageSavePlacement(Sender: TObject);
var
  i: integer;
  s: string;
begin
  with dbgAwardsData.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      s := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, integer(Items[i].Title.SortMarker), integer(Items[i].Visible), Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth, Items[i].InRowLinePos,
        Items[i].InRowLineHeight]);
      if s <> '' then
      begin
        if ((s[1] = '"') and (s[Length(s)] = '"')) or ((s[1] = '''') and (s[Length(s)] = '''')) then
          s := '"' + s + '"';
      end;
      FormStorage.WriteString(dbgAwardsData.Name + '.' + Items[i].FieldName, s);
    end;
  end;

end;

procedure TEditAward.AwardsStatistics_aAddAwardStatiscticExecute(
  Sender: TObject);
begin
 qryAwardsData.Insert;
end;

procedure TEditAward.AwardsStatistics_aAddAwardStatiscticUpdate(
  Sender: TObject);
begin
 AwardsStatistics_aAddAwardStatisctic.Enabled:=not (qryAwardsData.State in [dsInsert,dsEdit]);
end;

procedure TEditAward.AwardsStatistics_aCancelAwardStatisticUpdate(
  Sender: TObject);
begin
 AwardsStatistics_aCancelAwardStatistic.Enabled:=(qryAwardsData.State in [dsInsert,dsEdit]);
end;

procedure TEditAward.AwardsStatistics_aDeleteAwardStatisticUpdate(
  Sender: TObject);
begin
 AwardsStatistics_aDeleteAwardStatistic.Enabled:=not (qryAwardsData.State in [dsInsert,dsEdit]);
end;

procedure TEditAward.AwardsStatistics_aEditAwardStatisticUpdate(
  Sender: TObject);
begin
 AwardsStatistics_aEditAwardStatistic.Enabled:=not (qryAwardsData.State in [dsInsert,dsEdit]);
end;

procedure TEditAward.AwardsStatistics_aPostAwardStatisticUpdate(
  Sender: TObject);
begin
 AwardsStatistics_aPostAwardStatistic.Enabled:=(qryAwardsData.State in [dsInsert,dsEdit]);
end;

procedure TEditAward.AWARDSSTATISTICS_btnOkClick(Sender: TObject);
var
 i:integer;
 s:string;
begin
     qryAwards.FieldByName('AWARD_DATE_START').asDateTime:=AWARDSSTATISTICS_dtpStart.DateTime;
     qryAwards.FieldByName('AWARD_DATE_END').asDateTime:=AWARDSSTATISTICS_dtpEnd.DateTime;
     if cbDataField.ItemIndex<>-1 then
       qryAwards.FieldByName('AWARD_DATA_FIELD').asString:=TField(cbDataField.Items.Objects[cbDataField.ItemIndex]).FieldName;

     if cbFilterField.ItemIndex<>-1 then
       qryAwards.FieldByName('AWARD_FILTER_FIELD').asString:=TField(cbFilterField.Items.Objects[cbFilterField.ItemIndex]).FieldName;


 for i:=0 to lbDXCC.Items.Count-1 do
 if s='' then
   s:=IntToStr(Integer(lbDXCC.Items.Objects[i]))
 else
   s:=s+','+IntToStr(Integer(lbDXCC.Items.Objects[i]));
   qryAwards.FieldByName('AWARD_FILTER_DXCC').asString:=s;

     qryAwards.Post;
     if not bEditMode then
     begin
     qryAwards.Last;
     qryAwardsData.DisableControls;
     qryAwardsData.First;
     qryAwardsData.Edit;
     while not qryAwardsData.Eof do
      begin
       qryAwardsData.FieldByName('AWARD_ID').AsInteger:=qryAwards.FieldByName('AWARD_ID').AsInteger;
       qryAwardsData.Next;
      end;
     end;

     if qryAwardsData.State in [dsEdit,dsInsert] then
       qryAwardsData.Post;


end;

procedure TEditAward.Init;
var
i:integer;
slDXCC:TStringList;

begin

 qryTerritory.Open;
 qryTerritory.SortedBy.Text:='TERRITORY_NAME ASC';
 qryTerritory.Sort;

 for i:= 0 to ldsLogEdit.DataSet.FieldCount - 1 do
    cbDataField.AddItem(ldsLogEdit.DataSet.Fields[i].DisplayLabel,ldsLogEdit.DataSet.Fields[i]);
 cbDataField.Sorted:=True;



for i:= 0 to ldsLogEdit.DataSet.FieldCount - 1 do
    cbFilterField.AddItem(ldsLogEdit.DataSet.Fields[i].DisplayLabel,ldsLogEdit.DataSet.Fields[i]);
 cbFilterField.Sorted:=True;

 if bEditMode then
  begin
   for i:= 0 to cbDataField.Items.Count-1 do
     if  qryAwards.FieldByName('AWARD_DATA_FIELD').asString=TField(cbDataField.Items.Objects[i]).FieldName then
      begin
       cbDataField.ItemIndex:=i;
       break;
      end;

   for i:= 0 to cbFilterField.Items.Count-1 do
     if  qryAwards.FieldByName('AWARD_FILTER_FIELD').asString=TField(cbFilterField.Items.Objects[i]).FieldName then
      begin
       cbFilterField.ItemIndex:=i;
       break;
      end;

   slDXCC:=TStringList.Create;
   slDXCC.Delimiter:=',';
   slDXCC.DelimitedText:=qryAwards.FieldByName('AWARD_FILTER_DXCC').asString;

   qryTerritory.DisableControls;
   for i := 0 to slDXCC.Count - 1 do
   begin
     qryTerritory.First;
     qryTerritory.Locate('ADIF_ID',slDXCC[i],[]);
     lbDXCC.Items.AddObject(qryTerritory.FieldByName('TERRITORY_NAME').AsString,TObject(Integer(qryTerritory.FieldByName('ADIF_ID').AsInteger)));
   end;
   qryTerritory.First;
   qryTerritory.EnableControls;
   slDXCC.Free;
  end;
end;


procedure TEditAward.sbUrlClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, PChar('open'),PChar(AWARDSSTATISTICS_leAwardUrl.Text), Nil, Nil,SW_SHOW);
end;

procedure TEditAward.JvSpeedButton2Click(Sender: TObject);
begin
 lbDXCC.Items.AddObject(dblCountry.Text,TObject(Integer(dblCountry.KeyValue)));
end;

procedure TEditAward.JvSpeedButton3Click(Sender: TObject);
begin
 lbDXCC.DeleteSelected;
end;

procedure TEditAward.qryAwardsDataNewRecord(DataSet: TDataSet);
begin
 if bEditMode then
   qryAwardsData.FieldByName('AWARD_ID').AsInteger:=qryAwards.FieldByName('AWARD_ID').AsInteger;
end;

procedure TEditAward.ToolButton2Click(Sender: TObject);
begin
  qryAwardsData.Edit;
end;

procedure TEditAward.ToolButton3Click(Sender: TObject);
begin
  qryAwardsData.Delete;
end;

procedure TEditAward.ToolButton5Click(Sender: TObject);
begin
  qryAwardsData.Post;
end;

procedure TEditAward.ToolButton6Click(Sender: TObject);
begin
  qryAwardsData.Cancel;
end;

end.
