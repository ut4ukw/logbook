object PrintQSLSettings: TPrintQSLSettings
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'PrintQSLSettings'
  ClientHeight = 142
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lbTemplate: TLabel
    Left = 8
    Top = 13
    Width = 64
    Height = 16
    Caption = 'lbTemplate'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 108
    Width = 406
    Height = 34
    Align = alBottom
    BevelVisible = True
    object btnOk: TButton
      Left = 271
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
      Left = 336
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
    object cbShowWindowAdain: TCheckBox
      Left = 8
      Top = 9
      Width = 258
      Height = 17
      Caption = 'cbShowWindowAdain'
      TabOrder = 2
    end
  end
  object cbTemplate: TComboBox
    Left = 8
    Top = 32
    Width = 393
    Height = 24
    Style = csDropDownList
    Sorted = True
    TabOrder = 1
  end
  object cbPreview: TCheckBox
    Left = 8
    Top = 72
    Width = 201
    Height = 17
    Caption = 'cbPreview'
    TabOrder = 2
  end
  object FormStorage: TJvFormStorage
    AppStorage = MainWindow.AppStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpState]
    StoredProps.Strings = (
      'cbShowWindowAdain.Checked'
      'cbTemplate.ItemIndex'
      'cbPreview.Checked')
    StoredValues = <>
    Left = 176
    Top = 16
  end
end
