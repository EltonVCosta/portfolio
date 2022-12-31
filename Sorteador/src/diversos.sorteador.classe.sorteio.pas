unit diversos.sorteador.classe.sorteio;

interface

uses
  System.Classes,
  System.Generics.Collections;

type
  TSorteio = class
  private
    FNumerosSorteados: TList<Integer>;
    FValorMaximo: Integer;

    function AdicionarNumeroLista(const ANumero: Integer): Boolean;
    function SortearNumero: Integer;
    function VerificarSeNumeroJaSorteado(const ANumero: Integer): Boolean;
  public
    constructor Create;
    destructor Destroy; override;


    function Sortear: Integer;
    procedure Limpar;

    property ValorMaximo: Integer read FValorMaximo write FValorMaximo;
  end;

implementation

uses
  SysUtils, Dialogs;

{ TSorteio }

function TSorteio.AdicionarNumeroLista(const ANumero: Integer): Boolean;
begin
  Result := False;

  if VerificarSeNumeroJaSorteado(ANumero) then
    Exit;

  FNumerosSorteados.Add(ANumero);
  Result := True;
end;

function TSorteio.SortearNumero: Integer;
begin
  Randomize;
  Result := Random(FValorMaximo);
end;

function TSorteio.VerificarSeNumeroJaSorteado(const ANumero: Integer): Boolean;
begin
  Result := FNumerosSorteados.IndexOf(ANumero) >= 0;
end;

constructor TSorteio.Create;
begin
   FNumerosSorteados := TList<Integer>.Create;
end;

destructor TSorteio.Destroy;
begin
  FreeAndNil(FNumerosSorteados);
  inherited;
end;

procedure TSorteio.Limpar;
begin
  FNumerosSorteados.Clear;
end;

function TSorteio.Sortear: Integer;
var
  LNumeroAdicionado: Boolean;
begin
  repeat
    Result := SortearNumero;

    if Result = 0 then
      LNumeroAdicionado := False
    else
      LNumeroAdicionado := AdicionarNumeroLista(Result)
  until (LNumeroAdicionado = True)
end;

end.
