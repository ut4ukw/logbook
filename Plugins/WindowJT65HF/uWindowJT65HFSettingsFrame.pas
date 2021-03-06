unit uWindowJT65HFSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, ACS_Classes, ACS_DXAudio,
  ExtCtrls, Spin, Mask, JvExMask, JvToolEdit,uUtils, ShlObj;

type
  TWindowJT65HFSettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    WindowJT65HF_cbStartOnLoad: TCheckBox;
    WindowJT65HF_lbCsvFiles: TLabel;
    WindowJT65HF_deCsvFiles: TJvDirectoryEdit;
    WindowJT65HF_spTimeShowHstory: TSpinEdit;
    WindowJT65HF_lbTimeShowHistory: TLabel;
    WindowJT65HF_cbNewOneOnlyJT65HF: TCheckBox;
    WindowJT65HF_feExeFile: TJvFilenameEdit;
    WindowJT65HF_cbCaptureClipboard: TCheckBox;
    WindowJT65HF_cbSaveAfterEnd: TCheckBox;
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
  private
  public
  end;

implementation

uses uWindowJT65HFForm;


{$R *.dfm}



procedure TWindowJT65HFSettingsFrame.FormStorageAfterRestorePlacement(
  Sender: TObject);

function LocalAppDataPath : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MaxChar] of char;
begin
  SHGetFolderPath(0,CSIDL_LOCAL_APPDATA,0,SHGFP_TYPE_CURRENT,@path[0]);
  Result := StrPas(path);
end;

begin
  if Trim(WindowJT65HF_deCsvFiles.Directory)='' then
    WindowJT65HF_deCsvFiles.Directory:=LocalAppDataPath+'\JT65-HF';
  if WindowJT65HF_spTimeShowHstory.Value=0 then
    WindowJT65HF_spTimeShowHstory.Value:=30;
end;

end.
