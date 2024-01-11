using Avalon.ClienteService.Features.Login.Commands.LogarPorEmailESenha;
using Avalon.ClienteService.Repositories.Interfaces;
using Avalon.ClienteService.Repositories.Model;
using DataAccess;

namespace Avalon.ClienteService.Repositories;

public class UsuarioRepository : IUsuarioRepository
{
    private readonly IDataAccess _dataAccess;
    
    public UsuarioRepository(IDataAccess dataAccess)
    {

        _dataAccess = dataAccess;
        
    }

    public async Task<UsuarioPorEmailDto?> ObterPorEmail(LogarPorEmailESenhaDto request)
    {
         UsuarioPorEmailDto? user = (await _dataAccess.ExecuteAsync<UsuarioPorEmailDto>(
                "[dbo].[Usuario_Obter_PorEmail]",
                new Dictionary<string, object>()
                {
                    {"Email", request.Email}
                }
            )).FirstOrDefault();
        
        return user;
        
    }

    public async Task<IEnumerable<Usuario>> ListarUsuarios()
    {
         IEnumerable<Usuario>? user = await _dataAccess.ExecuteAsync<Usuario>(
                "[dbo].[Usuario_Listar_Usuarios]"
            );
        
        return user;
        
    }

    public async Task<IEnumerable<UsuarioPermissaoPagina>> ObterPermissoesPaginaUsuario(int usuarioId)
    {
         IEnumerable<UsuarioPermissaoPagina> permissoes = await _dataAccess.ExecuteAsync<UsuarioPermissaoPagina>(
                "[dbo].[Usuario_Obter_PermissoesPagina]",
                new Dictionary<string, object>()
                {
                    {"UsuarioId", usuarioId}
                }
            );
        
        return permissoes;
        
    }

}
