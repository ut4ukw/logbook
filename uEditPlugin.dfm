object EditPlugin: TEditPlugin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'EditPlugin'
  ClientHeight = 166
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object lbPlugin: TLabel
    Left = 8
    Top = 16
    Width = 44
    Height = 16
    Caption = 'lbPlugin'
  end
  object lbScript: TLabel
    Left = 11
    Top = 67
    Width = 44
    Height = 16
    Caption = 'lbPlugin'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 132
    Width = 354
    Height = 34
    Align = alBottom
    object btnOk: TButton
      Left = 219
      Top = 4
      Width = 61
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'btnOk'
      Default = True
      Enabled = False
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
      Left = 284
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
  object cbPlugins: TComboBox
    Left = 8
    Top = 34
    Width = 341
    Height = 24
    Style = csDropDownList
    TabOrder = 1
    OnClick = cbPluginsClick
  end
  object cbScript: TComboBox
    Left = 8
    Top = 85
    Width = 341
    Height = 24
    Style = csDropDownList
    TabOrder = 2
  end
end