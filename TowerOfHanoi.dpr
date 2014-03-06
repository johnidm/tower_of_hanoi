program TowerOfHanoi;

uses
  Vcl.Forms,
  UI.Principal in 'UI.Principal.pas' {Form2},
  Gerenciador.TorreHanoi in 'Gerenciador.TorreHanoi.pas',
  Desenha.Discos in 'Desenha.Discos.pas',
  Algoritmo.TorreDeHanoi in 'Algoritmo.TorreDeHanoi.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
