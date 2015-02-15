unit uPrintQSLSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter,
  JvComponentBase, JvFormPlacement, DB, Grids, DBGrids, uUtils;

type
  TPrintQSLSettings = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    lbTemplate: TLabel;
    cbTemplate: TComboBox;
    cbShowWindowAdain: TCheckBox;
    FormStorage: TJvFormStorage;
    cbPreview: TCheckBox;
    procedure leDesktopNameChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    procedure GetPatterns;
  end;

var
  PrintQSLSettings: TPrintQSLSettings;

implementation

{$R *.dfm}

procedure TPrintQSLSettings.btnCancelClick(Sender: TObject);
begin
 FormStorage.RestoreFormPlacement;
end;

procedure TPrintQSLSettings.FormCreate(Sender: TObject);
begin
 GetPatterns;
end;

procedure TPrintQSLSettings.GetPatterns;
var
  slFiles:TStringList;
  i:integer;
  sFileName:string;
begin
 cbTemplate.Items.Clear;
 slFiles:=TStringList.Create;
  try
    FindFilesByMask(slFiles,ExtractFilePath(Application.ExeName)+'Data\Reports\QSL','*.fr3');
    for i := 0 to slFiles.Count - 1 do
    begin
       sFileName:=ExtractFileName(slFiles.Strings[i]);
       cbTemplate.Items.Add(Copy(sFileName,1,Pos('.',sFileName)-1));
    end;
  finally
   slFiles.Free;
  end;
end;


procedure TPrintQSLSettings.leDesktopNameChange(Sender: TObject);
begin
// btnOk.Enabled:=Length(Trim(leDesktopname.Text))>0;
end;

end.
