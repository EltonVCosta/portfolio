program Sorteador;

uses
  Vcl.Forms,
  diversos.sorteador.view.principal in '..\src\diversos.sorteador.view.principal.pas' {frmPrincipal},
  diversos.sorteador.classe.sorteio in '..\src\diversos.sorteador.classe.sorteio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
