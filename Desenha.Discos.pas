unit Desenha.Discos;

interface

uses
  Vcl.ExtCtrls, Vcl.Graphics;

type
  TDesenjaDiscos = class
  public
    type
      TDisco = record
        Cor: TColor;
        Tamanho: Integer; // é um sequencial
      end;
      TDiscos = array of TDisco;

      TPino = record
        Discos: TDiscos;
        Painel: TPanel;
      end;

  public
    class procedure Desenhar( APainel: TPanel;  const ADiscos: TDiscos
      ); overload;
    class procedure Desenhar( APainel: TPanel;  const AIndice, ATamanho:
      Integer; ACor: TColor); overload;

    class procedure Apagar( APainel: TPanel ); overload;

    class procedure Apagar( APainel: TPanel;  const AIndice, ATamanho:
      Integer; ACor: TColor); overload;
  end;


implementation

uses
  System.Types;

type
  THackPanel = class(TPanel);


{ TDesenjaDiscos }

class procedure TDesenjaDiscos.Desenhar( APainel: TPanel;
  const ADiscos: TDiscos );

var
  PosicaoEsquerda: Integer;
  Indice: Integer;
  CorOriginal: TColor;

begin
  TDesenjaDiscos.Apagar( APainel );

  CorOriginal := THackPanel( APainel ).Canvas.Brush.Color;

  for Indice := Low( ADiscos ) to High( ADiscos ) do
    TDesenjaDiscos.Desenhar( APainel, Indice, ADiscos[Indice].Tamanho, ADiscos[Indice].Cor);

  THackPanel( APainel ).Canvas.Brush.Color := CorOriginal;

end;

class procedure TDesenjaDiscos.Apagar(APainel: TPanel; const AIndice,
  ATamanho: Integer; ACor: TColor);
begin
  TDesenjaDiscos.Desenhar(APainel, AIndice, ATamanho, APainel.Color);
end;

class procedure TDesenjaDiscos.Apagar(APainel: TPanel);
begin
  THackPanel( APainel ).Canvas.Pen.Style:= psSolid;
  THackPanel( APainel ).Canvas.Brush.Color:= clBtnFace;
  THackPanel( APainel ).Canvas.Rectangle( 0, 0, APainel.Width, APainel.Height );
end;

class procedure TDesenjaDiscos.Desenhar(APainel: TPanel; const AIndice,
  ATamanho: Integer; ACor: TColor);
const
  ESCALA_TAMANHO = 20;
var
  MetadeTamanhoPainel: Integer;
  MetadeTamanhoDisco, TamanhoDisco: Integer;

  Rect: TRect;
begin
  THackPanel( APainel ).Canvas.Pen.Style:= psClear;

  MetadeTamanhoPainel:= Trunc( APainel.Width / 2 );

  TamanhoDisco:= ATamanho * ESCALA_TAMANHO;
  MetadeTamanhoDisco:= Trunc( TamanhoDisco / 2 );

  Rect.Left:= MetadeTamanhoPainel - MetadeTamanhoDisco; // Desenhar no

  Rect.Top:= APainel.Height - ( ESCALA_TAMANHO + ( AIndice * ESCALA_TAMANHO { * 2 }  ) );

  Rect.Bottom:=APainel.Height - (  ( ESCALA_TAMANHO   * 2  ) + ( AIndice *
    ESCALA_TAMANHO { * 2 }  ) );

  Rect.Right:= TamanhoDisco + Rect.Left;

  THackPanel( APainel ).Canvas.Brush.Color:= ACor;
  THackPanel( APainel ).Canvas.Rectangle( Rect );
end;

end.
