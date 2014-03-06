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
    procedure Iniciar(const AQuantidadeDiscos: Integer);
    procedure Executar();

    constructor Create(const APainelOrigem, APainelAuxiliar, APainelDestino
      : TPanel);
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

{$REGION 'Métodos de teste' }

(*
  procedure InverteDiscos();
  var
  Indice, Metade: Integer;
  Temp: TDesenjaDiscos.TDisco;
  begin
  Metade:= Trunc( Length( DiscosOrigem ) / 2);
  for Indice := Low( DiscosOrigem ) to Pred( Metade ) do
  begin
  Temp:= DiscosOrigem[ Indice ];
  DiscosOrigem[ Indice ] := DiscosOrigem[ High( DiscosOrigem ) - Indice ];
  DiscosOrigem[ High( DiscosOrigem ) - Indice ] := Temp;
  end;
  end;

  procedure Embaralhar();
  var
  Temp: TDesenjaDiscos.TDisco;
  Range, Indice, RandonIdx: Integer;
  begin
  Range:= Succ( High( DiscosOrigem ) -  Low( DiscosOrigem ) );
  for Indice := Low( DiscosOrigem ) to High( DiscosOrigem ) do
  begin
  RandonIdx:= Low( DiscosOrigem ) + Random( Range );
  Temp:= DiscosOrigem[ Indice ];
  DiscosOrigem[ Indice ]:= DiscosOrigem[ RandonIdx ];
  DiscosOrigem[ RandonIdx ]:= Temp;
  end;
  end;
*)
{$ENDREGION}

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

procedure TTorreHanoi.Iniciar(const AQuantidadeDiscos: Integer);
var
  Indice: Integer;
  Tamanho: Integer;
begin
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

  TDesenjaDiscos.Desenhar(PinoOrigem.Painel, PinoOrigem.Discos);
end;

end.
