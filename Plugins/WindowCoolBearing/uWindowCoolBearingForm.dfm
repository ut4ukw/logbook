object WindowCoolBearingForm: TWindowCoolBearingForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowCoolBearingForm'
  ClientHeight = 320
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 276
    Width = 434
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    ExplicitTop = 0
    ExplicitWidth = 279
  end
  object pnlBearing: TPanel
    Left = 0
    Top = 279
    Width = 434
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = pnlBearingResize
    object sgBearing: TILSegmentText
      Left = 168
      Top = 2
      Width = 97
      Height = 38
      SegmentsType = stSeven
      Segments.Gap.Value = 0.009999999776482582
      Segments.Width.Value = 0.129999995231628400
      Segments.Color = -16751616
      Segments.CenterColor = -7278960
      DecimalPoint.Visible = True
      DecimalPoint.Offset.Right.Value = 0.039999999105930330
      DecimalPoint.Offset.Bottom.Value = 0.100000001490116100
      DecimalPoint.Size.Value = 0.129999995231628400
      Indents.Left.Value = 0.100000001490116100
      Indents.Right.Value = 0.100000001490116100
      Indents.Top.Value = 0.100000001490116100
      Indents.Bottom.Value = 0.100000001490116100
      Rows = 1
      Cols = 3
    end
  end
  object agBearing: TILAngularGauge
    Left = 0
    Top = 0
    Width = 434
    Height = 276
    Align = alClient
    Border.BevelOuter.Width.Value = 0.019999999552965160
    Border.BevelInner.Width.Value = 0.019999999552965160
    Border.Width._Floats = (
      (
        Value
        0.000000000000000000))
    Border.CornerRadius.Value = 0.100000001490116100
    Caption.Font.Name = 'Microsoft Sans Serif'
    Caption.Font.Style = [fsBold]
    Caption.Font.Brush.Color = -16777216
    Caption.Font.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Caption.Font.Brush.Hatch.Style = HatchStyleHorizontal
    Caption.Font.Brush.Blend.Shape.Focus = 0.500000000000000000
    Caption.Font.Brush.Blend.Shape.Scale = 1.000000000000000000
    Caption.Font.Brush.LinearGradientMode = lmHorizontal
    Caption.Font.Pen.Brush.Color = -16777216
    Caption.Font.Pen.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Caption.Font.Pen.Brush.Hatch.Style = HatchStyleHorizontal
    Caption.Font.Pen.Brush.Blend.Shape.Focus = 0.500000000000000000
    Caption.Font.Pen.Brush.Blend.Shape.Scale = 1.000000000000000000
    Caption.Font.Pen.Brush.LinearGradientMode = lmHorizontal
    Caption.Font.Pen.Width = 1.000000000000000000
    Caption.Font.Pen.DashStyle._Floats = (
      (
        Offset
        0.000000000000000000))
    Caption.Font.Pen.Enabled = False
    Caption.Font.Pen.AdditionalPens = <>
    Caption.Font.Pen._Floats = (
      (
        MiterLimit
        0.000000000000000000))
    Caption.Font.Size.Value = 0.090000003576278680
    Caption.Position.X._Floats = (
      (
        Value
        0.000000000000000000))
    Caption.Position.Y.Value = 60.000000000000000000
    Caption.Position.Y.Proportional = False
    Caption.AdditionalCaptions = <>
    Caption._Floats = (
      (
        Angle
        0.000000000000000000))
    Scale.Position.Value = 0.899999976158142100
    Scale.Precision.NumberDigits = 2
    Scale.Precision.FixedPrecision = False
    Scale.MajorTicks.Visible = True
    Scale.MajorTicks.Thickness.Value = 0.019999999552965160
    Scale.MajorTicks.Length.Value = 0.050000000745058060
    Scale.MajorTicks.Count = 13
    Scale.MajorTicks.Brush.Color = -16777216
    Scale.MajorTicks.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Scale.MajorTicks.Brush.Hatch.Style = HatchStyleHorizontal
    Scale.MajorTicks.Brush.Blend.Shape.Focus = 0.500000000000000000
    Scale.MajorTicks.Brush.Blend.Shape.Scale = 1.000000000000000000
    Scale.MajorTicks.Brush.LinearGradientMode = lmHorizontal
    Scale.MajorTicks.Labels.Position.Value = 0.750000000000000000
    Scale.MajorTicks.Labels.Visible = True
    Scale.MajorTicks.Labels.Font.Name = 'Microsoft Sans Serif'
    Scale.MajorTicks.Labels.Font.Style = [fsBold]
    Scale.MajorTicks.Labels.Font.Brush.Color = -16777216
    Scale.MajorTicks.Labels.Font.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Scale.MajorTicks.Labels.Font.Brush.Hatch.Style = HatchStyleHorizontal
    Scale.MajorTicks.Labels.Font.Brush.Blend.Shape.Focus = 0.500000000000000000
    Scale.MajorTicks.Labels.Font.Brush.Blend.Shape.Scale = 1.000000000000000000
    Scale.MajorTicks.Labels.Font.Brush.LinearGradientMode = lmHorizontal
    Scale.MajorTicks.Labels.Font.Pen.Brush.Color = -16777216
    Scale.MajorTicks.Labels.Font.Pen.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Scale.MajorTicks.Labels.Font.Pen.Brush.Hatch.Style = HatchStyleHorizontal
    Scale.MajorTicks.Labels.Font.Pen.Brush.Blend.Shape.Focus = 0.500000000000000000
    Scale.MajorTicks.Labels.Font.Pen.Brush.Blend.Shape.Scale = 1.000000000000000000
    Scale.MajorTicks.Labels.Font.Pen.Brush.LinearGradientMode = lmHorizontal
    Scale.MajorTicks.Labels.Font.Pen.Width = 1.000000000000000000
    Scale.MajorTicks.Labels.Font.Pen.DashStyle._Floats = (
      (
        Offset
        0.000000000000000000))
    Scale.MajorTicks.Labels.Font.Pen.Enabled = False
    Scale.MajorTicks.Labels.Font.Pen.AdditionalPens = <>
    Scale.MajorTicks.Labels.Font.Pen._Floats = (
      (
        MiterLimit
        0.000000000000000000))
    Scale.MajorTicks.Labels.Font.Size.Value = 0.090000003576278680
    Scale.MajorTicks.Labels._Floats = (
      (
        Angle
        0.000000000000000000))
    Scale.MajorTicks.MinTick.Visible = True
    Scale.MajorTicks.MinTick.TickLabel.Visible = True
    Scale.MajorTicks.MaxTick.Visible = False
    Scale.MajorTicks.MaxTick.TickLabel.Visible = True
    Scale.MinorTicks.Visible = True
    Scale.MinorTicks.Thickness.Value = 0.009999999776482582
    Scale.MinorTicks.Length.Value = 0.019999999552965160
    Scale.MinorTicks.Count = 4
    Scale.MinorTicks.Brush.Color = -16777216
    Scale.MinorTicks.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Scale.MinorTicks.Brush.Hatch.Style = HatchStyleHorizontal
    Scale.MinorTicks.Brush.Blend.Shape.Focus = 0.500000000000000000
    Scale.MinorTicks.Brush.Blend.Shape.Scale = 1.000000000000000000
    Scale.MinorTicks.Brush.LinearGradientMode = lmHorizontal
    Scale.MinorTicks.Labels.Position.Value = 0.850000023841857900
    Scale.MinorTicks.Labels.Visible = False
    Scale.MinorTicks.Labels.Font.Name = 'Microsoft Sans Serif'
    Scale.MinorTicks.Labels.Font.Style = [fsBold]
    Scale.MinorTicks.Labels.Font.Brush.Color = -16777216
    Scale.MinorTicks.Labels.Font.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Scale.MinorTicks.Labels.Font.Brush.Hatch.Style = HatchStyleHorizontal
    Scale.MinorTicks.Labels.Font.Brush.Blend.Shape.Focus = 0.500000000000000000
    Scale.MinorTicks.Labels.Font.Brush.Blend.Shape.Scale = 1.000000000000000000
    Scale.MinorTicks.Labels.Font.Brush.LinearGradientMode = lmHorizontal
    Scale.MinorTicks.Labels.Font.Pen.Brush.Color = -16777216
    Scale.MinorTicks.Labels.Font.Pen.Brush.Gradient.CenterColor.Point._Floats = (
      (
        X
        0.000000000000000000)
      (
        Y
        0.000000000000000000))
    Scale.MinorTicks.Labels.Font.Pen.Brush.Hatch.Style = HatchStyleHorizontal
    Scale.MinorTicks.Labels.Font.Pen.Brush.Blend.Shape.Focus = 0.500000000000000000
    Scale.MinorTicks.Labels.Font.Pen.Brush.Blend.Shape.Scale = 1.000000000000000000
    Scale.MinorTicks.Labels.Font.Pen.Brush.LinearGradientMode = lmHorizontal
    Scale.MinorTicks.Labels.Font.Pen.Width = 1.000000000000000000
    Scale.MinorTicks.Labels.Font.Pen.DashStyle._Floats = (
      (
        Offset
        0.000000000000000000))
    Scale.MinorTicks.Labels.Font.Pen.Enabled = False
    Scale.MinorTicks.Labels.Font.Pen.AdditionalPens = <>
    Scale.MinorTicks.Labels.Font.Pen._Floats = (
      (
        MiterLimit
        0.000000000000000000))
    Scale.MinorTicks.Labels.Font.Size.Value = 0.064999997615814210
    Scale.MinorTicks.Labels._Floats = (
      (
        Angle
        0.000000000000000000))
    Scale.MinAngle = 90.000000000000000000
    Scale.MaxAngle = 90.000000000000000000
    Ranges.Position.Value = 0.009999999776482582
    Ranges.Ranges = <>
    Ranges.Width.Value = 0.025000000372529030
    Hand.Length.Value = 0.779999971389770500
    Hand.TailLength.Value = 0.400000005960464400
    Hand.TipWidth.Value = 0.019999999552965160
    Hand.TailIndentSize.Value = 0.070000000298023220
    Hand.TailWidth.Value = 0.100000001490116100
    Center.Bottom.Size.Value = 0.200000002980232200
    Center.Bottom.Color = 1686143104
    Center.Top.Size.Value = 0.143000006675720200
    Center.Top.Color = -9404272
    Max = 360.000000000000000000
    Background.UseParentColor = True
    Background.Color = clBtnFace
    ExplicitHeight = 233
    _Floats = (
      (
        Min
        0.000000000000000000)
      (
        Value
        0.000000000000000000))
  end
end
