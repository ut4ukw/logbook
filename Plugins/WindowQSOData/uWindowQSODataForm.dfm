object WindowQSODataForm: TWindowQSODataForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowQSODataForm'
  ClientHeight = 249
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 16
  object lbOperator: TLabel
    Left = 33
    Top = 99
    Width = 61
    Height = 16
    Alignment = taRightJustify
    Caption = 'lbOperator'
  end
  object lbQTH: TLabel
    Left = 59
    Top = 127
    Width = 35
    Height = 16
    Alignment = taRightJustify
    Caption = 'lbQTH'
  end
  object lbDate: TLabel
    Left = 56
    Top = 156
    Width = 36
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taRightJustify
    Caption = 'lbDate'
  end
  object lbTime: TLabel
    Left = 53
    Top = 183
    Width = 39
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Alignment = taRightJustify
    Caption = 'lbTime'
  end
  object cbRealTime: TCheckBox
    Left = 184
    Top = 185
    Width = 86
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'cbRealTime'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = cbRealTimeClick
  end
  object dtpQSODate: TJvDateTimePicker
    Left = 96
    Top = 152
    Width = 85
    Height = 24
    Date = 40271.608206018520000000
    Time = 40271.608206018520000000
    TabOrder = 5
    OnChange = dtpQSODateChange
    DropDownDate = 40271.000000000000000000
  end
  object dtpQSOTime: TJvDateTimePicker
    Left = 96
    Top = 180
    Width = 85
    Height = 24
    Date = 40271.607638888890000000
    Format = 'HH:mm'
    Time = 40271.607638888890000000
    Kind = dtkTime
    TabOrder = 6
    OnChange = dtpQSOTimeChange
    OnKeyPress = dtpQSOTimeKeyPress
    DropDownDate = 40271.000000000000000000
  end
  object pnlCallInfo: TPanel
    Left = 0
    Top = 230
    Width = 468
    Height = 19
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 8
    object imgTime: TImage
      Left = 2
      Top = 2
      Width = 16
      Height = 16
      AutoSize = True
    end
    object lbsTime: TLabel
      Tag = -1
      Left = 21
      Top = 2
      Width = 4
      Height = 16
    end
    object lbDXCC: TLabel
      Tag = -1
      Left = 63
      Top = 2
      Width = 34
      Height = 16
      Caption = 'DXCC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDXCCBand: TLabel
      Tag = -1
      Left = 103
      Top = 2
      Width = 35
      Height = 16
      Caption = 'BAND'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDXCCMode: TLabel
      Tag = -1
      Left = 144
      Top = 2
      Width = 36
      Height = 16
      Caption = 'MODE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dbeOperator: TvlDBEdit
    Left = 96
    Top = 96
    Width = 142
    Height = 24
    DataField = 'LOG_NAME'
    TabOrder = 3
    OnEnter = dbeOperatorEnter
    OnExit = dbeOperatorExit
    Autocomplete = True
    LookupDisplay = 'OPERATOR_NAME'
    LookupField = 'OPERATOR_NAME'
    LookupSource = dsNames
    LookupListBoxHeight = 84
    OnCloseUp = dbeOperatorCloseUp
  end
  object dbeQTH: TvlDBEdit
    Left = 96
    Top = 124
    Width = 142
    Height = 24
    DataField = 'LOG_QTH'
    TabOrder = 4
    OnEnter = dbeQTHEnter
    OnExit = dbeQTHExit
    Autocomplete = True
    LookupDisplay = 'QTH_NAME'
    LookupField = 'QTH_NAME'
    LookupSource = dsQTH
    LookupListBoxHeight = 84
    OnCloseUp = dbeQTHCloseUp
  end
  object ldeCall: TLabeledDBEdit
    Left = 96
    Top = 8
    Width = 121
    Height = 27
    DataField = 'LOG_CALL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = ldeCallChange
    OnKeyDown = ldeCallKeyDown
    OnKeyPress = ldeCallKeyPress
    EditLabel.Width = 38
    EditLabel.Height = 16
    EditLabel.Caption = 'ldeCall'
    LabelPosition = lpLeft
    LabelSpacing = 3
  end
  object ldeReportFrom: TLabeledDBComboBox
    Left = 96
    Top = 40
    Width = 85
    Height = 24
    DataField = 'LOG_RST_RCVD'
    TabOrder = 1
    OnKeyPress = ldeReportFromKeyPress
    EditLabel.Width = 85
    EditLabel.Height = 16
    EditLabel.Caption = 'ldeReportFrom'
    LabelPosition = lpLeft
    LabelSpacing = 3
  end
  object ldeReportTo: TLabeledDBComboBox
    Left = 96
    Top = 68
    Width = 85
    Height = 24
    DataField = 'LOG_RST_SENT'
    TabOrder = 2
    OnKeyPress = ldeReportToKeyPress
    EditLabel.Width = 85
    EditLabel.Height = 16
    EditLabel.Caption = 'ldeReportFrom'
    LabelPosition = lpLeft
    LabelSpacing = 3
  end
  object timTime: TTimer
    OnTimer = timTimeTimer
    Left = 424
    Top = 8
  end
  object ilTime: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 384
    Top = 8
    Bitmap = {
      494C01010400F000E40410001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5D1D1EDCDC5C5EDC8BDBDEDC9BEBEEDCEC6C6EDD5D1D1ED0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F3
      F3FFDFD0CEFFCCB3B0FFC2A3A0FFBF9E9BFFC1A29EFFC8ACA9FFD4BDBBFFE5D8
      D7FFF8F3F3FF00000000000000000000000000000000000000009BD1FCFF0D9B
      FCFF1FCBFBFF48DEFAFF75E9FCFF75EAFBFF75E9FBFF77EAFCFF5CE3FBFF2AD4
      FAFF13A5FDFF1999FDFF86C8FDFF000000000000000000000000000000000000
      000000000000000000005AB4FEFF000000000000000067BBFDFF000000000000
      0000000000000000000000000000000000000000000000000000028BF7FF0002
      F7FF007BF5FF00ACF2FF00C7F7FF00CAF5FF00C7F5FF00CAF7FF00B8F5FF0092
      F2FF001BFAFF0000FAFF0073FAFF000000000000000000000000F3ECECFFCFB7
      B5FFB6938FFFA87E79FFA37068FFA36E65FFA5726BFFAC8079FFB99793FFC9AE
      AAFFDBC8C6FFF4EEEEFF00000000000000000000000098D0FCFF39A8FDFF27A2
      FDFF12B9FBFF64E8FAFFB0F0FBFFA6EFFBFFA5EFFBFFAEF0FBFF8EEEFBFF23CD
      FBFF179FFCFF78C2FCFF00000000000000000000000000000000000000000000
      000053B2FDFF0000000030A4FDFF46ACFCFF32A5FDFF3FACFDFF000000003FA9
      FCFF00000000000000000000000000000000000000000088F7FF0022FAFF0013
      FAFF004DF5FF00C5F2FF37D9F5FF1DD7F5FF1BD7F5FF31D9F5FF00D4F5FF0081
      F5FF000CF7FF0064F7FF000000000000000000000000F7F2F2FFCEB4B2FFAB86
      81FF97655EFF875B56FF6D7687FF5D94B4FF65A0BDFF828C98FFA27E7BFFB18C
      88FFC4A7A3FFDCC9C7FFF7F3F3FF0000000000000000000000000000000047AE
      FDFF0BA1FCFF31D1FAFF97F1F9FFC6F6F9FFCBF6FAFFADF5F9FF4DDFFAFF12AF
      FCFF0896FCFF0000000000000000000000000000000000000000000000000000
      00004DB0FDFF1493FCFF1397FDFF0A9FFDFF0DA3FDFF139BFDFF0790FDFF47AC
      FDFF000000000000000000000000000000000000000000000000000000000031
      FAFF0011F7FF008BF2FF00DCF0FF6EE8F0FF7BE8F2FF2FE6F0FF00AEF2FF0034
      F7FF0000F7FF00000000000000000000000000000000DCCAC8FFAD8884FF905D
      56FF765556FF449ED1FF29C4FFFF3DB8EBFF637B8FFF826767FF8F645FFF9F75
      70FFB3908CFFCAAEABFFE5D8D7FF000000000000000000000000000000003BAA
      FDFF4FB4FDFF16A8FCFF1EC3FBFF40D7FAFF47DBFAFF28CBFBFF0EADFDFF23A2
      FDFF76C2FCFF60B7FCFF000000000000000000000000000000006BBCFDFF52AF
      FDFF32A1FDFF0DA2FCFF20C5FBFF30D8FBFF32DAFBFF26CEFBFF15AFFBFF1796
      FCFF2199FDFF79C2FDFF00000000000000000000000000000000000000000027
      FAFF0041FAFF0022F7FF0067F5FF009AF2FF00A4F2FF007BF5FF002FFAFF0013
      FAFF0064F7FF0048F7FF0000000000000000D4D0CFEDC3A5A3FF986B65FF774A
      46FF539FCDFF2AC1FFFF3A9DCEFF613934FF73392DFF78463EFF83534CFF9165
      5FFFA6807BFFBE9E9AFFD8C3C1FFD4D1D1ED0000000000000000000000000000
      000000000000139CFCFF23A3FDFF12A4FDFF08A0FEFF18A3FDFF32A6FDFF21A2
      FCFF000000000000000000000000000000000000000000000000000000001B96
      FCFF059BFDFF18C8FBFF23D0FBFF22CDFBFF21CDFBFF23CFFBFF1CCDFBFF08AB
      FCFF1696FDFFDBEEFCFF00000000000000000000000000000000000000000000
      0000000000000004F7FF0016FAFF0018FAFF000EFCFF0016FAFF001DFAFF0013
      F7FF00000000000000000000000000000000CAC1C0EDB38F8BFF89534AFF6A6F
      80FF41C3FFFF2AA7ECFF4E332FFF622717FF66352BFF693730FF946C67FFD6C3
      C0FFA47B77FFB5938FFFD0B8B4FFCEC7C7ED0000000000000000000000000000
      00006ABCFCFF000000000000000022A3FDFF000000001EA0FDFF000000000000
      000000000000000000000000000000000000000000007EC4FDFF59B5FDFF219E
      FCFF11B8FBFF20CFFBFF1CCAFBFF1CCAFBFF1CCAFBFF1CC9FBFF1FCCFBFF19C6
      FBFF129CFDFF1295FCFF6FBEFDFF000000000000000000000000000000000000
      00000055F7FF00000000000000000016FAFF00000000000EFAFF000000000000
      000000000000000000000000000000000000C5B9B7EDAB8581FF824B42FF5F8C
      ADFF2EC2FFFF396B8DFF561400FF5A281AFF5C291EFF68352EFF8B615BFFC2A9
      A5FF9F7671FFB28E8AFFCCB2AFFFCAC1C1ED0000000000000000000000000000
      000000000000000000000000000084C8FCFF0000000089C9FDFF000000000000
      00000000000000000000000000000000000000000000000000005EB6FDFF119D
      FDFF20CAFBFF29D3FAFF37D8FBFF42DFFBFF42DFFAFF3CDBFBFF2BD2FAFF26D1
      FAFF069EFCFF6ABAFCFF00000000000000000000000000000000000000000000
      00000000000000000000000000000073F7FF000000000076FAFF000000000000
      000000000000000000000000000000000000C5B9B8EDAC8682FF854E45FF5492
      B8FF2BBFFFFF49464DFF571C07FF5F2D20FF6B3C31FF6A3931FF774741FF8556
      4FFF9C726EFFB3908CFFCCB2AFFFCAC2C1ED0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009BD1FCFF0D9B
      FCFF1FCBFBFF48DEFAFF75E9FCFF75EAFBFF75E9FBFF77EAFCFF5CE3FBFF2AD4
      FAFF13A5FDFF1999FDFF86C8FDFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBC3C2EDB6938FFF90574EFF5485
      A3FF31BDFFFF5B3D3AFF531A0AFF896158FF9D7973FF6A3831FF7E4F48FF8E60
      5AFFA17874FFB89692FFD1B9B6FFCFC8C7ED0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098D0FCFF39A8FDFF27A2
      FDFF12B9FBFF64E8FAFFB0F0FBFFA6EFFBFFA5EFFBFFAEF0FBFF8EEEFBFF23CD
      FBFF179FFCFF78C2FCFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5D2D2EDC7ABA8FF9F6E67FF7368
      70FF3EC3F8FF5E4E52FF662E21FF68372EFF6F3F37FF784A43FF895B55FF9E75
      71FFAA847EFFC0A19DFFDAC6C4FFD5D2D2ED0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000047AE
      FDFF0BA1FCFF31D1FAFF97F1F9FFC6F6F9FFCBF6FAFFADF5F9FF4DDFFAFF12AF
      FCFF0896FCFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E1D0CFFFB3908CFF9E6A
      63FF6491A9FF598397FF783F35FF764740FF7D4E47FF855750FFA17A75FFD5C1
      BEFFB6938FFFCCB2AFFFE8DCDBFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003BAA
      FDFF4FB4FDFF16A8FCFF1EC3FBFF40D7FAFF47DBFAFF28CBFBFF0EADFDFF23A2
      FDFF76C2FCFF60B7FCFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F6F6FFD6C0BEFFB591
      8CFF9D726CFF85757AFF8B5F5AFF8D5F59FF926560FF9A6F6AFFA67E7AFFB896
      92FFC8ACA8FFDFCECDFFF9F5F5FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000139CFCFF23A3FDFF12A4FDFF08A0FEFF18A3FDFF32A6FDFF21A2
      FCFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F2F2FFD6C1
      BFFFBE9C98FFB08882FFA7817CFFA67D7AFFA9837EFFB18D89FFBD9C98FFCBB0
      ADFFDFCECDFFF6F2F2FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006ABCFCFF000000000000000022A3FDFF000000001EA0FDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6D9D8FFD4BDBBFFC9AEABFFC5A9A5FFC8ABA8FFCEB5B2FFD9C5C4FFE9DE
      DDFFFAF7F7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084C8FCFF0000000089C9FDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D7D5D5EDD1CACAEDCDC5C4EDCCC5C4EDD1CBCAEDD6D4D5ED0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object dsNames: TDataSource
    DataSet = qryNames
    Left = 376
    Top = 80
  end
  object dsQTH: TDataSource
    DataSet = qryQTH
    Left = 408
    Top = 80
  end
  object qryDXCC: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    SQL.Strings = (
      
        'SELECT LOG_MODE,LOG_BAND_MHZ FROM LOG WHERE LOG_DXCC=:LOG_DXCC G' +
        'ROUP BY LOG_MODE,LOG_BAND_MHZ')
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldCount = 0
    ReadOnly = False
    LockEdits = False
    MasterAutoActivate = True
    DatabaseAutoActivate = False
    UseBrackets = True
    UseCaptions = False
    UseDaoProperties = True
    UseGetRecNo = True
    UseRecordCount = True
    WarnOnBadDatabase = False
    Filtered = False
    ParamCheck = True
    ProcessMessages = False
    Left = 304
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LOG_DXCC'
        ParamType = ptUnknown
      end>
  end
  object qryNames: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'OPERATOR'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldCount = 0
    ReadOnly = False
    LockEdits = False
    MasterAutoActivate = True
    DatabaseAutoActivate = False
    UseBrackets = True
    UseCaptions = False
    UseDaoProperties = True
    UseGetRecNo = True
    UseRecordCount = True
    WarnOnBadDatabase = False
    Filtered = False
    OnFilterRecord = qryNamesFilterRecord
    ParamCheck = True
    ProcessMessages = False
    Left = 344
    Top = 8
  end
  object qryQTH: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'QTH'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldCount = 0
    ReadOnly = False
    LockEdits = False
    MasterAutoActivate = True
    DatabaseAutoActivate = False
    UseBrackets = True
    UseCaptions = False
    UseDaoProperties = True
    UseGetRecNo = True
    UseRecordCount = True
    WarnOnBadDatabase = False
    Filtered = False
    OnFilterRecord = qryQTHFilterRecord
    ParamCheck = True
    ProcessMessages = False
    Left = 408
    Top = 136
  end
end