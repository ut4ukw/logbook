object FieldValueReplace: TFieldValueReplace
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FieldValueReplace'
  ClientHeight = 391
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lbField: TLabel
    Left = 8
    Top = 13
    Width = 37
    Height = 16
    Caption = 'lbField'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 356
    Width = 267
    Height = 35
    Align = alBottom
    BevelVisible = True
    object btnOk: TButton
      Left = 133
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
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 198
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
  object cbFields: TComboBox
    Left = 8
    Top = 32
    Width = 249
    Height = 24
    Style = csDropDownList
    Sorted = True
    TabOrder = 1
    OnClick = cbFieldsClick
  end
  object cbReplaceAll: TCheckBox
    Left = 9
    Top = 332
    Width = 250
    Height = 15
    Caption = 'cbFromFile'
    TabOrder = 2
  end
  object gbReplace: TGroupBox
    Left = 8
    Top = 62
    Width = 251
    Height = 256
    Caption = 'gbReplace'
    TabOrder = 3
    object lbValue: TLabel
      Left = 16
      Top = 49
      Width = 37
      Height = 16
      Caption = 'lbField'
    end
    object rbCustom: TRadioButton
      Left = 16
      Top = 26
      Width = 216
      Height = 17
      Caption = 'rbCustom'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbCustomClick
    end
    object edtString: TEdit
      Left = 16
      Top = 67
      Width = 216
      Height = 24
      TabOrder = 1
      Visible = False
    end
    object edtNumber: TJvCalcEdit
      Left = 17
      Top = 67
      Width = 216
      Height = 24
      ButtonWidth = 25
      TabOrder = 2
      Visible = False
      DecimalPlacesAlwaysShown = False
    end
    object edtDateTime: TDateTimePickerEx
      Left = 16
      Top = 67
      Width = 217
      Height = 24
      Date = 40533.490027141200000000
      Time = 40533.490027141200000000
      TabOrder = 3
      Visible = False
      FormatString = 'dd.MM.yyyy HH:mm:ss'
      FormatBlank = #39#39
      DateTime = 40533.490027141200000000
    end
    object rbFile: TRadioButton
      Left = 17
      Top = 110
      Width = 215
      Height = 17
      Caption = 'RadioButton1'
      TabOrder = 4
      OnClick = rbFileClick
    end
    object feFileName: TJvFilenameEdit
      Left = 17
      Top = 133
      Width = 215
      Height = 24
      DefaultExt = '*.txt'
      Filter = 'Text files (*.txt)|*.txt|All Files (*.*)|*.*'
      Enabled = False
      ButtonWidth = 22
      TabOrder = 5
    end
    object rbField: TRadioButton
      Left = 17
      Top = 186
      Width = 215
      Height = 17
      Caption = 'RadioButton1'
      TabOrder = 6
      OnClick = rbFieldClick
    end
    object cbFieldsFrom: TComboBox
      Left = 17
      Top = 209
      Width = 215
      Height = 24
      Style = csDropDownList
      Enabled = False
      Sorted = True
      TabOrder = 7
      OnClick = cbFieldsFromClick
    end
  end
end
