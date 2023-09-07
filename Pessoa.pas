unit Pessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class
  private
    FNome: String;
    FDtCad: TDateTime;
    FStatus: integer;
    FSenha: string;
    FDtAlt: TDateTime;
    FGUUID: string;
    FTipo: integer;
    FDataAlteracao: TDateTime;
    FDataCadastro: TDateTime;
    procedure SetNome(const Value: String);
    procedure SetDtAlt(const Value: TDateTime);
    procedure SetDtCad(const Value: TDateTime);
    procedure SetGUUID(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetStatus(const Value: integer);
    procedure SetTipo(const Value: integer);
    procedure SetDataAltercao(const Value: TDateTime);
    procedure SetDataCadastro(const Value: TDateTime);
  public
    property Nome : string read FNome write SetNome;
    property GUUID : string read FGUUID write SetGUUID;
    property Senha : string read FSenha write SetSenha;
    property Tipo : integer read FTipo write SetTipo;
    property Status : integer read FStatus write SetStatus;
    property DataCadastro : TDateTime read FDataCadastro write SetDataCadastro;
    property DataAlteracao : TDateTime read FDataAlteracao write SetDataAltercao;

    function TrataCPFCNPJ(aValue : String) : String;
    procedure ValidarCampo;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetDataAltercao(const Value: TDateTime);
begin
  FDataAlteracao := Value;
end;

procedure TPessoa.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TPessoa.SetDtAlt(const Value: TDateTime);
begin
  FDtAlt := Value;
end;

procedure TPessoa.SetDtCad(const Value: TDateTime);
begin
  FDtCad := Value;
end;

procedure TPessoa.SetGUUID(const Value: string);
begin
  FGUUID := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TPessoa.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TPessoa.SetTipo(const Value: integer);
begin
  FTipo := Value;
end;

function TPessoa.TrataCPFCNPJ(aValue: String): String;
var
  I: Integer;
begin
  for I := 1 to Length(aValue) do
  begin
    if aValue[I] in ['0','1','2','3','4','5','6','7','8','9'] then
      Result := Result + aValue[I];
  end;
end;

procedure TPessoa.ValidarCampo;
begin
  if FNome = '' then
    raise Exception.Create('Esse campo é obrigatório');
end;

end.
