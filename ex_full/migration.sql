IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [Treinos] (
    [Id] int NOT NULL IDENTITY,
    [Titulo] nvarchar(200) NOT NULL,
    [Descricao] nvarchar(1000) NOT NULL,
    [Avaliacao] float NOT NULL,
    CONSTRAINT [PK_Treinos] PRIMARY KEY ([Id])
);

CREATE TABLE [Comentarios] (
    [Id] int NOT NULL IDENTITY,
    [Texto] nvarchar(500) NOT NULL,
    [DataCriacao] datetime2 NOT NULL,
    [Usuario] nvarchar(100) NOT NULL,
    [TreinoId] int NOT NULL,
    CONSTRAINT [PK_Comentarios] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Comentarios_Treinos_TreinoId] FOREIGN KEY ([TreinoId]) REFERENCES [Treinos] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [Exercicios] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(100) NOT NULL,
    [Series] int NOT NULL,
    [Repeticoes] int NOT NULL,
    [Observacoes] nvarchar(500) NULL,
    [TreinoId] int NOT NULL,
    CONSTRAINT [PK_Exercicios] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Exercicios_Treinos_TreinoId] FOREIGN KEY ([TreinoId]) REFERENCES [Treinos] ([Id]) ON DELETE CASCADE
);

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Avaliacao', N'Descricao', N'Titulo') AND [object_id] = OBJECT_ID(N'[Treinos]'))
    SET IDENTITY_INSERT [Treinos] ON;
INSERT INTO [Treinos] ([Id], [Avaliacao], [Descricao], [Titulo])
VALUES (1, 4.5E0, N'Treino focado no desenvolvimento dos músculos peitorais e tríceps, ideal para iniciantes e intermediários. Concentre-se na execução correta dos movimentos.', N'Treino de Peito e Tríceps'),
(2, 4.7999999999999998E0, N'Sessão completa para fortalecimento das costas e bíceps. Foque na conexão mente-músculo para máximos resultados.', N'Treino de Costas e Bíceps'),
(3, 4.2000000000000002E0, N'Treino intenso para membros inferiores. Prepare-se para um dos treinos mais desafiadores, mas também mais recompensadores.', N'Treino de Pernas');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Avaliacao', N'Descricao', N'Titulo') AND [object_id] = OBJECT_ID(N'[Treinos]'))
    SET IDENTITY_INSERT [Treinos] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DataCriacao', N'Texto', N'TreinoId', N'Usuario') AND [object_id] = OBJECT_ID(N'[Comentarios]'))
    SET IDENTITY_INSERT [Comentarios] ON;
INSERT INTO [Comentarios] ([Id], [DataCriacao], [Texto], [TreinoId], [Usuario])
VALUES (1, '2025-06-06T20:43:56.6614034-03:00', N'Excelente treino! Senti bastante o peito trabalhando.', 1, N'Usuário Anônimo'),
(2, '2025-06-07T20:43:56.6637500-03:00', N'Muito bom para iniciantes, recomendo!', 1, N'Usuário Anônimo'),
(3, '2025-06-08T15:43:56.6637515-03:00', N'Poderia ter mais exercícios de tríceps.', 1, N'Usuário Anônimo'),
(4, '2025-06-05T20:43:56.6637525-03:00', N'Treino pesado, mas muito eficiente!', 2, N'Usuário Anônimo'),
(5, '2025-06-08T12:43:56.6637527-03:00', N'A rosca 21 é um exercício incrível!', 2, N'Usuário Anônimo'),
(6, '2025-06-07T20:43:56.6637529-03:00', N'Treino muito pesado, quase não consegui terminar!', 3, N'Usuário Anônimo'),
(7, '2025-06-08T08:43:56.6637530-03:00', N'Adoro treino de pernas, sempre dou meu máximo!', 3, N'Usuário Anônimo'),
(8, '2025-06-08T17:43:56.6637531-03:00', N'O agachamento livre é o rei dos exercícios!', 3, N'Usuário Anônimo');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'DataCriacao', N'Texto', N'TreinoId', N'Usuario') AND [object_id] = OBJECT_ID(N'[Comentarios]'))
    SET IDENTITY_INSERT [Comentarios] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Nome', N'Observacoes', N'Repeticoes', N'Series', N'TreinoId') AND [object_id] = OBJECT_ID(N'[Exercicios]'))
    SET IDENTITY_INSERT [Exercicios] ON;
INSERT INTO [Exercicios] ([Id], [Nome], [Observacoes], [Repeticoes], [Series], [TreinoId])
VALUES (1, N'Supino Reto', N'Controle a descida', 12, 4, 1),
(2, N'Supino Inclinado', N'45° de inclinação', 10, 3, 1),
(3, N'Crucifixo', N'Amplitude completa', 12, 3, 1),
(4, N'Tríceps Testa', N'Cotovelos fixos', 15, 3, 1),
(5, N'Tríceps Corda', N'Extensão completa', 12, 3, 1),
(6, N'Mergulho', N'Até a falha', 8, 2, 1),
(7, N'Barra Fixa', N'Pegada pronada', 8, 4, 2),
(8, N'Remada Curvada', N'Tronco a 45°', 10, 4, 2),
(9, N'Puxada Frente', N'Peito para frente', 12, 3, 2),
(10, N'Rosca Direta', N'Sem balanço', 12, 4, 2),
(11, N'Rosca Martelo', N'Pegada neutra', 10, 3, 2),
(12, N'Rosca 21', N'7+7+7 repetições', 21, 2, 2),
(13, N'Agachamento Livre', N'Profundidade completa', 8, 5, 3),
(14, N'Leg Press', N'Pés na largura dos ombros', 15, 4, 3),
(15, N'Extensora', N'Pausa no topo', 12, 3, 3),
(16, N'Flexora', N'Contração isométrica', 12, 3, 3),
(17, N'Panturrilha em Pé', N'Amplitude completa', 20, 4, 3),
(18, N'Panturrilha Sentado', N'Pausa na contração', 15, 3, 3);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Nome', N'Observacoes', N'Repeticoes', N'Series', N'TreinoId') AND [object_id] = OBJECT_ID(N'[Exercicios]'))
    SET IDENTITY_INSERT [Exercicios] OFF;

CREATE INDEX [IX_Comentarios_TreinoId] ON [Comentarios] ([TreinoId]);

CREATE INDEX [IX_Exercicios_TreinoId] ON [Exercicios] ([TreinoId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250608234358_InitialCreate', N'9.0.5');

COMMIT;
GO

