CREATE DATABASE GABRIELA_HEARST_BOUTIQUE;


USE GABRIELA_HEARST_BOUTIQUE;


CREATE TABLE CLIENTES_VIP (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE,
    Telefone VARCHAR(20),
    Nivel_VIP VARCHAR(50) DEFAULT 'Gold'
);

CREATE TABLE PECAS_COLECAO (
    ID_Peca INT PRIMARY KEY,
    Nome_Peca VARCHAR(255) NOT NULL,
    Colecao VARCHAR(100) NOT NULL,
    Preco_Venda DECIMAL(10, 2) NOT NULL,
    Qtd_Estoque INT NOT NULL CHECK (Qtd_Estoque >= 0)
);

CREATE TABLE LISTA_ESPERA (
    ID_Espera INT PRIMARY KEY,
    ID_Cliente INT,
    ID_Peca INT,
    Data_Entrada DATE DEFAULT(6),
    Status_Fila VARCHAR(50) DEFAULT 'Em Espera',
    Previsao_Anos INT,
    
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTES_VIP(ID_Cliente),
    FOREIGN KEY (ID_Peca) REFERENCES PECAS_COLECAO(ID_Peca)
);

INSERT INTO CLIENTES_VIP (ID_Cliente, Nome, Sobrenome, Email, Nivel_VIP)
VALUES (101, 'Isabella', 'Fontana', 'isabella.f@email.com', 'Platinum');

INSERT INTO CLIENTES_VIP (ID_Cliente, Nome, Sobrenome, Email, Nivel_VIP)
VALUES (102, 'Leonardo', 'Santos', 'leo.santos@email.com', 'Gold');


INSERT INTO PECAS_COLECAO (ID_Peca, Nome_Peca, Colecao, Preco_Venda, Qtd_Estoque)
VALUES (1, 'Vestido James', 'Spring 2025', 15000.00, 1); 
INSERT INTO PECAS_COLECAO (ID_Peca, Nome_Peca, Colecao, Preco_Venda, Qtd_Estoque)
VALUES (2, 'Bolsa Nina', 'Classic Collection', 4500.00, 0); 


INSERT INTO LISTA_ESPERA (ID_Espera, ID_Cliente, ID_Peca, Previsao_Anos)
VALUES (1, 102, 2, 3);


UPDATE CLIENTES_VIP
SET Nivel_VIP = 'Diamante'
WHERE ID_Cliente = 101;
PRIMARY

DELETE FROM LISTA_ESPERA
WHERE ID_Espera = 1 AND ID_Cliente = 102;
