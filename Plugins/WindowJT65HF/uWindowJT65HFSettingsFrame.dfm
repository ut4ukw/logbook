object WindowJT65HFSettingsFrame: TWindowJT65HFSettingsFrame
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
  object WindowJT65HF_lbCsvFiles: TLabel
    Left = 16
    Top = 82
    Width = 151
    Height = 16
    Caption = 'WindowJT65HF_lbCsvFiles'
  end
  object WindowJT65HF_lbTimeShowHistory: TLabel
    Left = 16
    Top = 142
    Width = 205
    Height = 16
    Caption = 'WindowJT65HF_lbTimeShowHistory'
  end
  object WindowJT65HF_cbStartOnLoad: TCheckBox
    Left = 16
    Top = 10
    Width = 393
    Height = 16
    Caption = 'WindowJT65HF_cbStartOnLoad'
    TabOrder = 0
  end
  object WindowJT65HF_deCsvFiles: TJvDirectoryEdit
    Left = 16
    Top = 100
    Width = 433
    Height = 24
    DialogKind = dkWin32
    TabOrder = 1
  end
  object WindowJT65HF_spTimeShowHstory: TSpinEdit
    Left = 16
    Top = 164
    Width = 81
    Height = 26
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object WindowJT65HF_cbNewOneOnlyJT65HF: TCheckBox
    Left = 16
    Top = 210
    Width = 393
    Height = 16
    Caption = 'WindowJT65HF_cbNewOneOnlyJT65HF'
    TabOrder = 3
  end
  object WindowJT65HF_feExeFile: TJvFilenameEdit
    Left = 16
    Top = 32
    Width = 433
    Height = 24
    Filter = 'Exel file (*.exe)|*.exe'
    TabOrder = 4
  end
  object WindowJT65HF_cbCaptureClipboard: TCheckBox
    Left = 16
    Top = 232
    Width = 393
    Height = 16
    Caption = 'WindowJT65HF_cbCaptureClipboard'
    TabOrder = 5
  end
  object WindowJT65HF_cbSaveAfterEnd: TCheckBox
    Left = 16
    Top = 254
    Width = 393
    Height = 16
    Caption = 'WindowJT65HF_cbSaveAfterEnd'
    TabOrder = 6
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    AfterRestorePlacement = FormStorageAfterRestorePlacement
    StoredProps.Strings = (
      'WindowJT65HF_deCsvFiles.Text'
      'WindowJT65HF_spTimeShowHstory.Value'
      'WindowJT65HF_cbNewOneOnlyJT65HF.Checked'
      'WindowJT65HF_feExeFile.FileName'
      'WindowJT65HF_cbStartOnLoad.Checked'
      'WindowJT65HF_cbCaptureClipboard.Checked')
    StoredValues = <>
    Left = 216
    Top = 240
  end
end
