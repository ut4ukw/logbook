object RemoveToBook: TRemoveToBook
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'RemoveToBook'
  ClientHeight = 169
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object JvFooter1: TJvFooter
    Left = 0
    Top = 135
    Width = 341
    Height = 34
    Align = alBottom
    BevelVisible = True
    ExplicitTop = 130
    ExplicitWidth = 267
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
end