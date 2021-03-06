unit uWindowLogForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, JvComponentBase,
  JvFormPlacement, uPluginHeaders,
  DBGridEhGrouping, GridsEh, Contnrs, uUtils,
  DBGridEh, ActnList, Menus, EhLibKaDAO, KDaoTable, uWindowPluginForm,
  uEditFilterName, uViewPicture, ToolCtrlsEh, DBGridEhSimpleFilterDlg,sToolBar, uColors;

const
  symb = ['a' .. 'z', 'A' .. 'Z', '0' .. '9'];

type

  TcrDBGridEh = class(TDBGridEh)
  end;

  TWindowLogForm = class(TWindowPluginForm)
    pnlMainToolbar: TPanel;
    tbLogMain: TsToolBar;
    tbFilter: TToolButton;
    Panel10: TPanel;
    FormStorage: TJvFormStorage;
    dbgLog: TDBGridEh;
    pmLog: TPopupMenu;
    mieQSL: TMenuItem;
    miLotW: TMenuItem;
    miQSL: TMenuItem;
    N1: TMenuItem;
    msgDeleteRecord: TLabel;
    N2: TMenuItem;
    ActionList: TActionList;
    aLogFilter: TAction;
    ToolButton1: TToolButton;
    miImport: TMenuItem;
    N3: TMenuItem;
    miExport: TMenuItem;
    miExportToAdif: TMenuItem;
    miImportFromAdif: TMenuItem;
    N1111: TMenuItem;
    N11111: TMenuItem;
    N4: TMenuItem;
    cbFilters: TComboBox;
    lbFilter: TLabel;
    aLogFilterSave: TAction;
    WindowLog_EditFilterName: TLabel;
    WindowLog_EditFilterbtnOk: TLabel;
    WindowLog_EditFilterbtnCancel: TLabel;
    FormStorageOnExit: TJvFormStorage;
    dQSL: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N1112: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    ilQSL: TImageList;
    qryQSLImageFiles: TKADaoTable;
    dsLog: TDataSource;
    N111: TMenuItem;
    N112: TMenuItem;
    N19: TMenuItem;
    N8: TMenuItem;
    N110: TMenuItem;
    N113: TMenuItem;
    N9: TMenuItem;
    N114: TMenuItem;
    N10: TMenuItem;
    edit1: TMenuItem;
    delte1: TMenuItem;
    N20: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    N119: TMenuItem;
    aLogShowInfo: TAction;
    Splitter: TSplitter;
    memLogInfo: TMemo;
    aLogDirtectInput: TAction;
    ilLog: TImageList;
    aLogAllBook: TAction;
    N21: TMenuItem;
    ToolButton3: TToolButton;
    tbShowInfo: TToolButton;
    ToolButton5: TToolButton;
    tbDirectInput: TToolButton;
    ToolButton8: TToolButton;
    procedure dbgLogDblClick(Sender: TObject);
    procedure dbgLogGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aLogFilterExecute(Sender: TObject);
    procedure cbFiltersClick(Sender: TObject);
    procedure aLogFilterSaveUpdate(Sender: TObject);
    procedure aLogFilterSaveExecute(Sender: TObject);
    procedure dbgLogMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure dbgLogCellClick(Column: TColumnEh);
    procedure dsLogDataChange(Sender: TObject; Field: TField);
    procedure dbgLogKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgLogSelectionChanged(Sender: TObject);
    procedure dbgLogExit(Sender: TObject);
    procedure dbgLogTranslateFilterDialog(Sender: TCustomDBGridEh; Dialog: TForm);
    procedure dbgLogKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure aLogShowInfoExecute(Sender: TObject);
    procedure aLogDirtectInputExecute(Sender: TObject);
    procedure aLogAllBookExecute(Sender: TObject);
  private
    CurrentCol: Integer;
    FViewPicture: TViewPicture;
    FEQSLImagePath: string;
    FDQSLImagePath: string;
    bUseAlternativeColor: boolean;
    ColorAltSent: TColor;
    ColorAltRcvd: TColor;
    ColorAltSentRcvd: TColor;
    ColorAltNotNeed: TColor;
    DirectOldDate: string;
    DirectOldBand: string;
    DirectOldMode: string;
    DirectOldRSTFrom: string;
    DirectOldRSTTo: string;

    procedure UpdateSQLSent(sSent: string);
    function FindColumn(Grid: TDBGridEh; const FieldName: string): TColumnEh;
    function GetGridFilter(Grid: TDBGridEh): string;
    procedure SetGridFilter(Grid: TDBGridEh; const Filter: string; IsApply: boolean);
    procedure ShowPicture(iType: Integer); // 0-eQSL 1-dQSL
    procedure ValidateCellValue;
  public
    LogTableName: string;
    iStationId: Integer;
    EscAction: TAction;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ActionRefreshUpdate(Sender: TObject);
    procedure DeleteQSO;
    procedure RefreshLog(lParam, wParam: Integer);
    procedure ChangeStation(StationId: Integer);
    procedure EditQSO(Sender: TObject);
    procedure CancelQSO;
    procedure SaveQSO;
    procedure SaveGrid;
    procedure SentQSL(Sender: TObject);
    procedure RcvdQSLQueue(Sender: TObject);
    procedure RcvdQSL(Sender: TObject);
    procedure IgnoreQSL(Sender: TObject);
    procedure GetSelectedRecords(var lParam: variant; var wParam: variant);
    procedure ShowNeqEQSL;
    procedure PrintQueueAddQSO(Sender: TObject);
    procedure InitGridColors;
    procedure InitData;
    procedure SetImagesPath;
    procedure Loaded;
    procedure GotoRecord(lParam: variant);
    procedure LogAfterInsert(DataSet: TDataSet);
    procedure LogBeforePost(DataSet: TDataSet);
    procedure SetLogFilter(lParam:variant);
  end;

var
  WindowLogForm: TWindowLogForm;
  EditFilterName: TEditFilterName;

implementation

{$R *.dfm}

uses uWindowLog;

procedure TWindowLogForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (AComponent = FViewPicture) and (Operation = opRemove) then
  begin
    FViewPicture := nil;
  end;
end;

procedure TWindowLogForm.ActionRefreshUpdate(Sender: TObject);
begin
  if not Assigned(Self.Parent) then
    exit;
  TAction(Sender).Enabled := Self.Parent.Visible and (not dbgLog.DataSource.DataSet.IsEmpty) and (not(ldsLogEdit.DataSet.State = dsEdit));
end;

procedure TWindowLogForm.dbgLogCellClick(Column: TColumnEh);
var
  P: TPoint;
begin
  GetCursorPos(P);
  P := dbgLog.ScreenToClient(P);
  CurrentCol := dbgLog.MouseCoord(P.X, P.Y).X;
end;

procedure TWindowLogForm.dbgLogDblClick(Sender: TObject);
var
  P: TPoint;
  T: TGridCoord;
  ss: string;
begin
if tbDirectInput.Down then exit;

  GetCursorPos(P);
  P := dbgLog.ScreenToClient(P);
  T := dbgLog.MouseCoord(P.X, P.Y);
  if (T.X - 1) >= 0 then
  begin
    if dbgLog.Columns[T.X - 1].FieldName = 'LOG_DQSL_QSL_RCVD' then
      if dbgLog.Columns[T.X - 1].Field.AsString = 'Y' then
      begin
        ShowPicture(1);
        exit;
      end;
    if dbgLog.Columns[T.X - 1].FieldName = 'LOG_EQSL_QSL_RCVD' then
      if dbgLog.Columns[T.X - 1].Field.AsString = 'Y' then
      begin
        ShowPicture(0);
        exit;
      end;
  end;

  if dbgLog.ScreenToClient(Mouse.CursorPos).Y > 17 then
  begin
    EditQSO(Self);
  end;

end;

procedure TWindowLogForm.dbgLogExit(Sender: TObject);
begin
  if not(dgRowSelect in dbgLog.Options) and not tbDirectInput.Down then
    dbgLog.Options := dbgLog.Options + [dgRowSelect];
end;

procedure TWindowLogForm.dbgLogGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin

  if bUseAlternativeColor then
    exit;
  if (csDestroying in TDBGridEh(Sender).ComponentState) or not Assigned(GridColorList) then
    exit;
  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['LOG_QSL_SENT'] = 'Y') then
    if Assigned(GridColorList.Items[0]) then
    begin
      Background := TGridColor(GridColorList.Items[0]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[0]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[0]).FontStyle;
    end;
  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['LOG_QSL_SENT'] = 'I') then
    if GridColorList.Count > 2 then
    begin
      Background := TGridColor(GridColorList.Items[2]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[2]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[2]).FontStyle;
    end;

  if (Column.FieldName = 'LOG_CALL') and (TDBGridEh(Sender).DataSource.DataSet.FieldValues['LOG_EQSL_QSL_RCVD'] = 'Y') then
    if GridColorList.Count > 5 then
    begin
      Background := TGridColor(GridColorList.Items[5]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[5]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[5]).FontStyle;
    end;

  if TDBGridEh(Sender).DataSource.DataSet.FieldValues['LOG_QSL_RCVD'] = 'Y' then
    if GridColorList.Count > 4 then
    begin
      Background := TGridColor(GridColorList.Items[4]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[4]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[4]).FontStyle;
    end;

  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['LOG_QSL_SENT'] = 'Q') then
    if GridColorList.Count > 0 then
    begin
      Background := TGridColor(GridColorList.Items[1]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[1]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[1]).FontStyle;
    end;

  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['LOG_QSL_SENT'] = 'Y') and (TDBGridEh(Sender).DataSource.DataSet.FieldValues['LOG_QSL_RCVD'] = 'Y') then
    if GridColorList.Count > 0 then
    begin
      Background := TGridColor(GridColorList.Items[3]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[3]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[3]).FontStyle;
    end;


end;

procedure TWindowLogForm.dbgLogKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 70) and (ssCtrl in Shift) and not tbDirectInput.Down then
  begin
    dbgLog.Options := dbgLog.Options - [dgRowSelect];
    dbgLog.Col := CurrentCol;
    dbgLog.StartInplaceSearch('', -1, ltdAllEh);
  end;
end;

procedure TWindowLogForm.dbgLogKeyPress(Sender: TObject; var Key: Char);
var
  c: TColumnEh;
  sExprStr: string;
begin
  if tbDirectInput.Down then
  begin
    if (Ord(Key) >= 97) and (Ord(Key) <= 122) then
      Key := Chr(Ord(Key) - 32);
    if Key = #13 then
      ValidateCellValue;
    exit;
  end;

  if (Key = #8) and dbgLog.STFilter.Visible then
  begin
    c := FindColumn(dbgLog, 'LOG_CALL');
    sExprStr := c.STFilter.ExpressionStr;
    if Trim(sExprStr) <> '' then
      if sExprStr[Length(sExprStr)] = '*' then
        Delete(sExprStr, Length(sExprStr) - 1, 1);

    if Trim(sExprStr) = '' then
    begin
      dbgLog.STFilter.Visible := False;
      dbgLog.ClearFilter;
      dbgLog.ApplyFilter;
      exit;
    end
    else if Length(Trim(sExprStr)) = 2 then
      if sExprStr = '**' then
      begin
        dbgLog.STFilter.Visible := False;
        dbgLog.ClearFilter;
        dbgLog.ApplyFilter;
        exit;
      end;
    c.STFilter.ExpressionStr := sExprStr;
    dbgLog.ApplyFilter;
    exit;
  end;

  if (Key in symb) then
  begin
    c := FindColumn(dbgLog, 'LOG_CALL');
    if not dbgLog.STFilter.Visible then
    begin
      dbgLog.STFilter.Visible := True;
    end;
    sExprStr := c.STFilter.ExpressionStr;
    if Trim(sExprStr) = '' then
      c.STFilter.ExpressionStr := '*' + UpperCase(Key)[1] + '*'
    else if (sExprStr[1] = '*') and (sExprStr[Length(sExprStr)] = '*') then
    begin
      Delete(sExprStr, 1, 1);
      Delete(sExprStr, Length(sExprStr), 1);
    end;
    c.STFilter.ExpressionStr := '*' + sExprStr + UpperCase(Key)[1] + '*';
    dbgLog.ApplyFilter;

    { c := FindColumn(dbgLog, 'LOG_CALL');
      if not dbgLog.STFilter.Visible then
      begin
      dbgLog.STFilter.Visible:=True;
      dbgLog.STFilter.Visible:=True;
      TcrDBGridEh(dbgLog).StartEditFilter(c.Index);
      SendMessage(dbgLog.Handle, WM_KEYDOWN, VK_ESCAPE, 1);
      TcrDBGridEh(dbgLog).FilterEdit.SetFocus;
      TcrDBGridEh(dbgLog).ShowFilterEditorChar(UpperCase(Key)[1]);
      end;

      c.STFilter.ExpressionStr:=c.STFilter.ExpressionStr+'*';
      dbgLog.ApplyFilter; }

  end;
end;

procedure TWindowLogForm.dbgLogMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  tmp: Integer;
  IdUnderMouse: Integer;
  ss: string;
begin
  { Screen.Cursor:=crDefault;
    if dbgLog.MouseCoord(X,Y).X-1<0 then exit;

    if dbgLog.Columns[dbgLog.MouseCoord(X,Y).X-1].FieldName='LOG_DQSL_QSL_RCVD' then
    begin
    TDBGridEh(Sender).DataSource.DataSet.DisableControls;
    tmp:=TDBGridEh(Sender).MouseCoord(x, Y).Y-TDBGridEh(Sender).row;
    TDBGridEh(Sender).DataSource.DataSet.MoveBy(tmp) ;
    ss:= TDBGridEh(Sender).Columns[TDBGridEh(Sender).MouseCoord(x, Y).X-1].Field.AsString;
    TDBGridEh(Sender).DataSource.DataSet.MoveBy(-tmp) ;
    TDBGridEh(Sender).DataSource.DataSet.EnableControls;
    if ss='Y' then
    Screen.Cursor:=crHandPoint
    else
    Screen.Cursor:=crDefault;
    end; }
end;

procedure TWindowLogForm.dbgLogSelectionChanged(Sender: TObject);
begin
  if not(dgRowSelect in dbgLog.Options) and not tbDirectInput.Down then
    dbgLog.Options := dbgLog.Options + [dgRowSelect];
end;

procedure TWindowLogForm.dbgLogTranslateFilterDialog(Sender: TCustomDBGridEh; Dialog: TForm);
begin
  ShowMessage(TDBGridEhSimpleFilterDialog(Dialog).Caption);
end;

procedure TWindowLogForm.DeleteQSO;
var
  lParam, wParam: variant;
begin
  if MessageBox(Handle, PWideChar(msgDeleteRecord.Caption), '', mb_YesNo or mb_iconquestion) = mrYes then
  begin
    if dbgLog.Selection.SelectionType = gstAll then
    begin
      dbgLog.SelectedRows.SelectAll;
      lParam := 0;
      wParam := 1;
      lDllCommand(DC_DELETE_QSO, Self, lParam, wParam);
    end
    else
    begin
      GetSelectedRecords(lParam, wParam);
      wParam := 0;
      lDllCommand(DC_DELETE_QSO, Self, lParam, wParam);
    end;
    dbgLog.SelectedRows.Clear;
  end;
end;

procedure TWindowLogForm.dsLogDataChange(Sender: TObject; Field: TField);
var
  lParam, wParam: variant;
begin

  if tbShowInfo.Down and (ldsLog.DataSet.State = dsBrowse) and memLogInfo.Visible then
  begin
    lParam := ldsLog.DataSet.FieldByName('LOG_CALL_ORIGINAL').AsString;
    lDllCommand(DC_CALL_ADDITION_INFO, Self, lParam, wParam);
    memLogInfo.Lines.Text := wParam;
  end;

  if not Assigned(FViewPicture) then
    exit;
  if FViewPicture.Showing then
  begin
    // if dbgLog.DataSource.DataSet.FieldByName('LOG_DQSL_QSL_RCVD').asString='Y' then
    ShowPicture(-1);
  end;

end;

procedure TWindowLogForm.RefreshLog(lParam, wParam: Integer);
var
  i: Integer;
begin
  { if wParam=-1 then
    begin
    for i:=0 to dbgLog.Columns.Count - 1 do
    begin
    dbgLog.Columns[i].Title.SortMarker:=smNoneEh;
    end;
    TKaDaoTable(dbgLog.DataSource.DataSet).SortedBy.Text:='LOG_QSO_DATETIME';
    TKaDaoTable(dbgLog.DataSource.DataSet).Sort;
    end; }
  dbgLog.DefaultApplySorting;
{  if dbgLog.STFilter.Visible then
    dbgLog.DefaultApplyFilter;}
end;

procedure TWindowLogForm.ChangeStation(StationId: Integer);
begin
  iStationId := StationId;
  LogTableName := 'LOG_' + IntToStr(StationId);

  if dbgLog.DataSource.DataSet.Active and (TKADaoTable(dbgLog.DataSource.DataSet).TableName <> LogTableName) then
  begin
    dbgLog.DataSource.DataSet.Close;
    TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;
    dbgLog.DataSource.DataSet.Open;
    dbgLog.DefaultApplySorting;
    if dbgLog.SortMarkedColumns.Count>0 then
      if dbgLog.SortMarkedColumns[0].Title.SortMarker = smUpEh then
        dbgLog.DataSource.DataSet.First
      else
        dbgLog.DataSource.DataSet.Last;
    dbgLog.SelectedRows.Clear;
    dbgLog.SelectedRows.CurrentRowSelected:=True;
  end;


  // TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;

  // if not lbLoaded then exit;
  {
    if StationId = 0 then
    begin
    dbgLog.DataSource.DataSet.Close;
    exit;
    end;
    LogTableName := 'LOG_' + IntToStr(StationId);

    if dbgLog.DataSource.DataSet.Active and (TKADaoTable(dbgLog.DataSource.DataSet).TableName <> LogTableName) then
    begin
    dbgLog.DataSource.DataSet.Close;
    TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;
    dbgLog.DataSource.DataSet.Open;
    end;

    if lbLoaded and not dbgLog.DataSource.DataSet.Active and (iStationId <> 0) then
    begin
    cbFilters.ItemIndex := 0;
    dbgLog.DataSource.DataSet.Close;
    TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;
    dbgLog.DataSource.DataSet.Open;
    end;

    dbgLog.DefaultApplySorting; }
end;

procedure TWindowLogForm.EditQSO(Sender: TObject);
var
  lParam, wParam: variant;
begin
  // dbgLog.Color:=clSilver;
//  dbgLog.Enabled := False;
  wParam:=0;
  lParam := dbgLog.DataSource.DataSet.FieldByName('LOG_ID').AsInteger;
  lDllCommand(DC_EDIT_QSO, Self, lParam, wParam);
end;

procedure TWindowLogForm.aLogAllBookExecute(Sender: TObject);
begin
{  if dbgLog.DataSource.DataSet.Active and (TKADaoTable(dbgLog.DataSource.DataSet).TableName <> LogTableName) then
  begin
    dbgLog.DataSource.DataSet.Close;
    TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;
    dbgLog.DataSource.DataSet.Open;
    dbgLog.DefaultApplySorting;
  end;   }
end;

procedure TWindowLogForm.aLogDirtectInputExecute(Sender: TObject);
var
  i: Integer;

begin
  if dgRowSelect in dbgLog.Options then
  begin
    dbgLog.Options := dbgLog.Options - [dgRowSelect];
    dbgLog.Options := dbgLog.Options + [dgEditing];
    dbgLog.AllowedOperations := [alopInsertEh, alopUpdateEh, alopDeleteEh, alopAppendEh];
    dbgLog.ReadOnly := False;
    dbgLog.FieldColumns['LOG_QSL_SENT'].KeyList.Clear;
    dbgLog.FieldColumns['LOG_QSL_RCVD'].KeyList.Clear;
    dbgLog.FieldColumns['LOG_EQSL_QSL_SENT'].KeyList.Clear;
    dbgLog.FieldColumns['LOG_EQSL_QSL_RCVD'].KeyList.Clear;
    dbgLog.FieldColumns['LOG_LOTW_QSL_SENT'].KeyList.Clear;
    dbgLog.FieldColumns['LOG_LOTW_QSL_RCVD'].KeyList.Clear;
    dbgLog.FieldColumns['LOG_DQSL_QSL_SENT'].KeyList.Clear;
    dbgLog.FieldColumns['LOG_DQSL_QSL_RCVD'].KeyList.Clear;

    for i := 0 to lActionList.ActionCount - 1 do
    begin
      if ShortCutToText(TAction(lActionList.Actions[i]).ShortCut) = 'Esc' then
      begin
        EscAction := TAction(lActionList.Actions[i]);
        TAction(lActionList.Actions[i]).ShortCut := TextToShortCut('');
      end;
    end;

    tbDirectInput.Down := True;
  end
  else
  begin
    tbDirectInput.Down := False;
    dbgLog.Options := dbgLog.Options + [dgRowSelect];
    dbgLog.Options := dbgLog.Options - [dgEditing];
    dbgLog.AllowedOperations := [];
    dbgLog.FieldColumns['LOG_QSL_SENT'].KeyList.Add('');
    dbgLog.FieldColumns['LOG_QSL_SENT'].KeyList.Add('');
    dbgLog.FieldColumns['LOG_QSL_SENT'].KeyList.Add('Y');
    dbgLog.FieldColumns['LOG_QSL_RCVD'].KeyList.Add('Y');
    dbgLog.FieldColumns['LOG_QSL_RCVD'].KeyList.Add('');

    dbgLog.FieldColumns['LOG_EQSL_QSL_SENT'].KeyList := dbgLog.FieldColumns['LOG_QSL_SENT'].KeyList;
    dbgLog.FieldColumns['LOG_EQSL_QSL_RCVD'].KeyList := dbgLog.FieldColumns['LOG_QSL_RCVD'].KeyList;
    dbgLog.FieldColumns['LOG_LOTW_QSL_SENT'].KeyList := dbgLog.FieldColumns['LOG_QSL_SENT'].KeyList;
    dbgLog.FieldColumns['LOG_LOTW_QSL_RCVD'].KeyList := dbgLog.FieldColumns['LOG_QSL_RCVD'].KeyList;
    dbgLog.FieldColumns['LOG_DQSL_QSL_SENT'].KeyList := dbgLog.FieldColumns['LOG_QSL_SENT'].KeyList;
    dbgLog.FieldColumns['LOG_DQSL_QSL_RCVD'].KeyList := dbgLog.FieldColumns['LOG_QSL_RCVD'].KeyList;
    if EscAction <> nil then
      EscAction.ShortCut := TextToShortCut('Esc');

    dbgLog.ReadOnly := True;
  end;

  { if not(dgRowSelect in dbgLog.Options) then
    dbgLog.Options := dbgLog.Options + [dgRowSelect]; }

end;

procedure TWindowLogForm.aLogFilterExecute(Sender: TObject);
begin
  // dbgLog.STFilter.Visible := tbFilter.Down;
  if dbgLog.STFilter.Visible then
    dbgLog.ClearFilter;
  dbgLog.STFilter.Visible := not dbgLog.STFilter.Visible;
  tbFilter.Down := dbgLog.STFilter.Visible;
  { cbFilters.ItemIndex := 0;
    dbgLog.ClearFilter; }
  if not dbgLog.STFilter.Visible then
  begin
    dbgLog.ApplyFilter;
  end;
end;

function TWindowLogForm.FindColumn(Grid: TDBGridEh; const FieldName: string): TColumnEh;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Grid.Columns.Count - 1 do
    if AnsiCompareText(Grid.Columns[i].FieldName, FieldName) = 0 then
      exit(Grid.Columns[i]);
end;

procedure TWindowLogForm.FormActivate(Sender: TObject);
begin
  if Self.Visible and dbgLog.CanFocus and dbgLog.Visible then
  dbgLog.SetFocus;
end;

function TWindowLogForm.GetGridFilter(Grid: TDBGridEh): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Grid.Columns.Count - 1 do
    if Grid.Columns[i].STFilter.ExpressionStr <> '' then
      Result := Result + #13#10 + Grid.Columns[i].FieldName + '=' + Grid.Columns[i].STFilter.ExpressionStr;
  Result := Trim(Result);
end;

procedure TWindowLogForm.SetGridFilter(Grid: TDBGridEh; const Filter: string; IsApply: boolean);
var
  c: TColumnEh;
  i: Integer;
begin
  with TStringList.Create do
    try
      Text := Filter;
      for i := 0 to Count - 1 do
      begin
        c := FindColumn(Grid, Names[i]);
        if c <> nil then
          c.STFilter.ExpressionStr := Values[Names[i]];
      end;
      if IsApply then
        Grid.ApplyFilter;
    finally
      free;
    end;
end;

procedure TWindowLogForm.aLogFilterSaveExecute(Sender: TObject);
var
  slFilter: TStringList;
begin
  EditFilterName := TEditFilterName.Create(Application);
  try
    EditFilterName.Caption := WindowLog_EditFilterName.Caption;
    EditFilterName.leFilterName.EditLabel.Caption := EditFilterName.Caption;
    EditFilterName.btnOk.Caption := WindowLog_EditFilterbtnOk.Caption;
    EditFilterName.btnCancel.Caption := WindowLog_EditFilterbtnCancel.Caption;
    if EditFilterName.ShowModal = mrOk then
    begin
      slFilter := TStringList.Create;
      try
        slFilter.Text := GetGridFilter(dbgLog);
        slFilter.SaveToFile(ExtractFilePath(Application.ExeName) + '\Data\Filters\' + EditFilterName.leFilterName.Text);
        InitData;
        cbFilters.ItemIndex := cbFilters.Items.IndexOf(EditFilterName.leFilterName.Text);
      finally
        slFilter.free;
      end;
    end;
  finally
    EditFilterName.free;
  end;

end;

procedure TWindowLogForm.aLogFilterSaveUpdate(Sender: TObject);
begin
  aLogFilterSave.Enabled := tbFilter.Down;
end;

procedure TWindowLogForm.aLogShowInfoExecute(Sender: TObject);
begin
  if memLogInfo.Visible then
  begin
    Splitter.Align := alNone;
    memLogInfo.Visible := False;
    tbShowInfo.Down := False;
    Splitter.Visible := False;
  end
  else
  begin
    memLogInfo.Visible := True;
    Splitter.Align := alBottom;
    Splitter.Visible := True;
    tbShowInfo.Down := True;
    dsLogDataChange(dsLog, nil);
  end;
end;

procedure TWindowLogForm.CancelQSO;
begin
//  dbgLog.Enabled := True;
  // dbgLog.Color:=clWindow;
end;

procedure TWindowLogForm.cbFiltersClick(Sender: TObject);
var
  sStr: string;
  slFilter: TStringList;
begin
  if iStationId = 1 then
    exit;

  Screen.Cursor := crHourGlass;
  try
    dbgLog.STFilter.Visible := False;
    if cbFilters.ItemIndex > 0 then
    begin
      slFilter := TStringList.Create;
      dbgLog.ClearFilter;
      slFilter.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Data\Filters\' + cbFilters.Text);

      try
        slFilter.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Data\Filters\' + cbFilters.Text);
        if UpperCase(Copy(slFilter.Text, 1, 6)) = 'SELECT' then
        begin
          dbgLog.DataSource.DataSet.Close;
          sStr := StringReplace(slFilter.Text, '[LOG_TABLE]', LogTableName, [rfReplaceAll, rfIgnoreCase]);
          TKADaoTable(dbgLog.DataSource.DataSet).SQL.Text := StringReplace(slFilter.Text, '[LOG_TABLE]', LogTableName, [rfReplaceAll, rfIgnoreCase]);
          // TKADaoTable(dbgLog.DataSource.DataSet).SQL.SaveToFile('D:\!\!query.sql');
          dbgLog.DataSource.DataSet.Open;
          TKADaoTable(dbgLog.DataSource.DataSet).Filter := '';
          TKADaoTable(dbgLog.DataSource.DataSet).Filtered := False;
        end
        else
        begin
          dbgLog.STFilter.Visible := True;
          SetGridFilter(dbgLog, slFilter.Text, True);
          if not dbgLog.DataSource.DataSet.Active then
          begin
            TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;
            dbgLog.DataSource.DataSet.Open;
          end;
        end;

      finally
        slFilter.free;
      end;
    end
    else
    begin
      dbgLog.ClearFilter;
      dbgLog.DataSource.DataSet.Close;
      TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;
      TKADaoTable(dbgLog.DataSource.DataSet).Filter := '';
      TKADaoTable(dbgLog.DataSource.DataSet).Filtered := False;
      dbgLog.DataSource.DataSet.Open;
    end;
  finally
    dbgLog.DefaultApplySorting;
    if dbgLog.SortMarkedColumns.Count>0 then
      if dbgLog.SortMarkedColumns[0].Title.SortMarker = smUpEh then
        dbgLog.DataSource.DataSet.First
      else
        dbgLog.DataSource.DataSet.Last;
    dbgLog.SelectedRows.Clear;
    dbgLog.SelectedRows.CurrentRowSelected:=True;

    tbFilter.Down := dbgLog.STFilter.Visible;
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowLogForm.SaveQSO;
begin
  dbgLog.Enabled := True;
  dbgLog.Color := clWindow;
end;

procedure TWindowLogForm.SaveGrid;
var
  S: string;
  i: Integer;
begin
  with dbgLog.Columns do
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
      FormStorage.WriteString('dbgLog.' + Items[i].FieldName, S);
    end;
  end;

  FormStorage.WriteString('dbgLog.FontName', dbgLog.Font.Name);
  FormStorage.WriteInteger('dbgLog.FontColor', dbgLog.Font.Color);
  FormStorage.WriteInteger('dbgLog.FontSize', dbgLog.Font.Size);
  FormStorage.WriteInteger('dbgLog.FontStyle', FontStyleToInt(dbgLog.Font.Style));
  FormStorage.WriteInteger('dbgLog.BackgroundColor', dbgLog.Color);
  FormStorage.WriteBoolean('dbgLog.UseCustomColorFont', dbgLog.DrawGraphicData);
end;

procedure TWindowLogForm.GetSelectedRecords(var lParam: variant; var wParam: variant);
var
  SelRecords: variant;
  i: Integer;
  Bookmark: TBytes;
begin
  wParam := 0;
  if dbgLog.Selection.SelectionType = gstAll then
  begin
    // dbgLog.SelectedRows.SelectAll;
    wParam := 1;
    { SelRecords := VarArrayCreate([0, dbgLog.DataSource.DataSet.RecordCount - 1], varVariant);
      Bookmark := dbgLog.DataSource.DataSet.GetBookmark;
      dbgLog.DataSource.DataSet.DisableControls;
      dbgLog.DataSource.DataSet.First;
      try
      I:=0;
      while not dbgLog.DataSource.DataSet.Eof do
      begin
      SelRecords[I] := dbgLog.DataSource.DataSet.FieldByName('LOG_ID').asInteger;
      Inc(I);
      dbgLog.DataSource.DataSet.Next;
      end;
      lParam := SelRecords;
      finally
      dbgLog.DataSource.DataSet.GotoBookmark(Bookmark);
      dbgLog.DataSource.DataSet.EnableControls;
      SelRecords := Unassigned;
      end; }
  end
  else
  begin
   if dbgLog.SelectedRows.Count>0 then
   begin
    SelRecords := VarArrayCreate([0, dbgLog.SelectedRows.Count - 1], varVariant);
    // Bookmark := dbgLog.DataSource.DataSet.GetBookmark;
    dbgLog.DataSource.DataSet.DisableControls;
    dbgLog.SaveBookmark;
    try
      for i := 0 to dbgLog.SelectedRows.Count - 1 do
      begin
        // dbgLog.DataSource.DataSet.GotoBookmark(Pointer(dbgLog.SelectedRows.Items[I]));
        dbgLog.DataSource.DataSet.Bookmark := dbgLog.SelectedRows[i];
        SelRecords[i] := dbgLog.DataSource.DataSet.FieldByName('LOG_ID').AsInteger;
      end;
      lParam := SelRecords;
    finally
      // dbgLog.DataSource.DataSet.GotoBookmark(Bookmark);
      dbgLog.RestoreBookmark;
      // dbgLog.SelectedRows.Clear;
      dbgLog.DataSource.DataSet.EnableControls;
      SelRecords := Unassigned;
    end;
   end
   else
   begin
    SelRecords := VarArrayCreate([0, 0], varVariant);
    SelRecords[0] := dbgLog.DataSource.DataSet.FieldByName('LOG_ID').AsInteger;
    lParam := SelRecords;
    SelRecords := Unassigned;
   end;
  end;
end;

procedure TWindowLogForm.UpdateSQLSent(sSent: string);
var
  i: Integer;
begin

  dbgLog.DataSource.DataSet.DisableControls;
  dbgLog.SaveBookmark;
  Screen.Cursor := crHourGlass;
  try
    if dbgLog.Selection.SelectionType = gstAll then
      dbgLog.SelectedRows.SelectAll;

    if dbgLog.SelectedRows.Count = 0 then
      dbgLog.SelectedRows.CurrentRowSelected := True;

    if dbgLog.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLog.SelectedRows.Count - 1 do
      begin
        dbgLog.DataSource.DataSet.Bookmark := dbgLog.SelectedRows[i];
        try
          dbgLog.DataSource.DataSet.Edit;
          dbgLog.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString := sSent;
          if sSent = 'Y' then
            dbgLog.DataSource.DataSet.FieldByName('LOG_QSL_SENT_VIA').AsString := 'B';
          dbgLog.DataSource.DataSet.FieldByName('LOG_QSLSDATE').AsDateTime := Date;
          dbgLog.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
      dbgLog.Selection.Clear;
    end;
  finally
    dbgLog.RestoreBookmark;
    dbgLog.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowLogForm.SentQSL;
begin
  UpdateSQLSent('Y');
end;

procedure TWindowLogForm.RcvdQSLQueue(Sender: TObject);
var
  i: Integer;
begin
  dbgLog.DataSource.DataSet.DisableControls;
  dbgLog.SaveBookmark;
  Screen.Cursor := crHourGlass;
  try
    if dbgLog.Selection.SelectionType = gstAll then
      dbgLog.SelectedRows.SelectAll;

    if dbgLog.SelectedRows.Count = 0 then
      dbgLog.SelectedRows.CurrentRowSelected := True;

    if dbgLog.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLog.SelectedRows.Count - 1 do
      begin
        // dbgLog.DataSource.DataSet.Bookmark := dbgLog.SelectedRows[I];
        try
          dbgLog.DataSource.DataSet.Edit;
          dbgLog.DataSource.DataSet.FieldByName('LOG_QSL_RCVD').AsString := 'Y';
          dbgLog.DataSource.DataSet.FieldByName('LOG_QSLRDATE').AsDateTime := Date;
          if (dbgLog.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString = 'N') or dbgLog.DataSource.DataSet.FieldByName('LOG_QSL_SENT').IsNull then
            dbgLog.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString := 'Q';
          dbgLog.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
      dbgLog.Selection.Clear;
    end;
  finally
    dbgLog.RestoreBookmark;
    dbgLog.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowLogForm.RcvdQSL(Sender: TObject);
var
  i: Integer;
begin
  dbgLog.DataSource.DataSet.DisableControls;
  dbgLog.SaveBookmark;
  Screen.Cursor := crHourGlass;
  try
    if dbgLog.Selection.SelectionType = gstAll then
      dbgLog.SelectedRows.SelectAll;

    if dbgLog.SelectedRows.Count = 0 then
      dbgLog.SelectedRows.CurrentRowSelected := True;

    if dbgLog.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLog.SelectedRows.Count - 1 do
      begin
        // dbgLog.DataSource.DataSet.Bookmark := dbgLog.SelectedRows[I];
        try
          dbgLog.DataSource.DataSet.Edit;
          dbgLog.DataSource.DataSet.FieldByName('LOG_QSL_RCVD').AsString := 'Y';
          dbgLog.DataSource.DataSet.FieldByName('LOG_QSLRDATE').AsDateTime := Date;
          dbgLog.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
      dbgLog.Selection.Clear;
    end;
  finally
    dbgLog.RestoreBookmark;
    dbgLog.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowLogForm.IgnoreQSL;
begin
  UpdateSQLSent('I');
end;

procedure TWindowLogForm.ShowNeqEQSL;
begin
  if Parent.Visible then
  begin
    dbgLog.FieldColumns['LOG_EQSL_QSLRDATE'].STFilter.ExpressionStr := '>28.09.2010';
    dbgLog.ApplyFilter;
    tbFilter.Down := True;
  end;
end;

procedure TWindowLogForm.PrintQueueAddQSO(Sender: TObject);
begin
  UpdateSQLSent('Q');
end;

procedure TWindowLogForm.InitGridColors;
var
  slColors: TStringList;
  slColorLine: TStringList;
  GridColor: TGridColor;
  i: Integer;
begin
  bUseAlternativeColor := lAppStorage.ReadBoolean('Options\cbGeneralColorAlternative_Checked');
  if bUseAlternativeColor then
  begin
    ColorAltSent := StringToColor(lAppStorage.ReadString('Options\cbColorAltSent_ColorValue', 'clWindow'));
    ColorAltRcvd := StringToColor(lAppStorage.ReadString('Options\cbColorAltRcvd_ColorValue', 'clWindow'));
    ColorAltSentRcvd := StringToColor(lAppStorage.ReadString('Options\cbColorAltSentRcvd_ColorValue', 'clWindow'));
    ColorAltNotNeed := StringToColor(lAppStorage.ReadString('Options\cbColorNotNeed_ColorValue', 'clWindow'));
    exit;
  end;
  GridColorList.Clear;
  slColors := TStringList.Create;
  slColorLine := TStringList.Create;
  slColorLine.Delimiter := '|';
  try
    lAppStorage.ReadStringList('Options\GridColors', slColors);
    for i := 0 to slColors.Count - 1 do
    begin
      slColorLine.DelimitedText := slColors.Strings[i];
      GridColor := TGridColor.Create;
      GridColor.ColorBackground := StrToInt2(slColorLine.Strings[0]);
      GridColor.ColorForeground := StrToInt2(slColorLine.Strings[1]);
      if boolean(StrToInt2(slColorLine.Strings[2])) then
        GridColor.FontStyle := GridColor.FontStyle + [fsBold];
      if boolean(StrToInt2(slColorLine.Strings[3])) then
        GridColor.FontStyle := GridColor.FontStyle + [fsItalic];
      if boolean(StrToInt2(slColorLine.Strings[4])) then
        GridColor.FontStyle := GridColor.FontStyle + [fsUnderline];
      GridColorList.Add(GridColor);
    end;
    dbgLog.Repaint;
  finally
    slColors.free;
    slColorLine.free;
  end;
end;

procedure TWindowLogForm.InitData;
var
  slFiles: TStringList;
  i: Integer;
  sFileName: string;
begin
  cbFilters.Items.Clear;
  cbFilters.Items.Add('-');
  slFiles := TStringList.Create;
  try
    FindFilesByMask(slFiles, ExtractFilePath(Application.ExeName) + 'Data\Filters', '*.*');
    for i := 0 to slFiles.Count - 1 do
    begin
      sFileName := ExtractFileName(slFiles.Strings[i]);
      cbFilters.Items.Add(sFileName);
    end;
  finally
    slFiles.free;
  end;
  cbFilters.Sorted := True;
end;

procedure TWindowLogForm.SetImagesPath;
begin
  FEQSLImagePath := lAppStorage.ReadString('Options\deEQSLPictureDirectory_Text', '');

  if Trim(FEQSLImagePath) <> '' then
  begin
    if POS(':', FEQSLImagePath) = 0 then
      FEQSLImagePath := ExtractFilePath(Application.ExeName) + FEQSLImagePath;
  end
  else
    FEQSLImagePath := ExtractFilePath(Application.ExeName) + FEQSLImagePath;
  if FEQSLImagePath[Length(FEQSLImagePath)] <> '\' then
    FEQSLImagePath := FEQSLImagePath + '\';

  FDQSLImagePath := lAppStorage.ReadString('Options\deDQSLPictureDirectory_Text', '');

  if Trim(FDQSLImagePath) <> '' then
  begin
    if POS(':', FDQSLImagePath) = 0 then
      FDQSLImagePath := ExtractFilePath(Application.ExeName) + FDQSLImagePath;
  end
  else
    FDQSLImagePath := ExtractFilePath(Application.ExeName) + FDQSLImagePath;
  if FDQSLImagePath[Length(FDQSLImagePath)] <> '\' then
    FDQSLImagePath := FDQSLImagePath + '\';

end;

procedure TWindowLogForm.ShowPicture(iType: Integer); // 0-eQSL 1-dQSL
var
  sFileName: string;
  sPath: string;
begin
  qryQSLImageFiles.Close;
  qryQSLImageFiles.Params.ParamByName('STATION_ID').AsInteger := iStationId;
  qryQSLImageFiles.Params.ParamByName('LOG_ID').AsInteger := dbgLog.DataSource.DataSet.FieldByName('LOG_ID').AsInteger;
  qryQSLImageFiles.Open;
  if not qryQSLImageFiles.IsEmpty then
  begin
    if iType = -1 then
    begin
      if Assigned(FViewPicture) then
        iType := FViewPicture.TypeQSL
      else
        exit;
    end;
    if iType = 0 then
    begin
      sFileName := qryQSLImageFiles.FieldByName('IMAGE_EQSL_FILENAME').AsString;
      sPath := FEQSLImagePath;
    end;
    if iType = 1 then
    begin
      sFileName := qryQSLImageFiles.FieldByName('IMAGE_DQSL_FILENAME').AsString;
      sPath := FDQSLImagePath;
    end;

    { if FileExists(sPath + sFileName) then
      begin }
    if FViewPicture = nil then
    begin
      FViewPicture := TViewPicture.Create(Self);
      FViewPicture.FormStorage.AppStorage := lAppStorage;
      FViewPicture.LoadImage(iType, sPath, sFileName);
      FViewPicture.Show;
      FViewPicture.FreeNotification(Self);
    end
    else
      FViewPicture.LoadImage(iType, sPath, sFileName)
  end
  else if Assigned(FViewPicture) then
  begin
    FViewPicture.Caption := '';
    FViewPicture.imgPicture.Picture := nil;
  end;
end;

procedure TWindowLogForm.Loaded;
var
  i: Integer;
begin
  cbFilters.OnClick(WindowLogForm);
  if not dbgLog.DataSource.DataSet.Active then
    exit;

  for i := 0 to dbgLog.Columns.Count - 1 do
  begin
    if dbgLog.Columns[i].Title.SortMarker = smDownEh then
    begin
      dbgLog.DataSource.DataSet.Last;
      exit;
    end;
    if dbgLog.Columns[i].Title.SortMarker = smUpEh then
    begin
      dbgLog.DataSource.DataSet.First;
      exit;
    end;
  end;
end;

procedure TWindowLogForm.GotoRecord(lParam: variant);
begin
  if dbgLog.DataSource.DataSet.Locate('LOG_ID', lParam, []) then
  begin
    dbgLog.SelectedRows.Clear;
    dbgLog.SelectedRows.CurrentRowSelected := True;
  end;
end;

procedure TWindowLogForm.ValidateCellValue;
var
  iOldSelectedRow: Integer;
  k: Char;
begin
  iOldSelectedRow := dbgLog.SelectedIndex;
  { if Options.cbSkipFilledField.Checked then
    begin }
  while dbgLog.SelectedIndex < (dbgLog.Columns.Count - 1) do
  begin
    dbgLog.SelectedIndex := dbgLog.SelectedIndex + 1;
    if dbgLog.Columns[dbgLog.SelectedIndex].Visible and (dbgLog.Columns[dbgLog.SelectedIndex].Field.AsString = '') then
      exit;
  end;
  { end
    else if dbgLog.Col < (dbgLog.fieldcount - 1) then
    dbgLog.Col := dbgLog.SelectedIndex + 1; }
  if dbgLog.SelectedIndex = (dbgLog.Columns.Count - 1) then
  begin
    // aPostRecordExecute(Self);

    // DataLink.DataSet.RecNo - DataLink.ActiveRecord;
    // if dbgLog.DataSource.DataSet.Eof then
    if (dbgLog.RowCount - dbgLog.TopRow = dbgLog.DataSource.DataSet.RecordCount) or dbgLog.DataSource.DataSet.Eof then
    begin
      dbgLog.DataSource.DataSet.Append;
      dbgLog.Col := 0;
      while dbgLog.SelectedIndex < (dbgLog.Columns.Count - 1) do
      begin
        dbgLog.SelectedIndex := dbgLog.SelectedIndex + 1;
        if dbgLog.Columns[dbgLog.SelectedIndex].Visible and (dbgLog.Columns[dbgLog.SelectedIndex].Field.AsString = '') then
          exit;
      end;

      // ValidateCellValue;
      // aNewRecordExecute(Self);
      { if Options.cbSkipFilledField.Checked then
        begin
        dbgLog.SelectedIndex := 0;
        ValidateCellValue;
        end; }
    end
    else
    begin
      dbgLog.SelectedIndex := iOldSelectedRow;
      if ((dbgLog.Columns[dbgLog.SelectedIndex].FieldName <> 'LOG_DATE') and (dbgLog.Columns[dbgLog.SelectedIndex].FieldName <> 'LOG_BAND') and (dbgLog.Columns[dbgLog.SelectedIndex].FieldName <> 'LOG_MODE') and
          (dbgLog.Columns[dbgLog.SelectedIndex].FieldName <> 'LOG_TIME')) then
      begin
        k := #27;
        dbgLog.EditorMode := True;
        dbgLog.EditorMode := True;
        SendMessage(dbgLog.Handle, WM_Char, Word(k), 0);
      end;
    end;
  end;
end;

procedure TWindowLogForm.LogAfterInsert(DataSet: TDataSet);
begin
  if not tbDirectInput.Down then
    exit;
  DataSet.FieldByName('LOG_QSL_SENT').AsString := 'N';
  DataSet.FieldByName('LOG_QSL_RCVD').AsString := 'N';
  DataSet.FieldByName('LOG_EQSL_QSL_SENT').AsString := 'N';
  DataSet.FieldByName('LOG_EQSL_QSL_RCVD').AsString := 'N';
  DataSet.FieldByName('LOG_LOTW_QSL_SENT').AsString := 'N';
  DataSet.FieldByName('LOG_LOTW_QSL_RCVD').AsString := 'N';
  DataSet.FieldByName('LOG_DQSL_QSL_SENT').AsString := 'N';
  DataSet.FieldByName('LOG_DQSL_QSL_RCVD').AsString := 'N';

  DataSet.FieldByName('LOG_QSO_DATE').AsString:=DirectOldDate;
  DataSet.FieldByName('LOG_BAND_MHZ').AsString:=DirectOldBand;
  DataSet.FieldByName('LOG_MODE').AsString :=DirectOldMode;
  DataSet.FieldByName('LOG_RST_RCVD').AsString := DirectOldRSTFrom;
  DataSet.FieldByName('LOG_RST_SENT').AsString := DirectOldRSTTo;

end;

procedure TWindowLogForm.LogBeforePost(DataSet: TDataSet);
begin
  DirectOldDate := DataSet.FieldByName('LOG_QSO_DATE').AsString;
  DirectOldBand := DataSet.FieldByName('LOG_BAND_MHZ').AsString;
  DirectOldMode := DataSet.FieldByName('LOG_MODE').AsString;
  DirectOldRSTFrom := DataSet.FieldByName('LOG_RST_RCVD').AsString;
  DirectOldRSTTo := DataSet.FieldByName('LOG_RST_SENT').AsString;
end;

procedure TWindowLogForm.SetLogFilter(lParam:variant);
var
slFilter:TStringList;
sStr :string;
begin
  Screen.Cursor := crHourGlass;
  try
    dbgLog.STFilter.Visible := False;
      slFilter := TStringList.Create;
      dbgLog.ClearFilter;
      slFilter.Text:=lParam;

      try
        if UpperCase(Copy(slFilter.Text, 1, 6)) = 'SELECT' then
        begin
          dbgLog.DataSource.DataSet.Close;
          sStr := StringReplace(slFilter.Text, '[LOG_TABLE]', LogTableName, [rfReplaceAll, rfIgnoreCase]);
          TKADaoTable(dbgLog.DataSource.DataSet).SQL.Text := StringReplace(slFilter.Text, '[LOG_TABLE]', LogTableName, [rfReplaceAll, rfIgnoreCase]);
          // TKADaoTable(dbgLog.DataSource.DataSet).SQL.SaveToFile('D:\!\!query.sql');
          dbgLog.DataSource.DataSet.Open;
          TKADaoTable(dbgLog.DataSource.DataSet).Filter := '';
          TKADaoTable(dbgLog.DataSource.DataSet).Filtered := False;
        end
        else
        begin
          dbgLog.STFilter.Visible := True;
          SetGridFilter(dbgLog, slFilter.Text, True);
          if not dbgLog.DataSource.DataSet.Active then
          begin
            TKADaoTable(dbgLog.DataSource.DataSet).TableName := LogTableName;
            dbgLog.DataSource.DataSet.Open;
          end;
          dbgLog.DefaultApplySorting;
          tbFilter.Down := dbgLog.STFilter.Visible;
        end;
      finally
        slFilter.free;
      end;
  finally
     Screen.Cursor := crDefault;
  end;
end;


end.
