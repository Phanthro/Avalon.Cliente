-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-07
-- Description:	Obter usuario por email
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Usuario_Obter_PorEmail]
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