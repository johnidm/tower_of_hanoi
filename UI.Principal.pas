unit UI.Principal;

interface

uses
  Gerenciador.TorreHanoi,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ImgList;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    PnlOrigem: TPanel;
    PnlAuxiliar: TPanel;
    PnlDestino: TPanel;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    ButtonedEdit1: TButtonedEdit;
    ImageList1: TImageList;
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
    TorreHanoi: TTorreHanoi;
  end;

var
  Form2: TForm2;

implementation


{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  // Esse metodo inicia os discos
  TorreHanoi.Iniciar( StrToInt( ButtonedEdit1.Text ) );
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  // Executa o algoritmo da torre de hanói
  TorreHanoi.Executar();
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
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
  // Cria o objeto ressponsável por executar as ações da torre de hanói
  TorreHanoi:= TTorreHanoi.Create( PnlOrigem, PnlAuxiliar, PnlDestino );
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FreeAndNil( TorreHanoi )
end;

end.
