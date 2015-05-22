CREATE TABLE DisciplinaTurma (TurmaIdTurma int NULL, DisciplinaIdDisciplina int NULL);
CREATE TABLE ProfessorTurma (PrefessorPessoaIdUsuario2 int NULL, TurmaIdTurma int NULL);
CREATE TABLE AplicacaoAvaliacaoTurma (IdAplicacaoAvaliacao int NOT NULL, IdAlunoTurma int NOT NULL);
CREATE TABLE AvaliacaoQuestao (AvaliacaoIdAvaliacao int NOT NULL, QuestaoIdQuestao int NOT NULL, PRIMARY KEY (AvaliacaoIdAvaliacao, QuestaoIdQuestao));
CREATE TABLE AlunoTurma (IdAlunoTurma int IDENTITY NOT NULL, IdAluno int NOT NULL, IdTurma int NOT NULL, PRIMARY KEY (IdAlunoTurma));
CREATE TABLE Turma (IdTurma int IDENTITY NOT NULL, Periodo int NOT NULL, DescricaoTurma varchar(255) NOT NULL, PRIMARY KEY (IdTurma));
CREATE TABLE QuestaoAlternativa (QuestaoIdQuestao int NOT NULL, AlternativaIdAlternativa int NOT NULL, Resposta bit NOT NULL, CONSTRAINT Resposta PRIMARY KEY (QuestaoIdQuestao, AlternativaIdAlternativa));
CREATE TABLE Alternativa (IdAlternativa int IDENTITY NOT NULL, DescricaoAlternativa int NOT NULL, PRIMARY KEY (IdAlternativa));
CREATE TABLE Disciplina (IdDisciplina int IDENTITY NOT NULL, Descricao varchar(255) NULL, PRIMARY KEY (IdDisciplina));
CREATE TABLE TipoQuestao (IdTipoQuestao int IDENTITY NOT NULL, DescricaoTipoQuestao varchar(100) NOT NULL, PRIMARY KEY (IdTipoQuestao));
CREATE TABLE Questao (IdRedator int NULL, IdQuestao int IDENTITY NOT NULL, TextoQuestao text NULL, DisciplinaIdDisciplina int NULL, TipoQuestaoIdTipoQuestao int NULL, PRIMARY KEY (IdQuestao));
CREATE TABLE Redator (IdPessoa int NOT NULL, PRIMARY KEY (IdPessoa));
CREATE TABLE AplicacaoAvaliacao (IdAplicacaoAvaliacao int IDENTITY NOT NULL, IdAvaliacao int NULL, DataAplicacao int NOT NULL, QuantidadeQuestoes int NOT NULL, TempoPorQuestao time NULL, TempoTotal time NULL, PRIMARY KEY (IdAplicacaoAvaliacao));
CREATE TABLE Avaliacao (IdAvaliacao int IDENTITY NOT NULL, IdAluno int NULL, IdProfessor int NULL, NomeAvaliacao varchar(255) NOT NULL, DataInicio datetime NOT NULL, DataFim datetime NULL, PRIMARY KEY (IdAvaliacao));
CREATE TABLE PapelFuncao (PapelIdPapel int NOT NULL, FuncaoIdFuncao int NOT NULL, PRIMARY KEY (PapelIdPapel, FuncaoIdFuncao));
CREATE TABLE Papel (IdUsuario int NOT NULL, IdPapel int IDENTITY NOT NULL, DescricaoPapel varchar(255) NOT NULL, PRIMARY KEY (IdPapel));
CREATE TABLE Funcao (IdFuncao int IDENTITY NOT NULL, DescricaoFuncao varchar(255) NOT NULL, URL varchar(255) NOT NULL, PRIMARY KEY (IdFuncao));
CREATE TABLE Prefessor (IdPessoa int NOT NULL, PRIMARY KEY (IdPessoa));
CREATE TABLE IdQuestaoResposta (IdQuescaoResposta int IDENTITY NOT NULL, IdAplicacaoAvaliacao int NOT NULL, IdAluno int NOT NULL, IdQuestao int NOT NULL, IdAlternativa int NOT NULL, PRIMARY KEY (IdQuescaoResposta));
CREATE TABLE ParticipacaoAplicacaoAvaliacao (IdAluno int NOT NULL, IdAplicacaoAvaliacao int NOT NULL, PRIMARY KEY (IdAluno, IdAplicacaoAvaliacao));
CREATE TABLE Aluno (IdPessoa int NOT NULL, Matricula varchar(255) NULL UNIQUE, PRIMARY KEY (IdPessoa));
CREATE TABLE Pessoa (IdPessoa int IDENTITY NOT NULL, IdUsuario int NOT NULL, Nome varchar(255) NOT NULL, PRIMARY KEY (IdPessoa));
CREATE TABLE Usuario (IdUsuario int IDENTITY NOT NULL, NomeUsuario varchar(255) NOT NULL, Senha varchar(255) NOT NULL, PRIMARY KEY (IdUsuario));
ALTER TABLE Pessoa ADD CONSTRAINT FKPessoa976944 FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario);
ALTER TABLE Aluno ADD CONSTRAINT FKAluno187415 FOREIGN KEY (IdPessoa) REFERENCES Pessoa (IdPessoa);
ALTER TABLE ParticipacaoAplicacaoAvaliacao ADD CONSTRAINT FKParticipac457508 FOREIGN KEY (IdAluno) REFERENCES Aluno (IdPessoa);
ALTER TABLE IdQuestaoResposta ADD CONSTRAINT FKIdQuestaoR243967 FOREIGN KEY (IdAluno, IdAplicacaoAvaliacao) REFERENCES ParticipacaoAplicacaoAvaliacao (IdAluno, IdAplicacaoAvaliacao);
ALTER TABLE Prefessor ADD CONSTRAINT FKPrefessor819735 FOREIGN KEY (IdPessoa) REFERENCES Pessoa (IdPessoa);
ALTER TABLE Papel ADD CONSTRAINT FKPapel290806 FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario);
ALTER TABLE PapelFuncao ADD CONSTRAINT FKPapelFunca298493 FOREIGN KEY (PapelIdPapel) REFERENCES Papel (IdPapel);
ALTER TABLE PapelFuncao ADD CONSTRAINT FKPapelFunca926412 FOREIGN KEY (FuncaoIdFuncao) REFERENCES Funcao (IdFuncao);
ALTER TABLE AplicacaoAvaliacao ADD CONSTRAINT FKAplicacaoA67341 FOREIGN KEY (IdAvaliacao) REFERENCES Avaliacao (IdAvaliacao);
ALTER TABLE Redator ADD CONSTRAINT FKRedator384823 FOREIGN KEY (IdPessoa) REFERENCES Pessoa (IdPessoa);
ALTER TABLE ParticipacaoAplicacaoAvaliacao ADD CONSTRAINT FKParticipac990583 FOREIGN KEY (IdAplicacaoAvaliacao) REFERENCES AplicacaoAvaliacao (IdAplicacaoAvaliacao);
ALTER TABLE Questao ADD CONSTRAINT FKQuestao114927 FOREIGN KEY (IdRedator) REFERENCES Redator (IdPessoa);
ALTER TABLE Questao ADD CONSTRAINT FKQuestao330883 FOREIGN KEY (DisciplinaIdDisciplina) REFERENCES Disciplina (IdDisciplina);
ALTER TABLE QuestaoAlternativa ADD CONSTRAINT FKQuestaoAlt171449 FOREIGN KEY (QuestaoIdQuestao) REFERENCES Questao (IdQuestao);
ALTER TABLE QuestaoAlternativa ADD CONSTRAINT FKQuestaoAlt283304 FOREIGN KEY (AlternativaIdAlternativa) REFERENCES Alternativa (IdAlternativa);
ALTER TABLE AlunoTurma ADD CONSTRAINT FKAlunoTurma421474 FOREIGN KEY (IdTurma) REFERENCES Turma (IdTurma);
ALTER TABLE AlunoTurma ADD CONSTRAINT FKAlunoTurma754325 FOREIGN KEY (IdAluno) REFERENCES Aluno (IdPessoa);
ALTER TABLE AvaliacaoQuestao ADD CONSTRAINT FKAvaliacaoQ223995 FOREIGN KEY (QuestaoIdQuestao) REFERENCES Questao (IdQuestao);
ALTER TABLE AvaliacaoQuestao ADD CONSTRAINT FKAvaliacaoQ872081 FOREIGN KEY (AvaliacaoIdAvaliacao) REFERENCES Avaliacao (IdAvaliacao);
ALTER TABLE AplicacaoAvaliacaoTurma ADD CONSTRAINT FKAplicacaoA785663 FOREIGN KEY (IdAplicacaoAvaliacao) REFERENCES AplicacaoAvaliacao (IdAplicacaoAvaliacao);
ALTER TABLE AplicacaoAvaliacaoTurma ADD CONSTRAINT FKAplicacaoA186577 FOREIGN KEY (IdAlunoTurma) REFERENCES AlunoTurma (IdAlunoTurma);
ALTER TABLE ProfessorTurma ADD CONSTRAINT FKProfessorT276822 FOREIGN KEY (TurmaIdTurma) REFERENCES Turma (IdTurma);
ALTER TABLE ProfessorTurma ADD CONSTRAINT FKProfessorT246476 FOREIGN KEY (PrefessorPessoaIdUsuario2) REFERENCES Prefessor (IdPessoa);
ALTER TABLE Avaliacao ADD CONSTRAINT FKAvaliacao669124 FOREIGN KEY (IdProfessor) REFERENCES Prefessor (IdPessoa);
ALTER TABLE Questao ADD CONSTRAINT FKQuestao421180 FOREIGN KEY (TipoQuestaoIdTipoQuestao) REFERENCES TipoQuestao (IdTipoQuestao);
ALTER TABLE DisciplinaTurma ADD CONSTRAINT FKDisciplina599722 FOREIGN KEY (TurmaIdTurma) REFERENCES Turma (IdTurma);
ALTER TABLE DisciplinaTurma ADD CONSTRAINT FKDisciplina54042 FOREIGN KEY (DisciplinaIdDisciplina) REFERENCES Disciplina (IdDisciplina);
ALTER TABLE Avaliacao ADD CONSTRAINT FKAvaliacao547159 FOREIGN KEY (IdAluno) REFERENCES Aluno (IdPessoa);
