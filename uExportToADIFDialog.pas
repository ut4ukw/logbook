unit uExportToADIFDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvMemo, ComCtrls, JvExComCtrls,
  JvProgressBar, WinInet,
  DateUtils, Db, jvDbGrid, Mask, JvExMask, JvToolEdit,
  dblookup, DBCtrls, JvWizard, JvExControls,
  JvWizardRouteMapNodes, JvSpecialProgress,ShellApi, PrefLst,
  uUtils, ExtCtrls, uPluginHeaders,  pngimage,  KDaoTable,
  rkVistaProBar;

type
  TExportToADIFDialog = class(TForm)
    Wizard: TJvWizard;
    wipWelcome: TJvWizardWelcomePage;
    wipExportCheck: TJvWizardInteriorPage;
    feFile: TJvFilenameEdit;
    lbFile: TLabel;
    wizRouteMap: TJvWizardRouteMapNodes;
    wipExport: TJvWizardInteriorPage;
    lbProgress: TLabel;
    rgExportVariant: TRadioGroup;
    rbExportAll: TRadioButton;
    rbExportSelected: TRadioButton;
    rbExportInterval: TRadioButton;
    dtpExportIntervalBegin: TDateTimePicker;
    dtpExportIntervalEnd: TDateTimePicker;
    lbFileCheck: TLabel;
    feFileCheck: TJvFilenameEdit;
    rgExportVariantCheck: TRadioGroup;
    rbExportAllCheck: TRadioButton;
    rbExportSelectedCheck: TRadioButton;
    rbExportIntervalCheck: TRadioButton;
    dtpExportIntervalBeginCheck: TDateTimePicker;
    dtpExportIntervalEndCheck: TDateTimePicker;
    Image1: TImage;
    qryExport: TKADaoTable;
    pgExport: TVistaProBar;
    lbFoundErrors: TLabel;
    lbOpendLog: TLabel;
    procedure wipWelcomeNextButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure wipExportCheckFinishButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure wipExportPage(Sender: TObject);
    procedure rbExportIntervalClick(Sender: TObject);
    procedure WizardActivePageChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbOpendLogClick(Sender: TObject);
  private
    procedure DoExport;
  public
    DateFrom: TDateTime;
    DialogCaption: String;
    Login: string;
    Password: string;
    DbGrid: TjvDbGrid;
    LoadCard: boolean;
  end;

var
  gs: string;
  ExportToADIFDialog: TExportToADIFDialog;

implementation

uses udmMain, uMainWindow;
{$R *.dfm}


procedure TExportToADIFDialog.FormShow(Sender: TObject);
begin
 dtpExportIntervalBegin.Date:=Date;
 dtpExportIntervalEnd.Date:=Date;
end;

procedure TExportToADIFDialog.lbOpendLogClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open',  'notepad.exe', PWideChar(ExtractFilePath(Application.ExeName)+'\Log\Export_'+ExtractFileName(feFile.FileName)+'.log'), nil, SW_SHOWNORMAL);
end;

procedure TExportToADIFDialog.rbExportIntervalClick(Sender: TObject);
begin
 dtpExportIntervalBegin.Enabled:=rbExportInterval.Checked;
 dtpExportIntervalEnd.Enabled:=rbExportInterval.Checked;
end;

procedure TExportToADIFDialog.wipExportCheckFinishButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
 Wizard.SelectNextPage;
end;

procedure TExportToADIFDialog.wipExportPage(Sender: TObject);
begin
 wipExport.EnabledButtons:=[];
 DoExport;
 wipExport.EnabledButtons:=[bkBack,bkCancel];
end;

procedure TExportToADIFDialog.wipWelcomeNextButtonClick(
  Sender: TObject; var Stop: Boolean);
begin
 if Trim(feFile.FileName)='' then
  begin
    MessageBox(Application.Handle,PWideChar('Enter filename '), 'ERROR', MB_OK or MB_ICONERROR);
    Abort;
  end;
  rbExportAllCheck.Checked:=rbExportAll.Checked;
  rbExportSelectedCheck.Checked:=rbExportSelected.Checked;
  rbExportIntervalCheck.Checked:=rbExportInterval.Checked;
  dtpExportIntervalBeginCheck.DateTime:=dtpExportIntervalBegin.DateTime;
  dtpExportIntervalEndCheck.DateTime:=dtpExportIntervalEnd.DateTime;
  feFileCheck.FileName:=feFile.FileName;
end;




procedure TExportToADIFDialog.WizardActivePageChanged(Sender: TObject);
begin
 wipWelcome.WaterMark.Visible:=Wizard.ActivePage=wipWelcome;
 wizRouteMap.Visible:=not wipWelcome.WaterMark.Visible;
end;



procedure TExportToADIFDialog.DoExport;
var
 sLog:TStringList;
 iExportedRowCount,i,HighBound:integer;
 lParam,wParam:variant;
 tFile:TextFile;
 Bookmark:TBookmark;

begin
 sLog:=TStringList.Create;
 iExportedRowCount:=0;
 Screen.Cursor:=crHourGlass;
 if ExtractFileExt(feFile.FileName)='' then
  feFile.FileName:=feFile.FileName+'.adi';
 dmMain.qryLog.DisableControls;
 try
  if rbExportAll.Checked then
   begin
    qryExport.SQL.Text:='SELECT COUNT(*) FROM LOG_'+IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
    qryExport.Open;
    pgExport.Max:=qryExport.Fields[0].AsInteger;
    lbProgress.Caption := '0/' + IntToStr(pgExport.Max);
    qryExport.Close;
    qryExport.SQL.Text:='SELECT * FROM LOG_'+IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
    qryExport.Open;
   end;

  if rbExportSelected.Checked then
   begin
    MainWindow.Plugins.CoreGetData(CC_GET_SELECTED_RECORDS,lParam,wParam);
    if wParam=1 then
      pgExport.Max:=dmMain.qryLog.RecordCount
    else
     begin
      if (varType(lParam) and varArray) = varArray then
         pgExport.Max:=TVarData(lParam).VArray^.Bounds[0].ElementCount
       else
         pgExport.Max:=0;
     end;
    lbProgress.Caption := '0/' + IntToStr(pgExport.Max);
   end;

  if rbExportInterval.Checked then
   begin
    qryExport.SQL.Text:='SELECT COUNT(*) FROM LOG_'+IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger)+' WHERE LOG_QSO_DATETIME  BETWEEN :DATE_BEGIN AND :DATE_END';
    qryExport.Params.ParamByName('DATE_BEGIN').AsDate:=dtpExportIntervalBegin.Date;
    qryExport.Params.ParamByName('DATE_END').AsDate:=dtpExportIntervalEnd.Date;
    qryExport.Open;
    pgExport.Max:=qryExport.Fields[0].AsInteger;
    lbProgress.Caption := '0/' + IntToStr(pgExport.Max);
    qryExport.Close;

    qryExport.SQL.Text:='SELECT * FROM LOG_'+IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger)+' WHERE LOG_QSO_DATETIME  BETWEEN :DATE_BEGIN AND :DATE_END';
    qryExport.Params.ParamByName('DATE_BEGIN').AsDate:=dtpExportIntervalBegin.Date;
    qryExport.Params.ParamByName('DATE_END').AsDate:=dtpExportIntervalEnd.Date;
    qryExport.Open;
   end;


   sLog.Add('Start export '+IntToStr(pgExport.Max)+' records.');
   try

    AssignFile(tFile,feFile.FileName);
    Rewrite(tFile);
    Writeln(tFile,'# UT4UKW Logbook Ver');
    Writeln(tFile,'');
    Writeln(tFile,'<PROGRAMID:13>UT4UKWLOGBOOK');
    Writeln(tFile,'<PROGRAMVERSION:4>1.00');
    Writeln(tFile,'<ADIF_VER:5>2.2.6');
    Writeln(tFile,'<EOH>');

   if rbExportAll.Checked or rbExportInterval.Checked then
    begin
     qryExport.First;
     while not qryExport.Eof do
      begin
       try
         try
          Writeln(tFile,GetAdifRow(qryExport,False));
         except
          on E: Exception do
            sLog.Add('Error in LOG_ID : '+IntToStr(qryExport.FieldByName('LOG_ID').asInteger)+ ' : ' + E.Message);
         end;
        finally
          Inc(iExportedRowCount);
          pgExport.Position := pgExport.Position + 1;
          lbProgress.Caption := IntToStr(pgExport.Position) + '/' + IntToStr(pgExport.Max);
          Application.ProcessMessages;
          qryExport.Next;
        end;
      end;
    end;

   if rbExportSelected.Checked and (pgExport.Max>0) then
    begin
    if wParam=1 then  // Select All
    begin
     dmMain.qryLog.DisableControls;
     Bookmark:=dmMain.qryLog.GetBookmark;
     try
      dmMain.qryLog.First;
      while not dmMain.qryLog.Eof do
       begin
        try
          try
            Writeln(tFile,GetAdifRow(dmMain.qryLog,False));
          except
            on E: Exception do
              sLog.Add('Error in LOG_ID : '+IntToStr(dmMain.qryLog.FieldByName('LOG_ID').asInteger)+ ' : ' + E.Message);
          end;
        finally
           Inc(iExportedRowCount);
           pgExport.Position := pgExport.Position + 1;
           lbProgress.Caption := IntToStr(pgExport.Position) + '/' + IntToStr(pgExport.Max);
           Application.ProcessMessages;
           Inc(i);
           dmMain.qryLog.Next;
        end;
       end;
     finally
       if dmMain.qryLog.BookmarkValid(Bookmark) then
          dmMain.qryLog.GotoBookmark(Bookmark);
       dmMain.qryLog.FreeBookmark(Bookmark);
       dmMain.qryLog.EnableControls;
     end;
    end
    else
    begin
     i := VarArrayLowBound(lParam, 1);
     HighBound := VarArrayHighBound(lParam, 1);
     while i <= HighBound do
       begin
        try
          try
           qryExport.Close;
           qryExport.SQL.Text:='SELECT * FROM LOG_'+IntToStr(dmMain.qryStations.FieldByName('STATION_ID').AsInteger)+' WHERE LOG_ID=:LOG_ID';
           qryExport.Params.ParamByName('LOG_ID').AsInteger:=lParam[i];
           qryExport.Open;
           Writeln(tFile,GetAdifRow(qryExport,False));
          except
            on E: Exception do
              sLog.Add('Error in LOG_ID : '+IntToStr(qryExport.FieldByName('LOG_ID').asInteger)+ ' : ' + E.Message);
          end;
        finally
           Inc(iExportedRowCount);
           pgExport.Position := pgExport.Position + 1;
           lbProgress.Caption := IntToStr(pgExport.Position) + '/' + IntToStr(pgExport.Max);
           Application.ProcessMessages;
           Inc(i);
        end;
       end;
    end;
   end;

   except
    on E: Exception do
      sLog.Add(E.Message);
   end;


//  sFile.SaveToFile(feFile.FileName);
  sLog.Add('End export. '+IntToStr(iExportedRowCount)+'/'+IntToStr(pgExport.Max)+' have been exported.');
  sLog.SaveToFile(ExtractFilePath(Application.ExeName)+'\Log\Export_'+ExtractFileName(feFile.FileName)+'.log');
  lbFoundErrors.Caption:=Format(lbFoundErrors.Caption, [IntToStr(pgExport.Max-iExportedRowCount)]);
  lbFoundErrors.Visible:=True;
 finally
  CloseFile(tFile);
  sLog.Free;
  dmMain.qryLog.EnableControls;
  Screen.Cursor:=crDefault;
 end;

{if cbOpenLog.Checked then
  ShellExecute(Handle, 'open',  'notepad.exe', PWideChar(ExtractFilePath(Application.ExeName)+'\Log\Export_'+ExtractFileName(feFile.FileName)+'.log'), nil, SW_SHOWNORMAL);}
end;


end.
