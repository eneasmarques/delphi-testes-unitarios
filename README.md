# Projeto Testes Unitários em DELPHI

Projeto para treinar Testes Unitários em Delphi utilizando

[DUnitx](https://docwiki.embarcadero.com/RADStudio/Alexandria/en/DUnitX_Overview) | [Delphi.Mocks](https://github.com/VSoftTechnologies/Delphi-Mocks)

### 📚 Aula - 01 - .IsTrue

- Testa `procedure TPEssoa.TrataCPFCNPJ(aValue: String) : String;`

### 📚 Aula - 02 - [TestCase]

- Testa `procedure TPessoa.TrataCPFCNPJ(aValue: String) : String` com **TestCase**

### 📚 Aula - 03 - AreEqual

- Testa `procedure TPessoa.TrataCPFCNPJ(aValue: String) : String` com **AreEqual**

### 📚 Aula - 04 - WillRaise

- Testa `TPessoa.ValidaCampos`;

### 📚 Aula - 05

- Testa `TPessoaDAO.Insert`

### 📚 Aula - 06 - Delphi.Mocks

- Testa `TPessoaDAO.Create(aLog: iLog)`;
- Delphi Mocks é utilizado quando desejamos testar classes que tem injeção de dependência.
- Atribuir `{$M+}` na classe a ser testada para permitir RTTI que irá criar uma Interface Virtual para o teste;
- No teste utilizar `TPessoaDAO.Create(TStub<iLog>.Create);`

### 📚 Aula - 07 - Mock.Setup.WillReturn()

- Testa `TPessoaDAO.Create(aLog: iLog; aSession: iSession);`

```
var
  Mock : TMock;
begin
  Mock : TMock<iSession>.Create;
  Mock.Setup.WillReturn('user_teste');
  code...
  TPessoaDAO.Create(TStub<iLog>.Create; Mock);
end;
```
