library WindowPhoto;


uses
  ShareMem,
  uWindowPhoto in 'uWindowPhoto.pas',
  uWindowPhotoForm in 'uWindowPhotoForm.pas' {WindowPhotoForm},
  uWindowPhotoSettingsFrame in 'uWindowPhotoSettingsFrame.pas' {WindowPhotoSettingsFrame: TFrame};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
