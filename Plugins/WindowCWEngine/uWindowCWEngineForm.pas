unit uWindowCWEngineForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm,
  Dialogs, uUtils, ExtCtrls, CPort, CPortCtl, JvComponentBase, Spin,
  JvFormPlacement, ActnList, Menus, uCWEngineMessages, JclShell, Tlhelp32,
  ButtonGroup, CategoryButtons, ComCtrls, ToolWin, JvExComCtrls, JvToolBar,
  Buttons, JvXPCore, JvXPButtons, JvgSpeedButton;

const
  ButtonLeftOffset = 2;
  ButtonTopOffset = 2;

type
  TWindowCWEngineForm = class(TWindowPluginForm)
    edtText: TEdit;
    seSpeed: TSpinEdit;
    FormStorageOnExit: TJvFormStorage;
    alCWEngineMacros: TActionList;
    alCWEngine: TActionList;
    aCWEngineCancelSent: TAction;
    pnlSpeed: TPanel;
    pnlText: TPanel;
    aCWEngineSpeedUp: TAction;
    aCWEngineSpeedDown: TAction;
    pnlTop: TPanel;
    pnlButtons: TPanel;
    procedure edtTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure seSpeedChange(Sender: TObject);
    procedure aCWEngineCancelSentExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure aCWEngineSpeedUpExecute(Sender: TObject);
    procedure aCWEngineSpeedDownExecute(Sender: TObject);
    procedure ButtonGroup1Items0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonGroup1DrawButton(Sender: TObject; Index: Integer; Canvas: TCanvas; Rect: TRect; State: TButtonDrawState);
    procedure ButtonGroup1BeforeDrawButton(Sender: TObject; Index: Integer; Canvas: TCanvas; Rect: TRect; State: TButtonDrawState);
    procedure ToolBar1AdvancedCustomDrawButton(Sender: TToolBar; Button: TToolButton; State: TCustomDrawState; Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags; var DefaultDraw: Boolean);
    procedure pnlButtonsResize(Sender: TObject);
  private
    CWEngineHandle: THandle;
    bRunninig: Boolean;
    ButtonCount: Integer;

    procedure SetSpeed(Speed: Integer);
    procedure OnFinish(Sender: TObject);
    procedure MacrosExecute(Sender: TObject);
    function ReplaceMacros(Str: string): string;
    procedure TransmitComplete(var Msg: TMessage); message CW_TRANSMIT_COMPLETE;
    procedure RebuildButtons;
    procedure RealignButtons;
    procedure ButtonClick(Sender: TObject);
    procedure ButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    procedure Init;
    procedure DeInit;
    procedure OptionsChanged;
    procedure CancelQSO;
    procedure SentCW(Macros: string);
  end;

var
  WindowCWEngineForm: TWindowCWEngineForm;

implementation

uses uWindowCWEngine;
{$R *.dfm}

procedure RunProgram(const ClientName: string; WaitForInput: Boolean; WaitForClose: Boolean);
var
  si: STARTUPINFO;
  pi: PROCESS_INFORMATION;
begin
  ZeroMemory(@si, sizeof(si));
  si.cb := sizeof(si);
  if not CreateProcess(nil, PChar(ClientName), nil, nil, false, 0, nil, nil, si, pi) then
    raiseLastOSError;
  CloseHandle(pi.hThread);
  try
    if WaitForInput then
      WaitForInputIdle(pi.hProcess, INFINITE);
    if WaitForClose then
      while WaitForSingleObject(pi.hProcess, 1000) = WAIT_TIMEOUT do
        { Update } ;
  finally
    CloseHandle(pi.hProcess);
  end;
end;

function GetProcessId(pName: PChar): dword;
var
  Snap: dword;
  Process: TPROCESSENTRY32;
begin
  Result := 0;
  Snap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Snap <> INVALID_HANDLE_VALUE then
  begin
    Process.dwSize := sizeof(TPROCESSENTRY32);
    if Process32First(Snap, Process) then
      repeat
        if lstrcmpi(Process.szExeFile, pName) = 0 then
        begin
          Result := Process.th32ProcessID;
          CloseHandle(Snap);
          Exit;
        end;
      until not Process32Next(Snap, Process);
      Result := 0;
    CloseHandle(Snap);
  end;
end;

function SetPriority(ExeName: string; PRIORITY_CLASS: Cardinal): Boolean;
var
  q: Cardinal;
begin
  q := openprocess(PROCESS_SET_INFORMATION, false, GetProcessId(PChar(ExeName)));
  Result := SetPriorityClass(q, PRIORITY_CLASS);
  CloseHandle(q);
end;

procedure TWindowCWEngineForm.SetSpeed(Speed: Integer);
begin
  SendMessage(CWEngineHandle, CW_SETSPEED, Speed, 0);
end;

procedure TWindowCWEngineForm.edtTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key <> VK_SHIFT) and (Key <> VK_CONTROL) and (Key <> 18) then
    SendMessage(CWEngineHandle, CW_SENDSYMBOL, Key, 0);
end;

procedure TWindowCWEngineForm.FormActivate(Sender: TObject);
begin
  if edtText.CanFocus then
    edtText.SetFocus;
end;

procedure TWindowCWEngineForm.FormCreate(Sender: TObject);
begin
  // ButtonGroup1.Items[1].
end;

procedure TWindowCWEngineForm.FormResize(Sender: TObject);
begin
  edtText.Width := pnlText.Width;
  edtText.Height := seSpeed.Height;
  pnlTop.Height := edtText.Height;
end;

procedure TWindowCWEngineForm.Init;
var
  FileName: string;
begin
  FileName := ExtractFilePath(GetDllFileName) + 'CWEngine.exe';
  CWEngineHandle := 0;
  CWEngineHandle := FindWindow(nil, 'CWEngineForm');
  if CWEngineHandle = 0 then
    if FileExists(FileName) then
      RunProgram(FileName, true, false);
  CWEngineHandle := FindWindow(nil, 'CWEngineForm');
  // SetPriority(GetProcessId('CWEngine'),REALTIME_PRIORITY_CLASS);
  SetPriority(FileName, REALTIME_PRIORITY_CLASS);
end;

procedure TWindowCWEngineForm.DeInit;
begin
  SendMessage(CWEngineHandle, CW_EXIT, 1, 0);
end;

procedure TWindowCWEngineForm.OptionsChanged;
var
  i: Integer;
  Action: TAction;
begin
  edtText.Height := seSpeed.Height;

  SetSpeed(seSpeed.Value);
  if WindowCWEngineSettingsFrame.cbComPort.Text <> '' then
    SendMessage(CWEngineHandle, CW_SETPORT, StrToInt(Copy(WindowCWEngineSettingsFrame.cbComPort.Text, 4, Length(WindowCWEngineSettingsFrame.cbComPort.Text) - 3)), Handle);

  SendMessage(CWEngineHandle, CW_SETCWSIGNAL, WindowCWEngineSettingsFrame.cbKey.ItemIndex, Handle);
  SendMessage(CWEngineHandle, CW_SETPTTSIGNAL, WindowCWEngineSettingsFrame.cbPTT.ItemIndex, Handle);

  for i := 0 to alCWEngineMacros.ActionCount - 1 do
    alCWEngineMacros.Actions[0].Free;

  WindowCWEngineSettingsFrame.cdsCWEngineMacros.DisableControls;
  try
    WindowCWEngineSettingsFrame.cdsCWEngineMacros.First;
    while not WindowCWEngineSettingsFrame.cdsCWEngineMacros.Eof do
    begin
      Action := TAction.Create(Self);
      Action.Name := 'CWEngineMacros' + IntToStr(alCWEngineMacros.ActionCount + 1);
      Action.Caption := WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').asString;
      Action.ShortCut := TextToShortCut(WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').asString);
      Action.OnExecute := MacrosExecute;
      Action.HelpKeyword := WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').asString;
      Action.Tag := -1;
      Action.ActionList := alCWEngineMacros;
      WindowCWEngineSettingsFrame.cdsCWEngineMacros.Next;
    end;
  finally
    WindowCWEngineSettingsFrame.cdsCWEngineMacros.First;
    WindowCWEngineSettingsFrame.cdsCWEngineMacros.EnableControls;
  end;
  RebuildButtons;
end;

procedure TWindowCWEngineForm.pnlButtonsResize(Sender: TObject);
begin
  RealignButtons;
end;

function TWindowCWEngineForm.ReplaceMacros(Str: string): string;
var
  i: Integer;
  iTagOpen, iTagClose: Integer;
  slMacros: TStringList;
  sIdentifier: string;
begin
  iTagOpen := 0;
  slMacros := TStringList.Create;
  try

    for i := 1 to Length(Str) do
    begin
      if Str[i] = '[' then
        iTagOpen := i;
      if (Str[i] = '~') { and (i=iTagOpen+1) } then
        iTagOpen := 0;
      if (Str[i] = ']') and (iTagOpen > 0) then
      begin
        sIdentifier := Copy(Str, iTagOpen + 1, i - iTagOpen - 1);
        if UpperCase(sIdentifier) = 'RN' then
        begin
          slMacros.Add('RN=' + StringReplace(ldsLogEdit.DataSet.FieldByName('LOG_RST_SENT').asString, '9', 'N', [rfReplaceAll, rfIgnoreCase]));
          continue;
        end;
        try
          slMacros.Add(sIdentifier + '=' + ldsLogEdit.DataSet.FieldByName('LOG_' + sIdentifier).asString);
        except
        end;
      end;
    end;
    for i := 0 to slMacros.Count - 1 do
      Str := StringReplace(Str, '[' + slMacros.Names[i] + ']', slMacros.Values[slMacros.Names[i]], [rfReplaceAll, rfIgnoreCase]);
  finally
    slMacros.Free;
  end;
  Result := Str;
end;

procedure TWindowCWEngineForm.MacrosExecute(Sender: TObject);
var
  stringToSend: string;
  copyDataStruct: TCopyDataStruct;
  res: Integer;
begin
  stringToSend := ReplaceMacros(TAction(Sender).HelpKeyword);
  copyDataStruct.dwData := 0; // use it to identify the message contents
  copyDataStruct.cbData := (Length(stringToSend) + 1) * sizeof(Char);
  copyDataStruct.lpData := PChar(stringToSend);
  res := SendMessage(CWEngineHandle, WM_COPYDATA, Integer(Handle), Integer(@copyDataStruct));
end;

procedure TWindowCWEngineForm.seSpeedChange(Sender: TObject);
begin
  SetSpeed(seSpeed.Value);
end;

procedure TWindowCWEngineForm.OnFinish(Sender: TObject);
begin
end;

procedure TWindowCWEngineForm.SentCW(Macros: string);
begin
end;

procedure TWindowCWEngineForm.aCWEngineCancelSentExecute(Sender: TObject);
begin
  SendMessage(CWEngineHandle, CW_CANCEL_SEND, 0, 0);
  // CancelQSO;
end;

procedure TWindowCWEngineForm.aCWEngineSpeedDownExecute(Sender: TObject);
begin
  seSpeed.Value := seSpeed.Value - 1;
  SetSpeed(seSpeed.Value);
end;

procedure TWindowCWEngineForm.aCWEngineSpeedUpExecute(Sender: TObject);
begin
  seSpeed.Value := seSpeed.Value + 1;
  SetSpeed(seSpeed.Value);
end;

procedure TWindowCWEngineForm.ButtonGroup1BeforeDrawButton(Sender: TObject; Index: Integer; Canvas: TCanvas; Rect: TRect; State: TButtonDrawState);
begin
  if index = 0 then
    Canvas.Brush.Color := clRed;
end;

procedure TWindowCWEngineForm.ButtonGroup1DrawButton(Sender: TObject; Index: Integer; Canvas: TCanvas; Rect: TRect; State: TButtonDrawState);
begin
  if index = 0 then
  begin
    Canvas.Brush.Color := clRed;
    // DrawFocusRect(Rect);
    // TextOut(Rect.Left, Rect.Top, ButtonGroup1.Items[Index].Caption);
  end;
end;

procedure TWindowCWEngineForm.ButtonGroup1Items0Click(Sender: TObject);
begin
  ShowMessage('sss');
end;

procedure TWindowCWEngineForm.CancelQSO;
begin
  { if not bRunninig then exit;
    bTerminated := True;
    thrCWSent.Terminate; }
end;

procedure TWindowCWEngineForm.ToolBar1AdvancedCustomDrawButton(Sender: TToolBar; Button: TToolButton; State: TCustomDrawState; Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags; var DefaultDraw: Boolean);
var
  Brect, BTrect, R: TRect;
  CurrentColor: TColor;
  W, H: Integer;
  Text: string;
begin
  Sender.Canvas.Font.Size := 10;
  W := Sender.Canvas.TextWidth(Button.Caption);
  H := Sender.Canvas.TextHeight(Button.Caption);

  Brect.Left := Button.BoundsRect.Left + 1;
  Brect.Right := Button.BoundsRect.Right - 1;
  Brect.Top := Button.BoundsRect.Top + 1;
  Brect.Bottom := Button.BoundsRect.Bottom - 1;

  BTrect.Left := Button.BoundsRect.Left + 2;
  BTrect.Right := Button.BoundsRect.Right - 2;
  BTrect.Top := Button.BoundsRect.Top + 2;
  BTrect.Bottom := Button.BoundsRect.Bottom - 2;

  if cdsHot in State then
    Sender.Canvas.Brush.Color := clWhite
  else
  begin
    if Button.Tag = 1 then
      Sender.Canvas.Brush.Color := cllime
    else
      Sender.Canvas.Brush.Color := clBtnFace;
  end;
  Sender.Canvas.FloodFill(Brect.Left + 1, Brect.Top + 1, CurrentColor, fsSurface);
  RoundRect(Sender.Canvas.Handle, Brect.Left, Brect.Top, Brect.Right, Brect.Bottom, 5, 5);
  Text := Button.Caption;
  Sender.Canvas.TextRect(BTrect, Text, [tfSingleLine, tfCenter, tfVerticalCenter, tfEndEllipsis]);
  DefaultDraw := false;
end;

procedure TWindowCWEngineForm.TransmitComplete(var Msg: TMessage);
begin
  bRunninig := false;
end;

procedure TWindowCWEngineForm.RebuildButtons;
var
  Button: TJvgSpeedButton;
  i: Integer;
begin
  ButtonCount := 0;
  for i := 0 to pnlButtons.ComponentCount - 1 do
    pnlButtons.Components[0].Free;
  WindowCWEngineSettingsFrame.cdsCWEngineMacros.DisableControls;
  WindowCWEngineSettingsFrame.cdsCWEngineMacros.First;
  while not WindowCWEngineSettingsFrame.cdsCWEngineMacros.Eof do
  begin
    Button := TJvgSpeedButton.Create(pnlButtons);
    Button.Parent := pnlButtons;
    Button.Width := 65;
    Button.Height := 22;
    Button.Flat := true;
    Button.OnClick := ButtonClick;
    Button.OnMouseDown:=ButtonMouseDown;
    Button.Caption := WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').asString + ' ' + WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').asString;
    Button.HelpKeyword := WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').asString;
    Button.Tag := WindowCWEngineSettingsFrame.cdsCWEngineMacros.RecNo;
    if WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').asString <> '' then
      Button.Color := HexToColor(WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').asString);
    WindowCWEngineSettingsFrame.cdsCWEngineMacros.Next;
  end;
  WindowCWEngineSettingsFrame.cdsCWEngineMacros.EnableControls;
  RealignButtons;
end;

procedure TWindowCWEngineForm.RealignButtons;
var
  i: Integer;
  TotalWidth: Integer;
  CurrentTop, CurrentLeft: Integer;
  Button: TJvgSpeedButton;
  CountInLine: Integer;
begin
  TotalWidth := ButtonLeftOffset;
  CurrentTop := ButtonTopOffset;
  CurrentLeft := ButtonLeftOffset;
  CountInLine := 0;
  for i := 0 to pnlButtons.ComponentCount - 1 do
  begin
    Button := TJvgSpeedButton(pnlButtons.Components[i]);
    CurrentLeft := ButtonLeftOffset + (CountInLine * (Button.Width + 1));
    inc(CountInLine);
    TotalWidth := TotalWidth + Button.Width + 1;

    if TotalWidth + 1 > pnlButtons.Width then
    begin
      CurrentTop := CurrentTop + Button.Height + 1;
      CountInLine := 0;
      TotalWidth:=0;
      CurrentLeft := ButtonLeftOffset + (CountInLine * (Button.Width + 1));
      CountInLine := 1;
      TotalWidth:=TotalWidth + Button.Width + 1;
    end;
    Button.Left := CurrentLeft;
    Button.Top := CurrentTop;
  end;
end;

procedure TWindowCWEngineForm.ButtonClick(Sender: TObject);
var
  stringToSend: string;
  copyDataStruct: TCopyDataStruct;
  res: Integer;
begin
  stringToSend := ReplaceMacros(TJvgSpeedButton(Sender).HelpKeyword);
  copyDataStruct.dwData := 0; // use it to identify the message contents
  copyDataStruct.cbData := (Length(stringToSend) + 1) * sizeof(Char);
  copyDataStruct.lpData := PChar(stringToSend);
  res := SendMessage(CWEngineHandle, WM_COPYDATA, Integer(Handle), Integer(@copyDataStruct));
end;



procedure TWindowCWEngineForm.ButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 aButton:TJvgSpeedButton;
begin
  if Button=mbRight then
  begin
    aButton:=TJvgSpeedButton(Sender);
    WindowCWEngineSettingsFrame.cdsCWEngineMacros.RecNo := aButton.Tag;
    WindowCWEngineSettingsFrame.CWEngine_aEditMacros.OnExecute(Self);
    aButton.Caption := WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').asString + ' ' + WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').asString;
    aButton.HelpKeyword := WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').asString;
    aButton.Tag := WindowCWEngineSettingsFrame.cdsCWEngineMacros.RecNo;
    if WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').asString <> '' then
      aButton.Color := HexToColor(WindowCWEngineSettingsFrame.cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').asString);
    WindowCWEngineSettingsFrame.FormStorage.SaveFormPlacement;
    Abort;
  end;
end;

end.
