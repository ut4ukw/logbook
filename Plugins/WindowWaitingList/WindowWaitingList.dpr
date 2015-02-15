library WindowWaitingList;


uses
  ShareMem,
  uWindowWaitingList in 'uWindowWaitingList.pas',
  uWindowWaitingListForm in 'uWindowWaitingListForm.pas' {WindowWaitingListForm},
  uWindowWaitingListSettingsFrame in 'uWindowWaitingListSettingsFrame.pas' {WindowWaitingListSettingsFrame: TFrame};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
