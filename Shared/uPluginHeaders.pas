unit uPluginHeaders;

interface
uses  ExtCtrls, JPEG, Classes, CallParser,PrefLst,Forms, Controls, Db,ActnList,
JvAppIniStorage,KDaoDataBase, Graphics,Contnrs,uUtils,SysUtils;

const
  CC_WINDOW_SHOW=100000;
  CC_WINDOW_HIDE=100001;
  CC_MODE_CHANGED=100002;
  CC_BAND_CHANGED=100003;
  CC_STATION_CHANGED=100004;
  CC_CALL_CHANGED=100005;
  CC_LOG_EXIT=100006;
  CC_GET_SELECTED_RECORDS=100007;
  CC_SHOW_NEW_EQSL=100008;
  CC_OPTIONS_CHANGED=100009;
  CC_LOADED=100010;
  CC_SET_RADIO_TO_SPOT=100011;
  CC_CHANGE_BOOK_LIST=100012;
  CC_GOTO_RECORD_BY_ID=100013;
  CC_SENT_CW=100014;
  CC_CLUSTER_WWW_CHANGED=100015;
  CC_CLUSTER_TELNET_CHANGED=100016;
  CC_CLUSTER_WWW_CLEAR=100017;
  CC_CLUSTER_TELNET_CLEAR=100018;
  CC_CLUSTER_WWW_LOADED=100019;
  CC_CLUSTER_TELNET_LOADED=100020;
  CC_CALLDESCRIPTION_LOADED=100021;
  CC_SET_LOG_FILTER=100022;
  CC_CLIPBOARD_CHANGE=100023;

  CA_NEW_QSO=0;
  CA_EDIT_QSO=1;
  CA_DELETE_QSO=2;
  CA_SAVE_QSO=3;
  CA_CANCEL_QSO=4;
  CA_REFRESH_LOG=5;      //lParam 1=RefreshAll, 2-Refresh one row wParam - Log_ID
  CA_CALL_INFO=7;
  CA_OPTIONS=8;
  CA_IMPORT_FROM_ADIF=9;
  CA_EXPORT_TO_ADIF=10;

  CA_EQSL_UPLOAD_SELECTED=11;
  CA_EQSL_UPLOAD_UNEXPORTED=12;
  CA_EQSL_UPLOAD_CHECK=13;
  CA_EQSL_DOWNLOAD=14;
  CA_EQSL_UPLOAD_DOWNLOAD=15;

  CA_QSL_SENT=16;
  CA_QSL_IGNORE=17;
  CA_CALL_MISTAKE=18;
  CA_DATABASE_COMPACT_AND_RESTORE=19;
  CA_DATABASE_MAKE_BACKUP=20;
  CA_DATABASE_RESTORE_BACKUP=21;
  CA_PROFILE_SAVE=22;
  CA_PROFILE_SAVE_AS=23;
  CA_PROFILE_SET_DEFAULT=24;
  CA_EXIT=26;
  CA_GROUP_FIELD_VALUE_REPLACE=28;
  CA_REDEFINE_GEO_DATA=29;
  CA_RECORD_REMOVE=30;
  CA_UPDATE_FLASH=31;
  CA_PRINT_QSL_QUEUE=32;
  CA_PRINT_QSL_QUEUE_ADD_QSQ=33;
  CA_PRINT_QUEUE_CLEAR=34;
  CA_PRINT_QUEUE_SETTINGS=35;
  CA_REPORT_DESIGN=36;
  CA_DQSL_UPLOAD_SELECTED=37;
  CA_DQSL_UPLOAD_UNEXPORTED=38;
  CA_DQSL_DOWNLOAD=39;
  CA_DQSL_UPLOAD_DOWNLOAD=40;
  CA_DQSL_MANUAL_CONFIRM=41;
  CA_QSL_SERVICES_EXCHANGE=42;
  CA_QSL_RCVD=43;
  CA_REDEFINE_MY_DATA=44;
  CA_LOTW_UPLOAD_SELECTED=47;
  CA_LOTW_UPLOAD_UNEXPORTED=48;
  CA_LOTW_DOWNLOAD=49;
  CA_LOTW_UPLOAD_DOWNLOAD=50;
  CA_HRDLOG_UPLOAD_SELECTED=51;
  CA_QSL_QUEUE=53;
  CA_OPEN_QRZCOM=56;
  CA_II_QRZCOM=57;
  CA_II_HAMQTH=58;



  DC_TRANSLATE_WINDOW=-1;
  DC_DELETE_QSO=-2;
  DC_REFRESH_LOG=-3;
  DC_BAND_CHANGED=-4;
  DC_MODE_CHANGED=-5;
  DC_EDIT_QSO=-6;
  DC_CALL_CHANGED=-7;
  DC_SELECT_RECORDS=-8;
  DC_SAVE_QSO=-9;
  DC_SET_CALL=-10;
  DC_GET_SELECTED_RECORDS=-11;
  DC_SET_RADIO_TO_SPOT=-12;
  DC_GOTO_RECORD_BY_ID=-13;
  DC_CALL_INFO=-14;
  DC_GET_CALL_DXCC_ID=-15;
  DC_CANCEL_QSO=-16;
  DC_SENT_CW=-17;
  DC_CLUSTER_WWW_CHANGED=-18;
  DC_CLUSTER_TELNET_CHANGED=-19;
  DC_CLUSTER_WWW_CLEAR=-20;
  DC_CLUSTER_TELNET_CLEAR=-21;
  DC_CLUSTER_WWW_LOADED=-22;
  DC_CLUSTER_TELNET_LOADED=-23;
  DC_CALL_ADDITION_INFO=-24;
  DC_SET_LOG_FILTER=-25;
  DC_RADIO_TX=-26;
  DC_RADIO_RX=-27;
  DC_GET_TRANSLATE_FILE=-28;

type

  TCallDesc = class
  public
    MappingList: TStringList;
    CallList: TStringList;
    FileName: string;
    constructor Create;
    destructor Destroy;
  end;

  TCallDescList = class(TObjectList)
  public
    procedure ReLoadFiles(Path: string);
    procedure LoadFiles(Path: string);
    function FindCall(Call: String; var ValueStr: string): boolean; overload;
    function FindCall(Call: String; var MappingList: TStringList; var ValueList: TStringList; var ValueStr: string): boolean; overload;
  end;


type
  PCallInfo=^TCallInfo;
  TCallInfo=record
    PrefixData:TPrefixData;
    ManagersList:array of string;
  end;

{  TCallInfo=class
    public
      PrefixData:TPrefixData;
      ManagersList:TStringList;
      constructor Create; override;
      destructor Destroy; override;
  end;}

  TDeInitialize = function ():integer; stdcall;
  TCoreCommand = function(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
  TDllCommand = function (IdCommand:integer;Sender:TObject; var lParam, wParam:variant):integer; stdcall;
  TCoreGetData = function(IdCommand:integer; var lParam, wParam:variant):integer; stdcall;
  TInitialize = function (App : TApplication;
                          Scr : TScreen;
                          ActionList:TActionList;
                          AppStorage:TJvAppIniFileStorage;
                          ImageList:TImageList;
                          DllCommand:pointer;
                          Database:TKADaoDatabase;
                          dsLogEdit:TDataSource;
                          dsLog:TDataSource;
                          IMSName:string;
                          var PluginForm:TForm;
                          var SettingsFrame:TFrame
                          ) : integer; stdcall;



implementation





constructor TCallDesc.Create;
begin
  MappingList := TStringList.Create;
  MappingList.Delimiter := ';';
  CallList := TStringList.Create;
end;

destructor TCallDesc.Destroy;
begin
  MappingList.Free;
  CallList.Free;
end;


procedure TCallDescList.ReLoadFiles(Path: string);
var
  sFileList: TStringList;
  sFile: TStringList;
  i: integer;
  CallDesc: TCallDesc;
begin
  sFileList := TStringList.Create;
  try
    Clear;
    FindFilesByMask(sFileList, Path, '*.*', true);
    for i := 0 to sFileList.Count - 1 do
    begin
      try
        sFile := TStringList.Create;
        sFile.LoadFromFile(sFileList.Strings[i]);
        if sFile.Count > 0 then
        begin
          CallDesc := TCallDesc.Create;
          CallDesc.FileName:=ExtractFileName(sFileList.Strings[i]);
          if Pos('LOG_', sFile.Strings[0]) > 0 then
          begin
            CallDesc.MappingList.DelimitedText := sFile.Strings[0];
            sFile.Delete(0);
          end;
          CallDesc.CallList.Assign(sFile);
          Add(CallDesc);
        end;
      finally
        sFile.Free;
      end;
    end;
  finally
    sFileList.Free;
  end;
end;


procedure TCallDescList.LoadFiles(Path: string);
var
  sFileList: TStringList;
  sFile: TStringList;
  i: integer;
  CallDesc: TCallDesc;
begin
  sFileList := TStringList.Create;
  try
    FindFilesByMask(sFileList, Path, '*.*', true);
    for i := 0 to sFileList.Count - 1 do
    begin
      try
        sFile := TStringList.Create;
        sFile.LoadFromFile(sFileList.Strings[i]);
        if sFile.Count > 0 then
        begin
          CallDesc := TCallDesc.Create;
          CallDesc.FileName:=sFileList.Strings[i];
          if Pos('LOG_', sFile.Strings[0]) > 0 then
          begin
            CallDesc.MappingList.DelimitedText := sFile.Strings[0];
            sFile.Delete(0);
          end;
          CallDesc.CallList.Assign(sFile);
          Add(CallDesc);
        end;
      finally
        sFile.Free;
      end;
    end;
  finally
    sFileList.Free;
  end;
end;

function TCallDescList.FindCall(Call: String; var ValueStr: string): boolean;
var
  i, j: integer;
  CallDesc: TCallDesc;
begin
  for i := 0 to Count - 1 do
  begin
    CallDesc := TCallDesc(Items[i]);
    for j := 0 to CallDesc.CallList.Count - 1 do
      if UpperCase(CallDesc.CallList.Names[j]) = Call then
      begin
        if ValueStr = '' then
          ValueStr := Trim(Copy(CallDesc.CallList.Strings[j], Pos('=', CallDesc.CallList.Strings[j]) + 1, Length(CallDesc.CallList.Strings[j])))
        else
          ValueStr := ValueStr + #13#10 + Trim(Copy(CallDesc.CallList.Strings[j], Pos('=', CallDesc.CallList.Strings[j]) + 1, Length(CallDesc.CallList.Strings[j])));
        result := true;
      end;
  end;
end;

function TCallDescList.FindCall(Call: String; var MappingList: TStringList; var ValueList: TStringList; var ValueStr: string): boolean;
var
  i, j: integer;
  CallDesc: TCallDesc;
begin
  for i := 0 to Count - 1 do
  begin
    CallDesc := TCallDesc(Items[i]);
    for j := 0 to CallDesc.CallList.Count - 1 do
      if UpperCase(CallDesc.CallList.Names[j]) = Call then
      begin
        if CallDesc.MappingList.Count > 0 then
        begin
          MappingList := CallDesc.MappingList;
          ValueList.DelimitedText := CallDesc.CallList.Values[CallDesc.CallList.Names[j]];
        end
        else
        begin
          if ValueStr = '' then
            ValueStr := Trim(Copy(CallDesc.CallList.Strings[j], Pos('=', CallDesc.CallList.Strings[j]) + 1, Length(CallDesc.CallList.Strings[j])))
          else
            ValueStr := ValueStr + #13#10 + Trim(Copy(CallDesc.CallList.Strings[j], Pos('=', CallDesc.CallList.Strings[j]) + 1, Length(CallDesc.CallList.Strings[j])));
        end;
        result := true;
      end;
  end;
end;



end.
