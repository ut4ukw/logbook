unit Ping;

interface

uses
  Windows, SysUtils, Classes;

function PingHost(InetAddress : string) : Boolean;

implementation

uses
  WinSock;

type
  TSunB = packed record
    s_b1, s_b2, s_b3, s_b4: byte;
  end;

  TSunW = packed record
    s_w1, s_w2: word;
  end;

  PIPAddr = ^TIPAddr;
  TIPAddr = record
    case integer of
      0: (S_un_b: TSunB);
      1: (S_un_w: TSunW);
      2: (S_addr: longword);
  end;
  IPAddr = TIPAddr;

type
  IP_OPTION_INFORMATION = record
    Ttl: Byte;          // Time To Live
    Tos: Byte;          // Type Of Service
    Flags: Byte;        // IP header flags
    OptionsSize: Byte;  // Size in bytes of options data
    OptionsData: PByte; // Pointer to options data
  end;
  PIP_OPTION_INFORMATION = ^IP_OPTION_INFORMATION;
  TIpOptionInformation = IP_OPTION_INFORMATION;
  PIpOptionInformation = PIP_OPTION_INFORMATION;

type
  ICMP_ECHO_REPLY = record
    Address: IPAddr;      // Replying address
    Status: ULONG;        // Reply IP_STATUS
    RoundTripTime: ULONG; // RTT in milliseconds
    DataSize: Word;     // Reply data size in bytes
    Reserved: Word;     // Reserved for system use
    Data: Pointer;         // Pointer to the reply data
    Options: IP_OPTION_INFORMATION; // Reply options
  end;
  PICMP_ECHO_REPLY = ^ICMP_ECHO_REPLY;
  TIcmpEchoReply = ICMP_ECHO_REPLY;
  PIcmpEchoReply = PICMP_ECHO_REPLY;

function IcmpCreateFile : THandle; stdcall; external 'icmp.dll';
function IcmpCloseHandle (icmpHandle : THandle) : boolean;
  stdcall; external 'icmp.dll'
function IcmpSendEcho
   (IcmpHandle : THandle; DestinationAddress : IPAddr;
    RequestData : Pointer; RequestSize : Smallint;
    RequestOptions : pointer;
    ReplyBuffer : Pointer;
    ReplySize : DWORD;
    Timeout : DWORD) : DWORD; stdcall; external 'icmp.dll';

function Fetch(var AInput: string;
  const ADelim: string = ' '; const ADelete: Boolean = true): string;
var
  iPos: Integer;
begin
  if ADelim = #0 then begin
    // AnsiPos does not work with #0
    iPos := Pos(ADelim, AInput);
  end else begin
    iPos := Pos(ADelim, AInput);
  end;
  if iPos = 0 then begin
    Result := AInput;
    if ADelete then begin
      AInput := '';
    end;
  end else begin
    result := Copy(AInput, 1, iPos - 1);
    if ADelete then begin
      Delete(AInput, 1, iPos + Length(ADelim) - 1);
    end;
  end;
end;

procedure TranslateStringToTInAddr(AIP: AnsiString; var AInAddr);
var
  phe: PHostEnt;
  pac: PAnsiChar;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);
  try
    phe := GetHostByName(PAnsiChar(AIP));
    if Assigned(phe) then
    begin
      pac := phe^.h_addr_list^;
      if Assigned(pac) then
      begin
        with TIPAddr(AInAddr).S_un_b do begin
          s_b1 := Byte(pac[0]);
          s_b2 := Byte(pac[1]);
          s_b3 := Byte(pac[2]);
          s_b4 := Byte(pac[3]);
        end;
      end
      else
      begin
        raise Exception.Create('Error getting IP from HostName');
      end;
    end
    else
    begin
      raise Exception.Create('Error getting HostName');
    end;
  except
    FillChar(AInAddr, SizeOf(AInAddr), #0);
  end;
  WSACleanup;
end;

function PingHost(InetAddress: string) : Boolean;
const
  IP_SUCCESS = 0;
var
 Handle : THandle;
 InAddr : IPAddr;
 DW : DWORD;
 sAnsiAddress: AnsiString;
 Icmp: ICMP_ECHO_REPLY;
begin
  Result := False;
  Handle := IcmpCreateFile;
  if Handle = INVALID_HANDLE_VALUE then
    Exit;

  sAnsiAddress := AnsiString(InetAddress);
  TranslateStringToTInAddr(sAnsiAddress, InAddr);
  DW := IcmpSendEcho(Handle, InAddr, nil, 0, nil, @Icmp, SizeOf(ICMP_ECHO_REPLY), 5000);
  Result := (DW <> 0) and (Icmp.Status = IP_SUCCESS);
  IcmpCloseHandle(Handle);
end;

end.
