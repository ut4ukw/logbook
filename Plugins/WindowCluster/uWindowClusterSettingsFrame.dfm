object WindowClusterSettingsFrame: TWindowClusterSettingsFrame
  Left = 0
  Top = 0
  Width = 472
  Height = 562
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object WindowCluster_gbTelnet: TGroupBox
    Left = 0
    Top = 74
    Width = 472
    Height = 278
    Align = alTop
    Caption = 'WindowCluster_gbTelnet'
    TabOrder = 0
    ExplicitTop = 49
    object WindowCluster_lbClusterURL: TLabel
      Left = 16
      Top = 20
      Width = 165
      Height = 16
      Caption = 'WindowCluster_lbClusterURL'
    end
    object WindowCluster_lbShowSpotLastMinutes: TLabel
      Left = 16
      Top = 198
      Width = 228
      Height = 16
      Caption = 'WindowCluster_lbShowSpotLastMinutes'
    end
    object WindowCluster_cbShowTelnetTab: TCheckBox
      Left = 16
      Top = 175
      Width = 400
      Height = 17
      Caption = 'WindowCluster_cbShowTelnetTab'
      TabOrder = 0
    end
    object spShowSpotLastMinutes: TSpinEdit
      Left = 16
      Top = 220
      Width = 81
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object memURL: TRichEdit
      Left = 16
      Top = 42
      Width = 429
      Height = 121
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object WindowCluster_cbShowDialogBeforeSpot: TCheckBox
      Left = 16
      Top = 254
      Width = 400
      Height = 17
      Caption = 'WindowCluster_cbShowTelnetTab'
      TabOrder = 3
    end
  end
  object WindowCluster_gbWWW: TGroupBox
    Left = 0
    Top = 352
    Width = 472
    Height = 210
    Align = alClient
    Caption = 'WindowCluster_gbWWW'
    TabOrder = 1
    ExplicitTop = 327
    ExplicitHeight = 235
    object WindowCluster_lbAutoLoadMinutes: TLabel
      Left = 16
      Top = 46
      Width = 228
      Height = 16
      Caption = 'WindowCluster_lbShowSpotLastMinutes'
    end
    object WindowCluster_lbWWWSpotCount: TLabel
      Left = 16
      Top = 101
      Width = 198
      Height = 16
      Caption = 'WindowCluster_lbWWWSpotCount'
    end
    object spAutoLoadMinute: TSpinEdit
      Left = 16
      Top = 68
      Width = 81
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object WindowCluster_cbAutoLoadWWW: TCheckBox
      Left = 16
      Top = 20
      Width = 400
      Height = 17
      Caption = 'WindowCluster_cbShowTelnetTab'
      TabOrder = 1
    end
    object cbWWWSpotCount: TComboBox
      Left = 16
      Top = 122
      Width = 81
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = '50'
      Items.Strings = (
        '50'
        '250')
    end
  end
  object WindowCluster_gbGeneral: TGroupBox
    Left = 0
    Top = 0
    Width = 472
    Height = 74
    Align = alTop
    Caption = 'WindowCluster_gbGeneral'
    TabOrder = 2
    object WindowCluster_cbBandSync: TCheckBox
      Left = 16
      Top = 24
      Width = 400
      Height = 17
      Caption = 'WindowCluster_cbShowTelnetTab'
      TabOrder = 0
    end
    object WindowCluster_cbShowAddInfoFromFile: TCheckBox
      Left = 16
      Top = 47
      Width = 400
      Height = 17
      Caption = 'WindowCluster_cbShowTelnetTab'
      TabOrder = 1
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    AfterSavePlacement = FormStorageAfterSavePlacement
    AfterRestorePlacement = FormStorageAfterRestorePlacement
    StoredProps.Strings = (
      'spShowSpotLastMinutes.Value'
      'WindowCluster_cbShowTelnetTab.Checked'
      'spAutoLoadMinute.Value'
      'WindowCluster_cbAutoLoadWWW.Checked'
      'WindowCluster_cbBandSync.Checked'
      'cbWWWSpotCount.ItemIndex'
      'WindowCluster_cbShowDialogBeforeSpot.Checked'
      'WindowCluster_cbShowAddInfoFromFile.Checked')
    StoredValues = <>
    Left = 280
    Top = 440
  end
end
