unit uWindowAwardsStatisticsSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls,
  ExtCtrls, Spin, Mask, JvExMask, JvToolEdit, uUtils, DBGridEhGrouping, ComCtrls,
  GridsEh, DBGridEh, ToolWin, DB, KDaoTable, KDaoDataBase, DBCtrls,
  LabeledControls, uEditAward, ActnList, ImgList, JvAppIniStorage, uPluginHeaders, IniFiles,
  JvDialogs, sToolBar;

type
  TWindowAwardsStatisticsSettingsFrame = class(TFrame)
    dbgAwards: TDBGridEh;
    lbSSTFilterListItem_All: TLabel;
    lbSSTFilterListItem_ClearFilter: TLabel;
    lbSSTFilterListItem_ApplyFilter: TLabel;
    lbSSTFilterListItem_CustomFilter: TLabel;
    lbFilterCaption: TLabel;
    lbShowRecordsWhere: TLabel;
    lbAnd: TLabel;
    lbOr: TLabel;
    qryAwards: TKADaoTable;
    dsAwards: TDataSource;
    qryAwardsAWARD_ID: TAutoIncField;
    qryAwardsAWARD_NAME: TStringField;
    qryAwardsAWARD_DATA_FIELD: TStringField;
    qryAwardsAWARD_RULES: TMemoField;
    qryAwardsAWARD_DATE_START: TDateTimeField;
    qryAwardsAWARD_DATE_END: TDateTimeField;
    alAwardsStatistics: TActionList;
    AwardsStatistics_aAddAward: TAction;
    AwardsStatistics_aEditAward: TAction;
    AwardsStatistics_aDeleteAward: TAction;
    qryAwardsAWARD_URL: TStringField;
    qryAwardsAWARD_ACTIVE: TIntegerField;
    qryAwardsAWARD_DATA_FIELD_CAPTION: TStringField;
    qryAwardsAWARD_QUICK_STATS: TIntegerField;
    AwardsStatistics_aImportAward: TAction;
    AwardsStatistics_aExportAward: TAction;
    SaveDialog: TSaveDialog;
    qryAwardsAWARD_FILTER_FIELD: TStringField;
    qryAwardsAWARD_FILTER_DXCC: TStringField;
    qryAwardsAWARD_FILTER_CALL: TStringField;
    qryAwardsAWARD_QSL: TSmallintField;
    qryAwardsAWARD_EQSL: TSmallintField;
    qryAwardsAWARD_LOTW: TSmallintField;
    qryAwardsAWARD_DQSL: TSmallintField;
    qryAwardsAWARD_STATS_FOR_ALL: TSmallintField;
    OpenDialog: TJvOpenDialog;
    qryAwardsData: TKADaoTable;
    qryAwardsDataAWARD_DATA_ID: TAutoIncField;
    qryAwardsDataAWARD_ID: TIntegerField;
    qryAwardsDataAWARD_DATA_FIELD_VALUE: TStringField;
    qryAwardsDataAWARD_DATA_FIELD_DESCRIPTION: TStringField;
    qryAwardsDataAWARD_DATA_START_DATE: TDateTimeField;
    qryAwardsDataAWARD_DATA_END_DATE: TDateTimeField;
    qryAwardsDataAWARD_DATA_SCORE: TIntegerField;
    qryAwardsDataAWARD_DATA_FILTER_VALUE: TStringField;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ilAwardStatistics: TImageList;
    AWARDSSTATISTICS_msgDeleteAward: TLabel;
    FormStorage: TJvFormStorage;
    procedure AwardsStatistics_aAddAwardExecute(Sender: TObject);
    procedure FormStorageSavePlacement(Sender: TObject);
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
    procedure AwardsStatistics_aDeleteAwardExecute(Sender: TObject);
    procedure AwardsStatistics_aEditAwardExecute(Sender: TObject);
    procedure AwardsStatistics_aImportAwardExecute(Sender: TObject);
    procedure AwardsStatistics_aExportAwardExecute(Sender: TObject);
    procedure dbgAwardsDblClick(Sender: TObject);
  private
  public
    procedure SavePlacementAwardDataGrid(Grid:TDbgridEh);
  end;

implementation

uses uWindowAwardsStatisticsForm, uWindowAwardsStatistics;
{$R *.dfm}

var
  EditAward: TEditAward;

procedure TWindowAwardsStatisticsSettingsFrame.AwardsStatistics_aAddAwardExecute(Sender: TObject);
var
  lParam, wParam: variant;
begin
  EditAward := TEditAward.Create(Self);
  try
    lParam := 'Options';
    lDllCommand(DC_TRANSLATE_WINDOW, EditAward, lParam, wParam);
    EditAward.Caption := AwardsStatistics_aAddAward.Caption;
    EditAward.qryAwards.Database := lDatabase;
    EditAward.qryAwards.Open;
    EditAward.qryAwards.Append;
    EditAward.qryAwards.FieldByName('AWARD_ACTIVE').AsInteger := 0;
    EditAward.qryAwards.FieldByName('AWARD_QUICK_STATS').AsInteger := 0;
    EditAward.qryAwards.FieldByName('AWARD_STATS_FOR_ALL').AsInteger := 0;
    EditAward.qryAwards.FieldByName('AWARD_QSL').AsInteger := 0;
    EditAward.qryAwards.FieldByName('AWARD_EQSL').AsInteger := 0;
    EditAward.qryAwards.FieldByName('AWARD_LOTW').AsInteger := 0;
    EditAward.qryAwards.FieldByName('AWARD_DQSL').AsInteger := 0;
    EditAward.qryAwardsData.Database := lDatabase;
    EditAward.qryAwardsData.Open;
    EditAward.qryAwardsData.Filter := 'AWARD_ID=-1';
    EditAward.qryAwardsData.Filtered := True;
    EditAward.Init;
    EditAward.dbgAwardsData.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorage.AppStorage).FileName, 'WindowAwardsStatisticsSettingsFrame', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh,
    crpDropDownWidthEh, crpRowPanelColPlacementEh]);

    if EditAward.ShowModal = mrOk then
    begin
      SavePlacementAwardDataGrid(EditAward.dbgAwardsData);
      qryAwards.RefreshData;
    end
    else
      EditAward.qryAwards.Cancel;
  finally
    EditAward.Free;
  end;
end;

procedure TWindowAwardsStatisticsSettingsFrame.AwardsStatistics_aDeleteAwardExecute(Sender: TObject);
begin
  if MessageBox(Handle, PWideChar(PWideChar(AWARDSSTATISTICS_msgDeleteAward.Caption)), PWideChar(''), mb_YesNo or mb_iconquestion) = mrYes then
  begin
    qryAwards.Delete;
  end;

end;

procedure TWindowAwardsStatisticsSettingsFrame.AwardsStatistics_aEditAwardExecute(Sender: TObject);
var
  lParam, wParam: variant;

begin
  EditAward := TEditAward.Create(Self);
  try
    lParam := 'Options';
    lDllCommand(DC_TRANSLATE_WINDOW, EditAward, lParam, wParam);
    EditAward.Caption := AwardsStatistics_aEditAward.Caption;
    EditAward.bEditMode := True;
    EditAward.qryAwards.Database := lDatabase;
    EditAward.qryAwards.Open;
    EditAward.qryAwards.Locate('AWARD_ID', IntToStr(qryAwards.FieldByName('AWARD_ID').AsInteger), []);
    EditAward.qryAwards.Edit;
    EditAward.qryAwardsData.Database := lDatabase;
    EditAward.qryAwardsData.Open;
    EditAward.qryAwardsData.Filter := 'AWARD_ID=' + IntToStr(EditAward.qryAwards.FieldByName('AWARD_ID').AsInteger);
    EditAward.qryAwardsData.Filtered := True;
    EditAward.Init;
    EditAward.dbgAwardsData.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorage.AppStorage).FileName, 'WindowAwardsStatisticsSettingsFrame', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh,
    crpDropDownWidthEh, crpRowPanelColPlacementEh]);
    if EditAward.ShowModal = mrOk then
    begin
      SavePlacementAwardDataGrid(EditAward.dbgAwardsData);
      qryAwards.Refresh;
    end
    else
      EditAward.qryAwards.Cancel;
  finally
    EditAward.Free;
  end;
end;

procedure TWindowAwardsStatisticsSettingsFrame.AwardsStatistics_aExportAwardExecute(Sender: TObject);
var
  IniFile: TIniFile;
  qryTmp: TKADaoTable;
  i:integer;
begin
  SaveDialog.FileName := qryAwards.FieldByName('AWARD_NAME').AsString;
  if SaveDialog.Execute() then
  begin
    Screen.Cursor:=crHourGlass;
    Application.ProcessMessages;
    IniFile := TIniFile.Create(SaveDialog.FileName);
    IniFile.EraseSection('Award');
    IniFile.EraseSection('Data');
    try
      IniFile.WriteString('Award', 'NAME', qryAwards.FieldByName('AWARD_NAME').AsString);
      IniFile.WriteString('Award', 'URL', qryAwards.FieldByName('AWARD_URL').AsString);
      IniFile.WriteString('Award', 'RULES', qryAwards.FieldByName('AWARD_RULES').AsString);
      IniFile.WriteDate('Award', 'DATE_START', qryAwards.FieldByName('AWARD_DATE_START').asDateTime);
      IniFile.WriteDate('Award', 'DATE_END', qryAwards.FieldByName('AWARD_DATE_END').asDateTime);
      IniFile.WriteString('Award', 'DATE_FIELD', Copy(qryAwards.FieldByName('AWARD_DATA_FIELD').AsString,5,Length(qryAwards.FieldByName('AWARD_DATA_FIELD').AsString)-4));
      IniFile.WriteString('Award', 'FILTER_DXCC', qryAwards.FieldByName('AWARD_FILTER_DXCC').AsString);
      IniFile.WriteString('Award', 'FILTER_FIELD', Copy(qryAwards.FieldByName('AWARD_FILTER_FIELD').AsString,5,Length(qryAwards.FieldByName('AWARD_FILTER_FIELD').AsString)-4));
      IniFile.WriteInteger('Award', 'QSL', qryAwards.FieldByName('AWARD_QSL').AsInteger);
      IniFile.WriteInteger('Award', 'EQSL', qryAwards.FieldByName('AWARD_EQSL').AsInteger);
      IniFile.WriteInteger('Award', 'LOTW', qryAwards.FieldByName('AWARD_LOTW').AsInteger);
      IniFile.WriteInteger('Award', 'DQSL', qryAwards.FieldByName('AWARD_DQSL').AsInteger);
      i:=1;
      qryTmp := TKADaoTable.Create(nil);
      try
        qryTmp.Database := lDatabase;
        qryTmp.SQL.Text := 'SELECT * FROM AWARDS_DATA WHERE AWARD_ID=' + qryAwards.FieldByName('AWARD_ID').AsString;
        qryTmp.Open;
        while not qryTmp.Eof do
        begin
          IniFile.WriteString('Data', IntToStr(i),qryTmp.FieldByName('AWARD_DATA_FIELD_VALUE').AsString+';'+qryTmp.FieldByName('AWARD_DATA_FIELD_DESCRIPTION').AsString + ';' + qryTmp.FieldByName('AWARD_DATA_FILTER_VALUE').AsString + ';' + DateToStr
              (qryTmp.FieldByName('AWARD_DATA_START_DATE').asDateTime) + ';' + DateToStr(qryTmp.FieldByName('AWARD_DATA_END_DATE').asDateTime) + ';' + IntToStr(qryTmp.FieldByName('AWARD_DATA_SCORE').AsInteger));
          Inc(i);
          qryTmp.Next;
        end;
      finally
        qryTmp.Free;
      end;

    finally
      IniFile.Free;
      Screen.Cursor:=crDefault;
    end;

  end;
end;

procedure TWindowAwardsStatisticsSettingsFrame.AwardsStatistics_aImportAwardExecute(Sender: TObject);
var
  IniFile: TIniFile;
  qryTmp: TKADaoTable;
  NewId: integer;
  slData, slDataLine: TStringList;
  i: integer;
  Edit:boolean;
  DateStart,DateEnd:TDateTime;
begin
  if OpenDialog.Execute() then
  begin
    Screen.Cursor:=crHourGlass;
    IniFile := TIniFile.Create(OpenDialog.FileName);
    slData := TStringList.Create;
    slDataLine := TStringList.Create;
    slDataLine.Delimiter := ';';
    slDataLine.StrictDelimiter:=True;
    Edit:=False;
    NewId := 0;
    qryTmp := TKADaoTable.Create(nil);
    qryTmp.Database := lDatabase;

    try

      qryAwards.DisableControls;

        qryTmp.Close;
        qryTmp.SQL.Text := 'SELECT AWARD_ID FROM AWARDS WHERE AWARD_NAME='+#39+IniFile.ReadString('Award', 'NAME', '')+#39;
        qryTmp.Open;
        if not qryTmp.IsEmpty  then
         begin
           Edit:=True;
           NewId := qryTmp.Fields[0].AsInteger;
           qryAwards.First;
           qryAwards.Locate('AWARD_NAME',IniFile.ReadString('Award', 'NAME', ''),[]);
         end;

      if Edit then
        qryAwards.Edit
      else
        qryAwards.Append;

      qryAwards.FieldByName('AWARD_NAME').AsString := IniFile.ReadString('Award', 'NAME', '');
      qryAwards.FieldByName('AWARD_URL').AsString := IniFile.ReadString('Award', 'URL', '');
      qryAwards.FieldByName('AWARD_RULES').AsString := IniFile.ReadString('Award', 'RULES', '');
      DateStart:=IniFile.ReadDate('Award', 'DATE_START', 0);
      if DateStart<>0 then
        qryAwards.FieldByName('AWARD_DATE_START').asDateTime := DateStart
      else
        qryAwards.FieldByName('AWARD_DATE_START').asDateTime := StrToDateTime('01.01.1900');

      if DateEnd<>0 then
        qryAwards.FieldByName('AWARD_DATE_END').asDateTime := DateEnd
      else
        qryAwards.FieldByName('AWARD_DATE_END').asDateTime := StrToDateTime('01.01.3000');

      qryAwards.FieldByName('AWARD_DATA_FIELD').AsString := 'LOG_'+IniFile.ReadString('Award', 'DATE_FIELD', '');
      qryAwards.FieldByName('AWARD_FILTER_DXCC').AsString := IniFile.ReadString('Award', 'FILTER_DXCC', '');
      qryAwards.FieldByName('AWARD_FILTER_FIELD').AsString := 'LOG_'+IniFile.ReadString('Award', 'FILTER_FIELD', '');
      qryAwards.FieldByName('AWARD_QSL').AsInteger := IniFile.ReadInteger('Award', 'QSL', 0);
      qryAwards.FieldByName('AWARD_EQSL').AsInteger := IniFile.ReadInteger('Award', 'EQSL', 0);
      qryAwards.FieldByName('AWARD_LOTW').AsInteger := IniFile.ReadInteger('Award', 'LOTW', 0);
      qryAwards.FieldByName('AWARD_DQSL').AsInteger := IniFile.ReadInteger('Award', 'DQSL', 0);
      qryAwards.FieldByName('AWARD_ACTIVE').AsInteger := 0;
      qryAwards.FieldByName('AWARD_QUICK_STATS').AsInteger := 0;
      qryAwards.FieldByName('AWARD_STATS_FOR_ALL').AsInteger := 0;

      qryAwards.Post;

      if NewId <> 0 then
      begin
        qryTmp.Close;
        qryTmp.SQL.Text := 'DELETE FROM AWARDS_DATA WHERE AWARD_ID='+IntToStr(NewId);
        qryTmp.ExecuteSQL;
      end
      else
      begin
        qryTmp.Close;
        qryTmp.SQL.Text := 'SELECT MAX(AWARD_ID) FROM AWARDS';
        qryTmp.Open;
        NewId := qryTmp.Fields[0].AsInteger;
      end;

      IniFile.ReadSectionValues('Data', slData);
    //  slData.SaveToFile('d:\1.1');
      qryAwardsData.Open;
      for i := 0 to slData.Count - 1 do
      begin
        slDataLine.DelimitedText := slData.Values[slData.Names[i]];
        qryAwardsData.Append;
        qryAwardsData.FieldByName('AWARD_ID').AsInteger := NewId;
        qryAwardsData.FieldByName('AWARD_DATA_FIELD_VALUE').AsString := slDataLine[0];
        qryAwardsData.FieldByName('AWARD_DATA_FIELD_DESCRIPTION').AsString := slDataLine[1];
        qryAwardsData.FieldByName('AWARD_DATA_FILTER_VALUE').AsString := slDataLine[2];
        if slDataLine.Count>3 then
        begin
         try
          qryAwardsData.FieldByName('AWARD_DATA_START_DATE').asDateTime := StrToDate(slDataLine[3])
         except
          qryAwardsData.FieldByName('AWARD_DATA_START_DATE').asDateTime := StrToDateTime('01.01.1900');
         end;
        end
        else
          qryAwardsData.FieldByName('AWARD_DATA_START_DATE').asDateTime := StrToDateTime('01.01.1900');

        if slDataLine.Count>4 then
         try
           qryAwardsData.FieldByName('AWARD_DATA_END_DATE').asDateTime := StrToDate(slDataLine[4])
         except
          qryAwardsData.FieldByName('AWARD_DATA_END_DATE').asDateTime := StrToDateTime('01.01.1900');
         end
        else
          qryAwardsData.FieldByName('AWARD_DATA_END_DATE').asDateTime := StrToDateTime('01.01.3000');

        if slDataLine.Count>5 then
        try
           qryAwardsData.FieldByName('AWARD_DATA_SCORE').AsInteger := StrToInt(slDataLine[5])
         except
          qryAwardsData.FieldByName('AWARD_DATA_SCORE').asInteger := 1;
         end
        else
           qryAwardsData.FieldByName('AWARD_DATA_SCORE').AsInteger := 1;

        qryAwardsData.Post;
      end;
      qryAwardsData.Close;

    finally
      if qryAwards.State in [dsInsert,dsEdit] then
        qryAwards.Cancel;
      if qryAwardsData.State in [dsInsert,dsEdit] then
        qryAwardsData.Cancel;
      qryTmp.Free;
      qryAwards.EnableControls;
      IniFile.Free;
      slData.Free;
      slDataLine.Free;
      Screen.Cursor:=crDefault;
    end;

  end;
end;

procedure TWindowAwardsStatisticsSettingsFrame.dbgAwardsDblClick(
  Sender: TObject);
begin
 if not qryAwards.IsEmpty then
   AwardsStatistics_aEditAwardExecute(Self);
end;

procedure TWindowAwardsStatisticsSettingsFrame.FormStorageAfterRestorePlacement(Sender: TObject);
begin
  dbgAwards.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorage.AppStorage).FileName, 'WindowAwardsStatisticsSettingsFrame', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh,
    crpDropDownWidthEh, crpRowPanelColPlacementEh]);
end;

procedure TWindowAwardsStatisticsSettingsFrame.FormStorageSavePlacement(Sender: TObject);
var
  i: integer;
  s: string;
begin
  with dbgAwards.Columns do
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
      FormStorage.WriteString(dbgAwards.Name + '.' + Items[i].FieldName, s);
    end;
  end;
end;

procedure TWindowAwardsStatisticsSettingsFrame.SavePlacementAwardDataGrid(Grid:TDbgridEh);
var
  i: integer;
  s: string;
begin
  with Grid.Columns do
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
      FormStorage.WriteString(Grid.Name + '.' + Items[i].FieldName, s);
    end;
  end;
end;





end.
