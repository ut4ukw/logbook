object WindowQSODataSettingsFrame: TWindowQSODataSettingsFrame
  Left = 0
  Top = 0
  Width = 434
  Height = 174
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object WindowQSOData_cbSaveRecordOnEnter: TCheckBox
    Left = 16
    Top = 16
    Width = 393
    Height = 16
    Caption = 'WindowQSOData_cbSaveRecordOnEnter'
    TabOrder = 0
  end
  object WindowQSOData_leAutoChangeKeyLayout: TLabeledEdit
    Left = 16
    Top = 62
    Width = 400
    Height = 24
    EditLabel.Width = 241
    EditLabel.Height = 16
    EditLabel.Caption = 'WindowQSOData_leAutoChangeKeyLayout'
    TabOrder = 1
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'WindowQSOData_cbSaveRecordOnEnter.Checked'
      'WindowQSOData_leAutoChangeKeyLayout.Text')
    StoredValues = <>
    Left = 24
    Top = 104
  end
end
