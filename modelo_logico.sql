-- Modelo Lógico de Banco de Dados: Meu Calendário Acadêmico

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    curso VARCHAR(100)
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL  -- Ex: 'Prova', 'Trabalho', 'Projeto'
);

CREATE TABLE Atividade (
    id_atividade INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_entrega DATE NOT NULL,
    prioridade VARCHAR(20),  -- 'Alta', 'Média', 'Baixa'
    status VARCHAR(20),      -- 'Pendente', 'Em andamento', 'Concluída'
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Notificacao (
    id_notificacao INT PRIMARY KEY,
    texto TEXT NOT NULL,
    data_envio DATETIME,
    lida BOOLEAN DEFAULT FALSE,
    id_atividade INT NOT NULL,
    FOREIGN KEY (id_atividade) REFERENCES Atividade(id_atividade)
);
