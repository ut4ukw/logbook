library WindowCWEngine;


uses
  ShareMem,
  uWindowCWEngine in 'uWindowCWEngine.pas',
  uWindowCWEngineForm in 'uWindowCWEngineForm.pas' {WindowCWEngineForm},
  uWindowCWEngineSettingsFrame in 'uWindowCWEngineSettingsFrame.pas' {WindowCWEngineSettingsFrame: TFrame},
  uEditCWEngineMacros in 'uEditCWEngineMacros.pas' {EditCWEngineMacros};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
