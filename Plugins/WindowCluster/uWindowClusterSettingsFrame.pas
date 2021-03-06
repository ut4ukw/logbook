unit uWindowClusterSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, Spin, JvExStdCtrls,
  JvMemo, ComCtrls;

type
  TWindowClusterSettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    WindowCluster_gbTelnet: TGroupBox;
    WindowCluster_lbClusterURL: TLabel;
    WindowCluster_lbShowSpotLastMinutes: TLabel;
    WindowCluster_cbShowTelnetTab: TCheckBox;
    spShowSpotLastMinutes: TSpinEdit;
    WindowCluster_gbWWW: TGroupBox;
    WindowCluster_lbAutoLoadMinutes: TLabel;
    spAutoLoadMinute: TSpinEdit;
    memURL: TRichEdit;
    WindowCluster_cbAutoLoadWWW: TCheckBox;
    WindowCluster_gbGeneral: TGroupBox;
    WindowCluster_cbBandSync: TCheckBox;
    WindowCluster_lbWWWSpotCount: TLabel;
    cbWWWSpotCount: TComboBox;
    WindowCluster_cbShowDialogBeforeSpot: TCheckBox;
    WindowCluster_cbShowAddInfoFromFile: TCheckBox;
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
    procedure FormStorageAfterSavePlacement(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TWindowClusterSettingsFrame.FormStorageAfterRestorePlacement(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'nodelist.dat') then
    memURL.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'nodelist.dat');
end;

procedure TWindowClusterSettingsFrame.FormStorageAfterSavePlacement(Sender: TObject);
begin
  memURL.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'nodelist.dat');

end;

end.
