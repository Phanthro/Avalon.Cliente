-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-09
-- Description:	Criar novo contato homepage
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[FaleConosco_GravarNovoContato]
	@Nome varchar(75),
	@Sobrenome varchar(75),
	@Email varchar(75),
	@Telefone  varchar(75),
	@Assunto varchar(30),
	@Descricao varchar(300)

AS
BEGIN
	INSERT INTO [dbo].[FaloConoscoContato]
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
           ,@Descricao
           ,GETDATE())
END

SELECT Convert(int, SCOPE_IDENTITY())


