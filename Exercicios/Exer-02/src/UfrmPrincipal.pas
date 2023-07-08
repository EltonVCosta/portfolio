unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    edtBase: TEdit;
    edtExpoente: TEdit;
    lblBase: TLabel;
    Label1: TLabel;
    btnCalcular: TButton;
    pnlResultado: TPanel;
    procedure btnCalcularClick(Sender: TObject);
  private
    function CalcularExponencial(const ABase, AExpoente: Integer): Integer;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function TfrmPrincipal.CalcularExponencial(const ABase, AExpoente: Integer): Integer;
var
  LContador: Integer;
begin
  if AExpoente = 1 then
  begin
    Result := ABase;
    Exit;
  end;

  if AExpoente = 0 then
  begin
    Result := 1;
    Exit;
  end;

  LContador := 1;
  Result := ABase;

  while (LContador < AExpoente) do
  begin
    Result := Result * ABase;
    Inc(LContador);
  end;
end;

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
var
  LBase: Integer;
  LExpoente: Integer;
begin
  if (edtBase.Text = EmptyStr) then
  begin
    ShowMessage('Informe um valor para base');
    Exit;
  end;

  if (edtBase.Text = EmptyStr) then
  begin
    ShowMessage('Informe um valor para o expoente');
    Exit;
  end;

  LBase := StrToIntDef(edtBase.Text, 1);
  LExpoente := StrToIntDef(edtExpoente.Text, 1);
  pnlResultado.Caption := CalcularExponencial(LBase, LExpoente).ToString;
end;

end.
