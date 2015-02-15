library CatOmniRig;


uses
  ShareMem,
  uCatOmniRig in 'uCatOmniRig.pas',
  udmCatOmniRig in 'udmCatOmniRig.pas' {dmCatOmniRig: TDataModule};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
