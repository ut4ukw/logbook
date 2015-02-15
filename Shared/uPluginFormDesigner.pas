unit uPluginFormDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvPropertyStoreEditor, JvExControls, JvInspector, ComCtrls, ToolWin;

type
  TPluginFormDesigner = class(TForm)
    Inspector: TJvInspector;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PluginFormDesigner: TPluginFormDesigner;

implementation

{$R *.dfm}

end.
