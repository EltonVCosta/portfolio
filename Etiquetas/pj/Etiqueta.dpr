program Etiqueta;

uses
  Vcl.Forms,
  UfrmPrincipal in '..\src\UfrmPrincipal.pas' {frmEtiqueta},
  Classe.Etiqueta in '..\src\Classe.Etiqueta.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEtiqueta, frmEtiqueta);
  Application.Run;
end.
