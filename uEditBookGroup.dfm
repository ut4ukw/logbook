object EditBookGroup: TEditBookGroup
  Left = 0
  Top = 0
  ActiveControl = leBookGroup
  BorderStyle = bsDialog
  Caption = 'EditBookGroup'
  ClientHeight = 105
  ClientWidth = 273
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
  object JvFooter1: TJvFooter
    Left = 0
    Top = 71
    Width = 273
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
      OnClick = btnOkClick
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
  object leBookGroup: TLabeledEdit
    Left = 8
    Top = 32
    Width = 257
    Height = 24
    EditLabel.Width = 71
    EditLabel.Height = 16
    EditLabel.Caption = 'leBookGroup'
    TabOrder = 1
    OnChange = leBookGroupChange
  end
end
