unit PessoaDAO;

interface

{$M+}
uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, Pessoa, Conexao, System.SysUtils;

type
  iLog = interface
    ['{C309BD65-E0A0-4607-8EC0-60223BD0CBA5}']
    procedure GravarLog(aLog: String);
  end;

  iSession = interface
    ['{7A54D9CE-0C0A-40AB-9C56-1EA0E379E092}']
    function User: String;
  end;

  TPessoaDAO = class
  private
    FPessoa: TPessoa;
    FQuery: TFDQuery;
    FLog: iLog;
    FSession: iSession;
  public
    constructor Create(aLog: iLog; aSession: iSession);
    destructor Destroy; override;

    function Entidade: TPessoa;
    procedure Insert;
    procedure Update;
    procedure Delete;
    procedure BuscarID(const AId: String);
  end;

implementation

constructor TPessoaDAO.Create(aLog: iLog; aSession: iSession);
begin
  FPessoa := TPessoa.Create;
  FLog := aLog;

  FSession := aSession;

  FLog.GravarLog('User: '+ FSession.User);

  if not Assigned(DataModule1) then
    DataModule1 := TDataModule1.Create(nil);

  FQuery := DataModule1.FDQuery1;
end;

function TPessoaDAO.Entidade: TPessoa;
begin
  Result := FPessoa;
end;

destructor TPessoaDAO.Destroy;
begin
  FreeAndNil(FPessoa);
  inherited;
end;

procedure TPessoaDAO.Insert;
begin
  // ValidaCampos;
  FQuery.Open('SELECT * FROM usuario WHERE 1=2');
  FQuery.Append;

  FQuery.FieldByName('guuid').AsString := FPessoa.Guuid;
  FQuery.FieldByName('nome').AsString := FPessoa.Nome;
  FQuery.FieldByName('senha').AsString := FPessoa.Senha;
  FQuery.FieldByName('tipo').AsInteger := FPessoa.Tipo;
  FQuery.FieldByName('status').AsInteger := FPessoa.Status;
  FQuery.FieldByName('datacadastro').AsDateTime := FPessoa.DataCadastro;
  FQuery.FieldByName('dataalteracao').AsDateTime := FPessoa.DataAlteracao;

  FQuery.Post;
  FQuery.ApplyUpdates(0);
end;

procedure TPessoaDAO.Update;
begin
  FQuery.Open('SELECT * FROM usuario WHERE guuid = ' +
    QuotedStr(FPessoa.Guuid));
  FQuery.Edit;

  FQuery.FieldByName('guuid').AsString := FPessoa.Guuid;
  FQuery.FieldByName('nome').AsString := FPessoa.Nome;
  FQuery.FieldByName('senha').AsString := FPessoa.Senha;
  FQuery.FieldByName('tipo').AsInteger := FPessoa.Tipo;
  FQuery.FieldByName('status').AsInteger := FPessoa.Status;
  FQuery.FieldByName('datacadastro').AsDateTime := FPessoa.DataCadastro;
  FQuery.FieldByName('dataalteracao').AsDateTime := FPessoa.DataAlteracao;

  FQuery.Post;
  FQuery.ApplyUpdates(0);
end;

procedure TPessoaDAO.Delete;
begin
  FQuery.Open('SELECT * FROM usuario WHERE guuid = ' +
    QuotedStr(FPessoa.Guuid));
  FQuery.Delete;
  FQuery.ApplyUpdates(0);
end;

procedure TPessoaDAO.BuscarID(const AId: String);
begin
  FQuery.Open('SELECT * FROM USUARIO WHERE GUUID = ' +
    QuotedStr(FPessoa.Guuid));
  FQuery.First;

  FPessoa.Guuid := FQuery.FieldByName('guuid').AsString;
  FPessoa.Nome := FQuery.FieldByName('nome').AsString;
  FPessoa.Senha := FQuery.FieldByName('senha').AsString;
  FPessoa.Tipo := FQuery.FieldByName('tipo').AsInteger;
  FPessoa.Status := FQuery.FieldByName('status').AsInteger;
  FPessoa.DataCadastro := FQuery.FieldByName('datacadastro').AsDateTime;
  FPessoa.DataAlteracao := FQuery.FieldByName('dataalteracao').AsDateTime;
end;

end.
