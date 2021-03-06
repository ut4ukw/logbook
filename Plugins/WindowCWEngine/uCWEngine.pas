unit uCWEngine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCWEngineMessages, CPort, JvComponentBase, JvThread, ExtCtrls;

type

  TSignal = (siNone, siDTR, siRTS);

  TCWEngineForm = class(TForm)
    ComPort: TComPort;
    timSend: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure timSendTimer(Sender: TObject);
  private
    FCOMPortActive: boolean;
    FSpeed: integer;
    FCWSignal: TSignal;
    FPTTSignal: TSignal;
    FDurationPoint: integer;
    FDurationDash: integer;
    FDurationBlank: integer;
    FWords: TStringList;
    FSymbols: TStringList;
    FCharBuff: TStringList;
    FMacros: TStringList;
    FRunninig: boolean;
    FTerminated: boolean;
    FIsMacros: boolean;
    FCurrMacros: string;
    FCurrPos: integer;
    FComPort: string;
    FApplicationHandle: THandle;

    procedure Delay(Value: Cardinal);
    procedure InternalSetSpeed(aSpeed: integer);
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    procedure SetPort(var Msg: TMessage); message CW_SETPORT;
    procedure SetSpeed(var Msg: TMessage); message CW_SETSPEED;
    procedure SetCWSignal(var Msg: TMessage); message CW_SETCWSIGNAL;
    procedure SetPTTSignal(var Msg: TMessage); message CW_SETPTTSIGNAL;
    procedure SendSymbol(var Msg: TMessage); message CW_SENDSYMBOL;
    procedure CancelSend(var Msg: TMessage); message CW_CANCEL_SEND;
    procedure Exit(var Msg: TMessage); message CW_EXIT;
  end;

var
  CWEngineForm: TCWEngineForm;

implementation

{$R *.dfm}

procedure TCWEngineForm.Delay(Value: Cardinal);
var
  F, N: Cardinal;
var
  oldTime: LongInt;
begin
  Sleep(Value);
end;

procedure TCWEngineForm.InternalSetSpeed(aSpeed: integer);
begin
  if aSpeed = 0 then
    aSpeed := 5;
  FSpeed := aSpeed;
  FDurationPoint := Round(1200 / FSpeed);
  FDurationDash := FDurationPoint * 3;
  FDurationBlank := FDurationPoint;
end;

procedure TCWEngineForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FWords.Free;
  FSymbols.Free;
  FCharBuff.Free;
  FMacros.Free;
end;

procedure TCWEngineForm.FormCreate(Sender: TObject);
begin
  Application.ShowMainForm := False;
  FWords := TStringList.Create;
  FWords.Delimiter := ' ';
  FSymbols := TStringList.Create;
  FCharBuff := TStringList.Create;
  FMacros := TStringList.Create;
  FSymbols.Add('A=01');
  FSymbols.Add('B=1000');
  FSymbols.Add('C=1010');
  FSymbols.Add('D=100');
  FSymbols.Add('E=0');
  FSymbols.Add('F=0010');
  FSymbols.Add('G=110');
  FSymbols.Add('H=0000');
  FSymbols.Add('I=00');
  FSymbols.Add('J=0111');
  FSymbols.Add('K=101');
  FSymbols.Add('L=0100');
  FSymbols.Add('M=11');
  FSymbols.Add('N=10');
  FSymbols.Add('O=111');
  FSymbols.Add('P=0110');
  FSymbols.Add('Q=1101');
  FSymbols.Add('R=010');
  FSymbols.Add('S=000');
  FSymbols.Add('T=1');
  FSymbols.Add('U=001');
  FSymbols.Add('V=0001');
  FSymbols.Add('W=011');
  FSymbols.Add('X=1001');
  FSymbols.Add('Y=1011');
  FSymbols.Add('Z=1100');
  FSymbols.Add('1=01111');
  FSymbols.Add('2=00111');
  FSymbols.Add('3=00011');
  FSymbols.Add('4=00001');
  FSymbols.Add('5=00000');
  FSymbols.Add('6=10000');
  FSymbols.Add('7=11000');
  FSymbols.Add('8=11100');
  FSymbols.Add('9=11110');
  FSymbols.Add('0=11111');
  FSymbols.Add('/=10010');
  FSymbols.Add('?=001100');
end;

procedure TCWEngineForm.SetPort(var Msg: TMessage);
begin
  FComPort := 'COM' + IntToStr(Msg.WParam);
  FApplicationHandle := Msg.LParam;
  ComPort.Port := FComPort;
  try
  ComPort.Open;
  except

  end;
end;

procedure TCWEngineForm.SetSpeed(var Msg: TMessage);
begin
  InternalSetSpeed(Msg.WParam);
end;

procedure TCWEngineForm.timSendTimer(Sender: TObject);
var
  iEscapeStart: integer;
  sEscapeTag: string;

  procedure CharSent(Ch: char);
  var
    val: string;
    k: integer;
  begin
    if Ch = ' ' then
      Delay(FDurationBlank)
    else
    begin
      val := FSymbols.Values[Ch];
      if val <> '' then
      begin
        for k := 1 to Length(val) do
        begin
          if FCWSignal = siDTR then
            ComPort.SetDTR(True);
          if FCWSignal = siRTS then
            ComPort.SetRTS(True);

          case val[k] of
            '0':
              Delay(FDurationPoint);
            '1':
              Delay(FDurationDash);
          end;
          if FCWSignal = siDTR then
            ComPort.SetDTR(False);
          if FCWSignal = siRTS then
            ComPort.SetRTS(False);
          Delay(FDurationBlank);
        end;
      end;
    end;
  end;

  procedure WordsSent;
  var
    i, j: integer;
  begin
    for i := 0 to FWords.Count - 1 do
    begin
      Application.ProcessMessages;
      if FTerminated then
        break;
      if FWords.Strings[i][1] = '~' then
      begin
        if UpperCase(FWords.Strings[i][2]) = 'S' then
          InternalSetSpeed(StrToInt(Copy(FWords.Strings[i], 3, Length(FWords.Strings[i]) - 2)));
        continue;
      end;

      for j := 1 to Length(FWords.Strings[i]) do
      begin
        Application.ProcessMessages;
        if FTerminated then
          break;
        CharSent(FWords.Strings[i][j]);
        if j < Length(FWords.Strings[i]) then
          Delay(FDurationBlank);
      end;
      if i < FWords.Count - 1 then
      begin
        if FTerminated then
          break;
        Delay(FDurationBlank);
        Delay(FDurationBlank);
        Delay(FDurationBlank);
        Delay(FDurationBlank);
        Delay(FDurationBlank);
      end;
    end;
  end;

begin
  if (FMacros.Count > 0) and not FRunninig then
  begin
    iEscapeStart := 0;
    sEscapeTag := '';
    if not FTerminated then
    begin
      FRunninig := True;
      FWords.Clear;
      FWords.DelimitedText := FMacros[0];
      Inc(FCurrPos);
      WordsSent;
      Application.ProcessMessages;
      if not FTerminated then
      begin
        Delay(FDurationBlank);
        if FMacros.Count > 0 then
          FMacros.Delete(0);
        FCharBuff.Clear;
        FCurrPos := 0;
      end;
      if FApplicationHandle <> 0 then
        SendMessage(FApplicationHandle, CW_TRANSMIT_COMPLETE, 0, 0);
      FRunninig := False;
    end;
  end;
end;

procedure TCWEngineForm.SetCWSignal(var Msg: TMessage);
begin
  case Msg.WParam of
    0:
      FCWSignal := siNone;
    1:
      FCWSignal := siDTR;
    2:
      FCWSignal := siRTS;
  end;
end;

procedure TCWEngineForm.SetPTTSignal(var Msg: TMessage);
begin
  case Msg.WParam of
    0:
      FPTTSignal := siNone;
    1:
      FPTTSignal := siDTR;
    2:
      FPTTSignal := siRTS;
  end;
end;

procedure TCWEngineForm.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  FTerminated := False;
  if FMacros.Count > 0 then
    FMacros.Add(' ' + PChar(Msg.CopyDataStruct.lpData))
  else
    FMacros.Add(PChar(Msg.CopyDataStruct.lpData));
  Msg.Result := 2006;
end;

procedure TCWEngineForm.SendSymbol(var Msg: TMessage);
begin
  FTerminated := False;
  if Msg.WParam = 191 then
    FMacros.Add('?')
  else
    FMacros.Add(Chr(Msg.WParam));
end;

procedure TCWEngineForm.CancelSend(var Msg: TMessage);
begin
  FMacros.Clear;
  FTerminated := True;
end;

procedure TCWEngineForm.Exit(var Msg: TMessage);
begin
  FTerminated := True;
  Sleep(1000);
  ComPort.Close;
  ComPort.Free;
  Close;
end;

end.
