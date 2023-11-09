-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Criar novo cliente
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Cliente_CriarNovo]
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