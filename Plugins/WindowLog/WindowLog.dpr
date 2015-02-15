library WindowLog;

uses
  ShareMem,
  uWindowLog in 'uWindowLog.pas',
  uEditFilterName in 'uEditFilterName.pas' {EditFilterName},
  uViewPicture in 'uViewPicture.pas' {ViewPicture},
  uWindowLogForm in 'uWindowLogForm.pas' {WindowLogForm};

{$R *.res}


exports
Initialize,
DeInitialize,
CoreCommand,
CoreGetData;

end.
