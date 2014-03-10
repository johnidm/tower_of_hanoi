unit UI.Principal;

interface

uses
  Gerenciador.TorreHanoi,
  System.UITypes,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ImgList;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    PnlOrigem: TPanel;
    PnlAuxiliar: TPanel;
    PnlDestino: TPanel;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ButtonedEdit1: TButtonedEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TorreHanoi: TTorreHanoi; // declaração do objeto que ira processar o algoritmo da torre de hanói
  end;

var
  Form2: TForm2;

implementation


{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  // Esse metodo desenha os discos
  TorreHanoi.DesenharDiscos( StrToInt( ButtonedEdit1.Text ) );
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin

  // verifica se os discos ja estão crados
  if ( TorreHanoi.VerificarSeOsDiscosForamCriados ) then
   TorreHanoi.Executar() // Executa o algoritmo da torre de hanói
  else
    MessageDlg( 'É necessário criar os discos', mtInformation, [mbOk], 0 );
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  if ( MessageDlg( 'Deseja realmente sair?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
    Close();
end;

procedure TForm2.ButtonedEdit1RightButtonClick(Sender: TObject);
var
  QuantidadeDiscos: string;
begin
  if ( InputQuery( 'Torre de Hanói', 'Informe a quantidade de discos',
     QuantidadeDiscos)) then
  ButtonedEdit1.Text:= QuantidadeDiscos;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  // Cria o objeto responsável por processar o algoritmo da torre de hanói
  TorreHanoi:= TTorreHanoi.Create( PnlOrigem, PnlAuxiliar, PnlDestino );

end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
   // destroi o objeto criado para processar o algoritmo da torre de hanói
  FreeAndNil( TorreHanoi )
end;

end.
