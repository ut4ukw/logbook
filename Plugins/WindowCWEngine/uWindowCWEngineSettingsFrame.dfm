object WindowCWEngineSettingsFrame: TWindowCWEngineSettingsFrame
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
  object WindowCWEngine_gbDeviceSettings: TGroupBox
    Left = 0
    Top = 0
    Width = 460
    Height = 81
    Align = alTop
    Caption = 'WindowCWEngine_gbDeviceSettings'
    TabOrder = 0
    object WindowCWEngine_lbComPort: TLabel
      Left = 16
      Top = 20
      Width = 170
      Height = 16
      Caption = 'WindowCWEngine_lbComPort'
    end
    object WindowCWEngine_lbPTT: TLabel
      Left = 136
      Top = 20
      Width = 170
      Height = 16
      Caption = 'WindowCWEngine_lbComPort'
    end
    object WindowCWEngine_lbKey: TLabel
      Left = 256
      Top = 20
      Width = 170
      Height = 16
      Caption = 'WindowCWEngine_lbComPort'
    end
    object cbComPort: TComboBox
      Left = 16
      Top = 40
      Width = 97
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'COM1'
        'COM2'
        'COM3'
        'COM4'
        'COM5'
        'COM6'
        'COM7'
        'COM8'
        'COM9'
        'COM10'
        'COM11'
        'COM12'
        'COM13'
        'COM14'
        'COM15'
        'COM16'
        'COM17'
        'COM18'
        'COM19'
        'COM20')
    end
    object cbPTT: TComboBox
      Left = 136
      Top = 40
      Width = 97
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        '-'
        'DTR'
        'RTS')
    end
    object cbKey: TComboBox
      Left = 256
      Top = 40
      Width = 97
      Height = 24
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        '-'
        'DTR'
        'RTS')
    end
  end
  object WindowCWEngine_gbMacros: TGroupBox
    Left = 0
    Top = 81
    Width = 460
    Height = 485
    Align = alClient
    Caption = 'WindowCWEngine_gbMacros'
    TabOrder = 1
    object CWEngine_btnOk: TLabel
      Left = 152
      Top = 16
      Width = 98
      Height = 16
      Caption = 'CWEngine_btnOk'
      Visible = False
    end
    object CWEngine_btnCancel: TLabel
      Left = 216
      Top = 240
      Width = 121
      Height = 16
      Caption = 'CWEngine_btnCancel'
      Visible = False
    end
    object ToolBar3: TToolBar
      Left = 2
      Top = 18
      Width = 456
      Height = 33
      ButtonHeight = 32
      ButtonWidth = 32
      Caption = 'ToolBar1'
      Images = ilCWEngine
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitTop = 23
      object ToolButton4: TToolButton
        Left = 0
        Top = 0
        Action = CWEngine_aAddMacros
      end
      object ToolButton1: TToolButton
        Left = 32
        Top = 0
        Action = CWEngine_aEditMacros
      end
      object ToolButton7: TToolButton
        Left = 64
        Top = 0
        Action = CWEngine_aDeleteMacros
      end
    end
    object dbgCWEngineMacros: TDBGridEh
      Left = 2
      Top = 51
      Width = 456
      Height = 432
      Align = alClient
      AllowedOperations = []
      ColumnDefValues.EndEllipsis = True
      ColumnDefValues.Title.Alignment = taCenter
      ColumnDefValues.Title.EndEllipsis = True
      ColumnDefValues.Title.TitleButton = True
      DataGrouping.GroupLevels = <>
      DataSource = dsCWEngineMacros
      DrawMemoText = True
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      IndicatorTitle.ShowDropDownSign = True
      IndicatorTitle.TitleButton = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack]
      ReadOnly = True
      RowDetailPanel.Color = clBtnFace
      STFilter.InstantApply = True
      STFilter.Local = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgCWEngineMacrosDblClick
      OnDrawColumnCell = dbgCWEngineMacrosDrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CWENGINE_MACROS_CAPTION'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CWENGINE_MACROS_SHORTCUT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CWENGINE_MACROS_TEXT'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CWENGINE_MACROS_BTNCOLOR'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
        object lbSSTFilterListItem_All: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
        object lbSSTFilterListItem_ClearFilter: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
        object lbSSTFilterListItem_ApplyFilter: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
        object lbSSTFilterListItem_CustomFilter: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
        object lbFilterCaption: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
        object lbShowRecordsWhere: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
        object lbAnd: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
        object lbOr: TLabel
          Left = -139
          Top = -16
          Width = 139
          Height = 16
          Caption = 'msgConfirmPluginDelete'
          Visible = False
        end
      end
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    OnSavePlacement = FormStorageSavePlacement
    AfterRestorePlacement = FormStorageAfterRestorePlacement
    StoredProps.Strings = (
      'cbComPort.ItemIndex'
      'cbKey.ItemIndex'
      'cbPTT.ItemIndex')
    StoredValues = <>
    Left = 272
    Top = 504
  end
  object cdsCWEngineMacros: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'CWENGINE_MACROS_CAPTION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CWENGINE_MACROS_SHORTCUT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CWENGINE_MACROS_TEXT'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'CWENGINE_MACROS_BTNCOLOR'
        DataType = ftString
        Size = 20
      end>
    AutoIncAsInteger = True
    Left = 128
    Top = 288
    object cdsCWEngineMacrosMACROS_CAPTION: TStringField
      FieldName = 'CWENGINE_MACROS_CAPTION'
    end
    object cdsCWEngineMacrosMACROS_SHORTCUT: TStringField
      FieldName = 'CWENGINE_MACROS_SHORTCUT'
    end
    object cdsCWEngineMacrosMACROS_TEXT: TStringField
      DisplayWidth = 4000
      FieldName = 'CWENGINE_MACROS_TEXT'
      Size = 4000
    end
    object cdsCWEngineMacrosCWENGINE_MACROS_BTNCOLOR: TStringField
      FieldName = 'CWENGINE_MACROS_BTNCOLOR'
    end
  end
  object dsCWEngineMacros: TDataSource
    DataSet = cdsCWEngineMacros
    Left = 192
    Top = 216
  end
  object alCWEngine: TActionList
    Images = ilCWEngine
    Left = 192
    Top = 392
    object CWEngine_aAddMacros: TAction
      Tag = -1
      Caption = 'CWEngine_aAddMacros'
      ImageIndex = 0
      OnExecute = CWEngine_aAddMacrosExecute
    end
    object CWEngine_aEditMacros: TAction
      Tag = -1
      Caption = 'aCWEngineEditMacros'
      ImageIndex = 1
      OnExecute = CWEngine_aEditMacrosExecute
      OnUpdate = CWEngine_aEditMacrosUpdate
    end
    object CWEngine_aDeleteMacros: TAction
      Tag = -1
      Caption = 'aCWEngineDeleteMacros'
      ImageIndex = 2
      OnExecute = CWEngine_aDeleteMacrosExecute
      OnUpdate = CWEngine_aDeleteMacrosUpdate
    end
  end
  object ilCWEngine: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 64
    Top = 392
    Bitmap = {
      494C01010500F0000C0610001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
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
      00000000000000000000266C2BFF236727FF1F6223FF1C5E20FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002B7331FF72BC78FF70BC76FF206324FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000317B37FF77BF7CFF74BE7AFF246929FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000037843DFF7BC181FF78C07EFF29702EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D8C44FF80C486FF7CC284FF2F7834FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000043944AFF84C78BFF81C588FF34813BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000489D51FF89CA90FF86C98DFF3A8941FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004EA557FF8DCC94FF8ACB92FF409148FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000054AC5DFF92CF99FF8FCE97FF46994EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000059B363FF95D29EFF93D09BFF5BAB63FF0F2211380000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000498E51BB5DB869F777C582FF99D4A2FF97D3A0FF7BC285FF4B9E53F73471
      3AB8000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000105030656A660DB7ACA86FF9DD6A6FF9BD4A4FF71BF7BFF46924ED90104
      0106000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052A05CD17CCA87FF79C884FF4A9553CF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004F9B59C94C9454C400000000000000000000
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
      0000000000000000000000000000000000000000000096969696B5CDC5FF4481
      6BFF166146FF4A856FFFBBD1C9FF969696960000000000000000000000000000
      000000000203255E9CFF21528DD21B4474AE0F264363040A121B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E63D2FF1835
      C4FF1631C3FF4C61D1FF01061D26000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000072727272B5CEC5FF1D694DFF1D69
      4DFF89B7A3FF1D694DFF1D694DFFBDD3CBFF0000000000000000000000000000
      00000000000025558FD2C0E1F6FFA6D4F0FF83B8DFFF3978B7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000206141B1736C0F51636C8FF1232
      C7FF1132C6FF1232C7FF1736C5FB03061B230000000000000000000000000000
      00000000000000000000000000001B4F1EC4194D1CC900000000000000000000
      0000000000000000000000000000000000000A4932D40D583CFF0D583CFF0D58
      3CFF0D583CFF0D583CFF0D583CFF0D583CFFDDE8E4FF44866DFF257155FF2571
      55FFFFFFFFFF257155FF257155FF4B8B73FF0A4932D40D583CFF0D583CFF0D58
      3CFF0D583CFF22637AFFD5E6F5FFD7E9FAFFCBE3F9FF9FD9F4FF458BC3FFE8EF
      F6FF0D583CFF0D583CFF0A4932D4000000000A4932D40D583CFF0D583CFF0D58
      3CFF0D583CFF0D583CFF0D583CFF0D583CFF1949A4FF1C41CFFF1A40CFFF7990
      E3FFF5F7FEFF607BDDFF183FCDFF102A9CC30000000000000000000000000000
      00000000000000000000235D29CF468E4BFF438B48FF1A511ED1000000000000
      000000000000000000000000000000000000135F42FFFFFFFFFFFFFFFFFFFDFE
      FEFFFBFEFDFFFAFDFCFFF7FCFAFFF4FBF9FFFDFDFDFF2E7B5EFF89B7A3FFFFFF
      FFFFFFFFFFFFFFFFFFFF89B7A3FF337E62FF135F42FFFFFFFFFFFFFFFFFFFDFE
      FEFFFBFEFDFFD4E1EDFF7EA7D2FFF9FCFEFFBCE3F9FF37BDE8FF509ACCFF488D
      C5FFE8EFF6FFE1F4EFFF135F42FF00000000135F42FFFFFFFFFFFFFFFFFFFDFE
      FEFFFBFEFDFFFAFDFCFFF7FCFAFFF4FBF9FF2B54D7FF224CD6FF819BE8FF1942
      D2FF7A97E6FFF0F3FCFF1E4AD5FF1A44CFFB0000000000000000000000000000
      0000010301062E6F33D94F9855FF77BF7CFF74BE7AFF448C49FF1D5620DB0101
      0106000000000000000000000000000000001A6749FFFCFDFDFFFCFEFEFFF9FD
      FCFFF6FBFAFFF1FAF7FFEDF8F5FFE8F6F2FFFCFEFDFF4E9478FF368666FF3686
      66FFFFFFFFFF368666FF368666FF599B82FF1A6749FFFCFDFDFFFCFEFEFFF9FD
      FCFFF6FBFAFFF1FAF7FF6290C2FFC8E4F5FF43D0F4FF00C3F2FF24B8E6FF5098
      CBFF4C91C6FFE8EFF6FF1A6749FF000000001A6749FFFCFDFDFFFCFEFEFFF9FD
      FCFFF6FBFAFFF1FAF7FFEDF8F5FFE8F6F2FF3663E0FF2B5ADDFFF7FAFEFF84A0
      EDFF1D4EDBFF7D9BEBFF2756DCFF204FD6F90000000000000000000000000000
      00002E6934B8398741F763AC6AFF7BC181FF78C07EFF49914EFF246829F7194B
      1DBB00000000000000000000000000000000237051FFFAFCFBFFF9FDFCFFF6FB
      FAFFF1FAF7FFEDF8F5FFE8F6F2FFE3F4EFFFEDF8F5FFBBD7CCFF3E8E6EFF3E8E
      6EFF89B7A3FF3E8E6EFF3E8E6EFFC2DBD1FF237051FFFAFCFBFFF9FDFCFFF6FB
      FAFFF1FAF7FFEDF8F5FFE8EFF6FF5F8FC4FFC2EAF8FF27CBF3FF00C3F2FF24B8
      E6FF5098CBFF5093C8FFE8EFF6FF00000000237051FFFAFCFBFFF9FDFCFFF6FB
      FAFFF1FAF7FFEDF8F5FFE8F6F2FFE3F4EFFF6793E9FF2E63E5FF779BEEFFF5F8
      FDFF85A3EEFF3065E5FF3165E5FF1B42A1B50000000000000000000000000000
      0000000000000E200F384C9953FF80C486FF7CC284FF2F7834FF000000000000
      0000000000000000000000000000000000002B7959FFF8FCFAFFF6FBFAFFF1FA
      F7FFEDF8F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFECF8F5FFBEDACFFF63A7
      8DFF459675FF68AA90FFC4DED3FF969696962B7959FFF8FCFAFFF6FBFAFFF1FA
      F7FFEDF8F5FFE8F6F2FFE3F4EFFFE8EFF6FF6494C5FFC2EBF8FF27CBF3FF00C3
      F2FF24B8E6FF5098CBFF5596CAFF000000002B7959FFF8FCFAFFF6FBFAFFF1FA
      F7FFEDF8F5FFE8F6F2FFE3F4EFFFDDF2ECFFC7E3E9FF4378EBFF336CEAFF336B
      EAFF346CEBFF386FEBFF3971E4FF050C1B1F0000000000000000000000000000
      0000000000000000000043944AFF84C78BFF81C588FF34813BFF000000000000
      000000000000000000000000000000000000358461FFF7FBFAFFF1FAF7FFEDF8
      F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFDFF3EEFFF5FB
      FAFFFFFFFFFFF7FCFBFF86B5A1FF00000000358461FFF7FBFAFFF1FAF7FFEDF8
      F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFE8EFF6FF6A97C7FFC2EBF8FF27CB
      F3FF00C3F2FF26B8E6FF5199CCFF6B9DCBFF358461FFF7FBFAFFF1FAF7FFEDF8
      F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFC4E5E5FF70A2EAFF4B85
      EEFF4A83EDFF82A8F5FF35836CFF000000000000000000000000000000000000
      00000000000000000000489D51FF89CA90FF86C98DFF3A8941FF000000000000
      0000000000000000000000000000000000003D8D69FFF4FAF8FFEDF8F5FFE8F6
      F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6
      DBFFBBE5D9FFD3EEE7FF3D8D69FF000000003D8D69FFF4FAF8FFEDF8F5FFE8F6
      F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFE8EFF6FF6F9BCAFFC2EB
      F8FF27CBF3FF00C3F2FF3EBBE6FF5593C7FF3D8D69FFF4FAF8FFEDF8F5FFE8F6
      F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6
      DBFFBBE5D9FFD3EEE7FF3D8D69FF000000000000000000000000000000000000
      000000000000000000004EA557FF8DCC94FF8ACB92FF409148FF000000000000
      000000000000000000000000000000000000469671FFF1F9F7FFE9F6F2FFE3F4
      EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6DBFFBAE5
      D9FFB7E3D7FFD1EEE6FF469671FF00000000469671FFF1F9F7FFE9F6F2FFE3F4
      EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFE8EFF6FF749E
      CCFFC2EBF8FF41D0F3FF5D9FCEFF2B3F5772469671FFF1F9F7FFE9F6F2FFE3F4
      EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6DBFFBAE5
      D9FFB7E3D7FFD1EEE6FF469671FF000000000000000000000000000000000000
      0000000000000000000054AC5DFF92CF99FF8FCE97FF46994EFF000000000000
      0000000000000000000000000000000000004D9E78FFEEF9F5FFE4F4EFFFDDF2
      ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBFE6DBFFBBE5D9FFB7E3
      D7FFB4E2D5FFD0EDE5FF4D9E78FF000000004D9E78FFEEF9F5FFE4F4EFFFDDF2
      ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBFE6DBFFBBE5D9FFE8EF
      F6FF78A1CEFF7BA4CEFF58989BFF000000004D9E78FFEEF9F5FFE4F4EFFFDDF2
      ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBFE6DBFFBBE5D9FFB7E3
      D7FFB4E2D5FFD0EDE5FF4D9E78FF000000000000000000000000000000000000
      0000000000000000000059B363FF95D29EFF93D09BFF4CA155FF000000000000
      00000000000000000000000000000000000053A57EFFEEF8F5FFEBF7F4FFE8F6
      F2FFE4F5F0FFE1F4EFFFDEF2EDFFDBF1EBFFD8F0E9FFD6EFE8FFD3EEE7FFD1EE
      E6FFD0EDE5FFD0EDE5FF53A57EFF0000000053A57EFFEEF8F5FFEBF7F4FFE8F6
      F2FFE4F5F0FFE1F4EFFFDEF2EDFFDBF1EBFFD8F0E9FFD6EFE8FFD3EEE7FFD1EE
      E6FFC8E6E2FFC5E3E2FF53A57EFF0000000053A57EFFEEF8F5FFEBF7F4FFE8F6
      F2FFE4F5F0FFE1F4EFFFDEF2EDFFDBF1EBFFD8F0E9FFD6EFE8FFD3EEE7FFD1EE
      E6FFD0EDE5FFD0EDE5FF53A57EFF000000000000000000000000000000000000
      000000000000000000005DBA68FF99D4A2FF97D3A0FF51A95BFF000000000000
      00000000000000000000000000000000000053A37CFD58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF53A47DFF0000000053A37CFD58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF53A47DFF0000000053A37CFD58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF53A47DFF000000000000000000000000000000000000
      0000000000000000000061BF6DFF9DD6A6FF9BD4A4FF57B161FF000000000000
      0000000000000000000000000000000000004F9E79FB99C9B2FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF50A17BFF000000004F9E79FB99C9B2FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF50A17BFF000000004F9E79FB99C9B2FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF50A17BFF000000000000000000000000000000000000
      0000000000000000000064C470FFA1D8AAFF9FD7A8FF5BB766FF000000000000
      00000000000000000000000000000000000052A17CF798C9B1FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF54A37EFB0000000052A17CF798C9B1FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF54A37EFB0000000052A17CF798C9B1FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF54A37EFB000000000000000000000000000000000000
      0000000000000000000066C772FF65C571FF63C16EFF60BD6BFF000000000000
      000000000000000000000000000000000000315F498E55A47FF757A781FB57A7
      81FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A7
      81FB57A781FB57A781FB32604B9200000000315F498E55A47FF757A781FB57A7
      81FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A7
      81FB57A781FB57A781FB32604B9200000000315F498E55A47FF757A781FB57A7
      81FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A7
      81FB57A781FB57A781FB32604B92000000000000000000000000000000000000
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
end
