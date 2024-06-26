USE [Avalon01]
GO
/****** Object:  User [AvalonApp]    Script Date: 01/03/2024 16:03:53 ******/
CREATE USER [AvalonApp] FOR LOGIN [AvalonApp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01/03/2024 16:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[NumeroInscricao] [varchar](75) NOT NULL,
	[TipoInscricao] [varchar](2) NOT NULL,
	[Nome] [varchar](75) NOT NULL,
	[Sobrenome] [varchar](75) NOT NULL,
	[RazaoSocial] [varchar](75) NOT NULL,
	[DataNascimento] [varchar](75) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClienteDetalhe]    Script Date: 01/03/2024 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClienteDetalhe](
	[ClienteDetalheId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[NomeContato] [varchar](50) NULL,
	[Telefone] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[WhatsApp] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[ProdutoInteressado] [varchar](50) NULL,
	[ComoConheceu] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ClienteDetalhe] PRIMARY KEY CLUSTERED 
(
	[ClienteDetalheId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClienteEndereco]    Script Date: 01/03/2024 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ClienteEndereco](
	[ClienteEnderecoId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NULL,
	[NomeEndereco] [varchar](50) NULL,
	[Endereco] [varchar](100) NOT NULL,
	[Numero] [varchar](100) NOT NULL,
	[Complemento] [varchar](100) NULL,
	[CEP] [varchar](50) NULL,
	[Cidade] [varchar](70) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[ClienteEndereco] ADD [Bairro] [varchar](70) NULL
 CONSTRAINT [PK_ClienteEndereco] PRIMARY KEY CLUSTERED 
(
	[ClienteEnderecoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FaleConoscoContato]    Script Date: 01/03/2024 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FaleConoscoContato](
	[FaleConoscoContatoId] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](75) NOT NULL,
	[Sobrenome] [varchar](75) NOT NULL,
	[Email] [varchar](75) NOT NULL,
	[Telefone] [varchar](15) NOT NULL,
	[Assunto] [varchar](30) NOT NULL,
	[Comentario] [varchar](300) NOT NULL,
	[RecebidoEm] [datetime] NOT NULL,
	[VistoEm] [datetime] NULL,
	[ExcluidoEm] [datetime] NULL,
 CONSTRAINT [PK_FaloConoscoContato] PRIMARY KEY CLUSTERED 
(
	[FaleConoscoContatoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 01/03/2024 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](75) NOT NULL,
	[Senha] [varchar](100) NOT NULL,
	[Nome] [varchar](75) NOT NULL,
	[CriadoEm] [datetime] NOT NULL,
	[IsAtivo] [bit] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioPermissaoPagina]    Script Date: 01/03/2024 16:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioPermissaoPagina](
	[UsuarioId] [int] NOT NULL,
	[PaginaId] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioPermissaoPagina] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC,
	[PaginaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([UsuarioId], [Email], [Senha], [Nome], [CriadoEm], [IsAtivo]) VALUES (1, N'teste@teste.com.br', N'$2y$10$Rivs/ZlA4oflABPJMPvCrOZPzz8fw3XR9NRJIxYuiwqTmikeV5A6y', N'Phanthro', CAST(N'2023-11-13 21:11:02.683' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ('') FOR [DataNascimento]
GO
ALTER TABLE [dbo].[ClienteDetalhe]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDetalhe_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO
ALTER TABLE [dbo].[ClienteDetalhe] CHECK CONSTRAINT [FK_ClienteDetalhe_Cliente]
GO
ALTER TABLE [dbo].[ClienteEndereco]  WITH CHECK ADD  CONSTRAINT [FK_ClienteEndereco_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO
ALTER TABLE [dbo].[ClienteEndereco] CHECK CONSTRAINT [FK_ClienteEndereco_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[Cliente_CriarNovo]    Script Date: 01/03/2024 16:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Criar novo cliente
-- =============================================
CREATE   PROCEDURE [dbo].[Cliente_CriarNovo]
	@NumeroInscricao  varchar(75),
	@Tipoinscricao varchar(2),
	@Nome varchar(75),
	@DataNascimento varchar(75),
	@Sobrenome varchar(75),
	@RazaoSocial varchar(75)

AS
BEGIN
	INSERT INTO [dbo].[Cliente]
           ([NumeroInscricao]
           ,[TipoInscricao]
           ,[Nome]
		   ,[DataNascimento]
           ,[Sobrenome]
           ,[RazaoSocial])
     VALUES
           (@NumeroInscricao
           ,@Tipoinscricao
           ,@Nome
		   ,@DataNascimento
           ,@Sobrenome
           ,@RazaoSocial)
END

SELECT Convert(int, SCOPE_IDENTITY())

GO
/****** Object:  StoredProcedure [dbo].[ClienteDetalhe_CriarNovo]    Script Date: 01/03/2024 16:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Criar detalhes para um cliente
-- =============================================
CREATE   PROCEDURE [dbo].[ClienteDetalhe_CriarNovo]
	@ClienteId  int,
	@NomeContato varchar(2),
	@Telefone varchar(75),
	@Celular varchar(75),
	@WhatsApp varchar(75),
	@Email varchar(75),
	@ProdutoInteressado varchar(75),
	@ComoConheceu varchar(75)

AS
BEGIN
	INSERT INTO [dbo].[ClienteDetalhe]
           ([ClienteId]
           ,[NomeContato]
           ,[Telefone]
           ,[Celular]
           ,[WhatsApp]
           ,[Email]
           ,[ProdutoInteressado]
           ,[ComoConheceu])
     VALUES
           (@ClienteId
           ,@NomeContato
           ,@Telefone
           ,@Celular
           ,@WhatsApp
           ,@Email
           ,@ProdutoInteressado
           ,@ComoConheceu)
END

SELECT Convert(int, SCOPE_IDENTITY())

GO
/****** Object:  StoredProcedure [dbo].[ClienteEndereco_CriarNovo]    Script Date: 01/03/2024 16:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Criar novo endereço para um cliente
-- =============================================
CREATE   PROCEDURE [dbo].[ClienteEndereco_CriarNovo]
	@ClienteId  int,
	@NomeEndereco varchar(75),
	@Endereco varchar(75),
	@Numero varchar(75),
	@Complemento varchar(75),
	@CEP varchar(75),
	@Cidade varchar(75),
	@Bairro varchar(75)

AS
BEGIN
	INSERT INTO [dbo].[ClienteEndereco]
           ([ClienteId]
           ,[NomeEndereco]
           ,[Endereco]
           ,[Numero]
           ,[Complemento]
           ,[CEP]
           ,[Cidade]
		   ,[Bairro])
     VALUES
           (@ClienteId
           ,@NomeEndereco
           ,@Endereco
           ,@Numero
           ,@Complemento
           ,@CEP
           ,@Cidade
		   ,@bairro)
END

SELECT Convert(int, SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[FaleConosco_GravarNovoContato]    Script Date: 01/03/2024 16:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-09
-- Description:	Criar novo contato homepage
-- =============================================
CREATE     PROCEDURE [dbo].[FaleConosco_GravarNovoContato]
	@Nome varchar(75),
	@Sobrenome varchar(75),
	@Email varchar(75),
	@Telefone  varchar(75),
	@Assunto varchar(30),
	@Comentario varchar(300)

AS
BEGIN
	INSERT INTO [dbo].[FaleConoscoContato]
           ([Nome]
           ,[Sobrenome]
           ,[Email]
		   ,[Telefone]
           ,[Assunto]
		   ,[Comentario]
		   ,[RecebidoEm])
     VALUES
           (@Nome
           ,@Sobrenome
           ,@Email
		   ,@Telefone
		   ,@Assunto
           ,@Comentario
           ,GETDATE())
END

SELECT Convert(int, SCOPE_IDENTITY())




GO
/****** Object:  StoredProcedure [dbo].[Usuario_Listar_Usuarios]    Script Date: 01/03/2024 16:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-12-21
-- Description:	Obter lista de usuarios
-- =============================================
CREATE    PROCEDURE [dbo].[Usuario_Listar_Usuarios]
	
AS
BEGIN

	SELECT TOP 1
		[UsuarioId]
		,[Email]
		,[Senha]
		,[Nome]
		,[CriadoEm]
		,[IsAtivo]
	FROM 
		[Avalon01].[dbo].[Usuario]

END


GO
/****** Object:  StoredProcedure [dbo].[Usuario_Obter_PermissoesPagina]    Script Date: 01/03/2024 16:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-14
-- Description:	Obter lista de permissões de pagina de um usuario
-- =============================================
CREATE   PROCEDURE [dbo].[Usuario_Obter_PermissoesPagina]
	@UsuarioId  int
AS
BEGIN

	SELECT 
	   [UsuarioId]
      ,[PaginaId]
	FROM
		[Avalon01].[dbo].[UsuarioPermissaoPagina]
	WHERE
		[UsuarioId] = @UsuarioId
END

GO
/****** Object:  StoredProcedure [dbo].[Usuario_Obter_PorEmail]    Script Date: 01/03/2024 16:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Obter usuario por email
-- =============================================
CREATE   PROCEDURE [dbo].[Usuario_Obter_PorEmail]
	@Email  varchar(75)
AS
BEGIN

	SELECT TOP 1
		[UsuarioId]
		,[Email]
		,[Senha]
		,[Nome]
		,[CriadoEm]
		,[IsAtivo]
	FROM 
		[Avalon01].[dbo].[Usuario]
	WHERE
		[Email] = @Email
END

SELECT Convert(int, SCOPE_IDENTITY())

GO
