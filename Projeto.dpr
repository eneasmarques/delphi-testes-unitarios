program Projeto;

uses
  Vcl.Forms,
  Projeto.Principal in 'Projeto.Principal.pas' {Form1},
  Pessoa in 'Pessoa.pas',
  Conexao in 'Conexao.pas' {DataModule1: TDataModule},
  PessoaDAO in 'PessoaDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
