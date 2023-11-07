CREATE TABLE [dbo].[ClienteDetalhe](

	[ClienteDetalheId] [int] NOT NULL IDENTITY(1,1),
	[ClienteId] [int] NOT NULL,

	[NomeContato] [varchar](50) NULL,
	[Telefone] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[WhatsApp] [varchar](50) NULL,
	[Email] [varchar](100) NULL,

	[ProdutoInteressado] [varchar](50) NULL,
	[ComoConheceu] [varchar](100) NOT NULL

 CONSTRAINT [PK_ClienteDetalhe] PRIMARY KEY CLUSTERED 
(
	[ClienteDetalheId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ClienteDetalhe]  WITH CHECK ADD  CONSTRAINT [FK_ClienteDetalhe_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO

ALTER TABLE [dbo].[ClienteDetalhe] CHECK CONSTRAINT [FK_ClienteDetalhe_Cliente]
GO


