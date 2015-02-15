object EditMode: TEditMode
  Left = 0
  Top = 0
  ActiveControl = leModeTitle
  BorderStyle = bsDialog
  Caption = 'EditMode'
  ClientHeight = 203
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object lbModeBackgroundColor: TLabel
    Left = 8
    Top = 110
    Width = 137
    Height = 16
    Caption = 'lbModeBackgroundColor'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 169
    Width = 239
    Height = 34
    Align = alBottom
    BevelVisible = True
    ExplicitLeft = 8
    ExplicitTop = 150
    object btnOk: TButton
      Left = 105
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
    end
    object btnCancel: TButton
      Left = 170
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
    end
  end
  object leModeTitle: TLabeledEdit
    Left = 8
    Top = 32
    Width = 223
    Height = 24
    EditLabel.Width = 66
    EditLabel.Height = 16
    EditLabel.Caption = 'leModeTitle'
    TabOrder = 1
  end
  object leModeDefaultReport: TLabeledEdit
    Left = 8
    Top = 80
    Width = 223
    Height = 24
    EditLabel.Width = 119
    EditLabel.Height = 16
    EditLabel.Caption = 'leModeDefaultReport'
    TabOrder = 2
  end
  object cbColorMode: TJvColorComboBox
    Left = 8
    Top = 129
    Width = 223
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
    DroppedDownWidth = 223
    NewColorText = 'Custom'
    Options = [coText, coStdColors, coCustomColors]
    TabOrder = 3
  end
end
