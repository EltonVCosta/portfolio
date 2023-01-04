unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmEtiqueta = class(TForm)
    edtQtdLinhas: TEdit;
    edtQtdColunas: TEdit;
    edtNumeroEtiqueta: TEdit;
    lblQtdLinhas: TLabel;
    lblQtdColunas: TLabel;
    lblNumeroEtiquetas: TLabel;
    pnlInformacao: TPanel;
    pnlTitulo: TPanel;
    btnCalcular: TButton;
    lblInformacao: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    function ValidarConfiguracao: Boolean;
  public
    { Public declarations }
  end;

var
  frmEtiqueta: TfrmEtiqueta;

implementation

uses
  Classe.Etiqueta;

{$R *.dfm}

procedure TfrmEtiqueta.btnCalcularClick(Sender: TObject);
var
  LEtiqueta: TEtiqueta;
  LConfiguracao: TConfiguracaoImpressao;
  LImpressao: TInformacaoImpressao;
begin
  if not ValidarConfiguracao then
    Exit;

  with LConfiguracao do
  begin
    NumeroEtiquetas := StrToIntDef(edtNumeroEtiqueta.Text, 10);
    QuantidadeColunas := StrToIntDef(edtQtdColunas.Text, 20);
    QuantidadeLinhas := StrToIntDef(edtQtdLinhas.Text, 2);
  end;

  LEtiqueta := TEtiqueta.Create;

  try
    LImpressao := LEtiqueta.Calcular(LConfiguracao);
    with LImpressao do
      lblInformacao.Caption := Concat(Format('Linha = %s, Coluna = %s da Página = %s', [Linha.ToString, Coluna.ToString, Pagina.ToString]));
  finally
    FreeAndNil(LEtiqueta);
  end;
end;

function TfrmEtiqueta.ValidarConfiguracao: Boolean;
begin
  Result := True;

  if (Trim(edtNumeroEtiqueta.Text) = EmptyStr)
  or (StrToIntDef(edtNumeroEtiqueta.Text, 0) = 0) then
  begin
    ShowMessage('Informe o número da etiqueta');
    Result := False;
    Exit;
  end;

  if (Trim(edtQtdColunas.Text) = EmptyStr)
  or (StrToIntDef(edtQtdColunas.Text, 0) = 0) then
  begin
    ShowMessage('Informe a quantidade de colunas');
    Result := False;
    Exit;
  end;

  if (Trim(edtQtdLinhas.Text) = EmptyStr)
  or (StrToIntDef(edtQtdLinhas.Text, 0) = 0) then
  begin
    ShowMessage('Informe a quantidade de linhas');
    Result := False;
    Exit;
  end;

end;

end.
