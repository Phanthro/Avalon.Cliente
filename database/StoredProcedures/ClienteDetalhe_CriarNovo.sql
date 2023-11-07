-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Criar detalhes para um cliente
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[ClienteDetalhe_CriarNovo]
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