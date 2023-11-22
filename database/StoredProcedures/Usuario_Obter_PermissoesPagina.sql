-- =============================================
-- Author:		Bruno Buchar Montenegro
-- Create date: 2023-11-14
-- Description:	Obter lista de permissões de pagina de um usuario
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Usuario_Obter_PermissoesPagina]
	@UsuarioId  int
AS
BEGIN

	SELECT 
	   [UsuarioId]
      ,[PaginaId]
	FROM
		[Avalon01].[dbo].[UsuarioPermissaoPagina]
	WHERE
		[UsuarioId] = @UsuarioId
END