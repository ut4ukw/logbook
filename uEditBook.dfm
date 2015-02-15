object EditBook: TEditBook
  Left = 0
  Top = 0
  ActiveControl = DBEdit1
  BorderStyle = bsDialog
  Caption = 'EditBook'
  ClientHeight = 480
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pgPersonalRecord: TPageControl
    Left = 0
    Top = 0
    Width = 424
    Height = 446
    ActivePage = tsStationDataMain
    Align = alClient
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 0
    object tsStationDataMain: TTabSheet
      Caption = 'tsStationDataMain'
      object gbStationDataMainBook: TGroupBox
        Left = 0
        Top = 0
        Width = 416
        Height = 185
        Align = alTop
        Caption = 'gbStationDataMainBook'
        TabOrder = 0
        object lbStationCall: TLabel
          Left = 10
          Top = 123
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationName: TLabel
          Left = 224
          Top = 123
          Width = 37
          Height = 16
          Caption = 'Label1'
        end
        object lbStationBookName: TLabel
          Left = 10
          Top = 27
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationBookDescription: TLabel
          Left = 10
          Top = 75
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object dbeMyCall: TDBEdit
          Left = 10
          Top = 141
          Width = 182
          Height = 24
          DataField = 'STATION_CALL'
          DataSource = dsStations
          TabOrder = 2
          OnChange = dbeMyCallChange
          OnKeyDown = dbeMyCallKeyDown
          OnKeyPress = dbeMyCallKeyPress
        end
        object DBEdit2: TDBEdit
          Left = 224
          Top = 141
          Width = 182
          Height = 24
          DataField = 'STATION_NAME'
          DataSource = dsStations
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 10
          Top = 45
          Width = 396
          Height = 24
          DataField = 'STATION_BOOK_NAME'
          DataSource = dsStations
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 10
          Top = 93
          Width = 396
          Height = 24
          DataField = 'STATION_BOOK_DESCRIPTION'
          DataSource = dsStations
          TabOrder = 1
          OnChange = dbeMyCallChange
        end
      end
      object gbStationDataMainGeo: TGroupBox
        Left = 0
        Top = 185
        Width = 416
        Height = 230
        Align = alClient
        Caption = 'gbStationDataMainGeo'
        TabOrder = 1
        object lbStationPostalCode: TLabel
          Left = 10
          Top = 122
          Width = 37
          Height = 16
          Caption = 'Label1'
        end
        object lbStationCity: TLabel
          Left = 10
          Top = 74
          Width = 37
          Height = 16
          Caption = 'Label1'
        end
        object lbStationAddress: TLabel
          Left = 10
          Top = 168
          Width = 37
          Height = 16
          Caption = 'Label1'
        end
        object lbStationCountry: TLabel
          Left = 10
          Top = 26
          Width = 37
          Height = 16
          Caption = 'Label1'
        end
        object lbStationGridSquare: TLabel
          Left = 224
          Top = 26
          Width = 37
          Height = 16
          Caption = 'Label1'
        end
        object lbStationLon: TLabel
          Left = 224
          Top = 122
          Width = 37
          Height = 16
          Caption = 'Label1'
        end
        object lbStationLat: TLabel
          Left = 224
          Top = 74
          Width = 67
          Height = 16
          Caption = 'lbStationLat'
        end
        object DBEdit3: TDBEdit
          Left = 10
          Top = 140
          Width = 182
          Height = 24
          DataField = 'STATION_POSTAL_CODE'
          DataSource = dsStations
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 10
          Top = 92
          Width = 182
          Height = 24
          DataField = 'STATION_CITY'
          DataSource = dsStations
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 10
          Top = 187
          Width = 182
          Height = 24
          DataField = 'STATION_STREET'
          DataSource = dsStations
          TabOrder = 3
        end
        object dblCountry: TJvDBLookupCombo
          Left = 10
          Top = 44
          Width = 182
          Height = 26
          DataField = 'STATION_COUNTRY'
          DataSource = dsStations
          LookupField = 'ADIF_ID'
          LookupDisplay = 'TERRITORY_NAME'
          LookupSource = dsTerritory
          TabOrder = 0
        end
        object dbcMyLat: TJvDBCalcEdit
          Left = 224
          Top = 92
          Width = 182
          Height = 24
          BiDiMode = bdLeftToRight
          Flat = False
          ParentBiDiMode = False
          ParentFlat = False
          AutoSelect = False
          AutoSize = False
          DecimalPlaces = 10
          DisplayFormat = '0.0000000000'
          ButtonWidth = 25
          TabOrder = 5
          DecimalPlacesAlwaysShown = True
          DataField = 'STATION_LAT'
          DataSource = dsStations
        end
        object dbeGridSquare: TDBEdit
          Left = 224
          Top = 44
          Width = 182
          Height = 24
          DataField = 'STATION_GRIDSQUARE'
          DataSource = dsStations
          TabOrder = 4
          OnChange = dbeGridSquareChange
          OnKeyDown = dbeGridSquareKeyDown
          OnKeyPress = dbeGridSquareKeyPress
        end
        object dbcMyLon: TJvDBCalcEdit
          Left = 224
          Top = 140
          Width = 182
          Height = 24
          DecimalPlaces = 10
          DisplayFormat = '0.##########'
          ButtonWidth = 25
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          DataField = 'STATION_LON'
          DataSource = dsStations
        end
      end
    end
    object tsStationAdditionData: TTabSheet
      Caption = 'tsStationAdditionData'
      ImageIndex = 4
      object gbStationAdditionData: TGroupBox
        Left = 0
        Top = 0
        Width = 416
        Height = 137
        Align = alTop
        Caption = 'gbStationAdditionData'
        TabOrder = 0
        object ldeStationState: TLabeledDBEdit
          Left = 10
          Top = 45
          Width = 182
          Height = 24
          DataField = 'STATION_STATE'
          DataSource = dsStations
          TabOrder = 0
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
        object ldeStationCNTY: TLabeledDBEdit
          Left = 10
          Top = 93
          Width = 182
          Height = 24
          DataField = 'STATION_CNTY'
          DataSource = dsStations
          TabOrder = 1
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
        object ldeCQZone: TLabeledDBEdit
          Left = 224
          Top = 45
          Width = 71
          Height = 24
          DataField = 'STATION_CQ_ZONE'
          DataSource = dsStations
          TabOrder = 2
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
          EditKeyRuleStyle = ssNumbers
        end
        object ldeITUZone: TLabeledDBEdit
          Left = 224
          Top = 93
          Width = 71
          Height = 24
          DataField = 'STATION_ITU_ZONE'
          DataSource = dsStations
          TabOrder = 3
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
          EditKeyRuleStyle = ssNumbers
        end
      end
      object gbStationRIG: TGroupBox
        Left = 0
        Top = 313
        Width = 416
        Height = 102
        Align = alClient
        Caption = 'gbStationRIG'
        TabOrder = 1
        object ldeStationRIG: TLabeledDBEdit
          Left = 10
          Top = 45
          Width = 396
          Height = 24
          DataField = 'STATION_RIG'
          DataSource = dsStations
          TabOrder = 0
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
      end
      object gbStationIOTA: TGroupBox
        Left = 0
        Top = 137
        Width = 416
        Height = 88
        Align = alTop
        Caption = 'gbStationIOTA'
        TabOrder = 2
        object ldeStationIOTA: TLabeledDBEdit
          Left = 10
          Top = 45
          Width = 182
          Height = 24
          DataField = 'STATION_IOTA'
          DataSource = dsStations
          TabOrder = 0
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
        object ldeStationIOTAIslandId: TLabeledDBEdit
          Left = 224
          Top = 45
          Width = 182
          Height = 24
          DataField = 'STATION_IOTA_ISLAND_ID'
          DataSource = dsStations
          TabOrder = 1
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
      end
      object gbStationEvents: TGroupBox
        Left = 0
        Top = 225
        Width = 416
        Height = 88
        Align = alTop
        Caption = 'gbStationEvents'
        TabOrder = 3
        object ldeStationSIG: TLabeledDBEdit
          Left = 10
          Top = 45
          Width = 182
          Height = 24
          DataField = 'STATION_SIG'
          DataSource = dsStations
          TabOrder = 0
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
        object ldeStationSIGInfo: TLabeledDBEdit
          Left = 224
          Top = 45
          Width = 182
          Height = 24
          DataField = 'STATION_SIG_INFO'
          DataSource = dsStations
          TabOrder = 1
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationState'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
      end
    end
    object tsStationDataEQSL: TTabSheet
      Caption = 'tsStationDataEQSL'
      ImageIndex = 1
      object gbEQSLParams: TGroupBox
        Left = 0
        Top = 40
        Width = 416
        Height = 375
        Align = alClient
        TabOrder = 0
        object lbStationeQSLLogin: TLabel
          Left = 10
          Top = 22
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationeQSLPassword: TLabel
          Left = 10
          Top = 71
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object dbeEQSLLogin: TDBEdit
          Left = 10
          Top = 40
          Width = 182
          Height = 24
          DataField = 'STATION_EQSL_LOGIN'
          DataSource = dsStations
          TabOrder = 0
          OnKeyDown = dbeEQSLLoginKeyDown
          OnKeyPress = dbeEQSLLoginKeyPress
        end
        object meStationeQSLPassword: TMaskEdit
          Left = 10
          Top = 89
          Width = 182
          Height = 24
          PasswordChar = '*'
          TabOrder = 1
        end
        object dbcEQSLSentEvery: TDBCheckBox
          Left = 10
          Top = 128
          Width = 399
          Height = 17
          Caption = 'dbcEQSLSentEvery'
          DataField = 'STATION_EQSL_SENT_EVERY'
          DataSource = dsStations
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 416
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object dbcEQSLActive: TDBCheckBox
          Left = 3
          Top = 8
          Width = 406
          Height = 17
          Caption = 'dbcEQSLActive'
          DataField = 'STATION_EQSL_ACTIVE'
          DataSource = dsStations
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object tsStationDataDQSL: TTabSheet
      Caption = 'tsStationDataDQSL'
      ImageIndex = 3
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 416
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object dbcDQSLActive: TDBCheckBox
          Left = 3
          Top = 8
          Width = 380
          Height = 17
          Caption = 'DBCheckBox1'
          DataField = 'STATION_DQSL_ACTIVE'
          DataSource = dsStations
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object gbDQSLMailParams: TGroupBox
        Left = 0
        Top = 40
        Width = 416
        Height = 225
        Align = alTop
        TabOrder = 1
        object Label3: TLabel
          Left = 139
          Top = 322
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationDQSLSMTPHost: TLabel
          Left = 10
          Top = 16
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationDQSLSMTPPort: TLabel
          Left = 325
          Top = 16
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationDQSLUsername: TLabel
          Left = 10
          Top = 116
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationDQSLPassword: TLabel
          Left = 10
          Top = 165
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationDQSLPOPHost: TLabel
          Left = 10
          Top = 67
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationDQSLPOPPort: TLabel
          Left = 325
          Top = 67
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object DBEdit7: TDBEdit
          Left = 10
          Top = 37
          Width = 295
          Height = 24
          DataField = 'STATION_DQSL_SMTP_HOST'
          DataSource = dsStations
          TabOrder = 0
        end
        object JvDBCalcEdit1: TJvDBCalcEdit
          Left = 325
          Top = 37
          Width = 81
          Height = 24
          DecimalPlaces = 0
          DisplayFormat = '0'
          ButtonWidth = 25
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          DataField = 'STATION_DQSL_SMTP_PORT'
          DataSource = dsStations
        end
        object DBEdit8: TDBEdit
          Left = 10
          Top = 134
          Width = 182
          Height = 24
          DataField = 'STATION_DQSL_MAIL_USERNAME'
          DataSource = dsStations
          TabOrder = 4
        end
        object meStationDQSLPassword: TMaskEdit
          Left = 10
          Top = 183
          Width = 182
          Height = 24
          PasswordChar = '*'
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 10
          Top = 86
          Width = 295
          Height = 24
          DataField = 'STATION_DQSL_POP_HOST'
          DataSource = dsStations
          TabOrder = 2
        end
        object JvDBCalcEdit2: TJvDBCalcEdit
          Left = 325
          Top = 86
          Width = 81
          Height = 24
          DecimalPlaces = 0
          DisplayFormat = '0'
          ButtonWidth = 25
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          DataField = 'STATION_DQSL_POP_PORT'
          DataSource = dsStations
        end
      end
      object gbDQSLParams: TGroupBox
        Left = 0
        Top = 265
        Width = 416
        Height = 248
        Align = alTop
        Caption = 'gbDQSLParams'
        TabOrder = 2
        object lbStationDQSLDefaultTemplate: TLabel
          Left = 11
          Top = 28
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object dbcbTemplate: TJvDBComboBox
          Left = 11
          Top = 47
          Width = 395
          Height = 24
          DataField = 'STATION_DQSL_DEFAULT_TEMPLATE'
          DataSource = dsStations
          TabOrder = 0
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
      end
    end
    object tsStationDataLOTW: TTabSheet
      Caption = 'tsStationDataLOTW'
      ImageIndex = 4
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 416
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object dbcLoTWActive: TDBCheckBox
          Left = 3
          Top = 8
          Width = 406
          Height = 17
          Caption = 'dbcEQSLActive'
          DataField = 'STATION_LOTW_ACTIVE'
          DataSource = dsStations
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object gbLoTWParams: TGroupBox
        Left = 0
        Top = 40
        Width = 416
        Height = 375
        Align = alClient
        TabOrder = 1
        object lbStationLoTWLogin: TLabel
          Left = 10
          Top = 22
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationLoTWPassword: TLabel
          Left = 10
          Top = 71
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object dbeLoTWLogin: TDBEdit
          Left = 10
          Top = 40
          Width = 182
          Height = 24
          DataField = 'STATION_LOTW_LOGIN'
          DataSource = dsStations
          TabOrder = 0
          OnKeyDown = dbeEQSLLoginKeyDown
          OnKeyPress = dbeEQSLLoginKeyPress
        end
        object meStationLoTWPassword: TMaskEdit
          Left = 10
          Top = 89
          Width = 182
          Height = 24
          PasswordChar = '*'
          TabOrder = 1
        end
        object ldeStationLoTWHome: TLabeledDBEdit
          Left = 10
          Top = 138
          Width = 182
          Height = 24
          DataField = 'STATION_LOTW_HOME'
          DataSource = dsStations
          TabOrder = 2
          EditLabel.Width = 123
          EditLabel.Height = 16
          EditLabel.Caption = 'ldeStationLoTWHome'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
      end
    end
    object tsStationDataHRDLog: TTabSheet
      Caption = 'tsStationDataHRDLog'
      ImageIndex = 5
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 416
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object dbcHRDLogActive: TDBCheckBox
          Left = 3
          Top = 8
          Width = 406
          Height = 17
          Caption = 'dbcEQSLActive'
          DataField = 'STATION_HRDLOG_ACTIVE'
          DataSource = dsStations
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object gbHRDLogParams: TGroupBox
        Left = 0
        Top = 40
        Width = 416
        Height = 375
        Align = alClient
        TabOrder = 1
        object lbStationHRDLogLogin: TLabel
          Left = 10
          Top = 22
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationHRDLogPassword: TLabel
          Left = 10
          Top = 70
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object DBEdit10: TDBEdit
          Left = 10
          Top = 40
          Width = 182
          Height = 24
          DataField = 'STATION_HRDLOG_LOGIN'
          DataSource = dsStations
          TabOrder = 0
          OnKeyDown = dbeEQSLLoginKeyDown
          OnKeyPress = dbeEQSLLoginKeyPress
        end
        object meStationHrdLogPassword: TMaskEdit
          Left = 10
          Top = 89
          Width = 182
          Height = 24
          PasswordChar = '*'
          TabOrder = 1
        end
        object dbcHRDLogSentEvery: TDBCheckBox
          Left = 10
          Top = 128
          Width = 399
          Height = 17
          Caption = 'dbcEQSLSentEvery'
          DataField = 'STATION_HRDLOG_SENT_EVERY'
          DataSource = dsStations
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object tsStationDataQRZCOM: TTabSheet
      Caption = 'tsStationDataQRZCOM'
      ImageIndex = 7
      object gbQRZCOMParams: TGroupBox
        Left = 0
        Top = 0
        Width = 416
        Height = 415
        Align = alClient
        TabOrder = 0
        object lbStationQrzComLogin: TLabel
          Left = 10
          Top = 22
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationQrzComPassword: TLabel
          Left = 10
          Top = 71
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object dbeQRZComLogin: TDBEdit
          Left = 10
          Top = 40
          Width = 182
          Height = 24
          DataField = 'STATION_QRZCOM_LOGIN'
          DataSource = dsStations
          TabOrder = 0
          OnKeyDown = dbeEQSLLoginKeyDown
          OnKeyPress = dbeEQSLLoginKeyPress
        end
        object meStationQrzComPassword: TMaskEdit
          Left = 10
          Top = 89
          Width = 182
          Height = 24
          PasswordChar = '*'
          TabOrder = 1
        end
      end
    end
    object tsStationDataHAMQTH: TTabSheet
      Caption = 'tsStationDataHAMQTH'
      ImageIndex = 6
      object gbHamQTHParams: TGroupBox
        Left = 0
        Top = 0
        Width = 416
        Height = 415
        Align = alClient
        TabOrder = 0
        object lbStationHamQTHLogin: TLabel
          Left = 10
          Top = 22
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object lbStationHamQTHPassword: TLabel
          Left = 10
          Top = 71
          Width = 71
          Height = 16
          Caption = 'lbStationCall'
        end
        object dbeHamQTHLogin: TDBEdit
          Left = 10
          Top = 40
          Width = 182
          Height = 24
          DataField = 'STATION_HAMQTH_LOGIN'
          DataSource = dsStations
          TabOrder = 0
          OnKeyDown = dbeEQSLLoginKeyDown
          OnKeyPress = dbeEQSLLoginKeyPress
        end
        object meStationHAMQTHPassword: TMaskEdit
          Left = 10
          Top = 89
          Width = 182
          Height = 24
          PasswordChar = '*'
          TabOrder = 1
        end
      end
    end
  end
  object JvFooter2: TJvFooter
    Left = 0
    Top = 446
    Width = 424
    Height = 34
    Align = alBottom
    BevelVisible = True
    object btnOk: TButton
      Left = 290
      Top = 4
      Width = 61
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'btnOk'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 355
      Top = 4
      Width = 65
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'btnCancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object cdsStations: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'STATION_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'STATION_CALL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_STREET'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_GRIDSQUARE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_LAT'
        DataType = ftFloat
      end
      item
        Name = 'STATION_LON'
        DataType = ftFloat
      end
      item
        Name = 'STATION_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_CITY'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_COUNTRY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_ITU_ZONE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_CQ_ZONE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_POSTAL_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STATION_RIG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_EQSL_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_EQSL_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_BOOK_NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_BOOK_DESCRIPTION'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_EQSL_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_SMTP_HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_SMTP_PORT'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_MAIL_USERNAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_MAIL_PASSWORD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_DEFAULT_TEMPLATE'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_DQSL_POP_HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_POP_PORT'
        DataType = ftInteger
      end
      item
        Name = 'STATION_CNTY'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_IOTA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_SIG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_SIG_INFO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_STATE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_LOTW_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_HOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_EQSL_SENT_EVERY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_HRDLOG_SENT_EVERY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'IS_GROUP'
        DataType = ftInteger
      end
      item
        Name = 'STATION_HAMQTH_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HAMQTH_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_QRZCOM_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_QRZCOM_PASSWORD'
        DataType = ftString
        Size = 100
      end>
    DataSet = dmMain.qryStations
    Left = 352
    Top = 408
    object cdsStationsSTATION_ID: TAutoIncField
      FieldName = 'STATION_ID'
    end
    object cdsStationsSTATION_CALL: TStringField
      FieldName = 'STATION_CALL'
      Size = 100
    end
    object cdsStationsSTATION_STREET: TStringField
      FieldName = 'STATION_STREET'
      Size = 255
    end
    object cdsStationsSTATION_GRIDSQUARE: TStringField
      FieldName = 'STATION_GRIDSQUARE'
      Size = 255
    end
    object cdsStationsSTATION_LAT: TFloatField
      FieldName = 'STATION_LAT'
    end
    object cdsStationsSTATION_LON: TFloatField
      FieldName = 'STATION_LON'
    end
    object cdsStationsSTATION_NAME: TStringField
      FieldName = 'STATION_NAME'
      Size = 255
    end
    object cdsStationsSTATION_CITY: TStringField
      FieldName = 'STATION_CITY'
      Size = 255
    end
    object cdsStationsSTATION_COUNTRY: TIntegerField
      FieldName = 'STATION_COUNTRY'
    end
    object cdsStationsSTATION_ITU_ZONE: TIntegerField
      FieldName = 'STATION_ITU_ZONE'
    end
    object cdsStationsSTATION_CQ_ZONE: TIntegerField
      FieldName = 'STATION_CQ_ZONE'
    end
    object cdsStationsSTATION_POSTAL_CODE: TStringField
      FieldName = 'STATION_POSTAL_CODE'
    end
    object cdsStationsSTATION_RIG: TStringField
      FieldName = 'STATION_RIG'
      Size = 255
    end
    object cdsStationsSTATION_EQSL_LOGIN: TStringField
      FieldName = 'STATION_EQSL_LOGIN'
      Size = 100
    end
    object cdsStationsSTATION_EQSL_PASSWORD: TStringField
      FieldName = 'STATION_EQSL_PASSWORD'
      Size = 100
    end
    object cdsStationsSTATION_BOOK_NAME: TStringField
      FieldName = 'STATION_BOOK_NAME'
      Size = 254
    end
    object cdsStationsSTATION_BOOK_DESCRIPTION: TStringField
      FieldName = 'STATION_BOOK_DESCRIPTION'
      Size = 254
    end
    object cdsStationsSTATION_EQSL_ACTIVE: TIntegerField
      FieldName = 'STATION_EQSL_ACTIVE'
    end
    object cdsStationsSTATION_DQSL_ACTIVE: TIntegerField
      FieldName = 'STATION_DQSL_ACTIVE'
    end
    object cdsStationsSTATION_DQSL_SMTP_HOST: TStringField
      FieldName = 'STATION_DQSL_SMTP_HOST'
      Size = 50
    end
    object cdsStationsSTATION_DQSL_SMTP_PORT: TIntegerField
      FieldName = 'STATION_DQSL_SMTP_PORT'
    end
    object cdsStationsSTATION_DQSL_MAIL_USERNAME: TStringField
      FieldName = 'STATION_DQSL_MAIL_USERNAME'
      Size = 50
    end
    object cdsStationsSTATION_DQSL_MAIL_PASSWORD: TStringField
      FieldName = 'STATION_DQSL_MAIL_PASSWORD'
      Size = 50
    end
    object cdsStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField
      FieldName = 'STATION_DQSL_DEFAULT_TEMPLATE'
      Size = 254
    end
    object cdsStationsSTATION_DQSL_POP_HOST: TStringField
      FieldName = 'STATION_DQSL_POP_HOST'
      Size = 50
    end
    object cdsStationsSTATION_DQSL_POP_PORT: TIntegerField
      FieldName = 'STATION_DQSL_POP_PORT'
    end
    object cdsStationsSTATION_CNTY: TStringField
      FieldName = 'STATION_CNTY'
      Size = 100
    end
    object cdsStationsSTATION_IOTA: TStringField
      FieldName = 'STATION_IOTA'
      Size = 100
    end
    object cdsStationsSTATION_IOTA_ISLAND_ID: TStringField
      FieldName = 'STATION_IOTA_ISLAND_ID'
      Size = 100
    end
    object cdsStationsSTATION_SIG: TStringField
      FieldName = 'STATION_SIG'
      Size = 255
    end
    object cdsStationsSTATION_SIG_INFO: TStringField
      FieldName = 'STATION_SIG_INFO'
      Size = 255
    end
    object cdsStationsSTATION_STATE: TStringField
      FieldName = 'STATION_STATE'
      Size = 100
    end
    object cdsStationsSTATION_LOTW_ACTIVE: TIntegerField
      FieldName = 'STATION_LOTW_ACTIVE'
    end
    object cdsStationsSTATION_LOTW_LOGIN: TStringField
      FieldName = 'STATION_LOTW_LOGIN'
      Size = 100
    end
    object cdsStationsSTATION_LOTW_PASSWORD: TStringField
      FieldName = 'STATION_LOTW_PASSWORD'
      Size = 100
    end
    object cdsStationsSTATION_LOTW_HOME: TStringField
      FieldName = 'STATION_LOTW_HOME'
      Size = 100
    end
    object cdsStationsSTATION_HRDLOG_LOGIN: TStringField
      FieldName = 'STATION_HRDLOG_LOGIN'
      Size = 100
    end
    object cdsStationsSTATION_HRDLOG_PASSWORD: TStringField
      FieldName = 'STATION_HRDLOG_PASSWORD'
      Size = 100
    end
    object cdsStationsSTATION_HRDLOG_ACTIVE: TIntegerField
      FieldName = 'STATION_HRDLOG_ACTIVE'
    end
    object cdsStationsSTATION_EQSL_SENT_EVERY: TIntegerField
      FieldName = 'STATION_EQSL_SENT_EVERY'
    end
    object cdsStationsSTATION_HRDLOG_SENT_EVERY: TIntegerField
      FieldName = 'STATION_HRDLOG_SENT_EVERY'
    end
    object cdsStationsSTATION_PARENT_ID: TIntegerField
      FieldName = 'STATION_PARENT_ID'
    end
    object cdsStationsIS_GROUP: TIntegerField
      FieldName = 'IS_GROUP'
    end
    object cdsStationsSTATION_HAMQTH_LOGIN: TStringField
      FieldName = 'STATION_HAMQTH_LOGIN'
      Size = 100
    end
    object cdsStationsSTATION_HAMQTH_PASSWORD: TStringField
      FieldName = 'STATION_HAMQTH_PASSWORD'
      Size = 100
    end
    object cdsStationsSTATION_QRZCOM_LOGIN: TStringField
      FieldName = 'STATION_QRZCOM_LOGIN'
      Size = 100
    end
    object cdsStationsSTATION_QRZCOM_PASSWORD: TStringField
      FieldName = 'STATION_QRZCOM_PASSWORD'
      Size = 100
    end
  end
  object dsStations: TDataSource
    DataSet = cdsStations
    Left = 264
    Top = 352
  end
  object qryTerritory: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = dmMain.DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'TERRITORY'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'TERRITORY_ID'
        DataType = ftInteger
      end
      item
        Name = 'TERRITORY_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ADIF_ID'
        DataType = ftInteger
      end
      item
        Name = 'CONTINENT_ID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'TERRITORY_NAME ASC'
        Expression = 'TERRITORY_NAME'
        Options = [ixExpression]
      end>
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
    Left = 360
    Top = 264
    object qryTerritoryTERRITORY_ID: TIntegerField
      FieldName = 'TERRITORY_ID'
    end
    object qryTerritoryTERRITORY_NAME: TStringField
      FieldName = 'TERRITORY_NAME'
      Size = 100
    end
    object qryTerritoryADIF_ID: TIntegerField
      FieldName = 'ADIF_ID'
    end
    object qryTerritoryCONTINENT_ID: TIntegerField
      FieldName = 'CONTINENT_ID'
    end
  end
  object dsTerritory: TDataSource
    DataSet = qryTerritory
    Left = 288
    Top = 280
  end
  object qryStationsUpdate: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = dmMain.DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'STATIONS'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'STATION_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'STATION_CALL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_STREET'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_GRIDSQUARE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_LAT'
        DataType = ftFloat
      end
      item
        Name = 'STATION_LON'
        DataType = ftFloat
      end
      item
        Name = 'STATION_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_CITY'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_COUNTRY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_ITU_ZONE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_CQ_ZONE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_POSTAL_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STATION_RIG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_EQSL_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_EQSL_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_BOOK_NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_BOOK_DESCRIPTION'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_EQSL_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_SMTP_HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_SMTP_PORT'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_MAIL_USERNAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_MAIL_PASSWORD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_DEFAULT_TEMPLATE'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_DQSL_POP_HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_POP_PORT'
        DataType = ftInteger
      end
      item
        Name = 'STATION_CNTY'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_IOTA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_SIG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_SIG_INFO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_STATE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_LOTW_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_HOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_EQSL_SENT_EVERY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_HRDLOG_SENT_EVERY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'IS_GROUP'
        DataType = ftInteger
      end
      item
        Name = 'STATION_HAMQTH_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HAMQTH_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_QRZCOM_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_QRZCOM_PASSWORD'
        DataType = ftString
        Size = 100
      end>
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
    Left = 224
    Top = 304
  end
end
