library WindowAwardsStatistics;


uses
  ShareMem,
  uWindowAwardsStatistics in 'uWindowAwardsStatistics.pas',
  uWindowAwardsStatisticsForm in 'uWindowAwardsStatisticsForm.pas' {WindowAwardsStatisticsForm},
  uWindowAwardsStatisticsSettingsFrame in 'uWindowAwardsStatisticsSettingsFrame.pas' {WindowAwardsStatisticsSettingsFrame: TFrame},
  uEditAward in 'uEditAward.pas' {EditAward};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
