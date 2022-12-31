unit diversos.sorteador.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.Generics.Collections,
  diversos.sorteador.classe.sorteio;

type
  TCanditado = record
    ID: String;
    Nome: String;
    EmUso: Boolean;
  end;

  TfrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    pnlTopo: TPanel;
    lblArquivo: TLabel;
    edtArquivo: TEdit;
    btnCarregar: TSpeedButton;
    pnlSorteio: TPanel;
    pnlGanhador: TPanel;
    lblGanhador: TLabel;
    lblCentral: TLabel;
    timSorteio: TTimer;
    dlgArquivo: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure timSorteioTimer(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
  private
    FEmSorteio: Boolean;
    FSorteio: TSorteio;
    FTempoEspera: Integer;
    FCandidato: TDictionary<String, TCanditado>;

    function FormatarNumero(const ANumero: Integer): string;
    procedure ImportarArquivo(const AArquivo: String);
    procedure LimparTela;
    function PesquisarNumeroArquivo(const ANumero: String): Boolean;
    procedure ResetarTempoEspera;
    function RetornarGanhador(const ANumero: String): String;
    procedure SortearNumero;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.LimparTela;
begin
  lblCentral.Caption := EmptyStr;
  lblGanhador.Caption := EmptyStr;
end;

function TfrmPrincipal.FormatarNumero(const ANumero: Integer): string;
begin
  Result := Format('%.3d', [ANumero])
end;

procedure TfrmPrincipal.ImportarArquivo(const AArquivo: String);
var
  LArquivo: TStringList;
  i: Integer;
  LCandidato: TCanditado;
  LLinha: String;
begin
  LArquivo := TStringList.Create;

  try
    with LArquivo do
    begin
      LoadFromFile(AArquivo);
      for i := 0 to Count - 1 do
      begin
        LLinha := LArquivo[i].Trim;
        with LCandidato do
        begin
          ID := Copy(LLinha, 1, 3);
          Nome := Copy(LLinha, 5, 16).Trim;
          EmUso := True;
          if Nome = EmptyStr then
            EmUso := False;
        end;
        FCandidato.Add(LCandidato.ID, LCandidato);
      end;
    end;
  finally
    FreeAndNil(LArquivo);
  end;
end;

function TfrmPrincipal.PesquisarNumeroArquivo(const ANumero: String): Boolean;
var
  LCandidato: TCanditado;
begin
  Result := False;

  with FCandidato do
  begin
    if ContainsKey(ANumero) and TryGetValue(ANumero, LCandidato) then
      Result := LCandidato.EmUso;
  end;
end;

procedure TfrmPrincipal.ResetarTempoEspera;
begin
  FTempoEspera := 5;
end;

function TfrmPrincipal.RetornarGanhador(const ANumero: String): String;
var
  LCandidato: TCanditado;
begin
  Result := EmptyStr;
  if FCandidato.TryGetValue(ANumero, LCandidato) then
    Result := LCandidato.Nome;
end;

procedure TfrmPrincipal.SortearNumero;
var
  LNumeroStr      : String;
  LEncontrouNumero: Boolean;
begin
  LEncontrouNumero := False;
  with FSorteio do
  begin
    ValorMaximo := 101;

    while not LEncontrouNumero do
    begin
      LNumeroStr       := FormatarNumero(Sortear);
      LEncontrouNumero := PesquisarNumeroArquivo(LNumeroStr);
    end;
  end;

  lblCentral.Caption := LNumeroStr;
  lblGanhador.Caption := RetornarGanhador(LNumeroStr);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  timSorteio.Enabled := False;
  FEmSorteio := False;
  FSorteio := TSorteio.Create;
  FCandidato := TDictionary<String, TCanditado>.Create;
  ResetarTempoEspera;
  LimparTela;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCandidato);
  FreeAndNil(FSorteio);
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if FEmSorteio then
      Exit;
    ResetarTempoEspera;
    FEmSorteio          := True;
    lblCentral.Caption  := FTempoEspera.ToString;
    lblGanhador.Caption := EmptyStr;
    timSorteio.Enabled  := True;
  end;
end;

procedure TfrmPrincipal.timSorteioTimer(Sender: TObject);
begin
  Dec(FTempoEspera);
  lblCentral.Caption := IntToStr(FTempoEspera);

  if FTempoEspera = 0 then
  begin
    timSorteio.Enabled := False;

    SortearNumero;
    FEmSorteio := False;
  end;
end;

procedure TfrmPrincipal.btnCarregarClick(Sender: TObject);
var
  LArquivo: String;
begin
  if dlgArquivo.Execute then
    LArquivo := dlgArquivo.FileName;

  if FileExists(LArquivo) then
  begin
    edtArquivo.Text := LArquivo;
    ImportarArquivo(LArquivo);
  end;

end;

end.
