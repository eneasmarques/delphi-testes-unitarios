unit Pessoa;

interface

type
  TPessoa = class
  private
  public
    function TrataCPFCNPJ(aValue : String) : String;
  end;

implementation

{ TPessoa }

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

end.
