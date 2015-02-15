unit uUtils;

interface

uses Forms,Windows, WinInet, Classes, JvImage, SysUtils, Math, DB, Variants, Graphics, DateUtils, StrUtils;

const
  ychr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  ynum = '0123456789';

type
  TCoordinate = record
    Lat: real;
    Lon: real;
  end;

procedure SentInetUrl(const FileURL: String);
function GetInetFile(const FileURL: String; Stream: TMemoryStream): boolean;
procedure GetJpeg(aImage: TJvImage; Url: String);
function getAppVersion: string;
function CoordinateToGrid(Lat, Lon: real): string;
function GridToCoordinate(Loc: string): TCoordinate;
function DateToAdif(val: TDateTime): string;
function GetTempDir: String;
function GetAdifRow(lDataSet: TDataset; beQSL: boolean): string;
function GetUrlContent(const Url: string): string;
function UrlEncode(const S: string; NeedUTF8: boolean = false): string;
function CallKeyCodeToChar(Key: word): char;
procedure getBearing(StartLat, StartLong, EndLat, EndLong: double; var Distance: double; var Bearing: double);
procedure CheckDir(DirName: string);
function IsInternetConnected: boolean;
function GetDelimeter: string;
function GetDllFileName: string;
function ConvertToURL(FileName: string): string;
Procedure CopyFile(InFileName, OutFileName: String);
function ColorToHex(Color: TColor): string;
function HexToColor(sColor: string): TColor;
function GetUrlInfo(const dwInfoLevel: DWORD; const FileURL: string): string;
function GetFileTime(Url: string): TDateTime;
function SetFileDate(Const FileName: String; Const FileDate: TDateTime): boolean;
function StrToInt2(const S: string): Integer;
procedure FindFilesByMask(List: tStrings; const DirName, Mask: String; SubDir: boolean = false);
function GetOriginalCall(Call: string): string;
function Capitalize(Text: string): string;
function DosToWin(ASource: AnsiString): AnsiString;
function UpperCase2(S: string): string;
function LowerCase2(S: string): string;
function ExtractFileNameWithoutExt(const FileName: string): string;
function RunAppHidden(my_app: string; my_wait: bool): bool;
function GetUrlSize(const Url: string): Integer;
function GetAbsolutePathFromOptions(Path:string):string;
function StreamToString(aStream: TStream): string;
function FileLastModified(const TheFile: string): TDateTime;
function IntToFontStyle(i: integer): TFontStyles;
function FontStyleToInt(s: TFontStyles): integer;


var
  sTMP: string;

implementation

function DateToAdif(val: TDateTime): string;
begin
  result := FormatDateTime('yyyymmdd', val);
end;

function GetTempDir: String;
var
  tempFolder: array [0 .. MAX_PATH] of char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function getAppVersion: string;
const
  NOVIDATA = '';

var
  dwInfoSize, // Size of VERSIONINFO structure
  dwVerSize, // Size of Version Info Data
  dwWnd: DWORD; // Handle for the size call.
  FI: PVSFixedFileInfo; // Delphi structure; see WINDOWS.PAS
  ptrVerBuf: Pointer; // pointer to a version buffer
  strFileName, // Name of the file to check
  strVersion: string; // Holds parsed version number
begin

  strFileName := paramStr(0);
  dwInfoSize := getFileVersionInfoSize(pChar(strFileName), dwWnd);

  if (dwInfoSize = 0) then
    result := NOVIDATA
  else
  begin

    getMem(ptrVerBuf, dwInfoSize);
    try

      if getFileVersionInfo(pChar(strFileName), dwWnd, dwInfoSize, ptrVerBuf) then

        if verQueryValue(ptrVerBuf, '\', Pointer(FI), dwVerSize) then

          strVersion := format('%d.%d.%d.%d', [hiWord(FI.dwFileVersionMS), loWord(FI.dwFileVersionMS), hiWord(FI.dwFileVersionLS), loWord(FI.dwFileVersionLS)]);

    finally
      freeMem(ptrVerBuf);
    end;
  end;
  result := strVersion;
end;

procedure SentInetUrl(const FileURL: String);
const
  BufferSize = 1024;
var
  hSession, hURL: HInternet;
  sAppName: string;
begin
  sAppName := 'LogBook';
  hSession := InternetOpen(pChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hURL := InternetOpenURL(hSession, pChar(FileURL), nil, 0, INTERNET_FLAG_NO_CACHE_WRITE, 0);
  finally
    InternetCloseHandle(hSession)
  end;
end;

function GetInetFile(const FileURL: String; Stream: TMemoryStream): boolean;
const
  BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array [1 .. BufferSize] of Byte;
  BufferLen: DWORD;
  sAppName: string;
begin
  sAppName := 'LogBook';
  hSession := InternetOpen(pChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hURL := InternetOpenURL(hSession, pChar(FileURL), nil, 0, INTERNET_FLAG_NO_CACHE_WRITE, 0);
    if hURL <> nil then
    begin
      try
        Stream.Clear;
        repeat
          InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
          Stream.Write(Buffer, BufferLen);
        until BufferLen = 0;
        result := True;
      finally
        InternetCloseHandle(hURL)
      end;
    end
    else
      result := false;
  finally
    InternetCloseHandle(hSession)
  end;
end;

procedure GetJpeg(aImage: TJvImage; Url: String);
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  GetInetFile(Url, Stream);
  Stream.Position := 0;
  // Stream.SaveToFile('d:\!\3.3');
  aImage.LoadFromStream(Stream);
  Stream.Free;
end;

function CoordinateToGrid(Lat, Lon: real): string;
var
  ycalc: array [1 .. 3] of real;
  yn: array [1 .. 7] of Integer;
  yi, yk, ydiv, y, ylp: Integer;
  yres: real;
  yqth: string;
begin
  ydiv := 0;
  if (Lat = 0) and (Lon = 0) then
  begin
    result := '';
    Exit;
  end;

  ycalc[1] := Lon + 180;
  ycalc[2] := Lat + 90;
  y := 0;
  for yi := 1 to 2 do
    for yk := 1 to 3 do
    begin
      if yk <> 3 then
      begin
        if yi = 1 then
        begin
          if yk = 1 then
            ydiv := 20;
          if yk = 2 then
            ydiv := 2;
        end;
        if yi = 2 then
        begin
          if yk = 1 then
            ydiv := 10;
          if yk = 2 then
            ydiv := 1;
        end;

        yres := ycalc[yi] / ydiv;
        ycalc[yi] := yres;
        if (ycalc[yi] > 0) then
          ylp := floor(yres)
        else
          ylp := ceil(yres);
        ycalc[yi] := (ycalc[yi] - ylp) * ydiv;
      end
      else
      begin
        if yi = 1 then
          ydiv := 12
        else
          ydiv := 24;
        yres := ycalc[yi] * ydiv;
        ycalc[yi] := yres;
        if ycalc[yi] > 0 then
          ylp := floor(yres)
        else
          ylp := ceil(yres);
      end;

      inc(y);
      yn[y] := ylp;
    end;

  yqth := ychr[yn[1] + 1] + ychr[yn[4] + 1] + ynum[yn[2] + 1] + ynum[yn[5] + 1] + ychr[yn[3] + 1] + ychr[yn[6] + 1];
  result := yqth;
end;

function CoordinateToLocation(FieldName:string;Coordinate:real): string;
var
 lL,lR,sValue:string;
 fC,iPosDelimeter:integer;

begin
 if (Copy(FieldName, 5, Length(FieldName) - 4)='LAT') or (Copy(FieldName, 5, Length(FieldName) - 4)='MY_LAT')  then
  begin
    sValue:=FloatToStr(Coordinate);
    iPosDelimeter:=Pos(GetDelimeter,sValue);
    if iPosDelimeter=0 then
     begin
       lL:=DupeString('0',3-Length(sValue) )+sValue;
       lR:='00.000';
     end
     else
      begin
       lL:=DupeString('0',3-Length(Copy(sValue,1,iPosDelimeter-1)))+Copy(sValue,1,iPosDelimeter-1);
       lR:=Copy(sValue,iPosDelimeter+1,Length(sValue)-iPosDelimeter);
       Insert('.',lR,3);
      end;
    result:='N'+lL+' '+lR;
  end
  else
 if (Copy(FieldName, 5, Length(FieldName) - 4)='LON') or (Copy(FieldName, 5, Length(FieldName) - 4)='MY_LON')  then
  begin
    sValue:=FloatToStr(Coordinate);
    iPosDelimeter:=Pos(GetDelimeter,sValue);
    if iPosDelimeter=0 then
     begin
       lL:=DupeString('0',3-Length(sValue) )+sValue;
       lR:='00.000';
     end
     else
      begin
       lL:=DupeString('0',3-Length(Copy(sValue,1,iPosDelimeter-1)))+Copy(sValue,1,iPosDelimeter-1);
       lR:=Copy(sValue,iPosDelimeter+1,Length(sValue)-iPosDelimeter);
       Insert('.',lR,3);
      end;
    result:='E'+lL+' '+lR;
  end;


end;


function GetAdifRow(lDataSet: TDataset; beQSL: boolean): string;
var
  j: Integer;
  sStr, sTag: String;
  Location:string;
begin
  for j := 0 to lDataSet.FieldCount - 1 do
  begin
    sTMP := lDataSet.Fields[j].FieldName;

    if (lDataSet.Fields[j].FieldName = 'LOG_ID') or (lDataSet.Fields[j].FieldName = 'LOG_WORKPLACE_ID') or (lDataSet.Fields[j].FieldName = 'MODE_ID') or (lDataSet.Fields[j].FieldName = 'MODE_NAME') or (lDataSet.Fields[j].FieldName = 'CONTINENT_ID') or (lDataSet.Fields[j].FieldName = 'TERRITORY_ID') or (lDataSet.Fields[j].FieldName = 'CONTINENT_NAME') or (lDataSet.Fields[j].FieldName = 'TERRITORY_NAME') or (lDataSet.Fields[j].FieldName = 'STATION_ID') or
      (lDataSet.Fields[j].FieldName = 'LOG_BAND_MHZ') or (lDataSet.Fields[j].FieldName = 'LOG_CONTINENT') or (lDataSet.Fields[j].FieldName = 'LOG_COUNTRY') or (lDataSet.Fields[j].FieldName = 'LOG_QSO_DATE') or (lDataSet.Fields[j].FieldName = 'LOG_QSO_TIME') or
    { (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSL_SENT') or
      (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSL_RCVD') or
      (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSLSDATE') or
      (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSLRDATE') or }
    (lDataSet.Fields[j].FieldName = 'BAND_ID') then
      continue;

    if beQSL and ((lDataSet.Fields[j].FieldName <> 'LOG_CALL') and (lDataSet.Fields[j].FieldName <> 'LOG_QSO_DATETIME') and (lDataSet.Fields[j].FieldName <> 'LOG_RST_RCVD') and (lDataSet.Fields[j].FieldName <> 'LOG_RST_SENT') and (lDataSet.Fields[j].FieldName <> 'LOG_BAND') and (lDataSet.Fields[j].FieldName <> 'LOG_MODE')) then
      continue;

    if lDataSet.Fields[j].Value <> null then
    begin

      { if lDataSet.Fields[j].FieldName = 'LOG_BAND' then
        begin
        sTag := '<' + Copy(lDataSet.Fields[j].FieldName, 5,
        Length(lDataSet.Fields[j].FieldName) - 4) + ':' + IntToStr
        (Length(VarToStr(lDataSet.Fields[j].asVariant)) + 1) + '>';
        sStr := sStr + sTag + VarToStr(lDataSet.Fields[j].asVariant) + 'M';
        continue;
        end; }

      if (lDataSet.Fields[j].FieldName = 'LOG_LAT') or
         (lDataSet.Fields[j].FieldName = 'LOG_LON') or
         (lDataSet.Fields[j].FieldName = 'LOG_MY_LAT') or
         (lDataSet.Fields[j].FieldName = 'LOG_MY_LON') then
      begin
        Location:=CoordinateToLocation(lDataSet.Fields[j].FieldName,lDataSet.Fields[j].asFloat);
        sStr := sStr + '<'+Copy(lDataSet.Fields[j].FieldName, 5, Length(lDataSet.Fields[j].FieldName) - 4) + ':'+IntToStr(Length(Location))+'>'+Location;
        continue;
      end;


      if lDataSet.Fields[j].FieldName = 'LOG_QSLSDATE' then
      begin
        sStr := sStr + '<QSLSDATE:8>' + DateToAdif(lDataSet.Fields[j].asDateTime);
        continue;
      end;

      if (lDataSet.Fields[j].FieldName = 'LOG_CONT') and (VarToStr(lDataSet.Fields[j].asVariant) = 'UN') then
        continue;

      if (lDataSet.Fields[j].FieldName = 'LOG_DXCC') and (lDataSet.Fields[j].asVariant = -1) then
        continue;

      if (lDataSet.Fields[j].FieldName = 'LOG_MY_COUNTRY') and (lDataSet.Fields[j].asVariant <> '') then
        continue;

      if lDataSet.Fields[j].FieldName = 'LOG_QSLRDATE' then
      begin
        sStr := sStr + '<QSLRDATE:8>' + DateToAdif(lDataSet.Fields[j].asDateTime);
        continue;
      end;

      if lDataSet.Fields[j].FieldName = 'LOG_QSO_DATETIME' then
      begin
        sStr := sStr + '<QSO_DATE:8>' + DateToAdif(lDataSet.Fields[j].asDateTime) + '<TIME_ON:4>' + FormatDateTime('hhmm', lDataSet.Fields[j].asDateTime);
        continue;
      end;

      // sTMP:=lDataSet.Fields[j].FieldName;

      if (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSL_SENT') or (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSL_RCVD') then
      begin
        sTag := '<APP_UT4UKWLOGBOOK_' + Copy(lDataSet.Fields[j].FieldName, 5, Length(lDataSet.Fields[j].FieldName) - 4) + ':1>';
        sStr := sStr + sTag + lDataSet.Fields[j].asString;
        continue;
      end;

      if (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSLRDATE') or (lDataSet.Fields[j].FieldName = 'LOG_DQSL_QSLSDATE') or
        (Pos('LOG_CUSTOM_STAT',lDataSet.Fields[j].FieldName)>0) then
      begin
        sTag := '<APP_UT4UKWLOGBOOK_' + Copy(lDataSet.Fields[j].FieldName, 5, Length(lDataSet.Fields[j].FieldName) - 4) + ':8>';
        sStr := sStr + sTag + DateToAdif(lDataSet.Fields[j].asDateTime);
        continue;
      end;

      if (TField(lDataSet.Fields[j]).DataType = ftDate) or (TField(lDataSet.Fields[j]).DataType = ftDateTime) then
      begin
        sTag := '<' + Copy(lDataSet.Fields[j].FieldName, 5, Length(lDataSet.Fields[j].FieldName) - 4) + ':8>';
        sStr := sStr + sTag + DateToAdif(lDataSet.Fields[j].asDateTime);
      end
      else
      begin
        sTag := '<' + Copy(lDataSet.Fields[j].FieldName, 5, Length(lDataSet.Fields[j].FieldName) - 4) + ':' + IntToStr(Length(VarToStr(lDataSet.Fields[j].asVariant))) + '>';
        if lDataSet.Fields[j].DataType = ftFloat then
          sStr := sStr + sTag + StringReplace(VarToStr(lDataSet.Fields[j].asVariant), ',', '.', [rfReplaceAll, rfIgnoreCase])
        else
          sStr := sStr + sTag + VarToStr(lDataSet.Fields[j].asVariant);
      end;
    end;

  end;

  // sult :=   AnsiToUtf8(sStr)+ '<EOR>';
  // result := Utf8ToAnsi(sStr) + '<EOR>';
  result := sStr + '<EOR>';

end;

function GetUrlContent(const Url: string): string;
var
  NetHandle: HInternet;
  UrlHandle: HInternet;
  Buffer: array [0 .. 1024] of AnsiChar;
  BytesRead: DWORD;
begin
  result := '';
  NetHandle := InternetOpen('UT4UKW LogBook', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

  if Assigned(NetHandle) then
  begin
    UrlHandle := InternetOpenURL(NetHandle, pChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);

    if Assigned(UrlHandle) then
    begin
      FillChar(Buffer, SizeOf(Buffer), 0);
      repeat
        result := result + Buffer;
        FillChar(Buffer, SizeOf(Buffer), 0);
        InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesRead);
      until BytesRead = 0;
      InternetCloseHandle(UrlHandle);
    end
    else
      raise Exception.CreateFmt('Cannot open URL %s', [Url]);

    InternetCloseHandle(NetHandle);
  end
  else
    raise Exception.Create('Unable to initialize Wininet');
end;

function UrlEncode(const S: string; NeedUTF8: boolean = false): string;
var
  I: Integer;
  W: UTF8String;
begin
  result := '';
  if NeedUTF8 then
    W := Utf8Encode(S)
  else
    W := S;
  For I := 1 to Length(W) do
    case W[I] of
      '%', ' ', '&', '=', '@', '.', #13, #10, '+', #128 .. #255:
        result := result + '%' + inttohex(ord(W[I]), 2);
    else
      result := result + W[I];
    end;
end;

function CallKeyCodeToChar(Key: word): char;
begin
  if ((Key >= 96) and (Key <= 105)) then
    Key := Key - 48; // Num lock

  if ((Key >= 48) and (Key <= 57)) or ((Key >= 65) and (Key <= 90)) then
    result := Chr(Key)
  else if ((Key = 111) or (Key = 191)) then
    result := '/'
  else
    result := #0;
end;

procedure getBearing(StartLat, StartLong, EndLat, EndLong: double; var Distance: double; var Bearing: double);
var
  fPhimean: double;
  fdLambda: double;
  fdPhi: double;
  fAlpha: double;
  fRho: double;
  fNu: double;
  fR: double;
  fz: double;
  fTemp: double;
const
  D2R: double = 0.017453;
  R2D: double = 57.295781;
  a: double = 6378137.0;
  b: double = 6356752.314245;
  e2: double = 0.006739496742337;
  f: double = 0.003352810664747;
begin
  if ((FloatToStr(EndLat) = '0') and (FloatToStr(EndLong) = '0')) or ((FloatToStr(StartLat) = '0') and (FloatToStr(StartLong) = '0')) then
  begin
    Distance := 0;
    Bearing := 0;
    Exit;
  end;
  try
    fdLambda := (StartLong - EndLong) * D2R;
    fdPhi := (StartLat - EndLat) * D2R;
    fPhimean := ((StartLat + EndLat) / 2.0) * D2R;

    fTemp := 1 - e2 * (Power(Sin(fPhimean), 2));
    fRho := (a * (1 - e2)) / Power(fTemp, 1.5);
    fNu := a / (Sqrt(1 - e2 * (Sin(fPhimean) * Sin(fPhimean))));

    fz := Sqrt(Power(Sin(fdPhi / 2.0), 2) + Cos(EndLat * D2R) * Cos(StartLat * D2R) * Power(Sin(fdLambda / 2.0), 2));

    fz := 2 * ArcSin(fz);

    fAlpha := Cos(EndLat * D2R) * Sin(fdLambda) * 1 / Sin(fz);
    fAlpha := ArcSin(fAlpha);

    fR := (fRho * fNu) / ((fRho * Power(Sin(fAlpha), 2)) + (fNu * Power(Cos(fAlpha), 2)));

    Distance := (fz * fR);
    if ((StartLat < EndLat) and (StartLong < EndLong)) then
      Bearing := Abs(fAlpha * R2D)
    else if ((StartLat < EndLat) and (StartLong > EndLong)) then
      Bearing := 360 - Abs(fAlpha * R2D)
    else if ((StartLat > EndLat) and (StartLong > EndLong)) then
      Bearing := 180 + Abs(fAlpha * R2D)
    else if ((StartLat > EndLat) and (StartLong < EndLong)) then
      Bearing := 180 - Abs(fAlpha * R2D);
  except
    Distance := -1;
    Bearing := -1;
  end;
end;

function GridToCoordinate(Loc: string): TCoordinate;
begin
  if Trim(Loc) = '' then
  begin
    result.Lat := 0;
    result.Lon := 0;
    Exit;
  end;
  { result.lat = (10*(grid.charCodeAt(1)-65) +   (grid.charCodeAt(3)-48) + 5*(grid.charCodeAt(5)-65)/120) - 90;

    result.lon = (20*(grid.charCodeAt(0)-65) + 2*(grid.charCodeAt(2)-48) + 5*(grid.charCodeAt(4)-65)/60) - 180;

    result.lat :=(10*(Ord(Loc[2]) - 65)+(Ord(Loc[4]) - 48)+5*(Ord(Loc[6]) - 65)/120)-90;
    result.lon:=1; }
  result.Lat := (ord(Loc[2]) - 65) * 10 + (ord(Loc[4]) - 48) + (ord(Loc[6]) - 65 + 0.5) / 24 - 90;
  result.Lon := (ord(Loc[1]) - 65) * 20 + (ord(Loc[3]) - 48) * 2 + (ord(Loc[5]) - 65 + 0.5) / 12 - 180;
end;

procedure CheckDir(DirName: string);
begin
  if not DirectoryExists(DirName) then
    ForceDirectories(DirName);
end;

function IsInternetConnected: boolean;
var
  dwConnectionTypes: DWORD;
begin
  dwConnectionTypes := INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN or INTERNET_CONNECTION_PROXY;
  result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

function GetDelimeter: string;
var
  Decimal: pChar;
begin
 // result := SysUtils.GetLocaleStr(LOCALE_SYSTEM_DEFAULT, LOCALE_SDECIMAL,'.');
  Decimal := StrAlloc(255);
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SDECIMAL, Decimal, 255);
  result := Decimal;
end;

function GetDllFileName: string;
var
  Buffer: Array [0 .. 260] of char;
begin
  GetModuleFileName(hInstance, Buffer, Length(Buffer));
  result := Buffer;
end;

function ConvertToURL(FileName: string): string;
begin
  if LowerCase(Copy(FileName, 1, 8)) <> 'file:///' then
    result := 'file:///';
  result := result + StringReplace(FileName, '\', '/', [rfReplaceAll, rfIgnoreCase]);
end;

Procedure CopyFile(InFileName, OutFileName: String);
Const
  BufSize = 4096;
Var
  InFile, OutFile: TStream;
  Buffer: Array [1 .. BufSize] Of Byte;
  ReadBufSize: Integer;
Begin
  InFile := Nil;
  OutFile := Nil;
  Try
    InFile := TFileStream.Create(InFileName, fmOpenRead);
    OutFile := TFileStream.Create(OutFileName, fmCreate or fmShareDenyWrite);
    Repeat
      ReadBufSize := InFile.Read(Buffer, BufSize);
      OutFile.Write(Buffer, ReadBufSize);
    Until ReadBufSize <> BufSize;
  Finally
    InFile.Free;
    OutFile.Free;
  End; { Try }
End; { CopyFile }

function ColorToHex(Color: TColor): string;
begin
  result := inttohex(GetRValue(Color), 2) + inttohex(GetGValue(Color), 2) + inttohex(GetBValue(Color), 2);
end;

function HexToColor(sColor: string): TColor;
begin
  result := RGB(StrToInt('$' + Copy(sColor, 1, 2)), StrToInt('$' + Copy(sColor, 3, 2)), StrToInt('$' + Copy(sColor, 5, 2)));
end;

function GetUrlInfo(const dwInfoLevel: DWORD; const FileURL: string): string;
var
  hSession, hFile: HInternet;
  dwBuffer: Array [0 .. 1024] Of AnsiChar;
  dwBufferLen, dwIndex: DWORD;
begin
  result := '';
  hSession := InternetOpen('STEROID Download', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hSession) then
  begin
    hFile := InternetOpenURL(hSession, pChar(FileURL), nil, 0, INTERNET_FLAG_RELOAD, 0);
    dwIndex := 0;
    // dwBufferLen := 20;
    dwBufferLen := SizeOf(dwBuffer);
    if HttpQueryInfo(hFile, dwInfoLevel, @dwBuffer, dwBufferLen, dwIndex) then
      result := dwBuffer;
    if Assigned(hFile) then
      InternetCloseHandle(hFile);
    InternetCloseHandle(hSession);
  end;
end;

function GetFileTime(Url: string): TDateTime;
var
  hSession, hFile: HInternet;
  dwBuffer: Pointer;
  dwBufferLen, dwIndex: DWORD;
  Len: DWORD;
  t, LastModified: SYSTEMTIME;
  ft1, ft2: FILETIME;

begin

  hSession := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hSession) then
  begin
    hFile := InternetOpenURL(hSession, pChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);
    dwIndex := 0;
    Len := SizeOf(LastModified);
    HttpQueryInfo(hFile, HTTP_QUERY_LAST_MODIFIED or HTTP_QUERY_FLAG_SYSTEMTIME, @LastModified, Len, dwIndex);
    if Len > 0 then
    begin
      SystemTimeToFileTime(LastModified, ft2);
      FileTimeToLocalFileTime(ft2, ft1);
      FileTimeToSystemTime(ft1, t);
      result := EncodeDateTime(t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond, 0);
    end;
    if Assigned(hFile) then
      InternetCloseHandle(hFile);
    InternetCloseHandle(hSession);
  end;
end;

function SetFileDate(Const FileName: String; Const FileDate: TDateTime): boolean;
Var
  FileHandle: THandle;
  FileSetDateResult: Integer;
Begin
  Try
    Try
      FileHandle := FileOpen(FileName, fmOpenWrite OR fmShareDenyNone);
      If FileHandle > 0 Then
      Begin
        FileSetDateResult := FileSetDate(FileHandle, DateTimeToFileDate(FileDate));
        result := (FileSetDateResult = 0);
      End;
    Except
      result := false;
    End;
  Finally
    FileClose(FileHandle);
  End;
End;

function StrToInt2(const S: string): Integer;
var
  intTemp, E: Integer;
begin
  result := 0;
  val(S, intTemp, E);
  if E = 0 then
    result := intTemp;
end;

procedure FindFilesByMask(List: tStrings; const DirName, Mask: String; SubDir: boolean = false);
// Поиск файлов по маске в заданной папке и подпапке
// var
// num: Integer;
// Чем меньше параметров и локальных переменных у рекурсивной процедуры,
// тем меньше она требует памяти под стек. Поэтому использую локальную
// процедуру
  procedure ScanDirs(const DirName: String);
  var
    h: THandle;
    wfd: tWin32FindData;
  begin
    // Inc(DirCount); // просто для статистики
    // Сначала просмотрим текущий каталог по заданной маске
    h := Windows.FindFirstFile(pChar(DirName + Mask), wfd);
    try
      if h <> INVALID_HANDLE_VALUE then
      begin
        repeat
          if (wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
            List.Add(DirName + wfd.cFileName);
        until not Windows.FindNextFile(h, wfd);
      end;
      // проверка кода ошибки и FindFirstFile и FindNextFile
      case GetLastError of
        ERROR_NO_MORE_FILES, // больше нет файлов и каталогов удовлетворяющих маске (но были)
        ERROR_FILE_NOT_FOUND, // вообще нет файлов и каталогов удовлетворяющих маске
        ERROR_SHARING_VIOLATION // возникает во время создания каталога (уже создан но еще недоступен)
          :
          ; // ничего не делаем, все Ok
      else // все остальные ошибки
        raise Exception.CreateFmt('Ошибка просмотра каталога "%s": %s', [DirName, SysErrorMessage(GetLastError)]);
      end;
    finally
      if h <> INVALID_HANDLE_VALUE then
        Windows.FindClose(h);
    end;

    // Теперь рекрсивно просмотрим подкаталоги
    if not SubDir then
      Exit; // 13.06.03
    h := Windows.FindFirstFile(pChar(DirName + '*.*'), wfd);
    try
      if h <> INVALID_HANDLE_VALUE then
      begin
        repeat
          if ((wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0) and (wfd.cFileName <> String('.')) and (wfd.cFileName <> '..') then
            ScanDirs(IncludeTrailingPathDelimiter(DirName + wfd.cFileName));
        until not Windows.FindNextFile(h, wfd);
      end;
      // проверка кода ошибки и FindFirstFile и FindNextFile
      case GetLastError of
        ERROR_NO_MORE_FILES, // больше нет файлов и каталогов удовлетворяющих маске (но были)
        ERROR_FILE_NOT_FOUND, // вообще нет файлов и каталогов удовлетворяющих маске
        ERROR_SHARING_VIOLATION // возникает во время создания каталога (уже создан но еще недоступен)
          :
          ; // ничего не делаем, все Ok
      else // все остальные ошибки
        raise Exception.CreateFmt('Ошибка просмотра каталога "%s": %s', [DirName, SysErrorMessage(GetLastError)]);
      end;
    finally
      if h <> INVALID_HANDLE_VALUE then
        Windows.FindClose(h);
    end;
  end;

begin // FindFilesByMask
  ScanDirs(IncludeTrailingPathDelimiter(DirName));
end;

function GetOriginalCall(Call: string): string;
var
  iPosFirstSlash, iPosSecondSlash: Integer;
begin
  iPosFirstSlash := Pos('/', Call);
  if iPosFirstSlash = 0 then
  begin
    result := Call;
    Exit;
  end
  else if (Length(Call) - iPosFirstSlash) <= 3 then // Letter or QRP
  begin
    result := Copy(Call, 1, iPosFirstSlash - 1);
    Exit;
  end
  else
  begin
    Delete(Call, 1, iPosFirstSlash);
    result := GetOriginalCall(Call);
  end;
end;

function Capitalize(Text: string): string;
const
  chars = ['A' .. 'Z', 'a' .. 'z', 'А' .. 'Я', 'а' .. 'я'];
var
  I: Integer;
  bNextCapitalize: boolean;
  CurrentWord: string;
begin
  if Trim(Text) = '' then
    Exit;
  Text := AnsiLowerCase(Text);
  for I := 1 to Length(Text) do
  begin
    if (Text[I] = ' ') or (Text[I] = '.') or (Text[I] = '-') then
      bNextCapitalize := True
    else if bNextCapitalize then
      case Text[I] of
        'A' .. 'Z', 'a' .. 'z', 'А' .. 'Я', 'а' .. 'я':
          begin
            Text[I] := AnsiUpperCase(Text[I])[1];
            bNextCapitalize := false;
          end;
      end;
  end;
  Text[1] := AnsiUpperCase(Text[1])[1];
  result := Text;
end;

function DosToWin(ASource: AnsiString): AnsiString;
var
  Ch: PAnsiChar;
begin
  Ch := AnsiStrAlloc(Length(ASource) + 1);
  OemToAnsi(PAnsiChar(ASource), Ch);
  result := StrPas(Ch);
  StrDispose(Ch)
end;

function UpperCase2(S: string): string;
var
  I: Integer;
begin
  result := S;
  for I := 1 to Length(result) do
    if (result[I] in ['a' .. 'z', 'а' .. 'я']) then
      result[I] := Chr(ord(result[I]) - 32);
end;

function LowerCase2(S: string): string;
var
  I: Integer;
begin
  result := S;
  for I := 1 to Length(result) do
    if (result[I] in ['A' .. 'Z', 'А' .. 'Я']) then
      result[I] := Chr(ord(result[I]) + 32);
end;

function ExtractFileNameWithoutExt(const FileName: string): string;
begin
  result := ChangeFileExt(ExtractFileName(FileName), '');
end;

function RunAppHidden(my_app: string; my_wait: bool): bool;
var
  si: TStartupInfo;
  pi: TProcessInformation;
begin
  result := false;
  try
    ZeroMemory(@si, SizeOf(si));
    si.cb := SizeOf(si);
    si.dwFlags := STARTF_USESHOWWINDOW;
    si.wShowWindow := SW_HIDE;
    if CreateProcess(nil, pChar(my_app), nil, nil, false, 0, nil, nil, si, pi) = True then
      result := True;
    try
      CloseHandle(pi.hThread);
    except
      ;
    end;
    if my_wait = True then
      WaitForSingleObject(pi.hProcess, INFINITE);
    try
      CloseHandle(pi.hProcess);
    except
      ;
    end;
  except
    result := false;
    ;
  end;
end;

function GetUrlSize(const Url: string): Integer;
var
  hSession, hFile: HInternet;
  dwBuffer: array [1 .. 20] of char;
  dwBufferLen, dwIndex: DWORD;
begin
  result := 0;
  hSession := InternetOpen(pChar('UT4UKW LogBook'), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hSession) then
  begin
    hFile := InternetOpenURL(hSession, pChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);
    dwIndex := 0;
    dwBufferLen := 20;
    if HttpQueryInfo(hFile, HTTP_QUERY_CONTENT_LENGTH, @dwBuffer, dwBufferLen, dwIndex) then
      result := StrToInt(String(@dwBuffer));
    if Assigned(hFile) then
      InternetCloseHandle(hFile);
    InternetCloseHandle(hSession);
  end;
end;


function GetAbsolutePathFromOptions(Path:string):string;
var
sPath:string;
begin
  sPath:=Trim(Path);
  if sPath<>'' then
  begin
    if Pos(':',sPath)>0 then
       result:=sPath
     else
       result:=ExtractFilePath(Application.ExeName)+sPath;
  end
  else
       result:=ExtractFilePath(Application.ExeName)+sPath;
   result:=IncludeTrailingPathDelimiter(result);
end;

function StreamToString(aStream: TStream): string;
var
  SS: TStringStream;
begin
  if aStream <> nil then
  begin
    SS := TStringStream.Create('');
    try
      aStream.Position := 0;
      SS.CopyFrom(aStream, aStream.Size);
      Result := SS.DataString;
    finally
      SS.Free;
    end;
  end else
  begin
    Result := '';
  end;
end;


function FileLastModified
   (const TheFile: string): TDateTime;
var
  FileH : THandle;
  LocalFT : TFileTime;
  DosFT : DWORD;
  LastAccessedTime : TDateTime;
  FindData : TWin32FindData;
begin
  FileH := FindFirstFile(PChar(TheFile), FindData) ;
  if FileH <> INVALID_HANDLE_VALUE then begin
   Windows.FindClose(FileH) ;
   if (FindData.dwFileAttributes AND
       FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
     FileTimeToLocalFileTime
      (FindData.ftLastWriteTime,LocalFT) ;
     FileTimeToDosDateTime
      (LocalFT,LongRec(DosFT).Hi,LongRec(DosFT).Lo) ;
     LastAccessedTime := FileDateToDateTime(DosFT) ;
     Result := LastAccessedTime ;
    end;
  end;
end;

function IntToFontStyle(i: integer): TFontStyles;
begin
 case i of                 {long winded but fast}
   0:  IntToFontStyle := [];
   1:  IntToFontStyle := [fsStrikeOut];
   2:  IntToFontStyle := [fsUnderline];
   3:  IntToFontStyle := [fsUnderline, fsStrikeOut];
   4:  IntToFontStyle := [fsItalic];
   5:  IntToFontStyle := [fsItalic, fsStrikeOut];
   6:  IntToFontStyle := [fsItalic, fsUnderline];
   7:  IntToFontStyle := [fsItalic, fsUnderline, fsStrikeOut];
   8:  IntToFontStyle := [fsBold];
   9:  IntToFontStyle := [fsBold, fsStrikeOut];
   10: IntToFontStyle := [fsBold, fsUnderline];
   11: IntToFontStyle := [fsBold, fsUnderline, fsStrikeOut];
   12: IntToFontStyle := [fsBold, fsItalic];
   13: IntToFontStyle := [fsBold, fsItalic, fsStrikeOut];
   14: IntToFontStyle := [fsBold, fsItalic, fsUnderline];
   15: IntToFontStyle := [fsBold, fsItalic, fsUnderline, fsStrikeOut];
 end; {case}
end;
function FontStyleToInt(s: TFontStyles): integer;
var i: integer;
begin
  i := 0;
  if fsBold in s then i := i + 8;
  if fsItalic in s then i := i + 4;
  if fsUnderline in s then i := i + 2;
  if fsStrikeOut in s then i := i + 1;
  FontStyleToInt := i;
end;

end.



