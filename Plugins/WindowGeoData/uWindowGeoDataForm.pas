unit uWindowGeoDataForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExMask, JvToolEdit, JvBaseEdits, JvDBControls, StdCtrls, Mask,
  DBCtrls, DB,   JvExControls, JvDBLookup,
  ComCtrls, JvExComCtrls, JvStatusBar, ExtCtrls, pngimage,uPluginHeaders, uUtils,
  KDaoTable, uWindowPluginForm;

type
  TWindowGeoDataForm = class(TWindowPluginForm)
    ScrollBox1: TScrollBox;
    lbLatitude: TLabel;
    lbLongitude: TLabel;
    lbTerritory: TLabel;
    lbContinent: TLabel;
    lbLocator: TLabel;
    lbPrefix: TLabel;
    lbDxccId: TLabel;
    dbeLocator: TDBEdit;
    dbceLatitude: TJvDBCalcEdit;
    dbceLongitude: TJvDBCalcEdit;
    dbePrefix: TDBEdit;
    dbceDxccId: TJvDBCalcEdit;
    dsContinents: TDataSource;
    dsTerritory: TDataSource;
    dblContinents: TJvDBLookupCombo;
    dblTerritory: TJvDBLookupCombo;
    Panel1: TPanel;
    imgTime: TImage;
    lbsTime: TLabel;
    Image1: TImage;
    lbDistance: TLabel;
    lbBearing: TLabel;
    qryContinents: TKADaoTable;
    qryTerritory: TKADaoTable;
    procedure dblContinentsClick(Sender: TObject);
    procedure dbeLocatorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeLocatorKeyPress(Sender: TObject; var Key: Char);
    procedure ChangeLocator;
    procedure RecalcDistanceBearing;
    procedure dbeLocatorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbceLatitudeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbceLongitudeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryContinentsAfterScroll(DataSet: TDataSet);
    procedure dsContinentsDataChange(Sender: TObject; Field: TField);
    procedure dsTerritoryDataChange(Sender: TObject; Field: TField);
  private
   vKey:char;
  public
   procedure CallChanged(vCallInfo:variant);
  end;

var
  WindowGeoDataForm: TWindowGeoDataForm;

implementation
uses uWindowGeoData;

{$R *.dfm}

procedure TWindowGeoDataForm.CallChanged(vCallInfo:variant);
var
 pCall:PCallInfo;
 Distance,Bearing:Double;
begin

pCall:=TVarData(vCallInfo).VPointer;
Distance:=0;
Bearing:=0;
if (pCall<>nil) and bAutoGetCallPrimaryData and not bCallMistake then
 begin
  ldsLogEdit.DataSet.FieldByName('LOG_LAT').AsString := FloatToStr(pCall.PrefixData.Location.Y / 180);
  ldsLogEdit.DataSet.FieldByName('LOG_LON').AsString := FloatToStr(pCall.PrefixData.Location.X / 180);
  getBearing(ldsLogEdit.DataSet.FieldByName('LOG_MY_LAT').AsFloat,ldsLogEdit.DataSet.FieldByName('LOG_MY_LON').AsFloat,
             pCall.PrefixData.Location.Y / 180, pCall.PrefixData.Location.X / 180,Distance,Bearing);
  ldsLogEdit.DataSet.FieldByName('LOG_GRIDSQUARE').asString := CoordinateToGrid(pCall.PrefixData.Location.Y / 180,pCall.PrefixData.Location.X / 180)
 end;
 lbDistance.Caption:=FormatFloat('0.00',Distance/1000)+'km';
 lbBearing.Caption:=FormatFloat('0.00',Bearing)+'�';
end;



procedure TWindowGeoDataForm.dbceLatitudeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 RecalcDistanceBearing;
end;

procedure TWindowGeoDataForm.dbceLongitudeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 RecalcDistanceBearing;
end;

procedure TWindowGeoDataForm.dbeLocatorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 vKey:=CallKeyCodeToChar(Key);
end;

procedure TWindowGeoDataForm.dbeLocatorKeyPress(Sender: TObject; var Key: Char);
begin
 if (vKey='') and (Key<>#8) and (Key<>#32) then
  begin
   Key:=#0;
   exit;
  end;
  if (Ord(vKey) >= 97) and (Ord(vKey) <= 122) then
    Key := Chr(Ord(vKey) - 32);
 if (Key<>#8) and (Key<>#32) then
   Key:=vKey;
end;

procedure TWindowGeoDataForm.dbeLocatorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
ChangeLocator;
RecalcDistanceBearing;
end;

procedure TWindowGeoDataForm.dblContinentsClick(Sender: TObject);
begin
 qryTerritory.First;
 dblTerritory.KeyValue:='-1';
end;

procedure TWindowGeoDataForm.dsContinentsDataChange(Sender: TObject;
  Field: TField);
begin
 if  ldsLogEdit.DataSet.State in [dsInsert,dsEdit] then
  ldsLogEdit.DataSet.FieldByName('LOG_CONTINENT').AsString:=qryContinents.FieldByName('CONTINENT_NAME').AsString;
end;

procedure TWindowGeoDataForm.dsTerritoryDataChange(Sender: TObject;
  Field: TField);
begin
 if  ldsLogEdit.DataSet.State in [dsInsert,dsEdit] then
  ldsLogEdit.DataSet.FieldByName('LOG_COUNTRY').AsString:=qryTerritory.FieldByName('TERRITORY_NAME').AsString;
end;

procedure TWindowGeoDataForm.qryContinentsAfterScroll(DataSet: TDataSet);
begin
     qryTerritory.Close;
     qryTerritory.Params.ParamByName('continent_id').Value:=qryContinents.FieldByName('CONTINENT_ID').AsInteger;
     qryTerritory.Open;
end;

procedure TWindowGeoDataForm.ChangeLocator;
var
 c:TCoordinate;
begin
  if dbeLocator.Text<>'' then
   begin
     c:=GridToCoordinate(dbeLocator.Text);
     ldsLogEdit.DataSet.FieldByName('LOG_LAT').AsFloat:=c.Lat;
     ldsLogEdit.DataSet.FieldByName('LOG_LON').AsFloat:=c.Lon;
   end
   else
   begin
     ldsLogEdit.DataSet.FieldByName('LOG_LAT').AsFloat:=0;
     ldsLogEdit.DataSet.FieldByName('LOG_LON').AsFloat:=0;
   end;
end;

procedure TWindowGeoDataForm.RecalcDistanceBearing;
var
 Distance,Bearing:Double;
begin
 Distance:=0;
 Bearing:=0;
 getBearing(ldsLogEdit.DataSet.FieldByName('LOG_MY_LAT').AsFloat,ldsLogEdit.DataSet.FieldByName('LOG_MY_LON').AsFloat,
             dbceLatitude.Value, dbceLongitude.Value,Distance,Bearing);
 lbDistance.Caption:=FormatFloat('0.00',Distance/1000)+'km';
 lbBearing.Caption:=FormatFloat('0.00',Bearing)+'�';
end;



end.
