unit uWindowAwardsStatisticsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm,
  Dialogs, uUtils, ExtCtrls, DBGridEhGrouping, MemTableDataEh, Db, MemTableEh,
  GridsEh, DBGridEh, ComCtrls, ToolWin, IniFiles, KDaoTable, JvMemoryDataset,
  Menus, JvExStdCtrls, JvCombobox, ActnList, ImgList, JvAppIniStorage,
  JvComponentBase, JvFormPlacement, CheckLst, JvExCheckLst, JvCheckListBox,
  JvXPBar, JvXPCore, JvXPContainer, NLDSideBar, JvDBLookup, jvStrUtils,
  uPluginHeaders, uColors,
  Mask, JvExMask, JvToolEdit, Contnrs, DBSumLst;

type

  TWindowAwardsStatisticsForm = class(TWindowPluginForm)
    dsAwards: TDataSource;
    qryAwards: TKADaoTable;
    qryBands: TKADaoTable;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    pnlMainToolbar: TPanel;
    tbLogMain: TToolBar;
    tbFilter: TToolButton;
    tbSearchAllBook: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    tbColorize: TToolButton;
    Panel10: TPanel;
    lbAward: TLabel;
    ilAwards: TImageList;
    alAwards: TActionList;
    aAwardsRefresh: TAction;
    aAwardAllBook: TAction;
    dblcAward: TJvDBLookupCombo;
    qryAwardsList: TKADaoTable;
    dsAwardsList: TDataSource;
    PageControl1: TPageControl;
    tsAwards: TTabSheet;
    dbgAwards: TDBGridEh;
    aAwardColorize: TAction;
    ToolButton1: TToolButton;
    pnlFilter: TNLDSideBar;
    qryModes: TKADaoTable;
    qryStations: TKADaoTable;
    FormStorageOnExit: TJvFormStorage;
    FormStorage: TJvFormStorage;
    xpcParams: TJvXPContainer;
    xpbModes: TJvXPBar;
    xpbQSLType: TJvXPBar;
    xpbFields: TJvXPBar;
    clbFields: TJvCheckListBox;
    clbQSLType: TJvCheckListBox;
    clbModes: TJvCheckListBox;
    ScrollBox1: TScrollBox;
    pnlParameters: TLabel;
    barFields: TLabel;
    barQSLType: TLabel;
    barModes: TLabel;
    FIELD_STATISTICS: TLabel;
    FIELD_DESCRIPTION: TLabel;
    WORKED_TOTAL: TLabel;
    qryAwardsTotalByBand: TKADaoTable;
    qryAwardsTotal: TKADaoTable;
    AWARD_DATA_FIELD_VALUE: TLabel;
    AWARD_DATA_FIELD_DESCRIPTION: TLabel;
    procedure aAwardsRefreshExecute(Sender: TObject);
    procedure aAwardAllBookExecute(Sender: TObject);
    procedure dbgAwardsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure aAwardColorizeExecute(Sender: TObject);
    procedure dbgAwardsDblClick(Sender: TObject);
    procedure dbgAwardsCellClick(Column: TColumnEh);
    procedure dbgAwardsTitleClick(Column: TColumnEh);
    procedure dblcAwardClick(Sender: TObject);
    procedure aAwardsRefreshUpdate(Sender: TObject);
    procedure dbgAwardsColWidthsChanged(Sender: TObject);
    procedure dbgAwardsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ToolButton1Click(Sender: TObject);
    procedure dbgAwardsDataHintShow(Sender: TCustomDBGridEh; CursorPos: TPoint; Cell: TGridCoord; InCellCursorPos: TPoint;
      Column: TColumnEh; var Params: TDBGridEhDataHintParams; var Processed: Boolean);
    procedure FormStorageOnExitAfterRestorePlacement(Sender: TObject);
    procedure FormStorageOnExitAfterSavePlacement(Sender: TObject);
    procedure qryModesNewRecord(DataSet: TDataSet);
    procedure xpbFieldsCollapsedChange(Sender: TObject; Collapsing: Boolean);
  private
    bColorize: Boolean;
    sAwardFieldName: string;
    bSearchAllBook: Boolean;
    BandFieldStartIndex: Integer;
    CurrentCol: Integer;
    bRefreshed: Boolean;
    bLoaded: Boolean;
    bColChanged: Boolean;
    iCheckedFieldsCount: Integer;
    bFetched: Boolean;
    sSelectTableAwards: string;
    sSelectTableAwardsTotalByBand: string;
    sSelectTableAwardsTotal: string;
    procedure HideFilter;
    function BuildQuery(): string;
    procedure Refresh;
    procedure BandGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    function GetSelectTable(): string;
    function BandFieldValueToStr(Value: string): string;
  public
    StationId: Integer;
    StationParentId: Integer;
    SumList: TObjectList;
    procedure Loaded;
    procedure OptionsChanged;
    procedure SaveGrid;
    procedure InitGridColors;
  end;

var
  WindowAwardsStatisticsForm: TWindowAwardsStatisticsForm;
  sd: TFieldType;

implementation

uses uWindowAwardsStatistics;
{$R *.dfm}

procedure TWindowAwardsStatisticsForm.aAwardAllBookExecute(Sender: TObject);
begin
  HideFilter;
  bSearchAllBook := not bSearchAllBook;
  tbSearchAllBook.Down := bSearchAllBook;
end;

procedure TWindowAwardsStatisticsForm.aAwardColorizeExecute(Sender: TObject);
begin
  HideFilter;
  bColorize := not bColorize;
  tbColorize.Down := bColorize;
  dbgAwards.Repaint;
end;

procedure TWindowAwardsStatisticsForm.aAwardsRefreshExecute(Sender: TObject);
begin
  HideFilter;
  Refresh;
end;

procedure TWindowAwardsStatisticsForm.aAwardsRefreshUpdate(Sender: TObject);
begin
  aAwardsRefresh.Enabled := dblcAward.KeyValue <> null;
end;

function TWindowAwardsStatisticsForm.BandFieldValueToStr(Value: string): string;
var
  sStr, sWorked, sSended: string;
begin
  if Value = ';;' then
    result := ''
  else
  begin
    sStr := Value;
    sWorked := Copy2SymbDel(sStr, ';');
    Delete(sStr, 1, 1);
    sSended := Copy2SymbDel(sStr, ';');
    Delete(sStr, 1, 1);
    result := sWorked + ' [' + sSended + '.' + sStr + ']';
  end;
end;

procedure TWindowAwardsStatisticsForm.BandGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  { if bColorize then
    begin
    Text := '';
    Exit;
    end; }

  if TField(Sender).FieldNo > iCheckedFieldsCount then
    Text := BandFieldValueToStr(TField(Sender).AsString)
  else
    Text := TField(Sender).AsString;
end;

procedure TWindowAwardsStatisticsForm.HideFilter;
begin

  If pnlFilter.AutoHide Then
    pnlFilter.Hide;
end;

procedure TWindowAwardsStatisticsForm.dblcAwardClick(Sender: TObject);
begin
  HideFilter;
end;

procedure TWindowAwardsStatisticsForm.FormStorageOnExitAfterRestorePlacement(Sender: TObject);
begin
  bSearchAllBook := tbSearchAllBook.Down;
  bColorize := tbColorize.Down;
end;

procedure TWindowAwardsStatisticsForm.FormStorageOnExitAfterSavePlacement(Sender: TObject);
var
  slFilterQSLType: TStringList;
  i: Integer;
begin
  slFilterQSLType := TStringList.Create;
  for i := 0 to clbQSLType.Count - 1 do
    if clbQSLType.Checked[i] then
      slFilterQSLType.Add('1')
    else
      slFilterQSLType.Add('0');
  FormStorageOnExit.AppStorage.WriteStringList('WindowAwardsStatisticsForm\FilterQSLType', slFilterQSLType);
  slFilterQSLType.Free;
end;

function TWindowAwardsStatisticsForm.GetSelectTable(): string;
var
  sResult: string;
  i: Integer;
  sWhereModes: string;
  sSelectedFields: string;

  function GetEqualStr: string;
  begin
    if ldsLog.DataSet.FieldByName(sAwardFieldName).DataType = ftString then
      result := 'l.' + sAwardFieldName + '=ad.award_data_field_value'
    else if (ldsLog.DataSet.FieldByName(sAwardFieldName).DataType = ftSmallint) or
      (ldsLog.DataSet.FieldByName(sAwardFieldName).DataType = ftInteger) then
      result := 'l.' + sAwardFieldName + '=val(ad.award_data_field_value)';
  end;

begin

  for i := 0 to clbModes.Count - 1 do
    if clbModes.Checked[i] then
    begin
      if sWhereModes = '' then
        sWhereModes := #39 + clbModes.Items[i] + #39
      else
        sWhereModes := sWhereModes + ',' + #39 + clbModes.Items[i] + #39;
    end;

  if sWhereModes <> '' then
    sWhereModes := ' AND LOG_MODE IN (' + sWhereModes + ') ';

  i := 0;

  sSelectedFields :=
    ' log_id,log_call,log_qso_datetime,log_band_mhz,log_mode,log_qsl_sent,log_eqsl_qsl_sent,log_lotw_qsl_sent,log_dqsl_qsl_sent,log_qsl_rcvd,log_eqsl_qsl_rcvd,log_lotw_qsl_rcvd,log_dqsl_qsl_rcvd, ' + ' ad.award_data_field_value, ad.award_data_field_description, log_name,log_dxcc,log_qth,log_pfx,log_state,log_cnty,log_gridsquare,log_iota,log_cqz,log_ituz,log_mode,log_custom_stat1,log_custom_stat2,log_custom_stat3,log_custom_stat4  ';

  if not bSearchAllBook then
  begin
    sSelectTableAwards := '(SELECT  ' + sSelectedFields + ' FROM  awards_data AS ad LEFT OUTER JOIN LOG_' + IntToStr(StationId)
      + ' AS l ON (' + GetEqualStr + ' AND l.log_qso_date Between ad.award_data_start_date and award_data_end_date' +
      sWhereModes + ')  WHERE ad.award_id=:award_id )';
    sSelectTableAwardsTotalByBand :=
      '(SELECT ad.award_data_field_value,l.log_band_mhz,l.log_QSL_rcvd,l.log_EQSL_QSL_rcvd,l.log_LOTW_QSL_rcvd,l.log_DQSL_QSL_rcvd FROM awards_data ad, LOG_' + IntToStr(StationId) + '  l WHERE ' + GetEqualStr + ' and ad.award_id=:award_id ' + sWhereModes + ')';
    exit;
  end
  else
  begin
    qryStations.Close;
    qryStations.SQL.Text := 'SELECT STATION_ID FROM STATIONS WHERE IS_GROUP=0 AND STATION_PARENT_ID=' + IntToStr
      (StationParentId);
    qryStations.Open;
    while not qryStations.Eof do
    begin
      if i = 0 then
      begin
        sResult := ' SELECT  ' + sSelectedFields + ' FROM  awards_data AS ad LEFT OUTER JOIN LOG_' + IntToStr
          (qryStations.FieldByName('STATION_ID').AsInteger) + ' AS l ON (' + GetEqualStr +
          '  AND l.log_qso_date Between ad.award_data_start_date and award_data_end_date' + sWhereModes +
          ')  WHERE ad.award_id=:award_id ';
        sSelectTableAwardsTotalByBand :=
          'SELECT ad.award_data_field_value,l.log_band_mhz,l.log_QSL_rcvd,l.log_EQSL_QSL_rcvd,l.log_LOTW_QSL_rcvd,l.log_DQSL_QSL_rcvd FROM awards_data ad, LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger) + '  l WHERE ' + GetEqualStr + ' and ad.award_id=:award_id ' + sWhereModes;
      end
      else
      begin
        sResult := sResult + ' UNION ALL  SELECT  ' + sSelectedFields + ' FROM  awards_data AS ad LEFT OUTER JOIN LOG_' +
          IntToStr(qryStations.FieldByName('STATION_ID').AsInteger) + ' AS l ON (' + GetEqualStr +
          ' AND l.log_qso_date Between ad.award_data_start_date and award_data_end_date' + sWhereModes +
          ')  WHERE ad.award_id=:award_id ';
        sSelectTableAwardsTotalByBand := sSelectTableAwardsTotalByBand +
          ' UNION ALL SELECT ad.award_data_field_value,l.log_band_mhz,l.log_QSL_rcvd,l.log_EQSL_QSL_rcvd,l.log_LOTW_QSL_rcvd,l.log_DQSL_QSL_rcvd FROM awards_data ad, LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger) + '  l WHERE ' + GetEqualStr + ' and ad.award_id=:award_id ' + sWhereModes;
      end;
      inc(i);
      qryStations.Next;
    end;
    sSelectTableAwardsTotalByBand := '(' + sSelectTableAwardsTotalByBand + ')';
    sSelectTableAwards := '(' + sResult + ')';
    result := '(' + sResult + ')';
  end;
end;

function TWindowAwardsStatisticsForm.BuildQuery(): string;
var
  sAdditionFieldList: string;
  sTable: string;
  i: Integer;
  sQSLsent, sQSLrcvd: string;
  sQSLSuffix: string;
  sBandList: string;
  Delimeter: string;
begin
  Delimeter := GetDelimeter;
  iCheckedFieldsCount := 0;
  sAwardFieldName := qryAwardsList.FieldByName('AWARD_DATA_FIELD').AsString;
  sd := ldsLog.DataSet.FieldByName(sAwardFieldName).DataType;

  for i := 0 to clbFields.Count - 1 do
    if clbFields.Checked[i] then
    begin
      sAdditionFieldList := sAdditionFieldList + ' , ' + TField(clbFields.Items.Objects[i]).FieldName;
      inc(iCheckedFieldsCount);
    end;

  for i := 0 to clbQSLType.Count - 1 do
    if clbQSLType.Checked[i] then
    begin
      if i = 0 then
        sQSLSuffix := ''
      else
        sQSLSuffix := '_qsl';
      if sQSLsent = '' then
      begin
        sQSLsent := 'l.log_' + clbQSLType.Items[i] + sQSLSuffix + '_sent=''Y''';
        sQSLrcvd := 'l.log_' + clbQSLType.Items[i] + sQSLSuffix + '_rcvd=''Y''';
      end
      else
      begin
        sQSLsent := sQSLsent + ' or l.log_' + clbQSLType.Items[i] + sQSLSuffix + '_sent=''Y''';
        sQSLrcvd := sQSLrcvd + ' or l.log_' + clbQSLType.Items[i] + sQSLSuffix + '_rcvd=''Y''';
      end;
    end;

  if sQSLsent = '' then
  begin
    sQSLsent := '0';
    sQSLrcvd := '0';
  end;

  qryBands.Close;
  qryBands.Open;
  SumList.Clear;
  while not qryBands.Eof do
  begin
    if sBandList = '' then
      sBandList := FormatFloat('0.##', qryBands.FieldByName('BAND_MHZ').asFloat)
    else
      sBandList := sBandList + ',' + FormatFloat('0.##', qryBands.FieldByName('BAND_MHZ').asFloat);
    qryBands.Next;
  end;

  GetSelectTable;

  qryAwards.SQL.Text := 'TRANSFORM Count(*)&'';''&Sum(IIf(' + sQSLsent + ',1,0))&'';''&Sum(IIf(' + sQSLrcvd + ',1,0))' +
    ' SELECT award_data_field_value, award_data_field_description, count(log_id) as worked_total' + sAdditionFieldList +
    '  FROM ( SELECT * FROM  ' + sSelectTableAwards + ') ' +
    ' GROUP BY award_data_field_value, award_data_field_description ' + sAdditionFieldList +
    ' ORDER BY award_data_field_description PIVOT (log_band_mhz) IN(' + sBandList + ') ';

  qryAwardsTotalByBand.SQL.Text :=
    'SELECT l.log_band_mhz as  log_band_mhz,Count(*) as WORKED_TOTAL,Sum(cfm) AS CONFIRMED_TOTAL FROM ( ' +
    ' SELECT  IIf(Sum(IIf(' + sQSLrcvd + ',1,0)),1,0) as cfm,ad.award_data_field_value,log_band_mhz FROM ' +
    sSelectTableAwardsTotalByBand + 'GROUP BY ad.award_data_field_value,log_band_mhz ) GROUP BY l.log_band_mhz';

  qryAwardsTotal.SQL.Text :=
    'SELECT Count(*) as WORKED_TOTAL,Sum(cfm) AS CONFIRMED_TOTAL FROM ( ' + ' SELECT  IIf(Sum(IIf(' + sQSLrcvd +
    ',1,0)),1,0) as cfm,ad.award_data_field_value FROM ' + sSelectTableAwardsTotalByBand +
    'GROUP BY ad.award_data_field_value ) ';
  // qryAwards.SQL.SaveToFile('D:\1.sql');

end;

procedure TWindowAwardsStatisticsForm.Refresh;
var
  i, j: Integer;
  WorkedTotal, ConfirmedTotal: Integer;

begin
  Screen.Cursor := crHourGlass;
  WorkedTotal := 0;
  ConfirmedTotal := 0;
  try

    qryAwards.DisableControls;

    qryAwards.Close;
    qryAwardsTotalByBand.Close;
    qryAwardsTotal.Close;
    BuildQuery();
   // qryAwards.SQL.SaveToFile('d:\!qryAwards.sql');
    // qryAwardsTotalByBand.SQL.SaveToFile('d:\!\!qryAwardsTotal.sql');
    // qryAwardsTotal.SQL.SaveToFile('d:\!\!qryAwardsTotal.sql');

    qryAwards.Params.ParamByName('AWARD_ID').AsInteger := dblcAward.KeyValue;
    qryAwardsTotalByBand.Params.ParamByName('AWARD_ID').AsInteger := dblcAward.KeyValue;
    qryAwardsTotal.Params.ParamByName('AWARD_ID').AsInteger := dblcAward.KeyValue;
    bFetched := True;
    qryAwards.Open;
    qryAwardsTotalByBand.Open;
    qryAwardsTotal.Open;
    qryAwards.Fields[0].DisplayLabel := AWARD_DATA_FIELD_VALUE.Caption;
    qryAwards.Fields[1].DisplayLabel := AWARD_DATA_FIELD_DESCRIPTION.Caption;
    qryAwards.Fields[2].DisplayLabel := WORKED_TOTAL.Caption;

    j := 3;
    for i := 0 to clbFields.Count - 1 do
      if clbFields.Checked[i] then
      begin
        qryAwards.Fields[j].DisplayLabel := clbFields.Items[i];
        inc(j);
      end;

    for i := iCheckedFieldsCount + 3 to qryAwards.Fields.Count - 1 do
    begin
      qryAwards.Fields[i].OnGetText := BandGetText;
    end;

    qryAwards.First;
    qryAwards.EnableControls;
    dbgAwards.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorage.AppStorage)
        .FileName, 'WindowAwardsStatisticsForm', [crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh,
      crpDropDownWidthEh, crpRowPanelColPlacementEh]);

    for i := iCheckedFieldsCount + 3 to dbgAwards.Columns.Count - 1 do
      dbgAwards.Columns[i].Title.Caption := StringReplace(dbgAwards.Columns[i].Title.Caption, '_', '.',
        [rfReplaceAll, rfIgnoreCase]);

    dbgAwards.FooterRowCount := 1;

    for i := iCheckedFieldsCount + 3 to dbgAwards.Columns.Count - 1 do
    begin
      dbgAwards.Columns[i].Title.Alignment := taCenter;
      dbgAwards.Columns[i].Footer.Alignment := taCenter;
      dbgAwards.Columns[i].Footer.ValueType := fvtStaticText;

      if qryAwardsTotalByBand.Locate('log_band_mhz', dbgAwards.Columns[i].Title.Caption, []) then
      begin
        dbgAwards.Columns[i].Footer.Value := qryAwardsTotalByBand.FieldByName('WORKED_TOTAL')
          .AsString + '/' + qryAwardsTotalByBand.FieldByName('CONFIRMED_TOTAL').AsString;
        inc(WorkedTotal, qryAwardsTotalByBand.FieldByName('WORKED_TOTAL').AsInteger);
        inc(ConfirmedTotal, qryAwardsTotalByBand.FieldByName('CONFIRMED_TOTAL').AsInteger);
      end
      else
        dbgAwards.Columns[i].Footer.Value := '0/0';
    end;

    dbgAwards.Columns[1].Footer.Alignment := taCenter;
    dbgAwards.Columns[1].Footer.ValueType := fvtStaticText;
    dbgAwards.Columns[1].Footer.Value := qryAwardsTotal.FieldByName('WORKED_TOTAL').AsString + '/' + qryAwardsTotal.FieldByName
      ('CONFIRMED_TOTAL').AsString;

  finally
    dbgAwards.Repaint;
    bRefreshed := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowAwardsStatisticsForm.dbgAwardsCellClick(Column: TColumnEh);
begin
  HideFilter;
end;

procedure TWindowAwardsStatisticsForm.dbgAwardsColWidthsChanged(Sender: TObject);
begin
  if bRefreshed or not bLoaded then
    exit;
  bColChanged := True;
end;

procedure TWindowAwardsStatisticsForm.dbgAwardsDataHintShow(Sender: TCustomDBGridEh; CursorPos: TPoint; Cell: TGridCoord;
  InCellCursorPos: TPoint; Column: TColumnEh; var Params: TDBGridEhDataHintParams; var Processed: Boolean);
var
  P: TPoint;
begin
  GetCursorPos(P);
  P := dbgAwards.ScreenToClient(P);
  CurrentCol := dbgAwards.MouseCoord(P.X, P.Y).X - 1;
  if not Assigned(dbgAwards.DataSource.DataSet.Fields[CurrentCol]) then
    exit;
  if dbgAwards.DataSource.DataSet.Fields[CurrentCol].AsString = ';;' then
    exit;

  Params.HintStr := BandFieldValueToStr(dbgAwards.DataSource.DataSet.Fields[CurrentCol].AsString);

end;

procedure TWindowAwardsStatisticsForm.dbgAwardsDblClick(Sender: TObject);
var
  lParam, wParam: variant;
  sFilter, sFilterFields: String;
  i: Integer;
  P: TPoint;
  T: TGridCoord;
begin
  if ldsLogEdit.DataSet.State in [dsEdit] then
    exit;

  sFilter := sAwardFieldName + '=' + qryAwards.FieldByName('AWARD_DATA_FIELD_VALUE').AsString;
  for i := 0 to clbFields.Count - 1 do
  begin
    if clbFields.Checked[i] then
    begin
      sFilterFields := sFilterFields + #13#10 + TField(clbFields.Items.Objects[i]).FieldName + '=' + qryAwards.FieldByName
        (TField(clbFields.Items.Objects[i]).FieldName).AsString + ' ';
    end;
  end;

  GetCursorPos(P);
  P := dbgAwards.ScreenToClient(P);
  T := dbgAwards.MouseCoord(P.X, P.Y);

  if (T.X - 1) >= iCheckedFieldsCount + 3 then
    sFilter := sFilter + #10#13 + 'LOG_BAND_MHZ=' + dbgAwards.Columns[T.X - 1].Title.Caption;

  lParam := sFilter + sFilterFields;
  lDllCommand(DC_SET_LOG_FILTER, Self, lParam, wParam);
end;

procedure TWindowAwardsStatisticsForm.dbgAwardsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  sStr, sWorked, sSended, sConfirmed: string;
begin
  if (csDestroying in TDBGridEh(Sender).ComponentState) or not bColorize  then
    exit;

  if not Assigned(GridColorList) then
    exit;

  if TDBGridEh(Sender).DataSource.DataSet.FieldByName('WORKED_TOTAL').AsString = '0' then
      if GridColorList.Count>0 then
      begin
      Background := TGridColor(GridColorList.Items[0]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[0]).ColorForeground;
      end;

  if (iCheckedFieldsCount + 3 > Column.Index) then
   exit;

  if TDBGridEh(Sender).DataSource.DataSet.FieldByName(Column.FieldName).AsString <> ';;' then
  begin
    sStr := TDBGridEh(Sender).DataSource.DataSet.FieldByName(Column.FieldName).AsString;
    sWorked := Copy2SymbDel(sStr, ';');
    Delete(sStr, 1, 1);
    sSended := Copy2SymbDel(sStr, ';');
    Delete(sStr, 1, 1);
    sConfirmed := sStr;
    if (sWorked <> '0') and (sSended = '0') and (sConfirmed = '0') then
    begin
      if GridColorList.Count > 1 then
      begin
        Background := TGridColor(GridColorList.Items[1]).ColorBackground;
        AFont.Color := TGridColor(GridColorList.Items[1]).ColorForeground;
      end;
    end
    else if (sWorked <> '0') and (sSended <> '0') and (sConfirmed = '0') then
    begin
      if GridColorList.Count > 2 then
      begin
        Background := TGridColor(GridColorList.Items[2]).ColorBackground;
        AFont.Color := TGridColor(GridColorList.Items[2]).ColorForeground;
      end;
    end
    else if (sWorked <> '0') and (sConfirmed <> '0') then
    begin
      if GridColorList.Count > 3 then
      begin
        Background := TGridColor(GridColorList.Items[3]).ColorBackground;
        AFont.Color := TGridColor(GridColorList.Items[3]).ColorForeground;
      end;
    end;
  end;
end;

procedure TWindowAwardsStatisticsForm.dbgAwardsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  P: TPoint;
  Width, i, j: Integer;
begin

  if bColChanged then
  begin
    GetCursorPos(P);
    P := dbgAwards.ScreenToClient(P);
    CurrentCol := dbgAwards.MouseCoord(P.X - 3, P.Y).X;
    if CurrentCol - 1 < 0 then
      exit;
    if CurrentCol - 1 < iCheckedFieldsCount + 3 then
      exit;

    Width := dbgAwards.Columns[CurrentCol - 1].Width;
    for i := iCheckedFieldsCount + 3 to dbgAwards.Columns.Count - 1 do
      dbgAwards.Columns[i].Width := Width;

    bColChanged := False;
  end;

end;

procedure TWindowAwardsStatisticsForm.dbgAwardsTitleClick(Column: TColumnEh);
begin
  HideFilter;
end;

procedure TWindowAwardsStatisticsForm.ToolButton1Click(Sender: TObject);
begin
  { SaveDBGridEhToExportFile(TDBGridEhExportAsCSV,dbgAwards,
    'd:\!\112233.csv',True); }

end;

procedure TWindowAwardsStatisticsForm.xpbFieldsCollapsedChange(Sender: TObject; Collapsing: Boolean);
begin
  pnlFilter.Refresh;
end;

procedure TWindowAwardsStatisticsForm.Loaded;
var
  slFilterQSLType: TStringList;
  i: Integer;
begin
  pnlFilter.Caption := pnlParameters.Caption;
  pnlFilter.Update;
  pnlFilter.Refresh;
  xpbFields.Caption := barFields.Caption;
  xpbQSLType.Caption := barQSLType.Caption;
  xpbModes.Caption := barModes.Caption;

  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_CALL').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_CALL'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_NAME').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_NAME'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_QTH').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_QTH'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_DXCC').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_DXCC'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_PFX').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_PFX'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_STATE').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_STATE'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_CNTY').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_CNTY'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_GRIDSQUARE').DisplayLabel,
    ldsLog.DataSet.FieldByName('LOG_GRIDSQUARE'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_IOTA').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_IOTA'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_CQZ').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_CQZ'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_ITUZ').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_ITUZ'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_MODE').DisplayLabel, ldsLog.DataSet.FieldByName('LOG_MODE'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT1').DisplayLabel,
    ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT1'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT2').DisplayLabel,
    ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT2'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT3').DisplayLabel,
    ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT3'));
  clbFields.Items.AddObject(ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT4').DisplayLabel,
    ldsLog.DataSet.FieldByName('LOG_CUSTOM_STAT4'));

  clbModes.Items.Clear;
  qryModes.Close;
  qryModes.Open;
  while not qryModes.Eof do
  begin
    clbModes.Items.Add(qryModes.FieldByName('MODE_NAME').AsString);
    qryModes.Next;
  end;

  clbQSLType.Items.Add('QSL');
  clbQSLType.Items.Add('LoTW');
  clbQSLType.Items.Add('eQSL');
  clbQSLType.Items.Add('dQSL');
  SumList := TObjectList.Create;

  slFilterQSLType := TStringList.Create;
  FormStorageOnExit.AppStorage.ReadStringList('WindowAwardsStatisticsForm\FilterQSLType', slFilterQSLType);
  for i := 0 to slFilterQSLType.Count - 1 do
    if slFilterQSLType.Strings[i] = '1' then
      clbQSLType.Checked[i] := True
    else
      clbQSLType.Checked[i] := False;
  slFilterQSLType.Free;

  bLoaded := True;
end;

procedure TWindowAwardsStatisticsForm.OptionsChanged;
begin
  clbModes.Items.Clear;
  qryModes.Close;
  qryModes.Open;
  while not qryModes.Eof do
  begin
    clbModes.Items.Add(qryModes.FieldByName('MODE_NAME').AsString);
    qryModes.Next;
  end;
  InitGridColors;
end;

procedure TWindowAwardsStatisticsForm.qryModesNewRecord(DataSet: TDataSet);
var
  a: Integer;
begin
  a := 10;
end;

procedure TWindowAwardsStatisticsForm.SaveGrid;
var
  S: string;
  i: Integer;
begin
  with dbgAwards.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, Integer(Items[i].Title.SortMarker),
        Integer(Items[i].Visible), Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth,
        Items[i].InRowLinePos, Items[i].InRowLineHeight]);
      if S <> '' then
      begin
        if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
          S := '"' + S + '"';
      end;
      FormStorage.WriteString('dbgAwards.' + Items[i].FieldName, S);
    end;
  end;
end;

procedure TWindowAwardsStatisticsForm.InitGridColors;
var
  slColors: TStringList;
  slColorLine: TStringList;
  GridColor: TGridColor;
  i: Integer;
begin
  GridColorList.Clear;
  slColors := TStringList.Create;
  slColorLine := TStringList.Create;
  slColorLine.Delimiter := '|';
  try
    lAppStorage.ReadStringList('Options\GridColorsStatistics', slColors);
    for i := 0 to slColors.Count - 1 do
    begin
      slColorLine.DelimitedText := slColors.Strings[i];
      GridColor := TGridColor.Create;
      GridColor.ColorBackground := StrToInt2(slColorLine.Strings[0]);
      GridColor.ColorForeground := StrToInt2(slColorLine.Strings[1]);
      GridColorList.Add(GridColor);
    end;
    dbgAwards.Repaint;
  finally
    slColors.Free;
    slColorLine.Free;
  end;
end;

end.
