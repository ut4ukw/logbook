object WindowRadioControlSettingsFrame: TWindowRadioControlSettingsFrame
  Left = 0
  Top = 0
  Width = 460
  Height = 349
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object WindowRadioControl_gbFreqDisplay: TGroupBox
    Left = 0
    Top = 0
    Width = 460
    Height = 160
    Align = alTop
    Caption = 'WindowRadioControl_gbFreqDisplay'
    TabOrder = 0
    object WindowRadioControl_lbFreqDisplayDigits: TLabel
      Left = 16
      Top = 28
      Width = 233
      Height = 16
      Caption = 'WindowRadioControl_lbFreqDisplayDigits'
    end
    object WindowRadioControl_lbFreqDisplayColor: TLabel
      Left = 16
      Top = 88
      Width = 202
      Height = 16
      Caption = 'WindowRadioControl_lbFreqDisplay'
    end
    object WindowRadioControl_spFreqDisplayDigits: TSpinEdit
      Left = 16
      Top = 50
      Width = 65
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object WindowRadioControl_cbFreqDisplayColor: TJvColorComboBox
      Left = 16
      Top = 109
      Width = 153
      Height = 23
      ColorNameMap.Strings = (
        'clBlack=Black'
        'clMaroon=Maroon'
        'clGreen=Green'
        'clOlive=Olive green'
        'clNavy=Navy blue'
        'clPurple=Purple'
        'clTeal=Teal'
        'clGray=Gray'
        'clSilver=Silver'
        'clRed=Red'
        'clLime=Lime'
        'clYellow=Yellow'
        'clBlue=Blue'
        'clFuchsia=Fuchsia'
        'clAqua=Aqua'
        'clWhite=White'
        'clMoneyGreen=Money green'
        'clSkyBlue=Sky blue'
        'clCream=Cream'
        'clMedGray=Medium gray'
        'clScrollBar=Scrollbar'
        'clBackground=Desktop background'
        'clActiveCaption=Active window title bar'
        'clInactiveCaption=Inactive window title bar'
        'clMenu=Menu background'
        'clWindow=Window background'
        'clWindowFrame=Window frame'
        'clMenuText=Menu text'
        'clWindowText=Window text'
        'clCaptionText=Active window title bar text'
        'clActiveBorder=Active window border'
        'clInactiveBorder=Inactive window border'
        'clAppWorkSpace=Application workspace'
        'clHighlight=Selection background'
        'clHighlightText=Selection text'
        'clBtnFace=Button face'
        'clBtnShadow=Button shadow'
        'clGrayText=Dimmed text'
        'clBtnText=Button text'
        'clInactiveCaptionText=Inactive window title bar text'
        'clBtnHighlight=Button highlight'
        'cl3DDkShadow=Dark shadow 3D elements'
        'cl3DLight=Highlight 3D elements'
        'clInfoText=Tooltip text'
        'clInfoBk=Tooltip background'
        'clGradientActiveCaption=Gradient Active Caption'
        'clGradientInactiveCaption=Gradient Inactive Caption'
        'clHotLight=Hot Light'
        'clMenuBar=Menu Bar'
        'clMenuHighlight=Menu Highlight')
      ColorDialogText = 'Custom...'
      DroppedDownWidth = 153
      NewColorText = 'Custom'
      Options = []
      TabOrder = 1
    end
  end
  object WindowRadioControl_gbControl: TGroupBox
    Left = 0
    Top = 160
    Width = 460
    Height = 161
    Align = alTop
    Caption = 'WindowRadioControl_gbControl'
    TabOrder = 1
    object WindowRadioControl_lbTuneCoarse: TLabel
      Left = 16
      Top = 29
      Width = 205
      Height = 16
      Caption = 'WindowRadioControl_lbTuneCoarse'
    end
    object WindowRadioControl_lbTuneFine: TLabel
      Left = 16
      Top = 91
      Width = 205
      Height = 16
      Caption = 'WindowRadioControl_lbTuneCoarse'
    end
    object seTuneCoarse: TSpinEdit
      Left = 16
      Top = 52
      Width = 65
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object seTuneFine: TSpinEdit
      Left = 16
      Top = 114
      Width = 65
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'WindowRadioControl_cbFreqDisplayColor.ColorValue'
      'WindowRadioControl_spFreqDisplayDigits.Value'
      'seTuneCoarse.Value'
      'seTuneFine.Value')
    StoredValues = <>
    Left = 168
    Top = 296
  end
end
