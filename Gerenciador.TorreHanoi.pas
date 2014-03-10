unit Gerenciador.TorreHanoi;

interface

uses
  Vcl.ExtCtrls, Vcl.Graphics, Desenha.Discos, Vcl.StdCtrls;

type
  TTorreHanoi = class
  strict private
    PinoOrigem, PinoAuxiliar, PinoDestino: TDesenjaDiscos.TPino;
    QuantidadeDiscos: Integer;

  public
    procedure DesenharDiscos(const AQuantidadeDiscos: Integer);

    procedure Executar();

    function VerificarSeOsDiscosForamCriados(): Boolean;

    constructor Create(const APainelOrigem, APainelAuxiliar,
      APainelDestino: TPanel);
  end;

implementation

uses
  Algoritmo.TorreDeHanoi, System.SysUtils;

{ TTorreHanoi }

constructor TTorreHanoi.Create(const APainelOrigem, APainelAuxiliar,
  APainelDestino: TPanel);
begin
  PinoOrigem.Painel := APainelOrigem;
  PinoAuxiliar.Painel := APainelAuxiliar;
  PinoDestino.Painel := APainelDestino;
end;


procedure TTorreHanoi.Executar;
var
  Algoritmo: TAlgoritmo;

begin

  TDesenjaDiscos.Apagar(PinoAuxiliar.Painel);
  TDesenjaDiscos.Apagar(PinoDestino.Painel);

  Algoritmo := TAlgoritmo.Create();
  try
    Algoritmo.Hanoi(QuantidadeDiscos, PinoOrigem, PinoDestino, PinoAuxiliar);

  finally
    FreeAndNil(Algoritmo);
  end;

end;

function TTorreHanoi.VerificarSeOsDiscosForamCriados: Boolean;
begin
  // Se o vetor estiver preenchido
  // indica que já foi inicializado
  Result := Length(PinoOrigem.Discos) > 0;
end;

procedure TTorreHanoi.DesenharDiscos( const AQuantidadeDiscos: Integer);
var
  Indice: Integer;
  Tamanho: Integer;
begin
  TDesenjaDiscos.Apagar(PinoOrigem.Painel);
  TDesenjaDiscos.Apagar(PinoDestino.Painel);
  TDesenjaDiscos.Apagar(PinoAuxiliar.Painel);


  Tamanho := 0;
  QuantidadeDiscos := AQuantidadeDiscos;

  SetLength(PinoOrigem.Discos, AQuantidadeDiscos);

  for Indice := High(PinoOrigem.Discos) downto 0 do
  begin
    Inc(Tamanho);

    PinoOrigem.Discos[Indice].Cor := Random(256 * 256 * 256);
    // define as corres dos discos
    PinoOrigem.Discos[Indice].Tamanho := Tamanho; // é um sequencial

  end;

  SetLength(PinoAuxiliar.Discos, 0);
  SetLength(PinoDestino.Discos, 0);

  TDesenjaDiscos.DesenharDiscos(PinoOrigem.Painel, PinoOrigem.Discos);
end;

end.
