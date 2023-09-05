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

    [Test]
    [TestCase('CaseCPF','123.123.123-12,12312312312')]
    [TestCase('CaseCNPJ','12.123.123/0001-12,12123123000112')]
    procedure TratarCPFCNPJ(aValue : String; aResultado : String);
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

procedure TMyTestObject.TratarCPFCNPJ(aValue, aResultado: String);
var
  Resultado: String;
begin
  Resultado := FPessoa.TrataCPFCNPJ(aValue);
  Assert.AreEqual(Resultado, aResultado);
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
