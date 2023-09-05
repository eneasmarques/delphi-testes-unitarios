unit ProjetoTeste.Principal;

interface
uses
  DUnitX.TestFramework, Pessoa;

type

  [TestFixture]
  TMyTestObject = class(TObject)
  private
    FPessoa : TPessoa;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TrataCPFCNPJ;
  end;

implementation

procedure TMyTestObject.Setup;
begin
  FPessoa := TPessoa.Create;
end;

procedure TMyTestObject.TearDown;
begin
  FPessoa.Free;
end;


procedure TMyTestObject.TrataCPFCNPJ;
var
  Resultado: string;
begin
  Resultado := FPessoa.TrataCPFCNPJ('123.123.123-12');
  Assert.IsTrue(Resultado = '12312312312', 'FPessoa.TrataCPFCNPJ apresentou um ERRO. Resultado = ' + Resultado);
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
