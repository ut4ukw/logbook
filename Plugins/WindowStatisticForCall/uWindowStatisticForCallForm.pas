unit uWindowStatisticForCallForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, uWindowPluginForm,DB,
  DBGridEhGrouping, GridsEh, DBGridEh,KDaoTable, Math, ImgList,jvStrUtils,uUtils,
  uPluginHeaders, uColors;


type

  TDBGridEhCrack = class(TDBGridEh);

  TStatisticPanel= class(TGroupBox)
  private
    dsData:TDataSource;
    FOldParam:string;
  protected
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
   Grid:TDbgridEh;
   AwardId:integer;
   qryData:TKaDaoTable;
   slQSLType:TstringList;
   bForAll:boolean;
   StationId:integer;
   StationParentId:integer;
   DataField:string;
   FilterDxcc:string;
   dsListener:TDataSource;
   procedure BuildQuery;
   procedure ListenerDataChange(Sender: TObject;  Field: TField);
   procedure OptimizeWidth;
   procedure GetText(Sender: TField; var Text: string; DisplayText: boolean);
   procedure Refresh();
   procedure Clear();
   procedure GridDblClick(Sender: TObject);
  end;

  TWindowStatisticForCallForm = class(TWindowPluginForm)
    DataSource1: TDataSource;
    qryBands: TKADaoTable;
    ilIcons: TImageList;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
   MainPanel:TPanel;
   StatisticPanel:TStatisticPanel;
   procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
    var Background: TColor; State: TGridDrawState);

  public
   StationParentId:integer;
   StationId:integer;
   slBands:TStringList;
   procedure OptionsChanged;
   procedure DeInit;
   procedure CallInfo;
   procedure NewQSO;
   procedure CallChanged;
   procedure InitGridColors;
  end;

var
  WindowStatisticForCallForm: TWindowStatisticForCallForm;
implementation

uses uWindowStatisticForCall;
{$R *.dfm}

constructor TStatisticPanel.Create(AOwner: TComponent);
var
 StringField:TStringField;
 IntegerField:TIntegerField;
 lslBands:TStringList;
 i:integer;
begin
  inherited;
  Align:=alTop;
  Grid:=TDbgridEh.Create(Self);
  Grid.Parent:=Self;
  Grid.Align:=alClient;
  Grid.TitleFont.Size := Font.Size;
  Grid.ReadOnly := True;
  Grid.OptionsEh := Grid.OptionsEh - [dghFixed3D];
  Grid.OptionsEh := Grid.OptionsEh - [dghExtendVertLines];
  Grid.OptionsEh := Grid.OptionsEh + [dghIncSearch,dghPreferIncSearch];
  Grid.Options := Grid.Options - [dgIndicator];

  Grid.VertScrollBar.Visible:=False;
  Grid.OnDblClick:=GridDblClick;

  qryData:=TKaDaoTable.Create(nil);
  dsData:=TDataSource.Create(nil);
  dsListener:=TDataSource.Create(nil);
  dsListener.OnDataChange:=ListenerDataChange;


  dsData.DataSet:=qryData;
  Grid.DataSource:=dsData;
  slQSLType:=TstringList.Create;
  qryData.FieldDefs.Add('LOG_MODE',ftString,25);
//  qryData.FieldDefs.Add('WORKED_TOTAL',ftInteger,0);
//  qryData.FieldDefs.Add('AWARD_DATA_FIELD_VALUE',ftString,25);

  StringField:=TStringField.Create(qryData);
  StringField.FieldName:='LOG_MODE';
  StringField.DataSet:=qryData;

{  IntegerField:=TIntegerField.Create(qryData);
  IntegerField.FieldName:='WORKED_TOTAL';
  IntegerField.DataSet:=qryData;
  IntegerField.Visible:=False;
 }

{  StringField:=TStringField.Create(qryData);
  StringField.FieldName:='AWARD_DATA_FIELD_VALUE';
  StringField.DataSet:=qryData;}

  lslBands:=TWindowStatisticForCallForm(Self.Owner.Owner).slBands;
  for i:= 0 to lslBands.Count-1 do
  begin
//    qryData.FieldDefs.Add(StringReplace(lslBands[i],'_','.',[rfReplaceAll, rfIgnoreCase]),ftString,25);
    qryData.FieldDefs.Add(lslBands[i],ftString,25);
    StringField:=TStringField.Create(qryData);
    StringField.FieldName:=StringReplace(lslBands[i],'.','_', [rfReplaceAll, rfIgnoreCase]);
    StringField.DisplayWidth:=16;
    StringField.OnGetText:=GetText;
    StringField.DataSet:=qryData;
  end;
  Grid.Columns.AddAllColumns(True);

  for i:=0 to Grid.Columns.Count - 1 do
  begin
    Grid.Columns[i].Title.Caption:=StringReplace(Grid.Columns[i].Title.Caption,'_','.',[rfReplaceAll, rfIgnoreCase]);
    Grid.Columns[i].Title.Alignment:=taCenter;
    {if i>0 then
    begin
      Grid.Columns[i].ImageList:=TWindowStatisticForCallForm(Self.Owner.Owner).ilIcons;
      Grid.Columns[i].KeyList.Add('0');
      Grid.Columns[i].KeyList.Add('1');
      Grid.Columns[i].KeyList.Add('2');
    end;   }
    Grid.Columns[i].Width:=32;
  end;
  Height:=TDBGridEhCrack(Grid).RowHeights[0]+5;
  //  newGridHeight:=(qryData.RecordCount+1)*(TDBGridEhCrack(Grid).RowHeights[0]+1)+4;

 // Clear;
end;

destructor TStatisticPanel.Destroy;
begin
  dsListener.DataSet:=nil;
  FreeAndNil(dsListener);
  FreeAndNil(dsData);
  FreeAndNil(qryData);
  FreeAndNil(slQSLType);
  inherited;
end;


procedure TStatisticPanel.BuildQuery;
var
  sQSLsent, sQSLrcvd: string;
  i:integer;
  sQSLSuffix:string;
  sSelectTableAwards:string;
  sDxcc:string;
  sAwardDataFieldValue:string;
  sBandList:string;
  qryTmp:TKadaoTable;
begin
  //


  for i := 0 to slQSLType.Count - 1 do
    begin
      if i = 0 then
        sQSLSuffix := ''
      else
        sQSLSuffix := '_qsl';
      if sQSLsent = '' then
      begin
        sQSLsent := 'l.log_' + slQSLType[i] + sQSLSuffix + '_sent=''Y''';
        sQSLrcvd := 'l.log_' + slQSLType[i] + sQSLSuffix + '_rcvd=''Y''';
      end
      else
      begin
        sQSLsent := sQSLsent + ' or l.log_' + slQSLType[i] + sQSLSuffix + '_sent=''Y''';
        sQSLrcvd := sQSLrcvd + ' or l.log_' + slQSLType[i] + sQSLSuffix + '_rcvd=''Y''';
      end;
    end;

  if sQSLsent = '' then
  begin
    sQSLsent := '0';
    sQSLrcvd := '0';
  end;

  if FilterDXCC<>'' then
    sDxcc:=' AND l.log_dxcc IN ('+FilterDXCC+') ';


  for i:=0 to TWindowStatisticForCallForm(Owner.Owner).slBands.Count-1 do
    if sBandList='' then
       sBandList := TWindowStatisticForCallForm(Owner.Owner).slBands[i]
    else
       sBandList := sBandList+','+TWindowStatisticForCallForm(Owner.Owner).slBands[i];


   if ldsLogEdit.DataSet.FieldByName(DataField).DataType=ftString then
       sAwardDataFieldValue:='ad.award_data_field_value';
   if (ldsLogEdit.DataSet.FieldByName(DataField).DataType=ftInteger) or (ldsLogEdit.DataSet.FieldByName(DataField).DataType=ftSmallInt) then
      sAwardDataFieldValue:='val(ad.award_data_field_value)';

  if not bForAll then
  begin
    sSelectTableAwards:='SELECT  *  FROM  awards_data  ad, (SELECT log_id, log_qso_datetime, log_band_mhz, log_mode, log_qsl_sent, '+
                        ' log_eqsl_qsl_sent, log_lotw_qsl_sent, log_dqsl_qsl_sent, log_qsl_rcvd, '+
                        ' log_eqsl_qsl_rcvd, log_lotw_qsl_rcvd, log_dqsl_qsl_rcvd, log_name, log_dxcc,log_qth, log_pfx, log_state, log_cnty, log_gridsquare, '+
                        ' log_iota, log_cqz, log_ituz, log_mode, log_custom_stat1, log_custom_stat2, log_custom_stat3, log_custom_stat4, log_qso_date '+
                        ' FROM LOG_'+IntToStr(StationId)+')l WHERE l.'+DataField+'='+sAwardDataFieldValue+' AND l.'+DataField+'=:DataVal AND ad.award_id='+IntToStr(AwardId)+sDxcc+
                        ' AND l.log_qso_date Between ad.award_data_start_date and award_data_end_date ';
  end
  else
  begin
   qryTmp:=TKadaoTable.Create(nil);
   try
   qryTmp.Database:=lDatabase;
   qryTmp.SQL.Text := 'SELECT STATION_ID FROM STATIONS WHERE IS_GROUP=0 AND STATION_PARENT_ID='+IntToStr(StationParentId);
   qryTmp.Open;
   while not qryTmp.Eof do
    begin
    if sSelectTableAwards='' then
    sSelectTableAwards:='SELECT  *  FROM  awards_data  ad, (SELECT log_id, log_qso_datetime, log_band_mhz, log_mode, log_qsl_sent, '+
                        ' log_eqsl_qsl_sent, log_lotw_qsl_sent, log_dqsl_qsl_sent, log_qsl_rcvd, '+
                        ' log_eqsl_qsl_rcvd, log_lotw_qsl_rcvd, log_dqsl_qsl_rcvd, log_name, log_dxcc,log_qth, log_pfx, log_state, log_cnty, log_gridsquare, '+
                        ' log_iota, log_cqz, log_ituz, log_mode, log_custom_stat1, log_custom_stat2, log_custom_stat3, log_custom_stat4, log_qso_date '+
                        ' FROM LOG_'+qryTmp.FieldByName('STATION_ID').AsString+')l WHERE l.'+DataField+'='+sAwardDataFieldValue+' AND l.'+DataField+'=:DataVal AND ad.award_id='+IntToStr(AwardId)+sDxcc+
                        ' AND l.log_qso_date Between ad.award_data_start_date and award_data_end_date '
    else
    sSelectTableAwards:=sSelectTableAwards+' UNION ALL SELECT  *  FROM  awards_data  ad, (SELECT log_id, log_qso_datetime, log_band_mhz, log_mode, log_qsl_sent, '+
                        ' log_eqsl_qsl_sent, log_lotw_qsl_sent, log_dqsl_qsl_sent, log_qsl_rcvd, '+
                        ' log_eqsl_qsl_rcvd, log_lotw_qsl_rcvd, log_dqsl_qsl_rcvd, log_name, log_dxcc,log_qth, log_pfx, log_state, log_cnty, log_gridsquare, '+
                        ' log_iota, log_cqz, log_ituz, log_mode, log_custom_stat1, log_custom_stat2, log_custom_stat3, log_custom_stat4, log_qso_date '+
                        ' FROM LOG_'+qryTmp.FieldByName('STATION_ID').AsString+')l WHERE l.'+DataField+'='+sAwardDataFieldValue+' AND l.'+DataField+'=:DataVal AND ad.award_id='+IntToStr(AwardId)+sDxcc+
                        ' AND l.log_qso_date Between ad.award_data_start_date and award_data_end_date ';

    qryTmp.Next;

    end;

   finally
    qryTmp.Free;
   end;
  end;
  qryData.SQL.Text :='TRANSFORM Count(*)&'';''&Sum(IIf(' + sQSLsent + ',1,0))&'';''&Sum(IIf(' + sQSLRcvd + ',1,0)) '+
  ' SELECT log_mode,award_data_field_value, award_data_field_description, count(log_id) as worked_total  FROM ( '+sSelectTableAwards+')'+
  ' l GROUP BY award_data_field_value, award_data_field_description,log_mode  PIVOT (log_band_mhz) IN('+sBandList+')';
//  qryData.SQL.SaveToFile('D:\3.sql');
end;

procedure TStatisticPanel.ListenerDataChange(Sender: TObject;  Field: TField);
begin
  if Assigned(Field) then
   if (Field.FieldName=DataField) and (Field.asString<>'') and bNeedRenew and (Field.FieldName<>'LOG_CALL') and (Field.FieldName<>'LOG_DXCC') then
    begin
{       qryData.Close;
       if Field.DataType=ftString then
         qryData.Params.ParamByName('DataVal').AsString:=QuotedStr(Field.asString);
       if (Field.DataType=ftInteger) or (Field.DataType=ftSmallInt) then
         qryData.Params.ParamByName('DataVal').AsInteger:=Field.asInteger;
       qryData.Open;}
       Refresh();
    end;
end;

procedure TStatisticPanel.OptimizeWidth;
var i:integer;
begin
  for i:=0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].OptimizeWidth;
end;

procedure TStatisticPanel.GetText(Sender: TField; var Text: string; DisplayText: boolean);
var
sStr,sWorked,sSended:string;
begin
Text:='';
//TField(Sender).AsString;
(* if (TField(Sender).AsString=';;') or (TField(Sender).AsString='') then
    Text := ''
 else
  begin
    sStr:=TField(Sender).AsString;
    sWorked:=Copy2SymbDel(sStr,';');
    Delete(sStr,1,1);
    sSended:=Copy2SymbDel(sStr,';');
    Delete(sStr,1,1);
    if (sWorked<>'0') and  (sSended='0') and  (sStr='0') then
      Text:='0';
    if (sWorked<>'0') and  (sSended<>'0') and  (sStr='0') then
      Text:='1';
    if (sWorked<>'0') {and  (sSended<>'0')} and  (sStr<>'0') then
      Text:='2';
    if (sWorked='0') and  (sSended='0') and  (sStr='0') then
      Text:='';
  end;
  *)
end;

procedure TStatisticPanel.Refresh();
var
 Field:TField;
 oldGridHeight,newGridHeight:Integer;
begin
   Field:=ldsLogEdit.DataSet.FieldByName(DataField);
   if FOldParam=Field.asString then exit;

   oldGridHeight:=Grid.Height;
   FOldParam:=Field.asString;
   qryData.Close;
//   qryData.SQL.SaveToFile('d:\1.sql');
   if (Field.FieldName='LOG_DXCC') and (Field.AsString='-1') then exit;
   if Field.DataType=ftString then
     qryData.Params.ParamByName('DataVal').AsString:=QuotedStr(Field.asString);
   if (Field.DataType=ftInteger) or (Field.DataType=ftSmallInt) then
     qryData.Params.ParamByName('DataVal').AsInteger:=Field.asInteger;
    qryData.Open;
    Grid.Columns[0].Title.Caption:=Field.asString;
    if Field.asString<>'' then
      Grid.Columns[0].OptimizeWidth
    else
      Grid.Columns[0].Width:=32;
    newGridHeight:=(qryData.RecordCount+1)*(TDBGridEhCrack(Grid).RowHeights[0]+1)+4;
    if newGridHeight>oldGridHeight then
       Height:=Height+(newGridHeight-oldGridHeight)
    else
    if newGridHeight<oldGridHeight then
       Height:=(Height-(oldGridHeight-newGridHeight));



    Grid.Height:=newGridHeight;
{    if Height<(qryData.RecordCount+1)*TDBGridEhCrack(Grid).RowHeights[0]+50 then
       Height:=(qryData.RecordCount+1)*TDBGridEhCrack(Grid).RowHeights[0]+50;}
end;

procedure TStatisticPanel.Clear();
begin
  qryData.Close;
  Grid.Columns[0].Title.Caption:='';
  Grid.Columns[0].Width:=32;
  Height:=Height-(Height-(2*TDBGridEhCrack(Grid).RowHeights[0]+1))+4;
  FOldParam:='';
  Grid.Columns[0].Title.Caption:='';
end;

procedure TStatisticPanel.GridDblClick(Sender: TObject);
var
  lParam, wParam: variant;
  sFilter,sFilterFields: String;
  i:integer;
  P: TPoint;
  T: TGridCoord;

begin
  if ldsLogEdit.DataSet.State in [dsEdit] then exit;
  GetCursorPos(P);
  P := Grid.ScreenToClient(P);
  T := Grid.MouseCoord(P.X, P.Y);

  sFilter := DataField + '=' + qryData.Params.ParamByName('DataVal').AsString;

  if (T.X ) > 0 then
   sFilter := sFilter +#10#13+'LOG_BAND_MHZ=' +Grid.Columns[T.X ].Title.Caption;
  sFilter := sFilter +#10#13+'LOG_MODE='+Grid.DataSource.DataSet.FieldByName('LOG_MODE').AsString;

  lParam := sFilter+sFilterFields;
  lDllCommand(DC_SET_LOG_FILTER, Self, lParam, wParam);
end;



procedure TWindowStatisticForCallForm.OptionsChanged;
var
 qryAwards:TKaDaoTable;
 Delimeter:string;

begin
  Delimeter:=GetDelimeter;
//DataSource1.DataSet:=ldsLogEdit.DataSet;
 slBands.Clear;
 qryBands.Close;
 qryBands.Open;
 while not qryBands.Eof do
 begin
    slBands.Add(StringReplace(FloatToStr(SimpleRoundTo(qryBands.FieldByName('BAND_MHZ').asFloat,-2)),Delimeter, '.',  [rfReplaceAll, rfIgnoreCase]));
    qryBands.Next;
 end;
 qryBands.Close;


if Assigned(MainPanel) then
 FreeAndNil(MainPanel);
 MainPanel:=TPanel.Create(Self);
 MainPanel.Parent:=Self;
 MainPanel.Align:=alClient;


 qryAwards:=TKaDaoTable.Create(nil);
 try
 qryAwards.Database:=lDatabase;
 qryAwards.SQL.Text:='SELECT * FROM AWARDS WHERE AWARD_ACTIVE=1 AND AWARD_QUICK_STATS=1';
 qryAwards.Open;
 while not qryAwards.Eof do
  begin
  if ldsLogEdit.DataSet.FindField(qryAwards.FieldByName('AWARD_DATA_FIELD').asString)=nil  then
   begin
      MessageBox(Application.Handle, PWideChar('Data field for award '+qryAwards.FieldByName('AWARD_NAME').AsString+' must be correct.'), PWideChar('Error'), MB_OK or MB_ICONERROR);
     continue;
   end;

   StatisticPanel:=TStatisticPanel.Create(MainPanel);
   StatisticPanel.Parent:=Self;
   StatisticPanel.qryData.Database:=lDatabase;
   if qryAwards.FieldByName('AWARD_STATS_FOR_ALL').asInteger=1 then
      StatisticPanel.Caption:=qryAwards.FieldByName('AWARD_NAME').AsString+' ['+Copy(qryAwards.FieldByName('AWARD_DATA_FIELD').asString,5,Length(qryAwards.FieldByName('AWARD_DATA_FIELD').asString)-4)+']'+' [*]'
   else
      StatisticPanel.Caption:=qryAwards.FieldByName('AWARD_NAME').AsString+' ['+Copy(qryAwards.FieldByName('AWARD_DATA_FIELD').asString,5,Length(qryAwards.FieldByName('AWARD_DATA_FIELD').asString)-4)+']';

   StatisticPanel.AwardId:=qryAwards.FieldByName('AWARD_ID').AsInteger;
   if qryAwards.FieldByName('AWARD_QSL').asInteger=1 then
      StatisticPanel.slQSLType.Add('QSL');
   if qryAwards.FieldByName('AWARD_EQSL').asInteger=1 then
      StatisticPanel.slQSLType.Add('EQSL');
   if qryAwards.FieldByName('AWARD_LOTW').asInteger=1 then
      StatisticPanel.slQSLType.Add('LOTW');
   if qryAwards.FieldByName('AWARD_DQSL').asInteger=1 then
      StatisticPanel.slQSLType.Add('DQSL');
   StatisticPanel.bForAll:=qryAwards.FieldByName('AWARD_STATS_FOR_ALL').asInteger=1;
   StatisticPanel.StationId:=StationId;
   StatisticPanel.StationParentId:=StationParentId;
   StatisticPanel.DataField:=qryAwards.FieldByName('AWARD_DATA_FIELD').asString;
   StatisticPanel.FilterDxcc:=qryAwards.FieldByName('AWARD_FILTER_DXCC').asString;
   StatisticPanel.dsListener.DataSet:=ldsLogEdit.DataSet;
   StatisticPanel.BuildQuery;
   StatisticPanel.OptimizeWidth;
   StatisticPanel.Grid.OnGetCellParams:=GridGetCellParams;
   StatisticPanel.Clear;
   qryAwards.Next;
  end;
 finally
  FreeAndNil(qryAwards);
 end;
  InitGridColors;
end;

procedure TWindowStatisticForCallForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if Field.FieldName='LOG_CNTY' then
  begin
   // ShowMessage(Field.AsString);
  end;
end;

procedure TWindowStatisticForCallForm.DeInit;
var
 i:integer;
begin
if Assigned(MainPanel) then
 FreeAndNil(MainPanel);
end;

procedure TWindowStatisticForCallForm.CallInfo;
var
 i:integer;
begin
 //FOldCall:=Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString);
 if not Assigned(MainPanel) then exit;
 bNeedRenew:=True;

 for i:=0 to MainPanel.ComponentCount-1 do
  if MainPanel.Components[i] is TStatisticPanel then
       TStatisticPanel(MainPanel.Components[i]).Refresh();
{   if ldsLogEdit.DataSet.FieldByName(TStatisticPanel(MainPanel.Components[i]).DataField).AsString<>'' then
     begin
       TStatisticPanel(MainPanel.Components[i]).qryData.Close;
       TStatisticPanel(MainPanel.Components[i]).qryData.Params.ParamByName('DataVal').AsString:=ldsLogEdit.DataSet.FieldByName(TStatisticPanel(MainPanel.Components[i]).DataField).AsString;
       TStatisticPanel(MainPanel.Components[i]).qryData.Open;
     end;}
end;


procedure TWindowStatisticForCallForm.NewQSO;
var
 i:integer;
begin
 if not Assigned(MainPanel) then exit;
 bNeedRenew:=False;
 for i:=0 to MainPanel.ComponentCount-1 do
  if MainPanel.Components[i] is TStatisticPanel then
   TStatisticPanel(MainPanel.Components[i]).Clear;
end;


procedure TWindowStatisticForCallForm.CallChanged;
var
 i:integer;
begin
 if not Assigned(MainPanel) or not bNeedRenew then exit;
 bNeedRenew:=False;
 if Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').asString)='' then
 begin
 for i:=0 to MainPanel.ComponentCount-1 do
  if MainPanel.Components[i] is TStatisticPanel then
   TStatisticPanel(MainPanel.Components[i]).Clear;
 end;

end;

procedure TWindowStatisticForCallForm.InitGridColors;
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
//    dbgAwards.Repaint;
  finally
    slColors.Free;
    slColorLine.Free;
  end;
end;


procedure TWindowStatisticForCallForm.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
    var Background: TColor; State: TGridDrawState);
var
  sStr, sWorked, sSended, sConfirmed: string;
begin

  if (csDestroying in TDBGridEh(Sender).ComponentState) or not Assigned(GridColorList) or (Column.Index=0) then
    exit;

{  if TDBGridEh(Sender).DataSource.DataSet.FieldByName('WORKED_TOTAL').AsString = '0' then
  begin
      if GridColorList.Count>0 then
      begin
      Background := TGridColor(GridColorList.Items[0]).ColorBackground;
      AFont.Color := TGridColor(GridColorList.Items[0]).ColorForeground;
      end;
  end;}
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




end.
