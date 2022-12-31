object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sorteador'
  ClientHeight = 639
  ClientWidth = 936
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 936
    Height = 639
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 152
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlTopo: TPanel
      Left = 0
      Top = 0
      Width = 936
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 96
      ExplicitTop = 88
      ExplicitWidth = 185
      object lblArquivo: TLabel
        Left = 8
        Top = 14
        Width = 37
        Height = 13
        Caption = 'Arquivo'
      end
      object btnCarregar: TSpeedButton
        Left = 511
        Top = 11
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = btnCarregarClick
      end
      object edtArquivo: TEdit
        Left = 51
        Top = 11
        Width = 454
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
    object pnlSorteio: TPanel
      Left = 0
      Top = 41
      Width = 936
      Height = 598
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 96
      ExplicitTop = 96
      ExplicitWidth = 185
      ExplicitHeight = 41
      object lblCentral: TLabel
        Left = 0
        Top = 0
        Width = 936
        Height = 442
        Align = alClient
        Alignment = taCenter
        Caption = 'SORTEIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -120
        Font.Name = 'Myriad Hebrew'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 538
        ExplicitHeight = 139
      end
      object pnlGanhador: TPanel
        Left = 0
        Top = 442
        Width = 936
        Height = 156
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 392
        ExplicitWidth = 811
        object lblGanhador: TLabel
          Left = 0
          Top = 0
          Width = 936
          Height = 156
          Align = alClient
          Alignment = taCenter
          Caption = 'GANHADOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -120
          Font.Name = 'Myriad Hebrew'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 696
          ExplicitHeight = 139
        end
      end
    end
  end
  object timSorteio: TTimer
    Enabled = False
    OnTimer = timSorteioTimer
    Left = 76
    Top = 440
  end
  object dlgArquivo: TOpenDialog
    Filter = 'txt|*.txt'
    Left = 552
    Top = 8
  end
end
