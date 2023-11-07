-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Criar novo endereço para um cliente
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[ClienteEndereco_CriarNovo]
	@ClienteId  int,
	@NomeEndereco varchar(75),
	@Endereco varchar(75),
	@Numero varchar(75),
	@Complemento varchar(75),
	@CEP varchar(75),
	@Cidade varchar(75)

AS
BEGIN
	INSERT INTO [dbo].[ClienteEndereco]
           ([ClienteId]
           ,[NomeEndereco]
           ,[Endereco]
           ,[Numero]
           ,[Complemento]
           ,[CEP]
           ,[Cidade])
     VALUES
           (@ClienteId
           ,@NomeEndereco
           ,@Endereco
           ,@Numero
           ,@Complemento
           ,@CEP
           ,@Cidade)
END

SELECT Convert(int, SCOPE_IDENTITY())
