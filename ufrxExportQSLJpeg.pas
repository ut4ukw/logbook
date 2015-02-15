unit ufrxExportQSLJpeg;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frxClass, Jpeg
{$IFDEF Delphi6}
, Variants
{$ENDIF};

procedure GIFSaveToStream(const Stream: TStream; const Bitmap: TBitmap);
procedure GIFSaveToFile(const FileName: String; const Bitmap: TBitmap);

type
  TfrxCustomQSLImageExport = class(TfrxCustomExportFilter)
  private
    FBitmap: TBitmap;
    FCrop: Boolean;
    FCurrentPage: Integer;
    FJPEGQuality: Integer;
    FMaxX: Integer;
    FMaxY: Integer;
    FMinX: Integer;
    FMinY: Integer;
    FMonochrome: Boolean;
    FResolution: Integer;
    FCurrentRes: Integer;
    FSeparate: Boolean;
    FYOffset: Integer;
    FFileSuffix: String;
    FFirstPage: Boolean;
    FExportNotPrintable: Boolean;
    function SizeOverflow(const Val: Extended): Boolean;
  protected
    FPaperWidth: Double;
    FPaperHeight: Double;
    FDiv: Extended;
    procedure Save; virtual;
    procedure FinishExport; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    function ShowModal: TModalResult; override;
    function Start: Boolean; override;
    procedure Finish; override;
    procedure FinishPage(Page: TfrxReportPage; Index: Integer); override;
    procedure StartPage(Page: TfrxReportPage; Index: Integer); override;
    procedure ExportObject(Obj: TfrxComponent); override;

    property JPEGQuality: Integer read FJPEGQuality write FJPEGQuality default 90;
    property CropImages: Boolean read FCrop write FCrop default False;
    property Monochrome: Boolean read FMonochrome write FMonochrome default False;
    property Resolution: Integer read FResolution write FResolution;
    property SeparateFiles: Boolean read FSeparate write FSeparate;
    property ExportNotPrintable: Boolean read FExportNotPrintable write FExportNotPrintable;
    property OverwritePrompt;
  end;



  TfrxQSLJPEGExport = class(TfrxCustomQSLImageExport)
  protected
    procedure Save; override;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: String; override;
  published
    property JPEGQuality;
    property CropImages;
    property Monochrome;
    property OverwritePrompt;
  end;


implementation

uses frxUtils, frxFileUtils, frxRes, frxrcExports;


type
  PDirEntry = ^TDirEntry;
  TDirEntry = record
    _Tag: Word;
    _Type: Word;
    _Count: LongInt;
    _Value: LongInt;
  end;

const
  EMF_DIV = 0.911;
  TifHeader: array[0..7] of Byte = (
    $49, $49, $2A, $00, $08, $00, $00, $00);

  { Here http://www.fileformat.info/format/bmp/egff.htm
    is written that BMP file can have size up to 32K x 32K }

  MaxBitmapHeight  = 30000;
  MaxBitmapWidth   = 30000;

  MAXBITSCODES = 12;
  HSIZE = 5003;
  NullString: array[0..3] of Byte = ($00, $00, $00, $00);
  Software: array[0..9] of AnsiChar = ('F', 'a', 's', 't', 'R', 'e', 'p', 'o', 'r', 't');
  code_mask: array [0..16] of cardinal = ($0000, $0001, $0003, $0007, $000F,
    $001F, $003F, $007F, $00FF, $01FF, $03FF, $07FF, $0FFF,
    $1FFF, $3FFF, $7FFF, $FFFF);
  BitsPerSample: array[0..2] of Word = ($0008, $0008, $0008);
  D_BW_C: array[0..13] of TDirEntry = (
    (_Tag: $00FE; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0100; _Type: $0003; _Count: $00000001; _Value: $00000000),
    (_Tag: $0101; _Type: $0003; _Count: $00000001; _Value: $00000000),
    (_Tag: $0102; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0103; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0106; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0111; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0115; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0116; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0117; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $011A; _Type: $0005; _Count: $00000001; _Value: $00000000),
    (_Tag: $011B; _Type: $0005; _Count: $00000001; _Value: $00000000),
    (_Tag: $0128; _Type: $0003; _Count: $00000001; _Value: $00000002),
    (_Tag: $0131; _Type: $0002; _Count: $0000000A; _Value: $00000000));
  D_COL_C: array[0..14] of TDirEntry = (
    (_Tag: $00FE; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0100; _Type: $0003; _Count: $00000001; _Value: $00000000),
    (_Tag: $0101; _Type: $0003; _Count: $00000001; _Value: $00000000),
    (_Tag: $0102; _Type: $0003; _Count: $00000001; _Value: $00000008),
    (_Tag: $0103; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0106; _Type: $0003; _Count: $00000001; _Value: $00000003),
    (_Tag: $0111; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0115; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0116; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0117; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $011A; _Type: $0005; _Count: $00000001; _Value: $00000000),
    (_Tag: $011B; _Type: $0005; _Count: $00000001; _Value: $00000000),
    (_Tag: $0128; _Type: $0003; _Count: $00000001; _Value: $00000002),
    (_Tag: $0131; _Type: $0002; _Count: $0000000A; _Value: $00000000),
    (_Tag: $0140; _Type: $0003; _Count: $00000300; _Value: $00000008));
  D_RGB_C: array[0..14] of TDirEntry = (
    (_Tag: $00FE; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0100; _Type: $0003; _Count: $00000001; _Value: $00000000),
    (_Tag: $0101; _Type: $0003; _Count: $00000001; _Value: $00000000),
    (_Tag: $0102; _Type: $0003; _Count: $00000003; _Value: $00000008),
    (_Tag: $0103; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0106; _Type: $0003; _Count: $00000001; _Value: $00000002),
    (_Tag: $0111; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0115; _Type: $0003; _Count: $00000001; _Value: $00000003),
    (_Tag: $0116; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $0117; _Type: $0004; _Count: $00000001; _Value: $00000000),
    (_Tag: $011A; _Type: $0005; _Count: $00000001; _Value: $00000000),
    (_Tag: $011B; _Type: $0005; _Count: $00000001; _Value: $00000000),
    (_Tag: $011C; _Type: $0003; _Count: $00000001; _Value: $00000001),
    (_Tag: $0128; _Type: $0003; _Count: $00000001; _Value: $00000002),
    (_Tag: $0131; _Type: $0002; _Count: $0000000A; _Value: $00000000));

{ TfrxCustomQSLImageExport }

constructor TfrxCustomQSLImageExport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCrop := True;
  FJPEGQuality := 90;
  FResolution := 96;
  FSeparate := True;
  FExportNotPrintable := False;
  CropImages := False;
end;

function TfrxCustomQSLImageExport.ShowModal: TModalResult;
begin
{  with TfrxIMGExportDialog.Create(nil) do
  begin
    Filter := Self;
    Quality.Text := IntToStr(FJPEGQuality);
    CropPage.Checked := FCrop;
    Mono.Checked := FMonochrome;
    Quality.Enabled := Self is TfrxQSLJPEGExport;
    Mono.Enabled := not (Self is TfrxGIFExport);
    Resolution.Text := IntToStr(FResolution);
    if OverwritePrompt then
      SaveDialog1.Options := SaveDialog1.Options + [ofOverwritePrompt];
    if SlaveExport then
    begin
      SeparateCB.Checked := False;
      SeparateCB.Visible := False;
    end
    else
      SeparateCB.Checked := FSeparate;

    if (FileName = '') and (not SlaveExport) then
      SaveDialog1.FileName := ChangeFileExt(ExtractFileName(frxUnixPath2WinPath(Report.FileName)), SaveDialog1.DefaultExt)
    else
      SaveDialog1.FileName := FileName;

    if PageNumbers <> '' then
    begin
      PageNumbersE.Text := PageNumbers;
      PageNumbersRB.Checked := True;
    end;

    Result := ShowModal;

    if Result = mrOk then
    begin
      FJPEGQuality := StrToInt(Quality.Text);
      FCrop := CropPage.Checked;
      FMonochrome := Mono.Checked;
      FResolution := StrToInt(Resolution.Text);
      FSeparate := SeparateCB.Checked;
      PageNumbers := '';
      CurPage := False;
      if CurPageRB.Checked then
        CurPage := True
      else if PageNumbersRB.Checked then
        PageNumbers := PageNumbersE.Text;

      if not SlaveExport then
      begin
        if DefaultPath <> '' then
          SaveDialog1.InitialDir := DefaultPath;
        if SaveDialog1.Execute then
          FileName := SaveDialog1.FileName else
          Result := mrCancel
      end;
    end;
    Free;
  end;}
end;

function TfrxCustomQSLImageExport.Start: Boolean;
begin
  if SlaveExport then
  begin
    if Report.FileName <> '' then
      FileName := ChangeFileExt(GetTemporaryFolder + ExtractFileName(Report.FileName), DefaultExt)
    else
      FileName := ChangeFileExt(GetTempFile, DefaultExt);
    FSeparate := False;
  end;
  CurPage := False;
  FCurrentPage := 0;
  FYOffset := 0;
  if not FSeparate then
  begin
    FBitmap := TBitmap.Create;
    FCurrentRes := FBitmap.Canvas.Font.PixelsPerInch;
    FDiv := FResolution / FCurrentRes;
    FBitmap.Canvas.Brush.Color := clWhite;
    FBitmap.Monochrome := Monochrome;
    FMaxX := 0;
    FMaxY := 0;
    FFirstPage := True;
  end;
  Result := (FileName <> '') or (Stream <> nil);
  if (ExtractFilePath(FileName) = '') and (DefaultPath <> '') then
    FileName := DefaultPath + '\' + FileName;
end;

procedure TfrxCustomQSLImageExport.StartPage(Page: TfrxReportPage; Index: Integer);
var
  i: Integer;
  h, w: Extended;
begin
  Inc(FCurrentPage);
  if FSeparate then
  begin
    FBitmap := TBitmap.Create;
    FCurrentRes := FBitmap.Canvas.Font.PixelsPerInch;
    FDiv := FResolution / FCurrentRes;
    FBitmap.Canvas.Brush.Color := clWhite;
    FBitmap.Monochrome := Monochrome;
    FBitmap.Width := Round(Page.Width * FDiv);
    FBitmap.Height := Round(Page.Height * FDiv);
    FMaxX := 0;
    FMaxY := 0;
    FMinX := FBitmap.Width;
    FMinY := FBitmap.Height;
  end
  else if FFirstpage then
    with FBitmap do
    begin
      w := 0;
      h := 0;

      for i := 0 to Report.PreviewPages.Count - 1 do
        with Report.PreviewPages.Page[i] do
        begin
          if w < Width then
            w := Width;

          h := h + Height;
        end;

      w := w * FDiv;
      h := h * FDiv;

      if SizeOverflow(w) then
        w := MaxBitmapWidth;

      if SizeOverflow(h) then
        h := MaxBitmapHeight;

      Width   := Round(w);
      Height  := Round(h);

      FMinX   := Width;
      FMinY   := Height;

      FFirstPage := False;
    end;
end;


procedure TfrxCustomQSLImageExport.ExportObject(Obj: TfrxComponent);
var
  z: Integer;
begin
  if (Obj is TfrxView) and (FExportNotPrintable or TfrxView(Obj).Printable) then
  begin
    if Obj.Name <> '_pagebackground' then
    begin
      z := Round(Obj.AbsLeft * FDiv);
      if z < FMinX then
        FMinX := z;
      z := FYOffset + Round(Obj.AbsTop * FDiv);
      if z < FMinY then
        FMinY := z;
      z := Round((Obj.AbsLeft + Obj.Width) * FDiv) + 1;
      if z > FMaxX then
        FMaxX := z;
      z := FYOffset + Round((Obj.AbsTop + Obj.Height) * FDiv) + 1;
      if z > FMaxY then
        FMaxY := z;
    end;
    TfrxView(Obj).Draw(FBitmap.Canvas, FDiv, FDiv, 0, FYOffset);
  end;
end;

procedure TfrxCustomQSLImageExport.FinishPage(Page: TfrxReportPage; Index: Integer);
begin
  FPaperWidth := Page.PaperWidth;
  FPaperHeight := Page.PaperHeight;

  if FSeparate then
    FinishExport
  else
    FYOffset := FYOffset + Round(Page.Height * FDiv);
end;

procedure TfrxCustomQSLImageExport.Finish;
begin
  if not FSeparate then
    FinishExport;
end;

procedure TfrxCustomQSLImageExport.Save;
begin
  if FSeparate then
    FFileSuffix := '.' + IntToStr(FCurrentPage)
  else
    FFileSuffix := '';
end;

procedure TfrxCustomQSLImageExport.FinishExport;
var
  RFrom, RTo: TRect;
begin
  try
    if FCrop then
    begin
      RFrom := Rect(FMinX, FMinY, FMaxX, FMaxY);
      RTo := Rect(0, 0, FMaxX - FMinX, FMaxY - FMinY);
      FBitmap.Canvas.CopyRect(RTo, FBitmap.Canvas, RFrom);
      FBitmap.Width := FMaxX - FMinX;
      FBitmap.Height := FMaxY - FMinY;
    end;
    Save;
  finally
    FBitmap.Free;
  end;
end;

function TfrxCustomQSLImageExport.SizeOverflow(const Val: Extended): Boolean;
begin
  Result :=  Val > MaxBitmapHeight;
end;

{ TfrxQSLJPEGExport }

constructor TfrxQSLJPEGExport.Create(AOwner: TComponent);
begin
  inherited;
  FilterDesc := frxResources.Get('QSLJPEGExportFilter');
  DefaultExt := '.jpg';
end;

class function TfrxQSLJPEGExport.GetDescription: String;
begin
  Result := frxResources.Get('QSLJPEGExport');
end;

procedure TfrxQSLJPEGExport.Save;
var
  Image: TJPEGImage;
  TFStream: TFileStream;
begin
  inherited;
  try
    if Stream <> nil then
    begin
      Image := TJPEGImage.Create;
      try
        Image.CompressionQuality := FJPEGQuality;
        Image.Assign(FBitmap);
        Image.SaveToStream(Stream);
      finally
        Image.Free;
      end;
    end
    else
    begin
      TFStream := TFileStream.Create(ChangeFileExt(FileName, FFileSuffix + '.jpg'), fmCreate);
      try
        Image := TJPEGImage.Create;
        try
          Image.CompressionQuality := FJPEGQuality;
          Image.Assign(FBitmap);
          Image.SaveToStream(TFStream);
        finally
          Image.Free;
        end;
      finally
        TFStream.Free;
      end;
    end;
  except
    on e: Exception do
      case Report.EngineOptions.NewSilentMode of
        simSilent:        Report.Errors.Add(e.Message);
        simMessageBoxes:  frxErrorMsg(e.Message);
        simReThrow:       raise;
      end;
  end;
end;

{ TfrxGIFExport }

procedure GIFSaveToFile(const FileName: String; const Bitmap: TBitmap);
var
  f: TFileStream;
begin
  f := TFileStream.Create(FileName, fmCreate);
  try
    GIFSaveToStream(f, Bitmap);
  finally
    f.Free;
  end;
end;

procedure GIFSaveToStream(const Stream: TStream; const Bitmap: TBitmap);
var
  w, h: word;
  flags, b: byte;
  i: Integer;
  Palette: array [0..255] of PALETTEENTRY;
  s: AnsiString;
  CountDown: Integer;
  curx, cury: Integer;
  htab: array [0..HSIZE] of longint;
  codetab: array [0..HSIZE] of integer;
  accum: array [0..255] of byte;
  a_count: integer;
  InitCodeSize: Integer;
  g_init_bits: Integer;
  maxcode, free_ent: integer;
  cur_accum: cardinal;
  cur_bits, clear_flg, clearcode, EOFCode, n_bits: Integer;

  function GifNextPixel: Integer;
  var
    P : PByteArray;
  begin
    if CountDown = 0 then
      Result := -1
    else begin
      Dec(CountDown);
      P := Bitmap.ScanLine[cury];
      Result := P[curx];
      Inc(curx);
      if curx = Bitmap.Width then
      begin
        curx := 0;
        Inc(cury);
      end;
    end;
  end;

  procedure Putword(const w: Integer);
  begin
    Stream.Write(w, 2);
  end;

  procedure cl_hash(const hsize: longint);
  var
    i: longint;
  begin
    for i := 0 to hsize - 1 do
      htab[i] := -1;
  end;

  procedure flush_char;
  var
    b: byte;
  begin
    if a_count > 0 then
    begin
      b := byte(a_count);
      Stream.Write(b, 1);
      Stream.Write(accum, a_count);
      a_count := 0;
    end;
  end;

  procedure char_out(c: byte);
  begin
    accum[a_count] := c;
    Inc(a_count);
    if a_count >= 254 then
      flush_char;
  end;

  procedure output(const code: Integer);
  begin
    cur_accum := cur_accum and code_mask[cur_bits];
    if cur_bits > 0  then
      cur_accum := cur_accum or (cardinal(code) shl cur_bits)
    else
      cur_accum := code;
    cur_bits := cur_bits + n_bits;
    while cur_bits >= 8 do
    begin
      char_out(cur_accum and $ff);
      cur_accum := cur_accum shr 8;
      cur_bits := cur_bits - 8;
    end;
    if (free_ent > maxcode) or (clear_flg <> 0) then
    begin
      if clear_flg <> 0 then
      begin
        n_bits := g_init_bits;
        maxcode := (1 shl n_bits) - 1;
        clear_flg := 0;
      end
      else begin
        Inc(n_bits);
        if n_bits = MAXBITSCODES then
          maxcode := 1 shl MAXBITSCODES
        else
          maxcode := (1 shl n_bits) - 1;
      end;
    end;
    if code = EOFCode then
    begin
      while cur_bits > 0 do
      begin
        char_out(cur_accum and $ff);
        cur_accum := cur_accum shr 8;
        cur_bits := cur_bits - 8;
      end;
      flush_char;
    end;
  end;

  procedure compressLZW(const init_bits: Integer);
  var
    fcode, c, ent, hshift, disp, i: longint;
    maxmaxcode: integer;
    label probe;
    label nomatch;
  begin
    g_init_bits := init_bits;
    cur_accum := 0;
    cur_bits := 0;
    clear_flg := 0;
    n_bits := g_init_bits;
    maxcode := (1 shl g_init_bits) - 1;
    maxmaxcode := 1 shl MAXBITSCODES;
    ClearCode := 1 shl (init_bits - 1);
    EOFCode := ClearCode + 1;
    free_ent := ClearCode + 2;
    a_count := 0;
    ent := GifNextPixel;
    hshift := 0;
    fcode := HSIZE;
    while fcode < 65536 do
    begin
      fcode := fcode * 2;
      hshift := hshift + 1;
    end;
    hshift := 8 - hshift;
    cl_hash(HSIZE);
    output(ClearCode);
    c := GifNextPixel;
    while c <> -1 do
    begin
      fcode := longint((longint(c) shl MAXBITSCODES) + ent);
      i := ((c shl hshift) xor ent);
      if HTab[i] = fcode then
      begin
        ent := CodeTab[i];
        c := GifNextPixel;
        continue;
      end
      else if HTab[i] < 0 then
        goto nomatch;
      disp := HSIZE - i;
      if i = 0 then
        disp := 1;
  probe:
      i := i - disp;
      if i < 0  then  i := i + HSIZE;
      if HTab[i] = fcode then
      begin
        ent := CodeTab[i];
        c := GifNextPixel;
        continue;
      end;
      if HTab[i] > 0 then
        goto probe;
  nomatch:
      output(ent);
      ent := c;
      if free_ent < maxmaxcode then
      begin
        CodeTab[i] := free_ent;
        free_ent := free_ent + 1;
        HTab[i] := fcode;
      end
      else begin
        cl_hash(HSIZE);
        free_ent := ClearCode + 2;
        clear_flg := 1;
        output(ClearCode);
      end;
      c := GifNextPixel;
    end;
    output(ent);
    output(EOFCode);
  end;

begin
  Bitmap.PixelFormat := pf8bit;
  Stream.Write(AnsiString('GIF89a'), 6);
  w := Bitmap.Width;
  h := Bitmap.Height;
  Stream.Write(w, 2);
  Stream.Write(h, 2);
  flags := $e7;
  Stream.Write(flags, 1);
  flags := 0;
  Stream.Write(flags, 1);
  Stream.Write(flags, 1);
  GetPaletteEntries(Bitmap.Palette, 0, 256, Palette);
  for i := 0 to 255 do
  begin
    Stream.Write(Palette[i].peRed, 1);
    Stream.Write(Palette[i].peGreen, 1);
    Stream.Write(Palette[i].peBlue, 1);
  end;
  Stream.Write(AnsiString('!'), 1);
  flags := $F9;
  Stream.Write(flags, 1);
  flags := 4;
  Stream.Write(flags, 1);
  flags := 0;
  Stream.Write(flags, 1);
  Stream.Write(flags, 1);
  Stream.Write(flags, 1);
  Stream.Write(flags, 1);
  Stream.Write(flags, 1);
  Stream.Write(AnsiString('!'), 1);
  flags := 254;
  Stream.Write(flags, 1);
  s := 'FastReport';
  flags := Length(s);
  Stream.Write(flags, 1);
  Stream.Write(s[1], flags);
  flags := 0;
  Stream.Write(flags, 1);
  curx := 0;
  cury := 0;
  CountDown := Bitmap.Width * Bitmap.Height;
  Stream.Write(AnsiString(','), 1);
  Putword(0);
  Putword(0);
  Putword(Bitmap.Width);
  Putword(Bitmap.Height);
  flags := 0;
  Stream.Write(flags, 1);
  InitCodeSize := 8;
  b := byte(InitCodeSize);
  Stream.Write(b, 1);
  compressLZW(InitCodeSize + 1);
  flags := 0;
  Stream.Write(flags, 1);
  Stream.Write(AnsiString(';'), 1);
end;


end.

