object WindowWaitingListSettingsFrame: TWindowWaitingListSettingsFrame
  Left = 0
  Top = 0
  Width = 460
  Height = 291
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object WindowWaitingList_cbSetNextCall: TCheckBox
    Left = 16
    Top = 10
    Width = 393
    Height = 16
    Caption = 'WindowWaitingList_cbSetNextCall'
    TabOrder = 0
  end
  object WindowWaitingList_leSetCallMacros: TLabeledEdit
    Left = 16
    Top = 56
    Width = 393
    Height = 24
    EditLabel.Width = 206
    EditLabel.Height = 16
    EditLabel.Caption = 'WindowWaitingList_leSetCallMacros'
    TabOrder = 1
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'WindowWaitingList_cbSetNextCall.Checked'
      'WindowWaitingList_leSetCallMacros.Text')
    StoredValues = <>
    Left = 216
    Top = 240
  end
end
