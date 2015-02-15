library WindowQSOEntry;



uses
  ShareMem,
  uWindowQSOEntry in 'uWindowQSOEntry.pas',
  uWindowQSOEntryForm in 'uWindowQSOEntryForm.pas' {WindowQSOEntryForm},
  uWindowQSOEntrySettingsFrame in 'uWindowQSOEntrySettingsFrame.pas' {WindowQSOEntrySettingsFrame: TFrame},
  uColors in '..\..\..\Shared\uColors.pas',
  ufrmvlComboSettings in '..\..\..\Components\VLComponents\vlDBEdit\ufrmvlComboSettings.pas' {frmVLComboSettings};

{$R *.res}


exports
Initialize,
DeInitialize,
CoreCommand;

end.
