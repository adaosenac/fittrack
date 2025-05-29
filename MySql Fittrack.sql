
CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY,
    plano_vinc INT NOT NULL,
    hist_treino INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_nasc DATE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    sexo CHAR(1) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);


CREATE TABLE plano (
    id_plano INT PRIMARY KEY,
    nome_plano VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    duracao INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status VARCHAR(50) NOT NULL
);


CREATE TABLE mensalidade (
    id_mensalidade INT PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_venc DATE NOT NULL,
    status_pgto VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    id_plano INT NOT NULL
);


CREATE TABLE treino (
    id_treino INT PRIMARY KEY,
    id_instrutor INT NOT NULL,
    data_aula DATE NOT NULL,
    horario TIME NOT NULL,
    turma VARCHAR(50) NOT NULL,
    tipo_aula VARCHAR(50) NOT NULL,
    id_aluno INT NOT NULL,
    id_mensalidade INT NOT NULL
);


CREATE TABLE instrutor (
    id_instrutor INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(15) NOT NULL
);


CREATE TABLE frequencia (
    id_frequencia INT PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_treino DATE NOT NULL,
    status_frequencia VARCHAR(50) NOT NULL,
    id_instrutor INT NOT NULL
);

ALTER TABLE aluno ADD CONSTRAINT fk_aluno_plano FOREIGN KEY (plano_vinc) REFERENCES plano(id_plano);
ALTER TABLE aluno ADD CONSTRAINT fk_aluno_hist_treino FOREIGN KEY (hist_treino) REFERENCES treino(id_treino);

ALTER TABLE mensalidade ADD CONSTRAINT fk_mensalidade_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);
ALTER TABLE mensalidade ADD CONSTRAINT fk_mensalidade_plano FOREIGN KEY (id_plano) REFERENCES plano(id_plano);

ALTER TABLE treino ADD CONSTRAINT fk_treino_instrutor FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor);
ALTER TABLE treino ADD CONSTRAINT fk_treino_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);
ALTER TABLE treino ADD CONSTRAINT fk_treino_mensalidade FOREIGN KEY (id_mensalidade) REFERENCES mensalidade(id_mensalidade);

ALTER TABLE frequencia ADD CONSTRAINT fk_frequencia_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno);
ALTER TABLE frequencia ADD CONSTRAINT fk_frequencia_instrutor FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor);
