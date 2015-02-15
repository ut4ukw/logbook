object WindowPluginForm: TWindowPluginForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TWindowPluginForm'
  ClientHeight = 320
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 40
    Top = 80
    Width = 185
    Height = 153
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
  end
end
