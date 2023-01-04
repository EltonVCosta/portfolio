object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exponencial'
  ClientHeight = 299
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblBase: TLabel
    Left = 27
    Top = 35
    Width = 23
    Height = 13
    Caption = 'Base'
  end
  object Label1: TLabel
    Left = 27
    Top = 59
    Width = 46
    Height = 13
    Caption = 'Expoente'
  end
  object edtBase: TEdit
    Left = 79
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtExpoente: TEdit
    Left = 79
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnCalcular: TButton
    Left = 27
    Top = 83
    Width = 190
    Height = 38
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btnCalcularClick
  end
  object pnlResultado: TPanel
    Left = 0
    Top = 136
    Width = 240
    Height = 163
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
