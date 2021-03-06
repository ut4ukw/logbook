unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCWEngineMessages, StdCtrls;

type
  TForm6 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure SendString();
   procedure SendData(const copyDataStruct: TCopyDataStruct);
    procedure TransmitComplete(var Msg: TMessage); message CW_TRANSMIT_COMPLETE;


  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.SendData(const copyDataStruct: TCopyDataStruct);
var
  receiverHandle: THandle;
  res: integer;
begin
  receiverHandle := FindWindow(nil, 'CWEngineForm');
  if receiverHandle = 0 then
  begin
    ShowMessage('CopyData Receiver NOT found!');
    Exit;
  end;

  res := SendMessage(receiverHandle, WM_COPYDATA, integer(Handle), integer(@copyDataStruct));
end;

procedure TForm6.TransmitComplete(var Msg: TMessage);
begin
  ShowMessage('ddd');
end;


procedure TForm6.SendString();
var
  stringToSend: string;
  copyDataStruct: TCopyDataStruct;
begin
  stringToSend := 'UT4UKW';

  copyDataStruct.dwData := 0; // use it to identify the message contents
  copyDataStruct.cbData := (length(stringToSend)+1) * SizeOf(Char);
  copyDataStruct.lpData := PChar(stringToSend);

  SendData(copyDataStruct);
end;

procedure TForm6.Button1Click(Sender: TObject);
var
  wnd: THandle;
  txt: AnsiString;
begin
  wnd := FindWindow(nil, 'CWEngineForm');
  SendMessage(wnd, CW_SETPORT, 8, Handle);
  SendMessage(wnd, CW_SETSPEED, 25, 0);
  SendMessage(wnd, CW_SETCWSIGNAL, 1, 0);
  SendString();


{  wnd := FindWindow(nil, 'CWEngineForm');
  /// SendMessage(wnd, CW_OPENPORT, 1,0);
  txt := 'Hello World';
  SendMessage(wnd, CW_SENDMACROS, 0, DWORD(PChar(txt)));}
end;

end.

