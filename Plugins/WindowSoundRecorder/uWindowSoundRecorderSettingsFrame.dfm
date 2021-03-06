object WindowSoundRecorderSettingsFrame: TWindowSoundRecorderSettingsFrame
  Left = 0
  Top = 0
  Width = 460
  Height = 566
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object WindowSoundRecorder_gbDeviceSettings: TGroupBox
    Left = 0
    Top = 0
    Width = 460
    Height = 201
    Align = alTop
    Caption = 'WindowSoundRecorder_gbDeviceSettings'
    TabOrder = 0
    object WindowSoundRecorder_lbDevice: TLabel
      Left = 16
      Top = 20
      Width = 188
      Height = 16
      Caption = 'WindowSoundRecorder_lbDevice'
    end
    object WindowSoundRecorder_lbSampleRate: TLabel
      Left = 16
      Top = 96
      Width = 220
      Height = 16
      Caption = 'WindowSoundRecorder_lbSampleRate'
    end
    object WindowSoundRecorder_lbBitPerSample: TLabel
      Left = 16
      Top = 144
      Width = 227
      Height = 16
      Caption = 'WindowSoundRecorder_lbBitPerSample'
    end
    object cbSoundRecorderDevice: TComboBox
      Left = 16
      Top = 41
      Width = 353
      Height = 24
      Style = csDropDownList
      TabOrder = 0
    end
    object WindowSoundRecorder_cbStereo: TCheckBox
      Left = 16
      Top = 73
      Width = 353
      Height = 17
      Caption = 'WindowSoundRecorder_cbStereo'
      TabOrder = 1
    end
    object seSampleRate: TSpinEdit
      Left = 16
      Top = 114
      Width = 113
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object seBitPerSample: TSpinEdit
      Left = 16
      Top = 162
      Width = 113
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
  end
  object WindowSoundRecorder_rgMode: TRadioGroup
    Left = 0
    Top = 201
    Width = 460
    Height = 104
    Align = alTop
    Caption = 'WindowSoundRecorder_rgMode'
    TabOrder = 1
  end
  object WindowSoundRecorder_rbManual: TRadioButton
    Left = 16
    Top = 226
    Width = 353
    Height = 17
    Caption = 'WindowSoundRecorder_rbManual'
    TabOrder = 2
  end
  object WindowSoundRecorder_rbSemiAuto: TRadioButton
    Left = 16
    Top = 249
    Width = 353
    Height = 17
    Caption = 'WindowSoundRecorder_rbManual'
    TabOrder = 3
  end
  object WindowSoundRecorder_rbAuto: TRadioButton
    Left = 16
    Top = 272
    Width = 353
    Height = 17
    Caption = 'WindowSoundRecorder_rbManual'
    TabOrder = 4
  end
  object WindowSoundRecorder_rgFile: TGroupBox
    Left = 0
    Top = 305
    Width = 460
    Height = 128
    Align = alTop
    Caption = 'WindowSoundRecorder_rgFile'
    TabOrder = 5
    object lbDQSLPictureDirectory: TLabel
      Left = 16
      Top = 58
      Width = 202
      Height = 16
      Caption = 'WindowSoundRecorder_lbDirectory'
    end
    object WindowSoundRecorder_cbAutoFileName: TCheckBox
      Left = 16
      Top = 32
      Width = 353
      Height = 17
      Caption = 'WindowSoundRecorder_cbAutoFileName'
      TabOrder = 0
    end
    object deDirectory: TJvDirectoryEdit
      Left = 16
      Top = 77
      Width = 421
      Height = 24
      DialogKind = dkWin32
      TabOrder = 1
      Text = 'deDirectory'
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'cbSoundRecorderDevice.ItemIndex'
      'WindowSoundRecorder_rbManual.Checked'
      'WindowSoundRecorder_rbSemiAuto.Checked'
      'WindowSoundRecorder_rbAuto.Checked'
      'WindowSoundRecorder_cbAutoFileName.Checked'
      'seBitPerSample.Value'
      'seSampleRate.Value'
      'WindowSoundRecorder_cbStereo.Checked'
      'deDirectory.Text')
    StoredValues = <>
    Left = 168
    Top = 296
  end
  object AudioIn: TDXAudioIn
    Latency = 100
    SamplesToRead = -1
    DeviceNumber = 0
    InBitsPerSample = 8
    InChannels = 1
    InSampleRate = 8000
    RecTime = -1
    EchoRecording = False
    FramesInBuffer = 24576
    PollingInterval = 100
    Left = 112
    Top = 296
  end
end
