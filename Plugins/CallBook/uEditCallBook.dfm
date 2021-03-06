object EditCallBook: TEditCallBook
  Left = 0
  Top = 0
  ActiveControl = leCallBookName
  BorderStyle = bsDialog
  Caption = 'EditCallBook'
  ClientHeight = 210
  ClientWidth = 272
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
  object lbCallBookFileName: TLabel
    Left = 8
    Top = 111
    Width = 111
    Height = 16
    Caption = 'lbCallBookFileName'
  end
  object lbCallBookType: TLabel
    Left = 8
    Top = 62
    Width = 86
    Height = 16
    Caption = 'lbCallBookType'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 176
    Width = 272
    Height = 34
    Align = alBottom
    BevelVisible = True
    object btnOk: TButton
      Left = 135
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
      Left = 200
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
  object leCallBookName: TLabeledEdit
    Left = 8
    Top = 32
    Width = 257
    Height = 24
    EditLabel.Width = 91
    EditLabel.Height = 16
    EditLabel.Caption = 'leCallBookName'
    TabOrder = 1
    OnChange = leCallBookNameChange
  end
  object cbTypeCallBook: TComboBox
    Left = 8
    Top = 81
    Width = 188
    Height = 24
    Style = csDropDownList
    TabOrder = 2
    OnClick = cbTypeCallBookClick
    Items.Strings = (
      'CallBook Migration'
      'RIC'
      'UR5EQF Internal Database')
  end
  object feCallBook: TJvFilenameEdit
    Left = 8
    Top = 131
    Width = 257
    Height = 24
    TabOrder = 3
    OnChange = feCallBookChange
  end
end
