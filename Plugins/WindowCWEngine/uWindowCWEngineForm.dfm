object WindowCWEngineForm: TWindowCWEngineForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowCWEngineForm'
  ClientHeight = 132
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlText: TPanel
      Left = 0
      Top = 0
      Width = 285
      Height = 28
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object edtText: TEdit
        Left = 0
        Top = 0
        Width = 201
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edtTextKeyDown
      end
    end
    object pnlSpeed: TPanel
      Left = 285
      Top = 0
      Width = 49
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object seSpeed: TSpinEdit
        Left = 0
        Top = 0
        Width = 49
        Height = 26
        MaxValue = 300
        MinValue = 5
        TabOrder = 0
        Value = 25
        OnChange = seSpeedChange
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 28
    Width = 334
    Height = 104
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    OnResize = pnlButtonsResize
  end
  object FormStorageOnExit: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'seSpeed.Value')
    StoredValues = <>
    Left = 72
    Top = 64
  end
  object alCWEngineMacros: TActionList
    Left = 168
    Top = 64
  end
  object alCWEngine: TActionList
    Left = 224
    Top = 72
    object aCWEngineCancelSent: TAction
      Caption = 'aCWEngineCancelSent'
      OnExecute = aCWEngineCancelSentExecute
    end
    object aCWEngineSpeedUp: TAction
      Caption = 'aCWEngineSpeedUp'
      OnExecute = aCWEngineSpeedUpExecute
    end
    object aCWEngineSpeedDown: TAction
      Caption = 'aCWEngineSpeedDown'
      OnExecute = aCWEngineSpeedDownExecute
    end
  end
end
