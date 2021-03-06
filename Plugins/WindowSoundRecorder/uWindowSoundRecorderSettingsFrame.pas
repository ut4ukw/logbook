unit uWindowSoundRecorderSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, ACS_Classes, ACS_DXAudio,
  ExtCtrls, Spin, Mask, JvExMask, JvToolEdit;

type
  TWindowSoundRecorderSettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    AudioIn: TDXAudioIn;
    WindowSoundRecorder_gbDeviceSettings: TGroupBox;
    cbSoundRecorderDevice: TComboBox;
    WindowSoundRecorder_lbDevice: TLabel;
    WindowSoundRecorder_rgMode: TRadioGroup;
    WindowSoundRecorder_rbManual: TRadioButton;
    WindowSoundRecorder_rbSemiAuto: TRadioButton;
    WindowSoundRecorder_rbAuto: TRadioButton;
    WindowSoundRecorder_cbAutoFileName: TCheckBox;
    WindowSoundRecorder_cbStereo: TCheckBox;
    WindowSoundRecorder_lbSampleRate: TLabel;
    seSampleRate: TSpinEdit;
    WindowSoundRecorder_lbBitPerSample: TLabel;
    seBitPerSample: TSpinEdit;
    WindowSoundRecorder_rgFile: TGroupBox;
    lbDQSLPictureDirectory: TLabel;
    deDirectory: TJvDirectoryEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
