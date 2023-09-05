unit Pessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class
  private
    FNome: String;
    procedure SetNome(const Value: String);
  public
    function TrataCPFCNPJ(aValue : String) : String;
    procedure ValidarCampo;
    property Nome : String read FNome write SetNome;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
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
