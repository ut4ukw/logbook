object PluginFormDesigner: TPluginFormDesigner
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSizeToolWin
  Caption = 'PluginFormDesigner'
  ClientHeight = 280
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Inspector: TJvInspector
    Left = 0
    Top = 29
    Width = 416
    Height = 251
    Align = alClient
    ItemHeight = 16
    TabStop = True
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 48
    ExplicitWidth = 313
    ExplicitHeight = 193
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 416
    Height = 29
    ButtonHeight = 32
    ButtonWidth = 32
    Caption = 'ToolBar1'
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 32
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 64
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 2
    end
  end
end
