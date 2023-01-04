unit Classe.Etiqueta;

interface

type
  TConfiguracaoImpressao = record
    NumeroEtiquetas: Integer;
    QuantidadeColunas: Integer;
    QuantidadeLinhas: Integer;
  end;

  TInformacaoImpressao = record
    Linha: Integer;
    Coluna: Integer;
    Pagina: Integer;

    procedure Limpar;
  end;

  TEtiqueta = class
  private
    function RetornarNumeroDePaginas(const AConfiguracao: TConfiguracaoImpressao): Integer;
  public
    function Calcular(const AConfiguracao: TConfiguracaoImpressao): TInformacaoImpressao;
  end;

implementation

{ TEtiqueta }

function TEtiqueta.RetornarNumeroDePaginas(const AConfiguracao: TConfiguracaoImpressao): Integer;
var
  LTotalDeCelulas: Integer;
begin
  LTotalDeCelulas := AConfiguracao.QuantidadeLinhas * AConfiguracao.QuantidadeColunas;
  Result := AConfiguracao.NumeroEtiquetas div LTotalDeCelulas;

  if (AConfiguracao.NumeroEtiquetas mod LTotalDeCelulas) > 0 then
    Inc(Result);
end;

function TEtiqueta.Calcular(const AConfiguracao: TConfiguracaoImpressao): TInformacaoImpressao;
var
  LNumeroDePaginas: Integer;
  LLinha: Integer;
  LColuna: Integer;
  I: Integer;
  LContadorEtiqueta: Integer;
  LAbortar: Boolean;
begin
  Result.Limpar;
  LLinha := 0;
  LColuna := 0;
  LContadorEtiqueta := 0;
  LAbortar := False;
  LNumeroDePaginas := RetornarNumeroDePaginas(AConfiguracao);

  for I := 1 to LNumeroDePaginas do
  begin
    for LColuna := 1 to AConfiguracao.QuantidadeColunas do
    begin
      for LLinha := 1 to AConfiguracao.QuantidadeLinhas do
      begin
        Inc(LContadorEtiqueta);

        if LContadorEtiqueta = AConfiguracao.NumeroEtiquetas then
        begin
          LAbortar := True;
          Break;
        end;
      end;

      if LAbortar then
        Break;      
    end;
  end;

  with Result do
  begin
    Pagina := LNumeroDePaginas;
    Coluna := LColuna;
    Linha := LLinha;
  end;
end;

{ TInformacaoImpressao }

procedure TInformacaoImpressao.Limpar;
begin
  Linha := 0;
  Coluna := 0;
  Pagina := 0;
end;

end.

