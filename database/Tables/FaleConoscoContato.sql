CREATE TABLE [dbo].[FaleConoscoContato](

	[FaleConoscoContatoId] [int] IDENTITY(1,1) NOT NULL,

	[Nome] [varchar](75) NOT NULL,

	[Sobrenome] [varchar](75) NOT NULL,

	[Email]  [varchar](75) NOT NULL,

	[Telefone] [varchar](15) NOT NULL,

	[Assunto] [varchar](30) NOT NULL,

	[Comentario] [varchar](300) NOT NULL,

	[RecebidoEm] [Datetime] NOT NULL,

	[VistoEm] [Datetime] NULL,

	[ExcluidoEm] [Datetime] NULL
	
 CONSTRAINT [PK_FaloConoscoContato] PRIMARY KEY CLUSTERED 
(
	[FaleConoscoContatoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

