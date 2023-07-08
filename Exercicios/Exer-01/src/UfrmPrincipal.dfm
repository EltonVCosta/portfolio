object frmEtiqueta: TfrmEtiqueta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Etiquetas'
  ClientHeight = 253
  ClientWidth = 376
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
  object lblQtdLinhas: TLabel
    Left = 59
    Top = 19
    Width = 104
    Height = 13
    Caption = 'Quantidade de Linhas'
  end
  object lblQtdColunas: TLabel
    Left = 51
    Top = 46
    Width = 112
    Height = 13
    Caption = 'Quantidade de Colunas'
  end
  object lblNumeroEtiquetas: TLabel
    Left = 68
    Top = 75
    Width = 95
    Height = 13
    Caption = 'N'#250'mero de etiqueta'
  end
  object edtQtdLinhas: TEdit
    Left = 169
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtQtdColunas: TEdit
    Left = 169
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtNumeroEtiqueta: TEdit
    Left = 169
    Top = 70
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object pnlInformacao: TPanel
    Left = 0
    Top = 145
    Width = 376
    Height = 108
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = -8
    ExplicitTop = 137
    object lblInformacao: TLabel
      Left = 0
      Top = 25
      Width = 376
      Height = 83
      Align = alClient
      Alignment = taCenter
      Caption = 'RESULTADO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 84
      ExplicitHeight = 16
    end
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 376
      Height = 25
      Align = alTop
      Caption = 'Informa'#231#227'o da Impress'#227'o'
      TabOrder = 0
    end
  end
  object btnCalcular: TButton
    Left = 68
    Top = 97
    Width = 222
    Height = 33
    Caption = 'Calcular'
    TabOrder = 4
    OnClick = btnCalcularClick
  end
end
