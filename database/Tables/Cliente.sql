CREATE TABLE [dbo].[Cliente](

	[ClienteId] [int] IDENTITY(1,1) NOT NULL,

	[NumeroInscricao] [varchar](75) NOT NULL,

	[DataNascimento]  [varchar](75) NOT NULL,

	[TipoInscricao] [varchar](2) NOT NULL,

	[Nome] [varchar](75) NOT NULL,

	[Sobrenome] [varchar](75) NOT NULL,

	[RazaoSocial] [varchar](75) NOT NULL	
	
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

