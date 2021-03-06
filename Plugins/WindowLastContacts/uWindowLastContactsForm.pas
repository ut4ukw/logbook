unit uWindowLastContactsForm;

interface

uses
  EhLibMemTableData, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Contnrs, uUtils, DBGrids, JvComponentBase, JvFormPlacement,
  Provider, KDaoTable, KDaoDataBase, uWindowPluginForm, uPluginHeaders,
  JvMemoryDataset, GridsEh, DBGridEh, ComCtrls,
  ToolWin, ActnList, ImgList, JvThread, ExtCtrls, Menus,uColors,
  DBGridEhGrouping;

type

  TWindowLastContactsForm = class(TWindowPluginForm)
    dsLastContacts: TDataSource;
    qryLastContacts: TKADaoTable;
    qryLastContactsLOG_ID: TIntegerField;
    qryLastContactsLOG_QTH: TStringField;
    qryLastContactsLOG_CALL: TStringField;
    qryLastContactsLOG_QSO_DATE: TDateTimeField;
    qryLastContactsLOG_COMMENT: TStringField;
    qryLastContactsLOG_QSLSDATE: TDateTimeField;
    qryLastContactsLOG_QSLRDATE: TDateTimeField;
    qryLastContactsLOG_QSL_RCVD: TStringField;
    qryLastContactsLOG_QSL_SENT: TStringField;
    qryLastContactsLOG_QSL_VIA: TStringField;
    qryLastContactsLOG_EQSL_QSLRDATE: TDateTimeField;
    qryLastContactsLOG_EQSL_QSLSDATE: TDateTimeField;
    qryLastContactsLOG_EQSL_QSL_RCVD: TStringField;
    qryLastContactsLOG_EQSL_QSL_SENT: TStringField;
    qryLastContactsLOG_LOTW_QSLRDATE: TDateTimeField;
    qryLastContactsLOG_LOTW_QSLSDATE: TDateTimeField;
    qryLastContactsLOG_LOTW_QSL_RCVD: TStringField;
    qryLastContactsLOG_LOTW_QSL_SENT: TStringField;
    qryLastContactsLOG_BAND_MHZ: TFloatField;
    FormStorage: TJvFormStorage;
    qryLastContactsLOG_MODE: TStringField;
    qryLastContactsLOG_NAME: TStringField;
    ToolBar1: TToolBar;
    tbSyncBrowse: TToolButton;
    ActionList: TActionList;
    ilLastContacts: TImageList;
    aLastContactsSyncBrowse: TAction;
    aLastContactsSearchAllBook: TAction;
    tbSearchAllBook: TToolButton;
    FormStorageOnExit: TJvFormStorage;
    qryLastContactsLOG_OPERATOR: TStringField;
    cdsLastContacts: TJvMemoryData;
    qryStations: TKADaoTable;
    ilQSL: TImageList;
    qryLastContactsLOG_QSO_TIME: TDateTimeField;
    dbgLastContacts: TDBGridEh;
    dsLog: TDataSource;
    qryLastContactsLOG_STATE: TStringField;
    qryLastContactsLOG_CNTY: TStringField;
    qryLastContactsLOG_QSO_DATETIME: TDateTimeField;
    qryLastContactsLOG_EMAIL: TStringField;
    qryLastContactsLOG_WEB: TStringField;
    qryLastContactsLOG_IOTA: TStringField;
    qryLastContactsLOG_GRIDSQUARE: TStringField;
    cdsLastContactsLOG_EMAIL: TStringField;
    cdsLastContactsLOG_WEB: TStringField;
    cdsLastContactsLOG_IOTA: TStringField;
    cdsLastContactsLOG_GRIDSQUARE: TStringField;
    cdsLastContactsLOG_STATE: TStringField;
    cdsLastContactsLOG_CNTY: TStringField;
    cdsLastContactsLOG_QTH: TStringField;
    cdsLastContactsLOG_OPERATOR: TStringField;
    cdsLastContactsLOG_CALL: TStringField;
    cdsLastContactsLOG_QSO_DATE: TDateTimeField;
    cdsLastContactsLOG_COMMENT: TStringField;
    cdsLastContactsLOG_QSLSDATE: TDateTimeField;
    cdsLastContactsLOG_QSLRDATE: TDateTimeField;
    cdsLastContactsLOG_QSL_RCVD: TStringField;
    cdsLastContactsLOG_QSL_SENT: TStringField;
    cdsLastContactsLOG_QSL_VIA: TStringField;
    cdsLastContactsLOG_EQSL_QSLRDATE: TDateTimeField;
    cdsLastContactsLOG_EQSL_QSLSDATE: TDateTimeField;
    cdsLastContactsLOG_EQSL_QSL_RCVD: TStringField;
    cdsLastContactsLOG_EQSL_QSL_SENT: TStringField;
    cdsLastContactsLOG_LOTW_QSLRDATE: TDateTimeField;
    cdsLastContactsLOG_LOTW_QSLSDATE: TDateTimeField;
    cdsLastContactsLOG_LOTW_QSL_RCVD: TStringField;
    cdsLastContactsLOG_LOTW_QSL_SENT: TStringField;
    cdsLastContactsLOG_BAND_MHZ: TFloatField;
    cdsLastContactsLOG_MODE: TStringField;
    cdsLastContactsLOG_NAME: TStringField;
    cdsLastContactsLOG_QSO_TIME: TDateTimeField;
    cdsLastContactsLOG_QSO_DATETIME: TDateTimeField;
    pnlMainToolbar: TPanel;
    cdsLastContactsSTATION_ID: TIntegerField;
    qryLastContactsSTATION_ID: TStringField;
    pmLog: TPopupMenu;
    miQSL: TMenuItem;
    N112: TMenuItem;
    N111: TMenuItem;
    N1111: TMenuItem;
    N11111: TMenuItem;
    N4: TMenuItem;
    N1112: TMenuItem;
    aLastContactsQSLQueue: TAction;
    cdsLastContactsLOG_ID: TIntegerField;
    aLastContactsQSLRcvd: TAction;
    aLastContactsQSLSent: TAction;
    aLastContactsQSLIgnore: TAction;
    aLastContactsQSLPrint: TAction;
    procedure dbgLastContactsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aLastContactsSyncBrowseExecute(Sender: TObject);
    procedure aLastContactsSearchAllBookExecute(Sender: TObject);
    procedure FormStorageOnExitAfterRestorePlacement(Sender: TObject);
    procedure dsLogDataChange(Sender: TObject; Field: TField);
    procedure dbgLastContactsDblClick(Sender: TObject);
    procedure dbgLastContactsExit(Sender: TObject);
    procedure dbgLastContactsEnter(Sender: TObject);
    procedure aLastContactsQSLQueueExecute(Sender: TObject);
    procedure aLastContactsQSLRcvdExecute(Sender: TObject);
    procedure aLastContactsQSLSentExecute(Sender: TObject);
    procedure aLastContactsQSLIgnoreExecute(Sender: TObject);
    procedure aLastContactsQSLPrintExecute(Sender: TObject);
  private
    bSearchAllBook: boolean;
    bSyncBrowse: boolean;
    bLoaded: boolean;
  public
    BandMhz: real;
    gsCall: string;
    SelectFromClause, SelectFromClauseAllBooks: string;
    StationId: integer;
    StationParentId: integer;
    procedure CallInfo;
    procedure SaveGrid;
    procedure InitGridColors;
    procedure Loaded;
    procedure CallChanged;
  end;

var
  WindowLastContactsForm: TWindowLastContactsForm;

implementation

{$R *.dfm}

uses uWindowLastContacts;

procedure TWindowLastContactsForm.aLastContactsQSLRcvdExecute(Sender: TObject);
var
  i: Integer;
  qryTmp:TKaDaoTable;
  sQslSnt:string;
  lParam, wParam:variant;
begin
  dbgLastContacts.DataSource.DataSet.DisableControls;
  dbgLastContacts.SaveBookmark;
  Screen.Cursor := crHourGlass;
  qryTmp:=TKaDaoTable.Create(nil);
  try
  qryTmp.Database:=lDatabase;
    if dbgLastContacts.Selection.SelectionType = gstAll then
      dbgLastContacts.SelectedRows.SelectAll;

    if dbgLastContacts.SelectedRows.Count = 0 then
      dbgLastContacts.SelectedRows.CurrentRowSelected := True;

    if dbgLastContacts.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLastContacts.SelectedRows.Count - 1 do
      begin
         dbgLastContacts.DataSource.DataSet.Bookmark := dbgLastContacts.SelectedRows[I];
        try
         qryTmp.SQL.Text:='UPDATE LOG_'+dbgLastContacts.DataSource.DataSet.FieldByName('STATION_ID').AsString+' SET LOG_QSL_RCVD='+QuotedStr('Y')+' , LOG_QSLRDATE='+QuotedStr(DateToStr(Date))+' WHERE LOG_ID='+dbgLastContacts.DataSource.DataSet.FieldByName('LOG_ID').AsString;
         qryTmp.ExecuteSQL;
          dbgLastContacts.DataSource.DataSet.Edit;
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_RCVD').AsString := 'Y';
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSLRDATE').AsDateTime := Date;
          dbgLastContacts.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
//    dbgLastContacts.Selection.Clear;
    end;
  finally
    qryTmp.Free;
    dbgLastContacts.RestoreBookmark;
    dbgLastContacts.Selection.Clear;
    dbgLastContacts.SelectedRows.Clear;
    dbgLastContacts.DataSource.DataSet.EnableControls;
    lDllCommand(DC_REFRESH_LOG, Self, lParam, wParam);
    Screen.Cursor := crDefault;
  end;
end;


procedure TWindowLastContactsForm.aLastContactsQSLSentExecute(Sender: TObject);
var
  i: Integer;
  qryTmp:TKaDaoTable;
  sQslSnt:string;
  lParam, wParam:variant;
begin
  dbgLastContacts.DataSource.DataSet.DisableControls;
  dbgLastContacts.SaveBookmark;
  Screen.Cursor := crHourGlass;
  qryTmp:=TKaDaoTable.Create(nil);
  try
  qryTmp.Database:=lDatabase;
    if dbgLastContacts.Selection.SelectionType = gstAll then
      dbgLastContacts.SelectedRows.SelectAll;

    if dbgLastContacts.SelectedRows.Count = 0 then
      dbgLastContacts.SelectedRows.CurrentRowSelected := True;

    if dbgLastContacts.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLastContacts.SelectedRows.Count - 1 do
      begin
         dbgLastContacts.DataSource.DataSet.Bookmark := dbgLastContacts.SelectedRows[I];
        try
         qryTmp.SQL.Text:='UPDATE LOG_'+dbgLastContacts.DataSource.DataSet.FieldByName('STATION_ID').AsString+' SET LOG_QSL_SENT='+QuotedStr('Y')+' , LOG_QSLSDATE='+QuotedStr(DateToStr(Date))+',LOG_QSL_SENT_VIA='+QuotedStr('B')+'    WHERE LOG_ID='+dbgLastContacts.DataSource.DataSet.FieldByName('LOG_ID').AsString;
         qryTmp.ExecuteSQL;
          dbgLastContacts.DataSource.DataSet.Edit;
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString := 'Y';
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSLSDATE').AsDateTime := Date;
          dbgLastContacts.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
    end;

  finally
    qryTmp.Free;
    dbgLastContacts.RestoreBookmark;
    dbgLastContacts.Selection.Clear;
    dbgLastContacts.SelectedRows.Clear;
    dbgLastContacts.DataSource.DataSet.EnableControls;
    lDllCommand(DC_REFRESH_LOG, Self, lParam, wParam);
    Screen.Cursor := crDefault;
  end;
end;


procedure TWindowLastContactsForm.aLastContactsSearchAllBookExecute(Sender: TObject);
begin
  bSearchAllBook := not bSearchAllBook;
  tbSearchAllBook.Down := bSearchAllBook;
  CallInfo;
end;

procedure TWindowLastContactsForm.aLastContactsQSLIgnoreExecute(
  Sender: TObject);
var
  i: Integer;
  qryTmp:TKaDaoTable;
  lParam, wParam:variant;
begin
  dbgLastContacts.DataSource.DataSet.DisableControls;
  dbgLastContacts.SaveBookmark;
  Screen.Cursor := crHourGlass;
  qryTmp:=TKaDaoTable.Create(nil);
  try
  qryTmp.Database:=lDatabase;
    if dbgLastContacts.Selection.SelectionType = gstAll then
      dbgLastContacts.SelectedRows.SelectAll;

    if dbgLastContacts.SelectedRows.Count = 0 then
      dbgLastContacts.SelectedRows.CurrentRowSelected := True;

    if dbgLastContacts.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLastContacts.SelectedRows.Count - 1 do
      begin
         dbgLastContacts.DataSource.DataSet.Bookmark := dbgLastContacts.SelectedRows[I];
        try
         qryTmp.SQL.Text:='UPDATE LOG_'+dbgLastContacts.DataSource.DataSet.FieldByName('STATION_ID').AsString+' SET LOG_QSL_SENT='+QuotedStr('I')+'  WHERE LOG_ID='+dbgLastContacts.DataSource.DataSet.FieldByName('LOG_ID').AsString;
         qryTmp.ExecuteSQL;
          dbgLastContacts.DataSource.DataSet.Edit;
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString := 'I';
          dbgLastContacts.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
    end;
  finally
    qryTmp.Free;
    dbgLastContacts.RestoreBookmark;
    dbgLastContacts.Selection.Clear;
    dbgLastContacts.SelectedRows.Clear;
    dbgLastContacts.DataSource.DataSet.EnableControls;
    lDllCommand(DC_REFRESH_LOG, Self, lParam, wParam);
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowLastContactsForm.aLastContactsQSLPrintExecute(Sender: TObject);
var
  i: Integer;
  qryTmp:TKaDaoTable;
  lParam, wParam:variant;
begin
  dbgLastContacts.DataSource.DataSet.DisableControls;
  dbgLastContacts.SaveBookmark;
  Screen.Cursor := crHourGlass;
  qryTmp:=TKaDaoTable.Create(nil);
  try
  qryTmp.Database:=lDatabase;
    if dbgLastContacts.Selection.SelectionType = gstAll then
      dbgLastContacts.SelectedRows.SelectAll;

    if dbgLastContacts.SelectedRows.Count = 0 then
      dbgLastContacts.SelectedRows.CurrentRowSelected := True;

    if dbgLastContacts.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLastContacts.SelectedRows.Count - 1 do
      begin
         dbgLastContacts.DataSource.DataSet.Bookmark := dbgLastContacts.SelectedRows[I];
        try
         qryTmp.SQL.Text:='UPDATE LOG_'+dbgLastContacts.DataSource.DataSet.FieldByName('STATION_ID').AsString+' SET LOG_QSL_SENT='+QuotedStr('Q')+'  WHERE LOG_ID='+dbgLastContacts.DataSource.DataSet.FieldByName('LOG_ID').AsString;
         qryTmp.ExecuteSQL;
          dbgLastContacts.DataSource.DataSet.Edit;
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString := 'Q';
          dbgLastContacts.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
    end;
  finally
    qryTmp.Free;
    dbgLastContacts.RestoreBookmark;
    dbgLastContacts.Selection.Clear;
    dbgLastContacts.SelectedRows.Clear;
    dbgLastContacts.DataSource.DataSet.EnableControls;
    lDllCommand(DC_REFRESH_LOG, Self, lParam, wParam);
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowLastContactsForm.aLastContactsQSLQueueExecute(
  Sender: TObject);
var
  i: Integer;
  qryTmp:TKaDaoTable;
  sQslSnt:string;
  lParam, wParam:variant;
begin
  dbgLastContacts.DataSource.DataSet.DisableControls;
  dbgLastContacts.SaveBookmark;
  Screen.Cursor := crHourGlass;
  qryTmp:=TKaDaoTable.Create(nil);
  try
  qryTmp.Database:=lDatabase;
    if dbgLastContacts.Selection.SelectionType = gstAll then
      dbgLastContacts.SelectedRows.SelectAll;

    if dbgLastContacts.SelectedRows.Count = 0 then
      dbgLastContacts.SelectedRows.CurrentRowSelected := True;

    if dbgLastContacts.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgLastContacts.SelectedRows.Count - 1 do
      begin
         dbgLastContacts.DataSource.DataSet.Bookmark := dbgLastContacts.SelectedRows[I];
        try
          if (dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString = 'N') or dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').IsNull then
            sQslSnt:=' , LOG_QSL_SENT='+QuotedStr('Q');
         qryTmp.SQL.Text:='UPDATE LOG_'+dbgLastContacts.DataSource.DataSet.FieldByName('STATION_ID').AsString+' SET LOG_QSL_RCVD='+QuotedStr('Y')+' , LOG_QSLRDATE='+QuotedStr(DateToStr(Date))+sQslSnt+' WHERE LOG_ID='+dbgLastContacts.DataSource.DataSet.FieldByName('LOG_ID').AsString;
         qryTmp.ExecuteSQL;
          dbgLastContacts.DataSource.DataSet.Edit;
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_RCVD').AsString := 'Y';
          dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSLRDATE').AsDateTime := Date;
          if (dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString = 'N') or dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').IsNull then
            dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString := 'Q';
          dbgLastContacts.DataSource.DataSet.Post;
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), 'Error', MB_OK or MB_ICONERROR);
        end;
      end;
//    dbgLastContacts.Selection.Clear;
    end;
  finally
    qryTmp.Free;
    dbgLastContacts.RestoreBookmark;
    dbgLastContacts.Selection.Clear;
    dbgLastContacts.SelectedRows.Clear;
    dbgLastContacts.DataSource.DataSet.EnableControls;
    lDllCommand(DC_REFRESH_LOG, Self, lParam, wParam);
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowLastContactsForm.aLastContactsSyncBrowseExecute(Sender: TObject);
begin
  bSyncBrowse := not bSyncBrowse;
  tbSyncBrowse.Down := bSyncBrowse;
  if bSyncBrowse then
  begin
    gsCall := GetOriginalCall(Trim(ldsLog.DataSet.FieldByName('LOG_CALL').AsString));
    CallInfo;
  end
  else
    dbgLastContacts.DataSource.DataSet.Close;
end;

procedure TWindowLastContactsForm.CallInfo;
var
  i: integer;
begin
  if not Assigned(Parent) then
    exit;
//  if Parent.Visible then
    if gsCall <> '' then
    begin

      dsLastContacts.DataSet.DisableControls;
//      qryLastContacts.DisableControls;



      try
        dbgLastContacts.DataSource.DataSet.Close;
        if not bSearchAllBook then
        begin
          qryLastContacts.Close;
          qryLastContacts.SQL.Text := 'SELECT LOG_EMAIL,LOG_WEB,LOG_IOTA, LOG_GRIDSQUARE, LOG_STATE, LOG_CNTY, LOG_ID, LOG_QTH, LOG_OPERATOR, LOG_CALL, LOG_QSO_DATE, LOG_COMMENT, LOG_QSLSDATE, LOG_QSLRDATE, LOG_QSL_RCVD, LOG_QSL_SENT, LOG_QSL_VIA, ' + 'LOG_EQSL_QSLRDATE, LOG_EQSL_QSLSDATE, LOG_EQSL_QSL_RCVD, LOG_EQSL_QSL_SENT, LOG_LOTW_QSLRDATE, LOG_LOTW_QSLSDATE, LOG_LOTW_QSL_RCVD, LOG_LOTW_QSL_SENT, LOG_BAND_MHZ, LOG_MODE, LOG_NAME, LOG_QSO_TIME, LOG_QSO_DATETIME , "'+ IntToStr(StationId)+'" as STATION_ID FROM LOG_' + IntToStr(StationId)
            + ' WHERE log_call_original='''+gsCall+'''';
          qryLastContacts.Open;
          dsLastContacts.DataSet := qryLastContacts;
        end
        else
        begin
          cdsLastContacts.EmptyTable;
          cdsLastContacts.Open;
          qryStations.Close;
          qryStations.Params.ParamByName('STATION_PARENT_ID').AsInteger:=StationParentId;
          qryStations.Open;
          while not qryStations.Eof do
          begin
            qryLastContacts.Close;
            qryLastContacts.SQL.Text := 'SELECT LOG_EMAIL,LOG_WEB,LOG_IOTA, LOG_GRIDSQUARE,LOG_STATE, LOG_CNTY, LOG_ID, LOG_QTH, LOG_OPERATOR, LOG_CALL, LOG_QSO_DATE, LOG_COMMENT, LOG_QSLSDATE, LOG_QSLRDATE, LOG_QSL_RCVD, LOG_QSL_SENT, LOG_QSL_VIA, ' + 'LOG_EQSL_QSLRDATE, LOG_EQSL_QSLSDATE, LOG_EQSL_QSL_RCVD, LOG_EQSL_QSL_SENT, LOG_LOTW_QSLRDATE, LOG_LOTW_QSLSDATE, LOG_LOTW_QSL_RCVD, LOG_LOTW_QSL_SENT, LOG_BAND_MHZ, LOG_MODE, LOG_NAME, LOG_QSO_TIME, LOG_QSO_DATETIME, "'+ qryStations.FieldByName('STATION_ID').AsString+'" as STATION_ID FROM LOG_' + IntToStr
              (qryStations.FieldByName('STATION_ID').AsInteger)
            + ' WHERE log_call_original='''+gsCall+'''';
//            + ' WHERE log_call=''' + gsCall + '''  OR log_call LIKE ''*/' + gsCall + ''' OR log_call LIKE ''' + gsCall + '/*'' OR log_call LIKE ''*/' + gsCall + '/*''';
        //    qryLastContacts.SQL.SaveToFile('d:\2.sql');
            qryLastContacts.Open;
            cdsLastContacts.LoadFromDataSet(qryLastContacts, qryLastContacts.RecordCount, lmAppend, True);
            qryStations.Next;
           // break;
          end;
          cdsLastContacts.SortOnFields('LOG_QSO_DATETIME', False, True);
          dsLastContacts.DataSet := cdsLastContacts;
        // dbgLastContacts.DefaultApplySorting;
        end;

{        for i := 0 to dbgLastContacts.Columns.Count - 1 do
        begin
          if dbgLastContacts.Columns[i].FieldName = 'LOG_QSO_DATE' then
            dbgLastContacts.Columns[i].Title.SortMarker := smUpEh
          else
            dbgLastContacts.Columns[i].Title.SortMarker := smNoneEh;
        end;}

        dbgLastContacts.DataSource.DataSet.First;
        while not dbgLastContacts.DataSource.DataSet.Eof do
        begin
          if Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString) = dbgLastContacts.DataSource.DataSet.FieldByName('LOG_CALL').AsString then
          begin
           if ldsLogEdit.DataSet.State in [dsInsert] then
            begin
            try
             ldsLogEdit.DataSet.FieldByName('LOG_NAME').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_NAME').AsString;
             ldsLogEdit.DataSet.FieldByName('LOG_QTH').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_QTH').AsString;
             ldsLogEdit.DataSet.FieldByName('LOG_GRIDSQUARE').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_GRIDSQUARE').AsString;
             ldsLogEdit.DataSet.FieldByName('LOG_STATE').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_STATE').AsString;
             ldsLogEdit.DataSet.FieldByName('LOG_CNTY').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_CNTY').AsString;
             ldsLogEdit.DataSet.FieldByName('LOG_EMAIL').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_EMAIL').AsString;
             ldsLogEdit.DataSet.FieldByName('LOG_WEB').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_WEB').AsString;
             ldsLogEdit.DataSet.FieldByName('LOG_IOTA').AsString := dbgLastContacts.DataSource.DataSet.FieldByName('LOG_IOTA').AsString;
            except
            end;
            end;
            break;
          end;
          dbgLastContacts.DataSource.DataSet.Next;
        end;
        dbgLastContacts.DataSource.DataSet.First;

      finally
        dsLastContacts.DataSet.EnableControls;

        dbgLastContacts.DefaultApplySorting;
        dbgLastContacts.DataSource.DataSet.First;
        dbgLastContacts.Selection.Clear;
        if dbgLastContacts.DataSource.DataSet.IsEmpty then
         dbgLastContacts.DataSource.DataSet.Close;
      end;
    end;

  { qryLastContacts.Open;
    dbgLastContacts.DefaultApplySorting; }
end;

procedure TWindowLastContactsForm.dbgLastContactsDblClick(Sender: TObject);
var
  lParam, wParam: variant;
begin
{  lParam := dsLastContacts.DataSet.FieldByName('LOG_ID').AsInteger;
  lDllCommand(DC_GOTO_RECORD_BY_ID, Self, lParam, wParam);}
  wParam:=dsLastContacts.DataSet.FieldByName('STATION_ID').AsInteger;
  lParam := dsLastContacts.DataSet.FieldByName('LOG_ID').AsInteger;
  lDllCommand(DC_EDIT_QSO, Self, lParam, wParam);
end;

procedure TWindowLastContactsForm.dbgLastContactsEnter(Sender: TObject);
begin
 dbgLastContacts.Options:=dbgLastContacts.Options+[dgAlwaysShowSelection];
end;

procedure TWindowLastContactsForm.dbgLastContactsExit(Sender: TObject);
begin
 dbgLastContacts.Options:=dbgLastContacts.Options-[dgAlwaysShowSelection];
end;

procedure TWindowLastContactsForm.dbgLastContactsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (csDestroying in TDBGridEh(Sender).ComponentState) or not Assigned(GridColorList) then
    exit;
  if (TDBGridEh(Sender).DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString = 'Y') then
    if Assigned(GridColorList.Items[0]) then
    begin
      Background := TGridColor(GridColorList.Items[0]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[0]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[0]).FontStyle;
    end;
  if (TDBGridEh(Sender).DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString = 'I') then
    if GridColorList.Count > 2 then
    begin
      Background := TGridColor(GridColorList.Items[2]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[2]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[2]).FontStyle;
    end;


  if (Column.FieldName = 'LOG_CALL') and (TDBGridEh(Sender).DataSource.DataSet.FieldByName('LOG_EQSL_QSL_RCVD').AsString = 'Y') then
    if GridColorList.Count > 5 then
    begin
      Background := TGridColor(GridColorList.Items[5]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[5]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[5]).FontStyle;
    end;

  if TDBGridEh(Sender).DataSource.DataSet.FieldByName('LOG_QSL_RCVD').AsString = 'Y' then
    if GridColorList.Count > 4 then
    begin
      Background := TGridColor(GridColorList.Items[4]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[4]).ColorForeground;
      AFont.Style := TGridColor(GridColorList.Items[4]).FontStyle;
    end;
  if TDBGridEh(Sender).DataSource.DataSet.FieldByName('LOG_BAND_MHZ').AsFloat = BandMhz then
  begin
    AFont.Color := clTeal;
   // AFont.Color := 40704;
//    Background := clGreen;
  end;

  if (TDBGridEh(Sender).DataSource.DataSet.FieldByName('LOG_QSL_SENT').AsString = 'Q') then
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



  if (TDBGridEh(Sender).DataSource.DataSet.FieldByName('STATION_ID').asInteger = StationId) and bSearchAllBook then
    AFont.Style:=[fsUnderline];


end;

procedure TWindowLastContactsForm.dsLogDataChange(Sender: TObject; Field: TField);
begin
  if not bLoaded or not bSyncBrowse then
    exit;
  if ldsLog.DataSet.State = dsBrowse then
  begin
    gsCall := GetOriginalCall(Trim(ldsLog.DataSet.FieldByName('LOG_CALL').AsString));
    CallInfo;
  end;
end;

procedure TWindowLastContactsForm.FormStorageOnExitAfterRestorePlacement(Sender: TObject);
begin
  bSearchAllBook := tbSearchAllBook.Down;
  bSyncBrowse := tbSyncBrowse.Down;
end;

procedure TWindowLastContactsForm.SaveGrid;
var
  S: string;
  i: integer;
begin
  with dbgLastContacts.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, integer(Items[i].Title.SortMarker), integer(Items[i].Visible), Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth, Items[i].InRowLinePos, Items[i].InRowLineHeight]);
      if S <> '' then
      begin
        if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
          S := '"' + S + '"';
      end;
      FormStorage.WriteString('dbgLastContacts.' + Items[i].FieldName, S);
    end;
  end;
  FormStorage.WriteString('dbgLastContacts.FontName', dbgLastContacts.Font.Name);
  FormStorage.WriteInteger('dbgLastContacts.FontColor', dbgLastContacts.Font.Color);
  FormStorage.WriteInteger('dbgLastContacts.FontSize', dbgLastContacts.Font.Size);
  FormStorage.WriteInteger('dbgLastContacts.FontStyle', FontStyleToInt(dbgLastContacts.Font.Style));
  FormStorage.WriteInteger('dbgLastContacts.BackgroundColor', dbgLastContacts.Color);
  FormStorage.WriteBoolean('dbgLastContacts.UseCustomColorFont', dbgLastContacts.DrawGraphicData);
end;

procedure TWindowLastContactsForm.InitGridColors;
var
  slColors: TStringList;
  slColorLine: TStringList;
  GridColor: TGridColor;
  i: integer;
begin
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
    dbgLastContacts.Repaint;
  finally
    slColors.Free;
    slColorLine.Free;
  end;
end;

{
  procedure TWindowLastContactsForm.AfterScroll(Sender: TDataSet);
  begin
  if tbSyncBrowse.Down then
  begin
  if ldsLog.DataSet.State = dsBrowse then
  begin
  gsCall := ldsLog.DataSet.FieldByName('LOG_CALL').AsString;
  CallChanged;
  end;
  end;
  if Assigned(OriginalAfterScroll) then
  OriginalAfterScroll(Sender);
  end; }

procedure TWindowLastContactsForm.Loaded;
begin
  bLoaded := True;
  { if bSyncBrowse then
    dsLogDataChange(nil,nil); }
end;

procedure TWindowLastContactsForm.CallChanged;
begin
  dbgLastContacts.DataSource.DataSet.Close;
end;

end.
