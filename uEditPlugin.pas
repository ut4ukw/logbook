unit uEditPlugin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrlsEh, StdCtrls, JvExMask, JvToolEdit, JvBaseEdits,
  JvDBControls, ExtCtrls, JvExControls, JvDBLookup, DBCtrls, ComCtrls,
  JvExStdCtrls, JvButton, JvCtrls, JvFooter, JvExExtCtrls, JvExtComponent, DB,
  uUtils, KDaoTable, JvMemoryDataset;

type
  TString = class
  private
    fStr: String;
  public
    constructor Create(const AStr: String);
    property Str: String read fStr write fStr;
  end;

  TEditPlugin = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    cbPlugins: TComboBox;
    lbPlugin: TLabel;
    cbScript: TComboBox;
    lbScript: TLabel;
    procedure cbPluginsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    vKey: char;
    OldCall: string;
  public
    isEdit: boolean;
    PluginName: string;
    procedure GetPlugins(bAll: boolean);
    procedure GetScripts(PluginName: string);
  end;

var
  EditPlugin: TEditPlugin;

implementation

uses udmMain, uOptions, uMainWindow;
{$R *.dfm}

constructor TString.Create(const AStr: String);
begin
  inherited Create;
  fStr := AStr;
end;

procedure TEditPlugin.cbPluginsClick(Sender: TObject);
begin
  btnOk.Enabled := Trim(cbPlugins.Text) <> '';
  PluginName := TString(cbPlugins.Items.Objects[cbPlugins.ItemIndex]).Str;
  GetScripts(PluginName);
end;

procedure TEditPlugin.FormClose(Sender: TObject; var Action: TCloseAction);
var
  j: integer;
begin
  for j := 0 to cbPlugins.Items.Count - 1 do
  begin
    TString(cbPlugins.Items.Objects[j]).Free;
    cbPlugins.Items.Objects[j] := nil;
  end;
end;

procedure TEditPlugin.GetPlugins(bAll: boolean);
var
  slFiles: TStringList;
  i: integer;
  sFileName: string;
  h: tHandle;
  wfd: tWin32FindData;
  PluginCaption: string;
  ostr: TString;
begin
  Options.cdsPlugins.DisableControls;
  slFiles := TStringList.Create;
  try
    cbPlugins.Items.Clear;
    h := Windows.FindFirstFile(PChar(ExtractFilePath(Application.ExeName) + 'Plugins\*.*'), wfd);
    try
      if h <> INVALID_HANDLE_VALUE then
      begin
        repeat
          if (wfd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY then
          begin
            sFileName := wfd.cFileName;
            if Length(sFileName) > 0 then
              if sFileName[1] <> '.' then
              begin
                if not bAll then
                begin
                  Options.cdsPlugins.First;
                  if not Options.cdsPlugins.Locate('PLUGIN_NAME', sFileName, []) then
                  begin
                    PluginCaption := MainWindow.Translator.GetCaption(sFileName + 'Form', sFileName + 'Form');
                    if PluginCaption = '' then
                      PluginCaption := MainWindow.Translator.GetCaption('Options', sFileName);
                    ostr := TString.Create(sFileName);
                    cbPlugins.Items.AddObject(PluginCaption, ostr);
                  end;
                end
                else
                begin
                  PluginCaption := MainWindow.Translator.GetCaption(sFileName + 'Form', sFileName + 'Form');
                  if PluginCaption = '' then
                    PluginCaption := MainWindow.Translator.GetCaption('Options', sFileName);
                  ostr := TString.Create(sFileName);
                  cbPlugins.Items.AddObject(PluginCaption, ostr);
                end;
              end;
          end;
        until not Windows.FindNextFile(h, wfd);
      end;
      // проверка кода ошибки и FindFirstFile и FindNextFile
      case GetLastError of
        ERROR_NO_MORE_FILES, // больше нет файлов и каталогов удовлетвор€ющих маске (но были)
        ERROR_FILE_NOT_FOUND, // вообще нет файлов и каталогов удовлетвор€ющих маске
        ERROR_SHARING_VIOLATION // возникает во врем€ создани€ каталога (уже создан но еще недоступен)
          :
          ; // ничего не делаем, все Ok
      else // все остальные ошибки
        raise Exception.CreateFmt('ќшибка просмотра каталога "%s": %s', [PChar(ExtractFilePath(Application.ExeName) + 'Plugins\*.*'), SysErrorMessage(GetLastError)]);
      end;
    finally
      if h <> INVALID_HANDLE_VALUE then
        Windows.FindClose(h);
    end;
  finally
    slFiles.Free;
    Options.cdsPlugins.EnableControls;
    cbPlugins.Sorted := True;
  end;
end;

procedure TEditPlugin.GetScripts(PluginName: string);
var
  slFiles: TStringList;
  i: integer;
  sFileName: string;
begin
  cbScript.Items.Clear;
  slFiles := TStringList.Create;
  try
    FindFilesByMask(slFiles, ExtractFilePath(Application.ExeName) + 'Plugins\' + PluginName, '*.xml');
    for i := 0 to slFiles.Count - 1 do
    begin
      sFileName := ExtractFileName(slFiles.Strings[i]);
      cbScript.Items.Add(Copy(sFileName, 1, Pos('.', sFileName) - 1));
    end;
  finally
    slFiles.Free;
  end;
  if cbScript.Items.Count > 0 then
    cbScript.Items.Insert(0, '');
end;

end.
