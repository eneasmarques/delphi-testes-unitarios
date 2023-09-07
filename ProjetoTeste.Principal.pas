unit ProjetoTeste.Principal;

interface

uses
  DUnitX.TestFramework, Pessoa, PessoaDAO;

type

  [TestFixture]
  TMyTestObject = class(TObject)
  private
    FPessoa: TPessoa;
    FPessoaDAO: TPessoaDAO;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TrataCPFCNPJ;

    [Test]
    [TestCase('CaseCPF', '123.123.123-12,12312312312')]
    [TestCase('CaseCNPJ', '12.123.123/0001-12,12123123000112')]
    procedure TratarCPFCNPJ(aValue: String; aResultado: String);

    [Test]
    procedure ValidarCampos;

    [Test]
    procedure Insert;
  end;

implementation

uses
  System.SysUtils, Delphi.Mocks;

procedure TMyTestObject.Insert;
begin
  try
    FPessoaDAO.Entidade.Guuid := '99999';
    FPessoaDAO.Entidade.Nome := '99999';
    FPessoaDAO.Entidade.Senha := '99999';
    FPessoaDAO.Entidade.Tipo := 9;
    FPessoaDAO.Entidade.Status := 9;
    FPessoaDAO.Entidade.DataCadastro := Now;
    FPessoaDAO.Entidade.DataAlteracao := Now;

    FPessoaDAO.Insert;

    FPessoaDAO.BuscarID('99999');

    Assert.IsTrue(FPessoaDAO.Entidade.Guuid = '99999',
      'TPessoaDAO.Insert Erro ao Inserir GUUID');
    Assert.IsTrue(FPessoaDAO.Entidade.Nome = '99999',
      'TPessoaDAO.Insert Erro ao Inserir NOME');
    Assert.IsTrue(FPessoaDAO.Entidade.Senha = '99999',
      'TPessoaDAO.Insert Erro ao Inserir Senha');
    Assert.IsTrue(FPessoaDAO.Entidade.Tipo = 9,
      'TPessoaDAO.Insert Erro ao Inserir Tipo');
    Assert.IsTrue(FPessoaDAO.Entidade.Status = 9,
      'TPessoaDAO.Insert Erro ao Inserir Status');
    Assert.IsNotNull(FPessoaDAO.Entidade.DataCadastro);
    Assert.IsNotNull(FPessoaDAO.Entidade.DataAlteracao);
  finally
    FPessoaDAO.Entidade.Guuid := '99999';
    FPessoaDAO.Delete;
  end;

end;

procedure TMyTestObject.Setup;
var
  Mock: TMock<iSession>;
begin
  Mock := TMock<iSession>.Create;
  Mock.Setup.WillReturn('usuario_teste');

  FPessoa := TPessoa.Create;
  FPessoaDAO := TPessoaDAO.Create(TStub<iLog>.Create, Mock);
end;

procedure TMyTestObject.TearDown;
begin
  FPessoa.Free;
  FPessoaDAO.Free;
end;

procedure TMyTestObject.TrataCPFCNPJ;
var
  Resultado: string;
begin
  Resultado := FPessoa.TrataCPFCNPJ('123.123.123-12');
  Assert.IsTrue(Resultado = '12312312312',
    'TPessoa.TrataCPFCNPJ apresentou um ERRO. Resultado = ' + Resultado);
end;

procedure TMyTestObject.TratarCPFCNPJ(aValue, aResultado: String);
var
  Resultado: String;
begin
  Resultado := FPessoa.TrataCPFCNPJ(aValue);
  Assert.AreEqual(Resultado, aResultado);
end;

procedure TMyTestObject.ValidarCampos;
begin
  FPessoa.Nome := '';
  Assert.WillRaise(FPessoa.ValidarCampo, nil,
    'TPessoa.ValidarCampo - Não foi gerado Exception para o campo Nome quando Vazio');
end;

initialization

TDUnitX.RegisterTestFixture(TMyTestObject);

end.
