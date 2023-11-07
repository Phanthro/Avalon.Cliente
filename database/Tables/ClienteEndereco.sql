CREATE TABLE [dbo].[ClienteEndereco](
	[ClienteEnderecoId] [int] NOT NULL IDENTITY(1,1),
	[ClienteId] [int] NULL,
	[NomeEndereco] [varchar](50) NULL,
	[Endereco] [varchar](100) NOT NULL,
	[Numero] [varchar](100) NOT NULL,
	[Complemento] [varchar](100) NULL,
	[CEP] [varchar](50) NULL,
	[Cidade] [varchar](70) NULL
 CONSTRAINT [PK_ClienteEndereco] PRIMARY KEY CLUSTERED 
(
	[ClienteEnderecoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ClienteEndereco]  WITH CHECK ADD  CONSTRAINT [FK_ClienteEndereco_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO

ALTER TABLE [dbo].[ClienteEndereco] CHECK CONSTRAINT [FK_ClienteEndereco_Cliente]
GO


