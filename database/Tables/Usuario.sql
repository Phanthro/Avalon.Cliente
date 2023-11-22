CREATE TABLE [dbo].[Usuario](

	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,

	[Email] [varchar](75) NOT NULL,

	[Senha] [varchar](100) NOT NULL,

	[Nome]  [varchar](75) NOT NULL,

	[CriadoEm] [Datetime] NOT NULL,

	[IsAtivo] [bit] NOT NULL
	
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

