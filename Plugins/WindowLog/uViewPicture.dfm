object ViewPicture: TViewPicture
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'ViewPicture'
  ClientHeight = 286
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object imgPicture: TImage
    Left = 0
    Top = 29
    Width = 418
    Height = 257
    Cursor = crHandPoint
    Align = alClient
    Stretch = True
    OnClick = imgPictureClick
    ExplicitLeft = 128
    ExplicitTop = 120
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object tbMain: TToolBar
    Left = 0
    Top = 0
    Width = 418
    Height = 29
    ButtonHeight = 32
    ButtonWidth = 32
    Caption = 'tbMain'
    TabOrder = 0
    Visible = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 224
    Top = 192
  end
end
