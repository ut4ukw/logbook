library WindowQSOData;



uses
  ShareMem,
  uWindowQSOData in 'uWindowQSOData.pas',
  uWindowQSODataForm in 'uWindowQSODataForm.pas' {WindowQSODataForm},
  uWindowQSODataSettingsFrame in 'uWindowQSODataSettingsFrame.pas' {WindowQSODataSettingsFrame: TFrame};

{$R *.res}


exports
Initialize,
DeInitialize,
CoreCommand;

end.
