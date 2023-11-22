using Avalon.ClienteService.Features.Login.Commands.LogarPorEmailESenha;
using Avalon.ClienteService.Repositories.Model;

namespace Avalon.ClienteService.Repositories.Interfaces;

public interface IUsuarioRepository
{
    Task<UsuarioPorEmailDto?> ObterPorEmail(LogarPorEmailESenhaDto request);
    Task<IEnumerable<UsuarioPermissaoPagina>> ObterPermissoesPaginaUsuario(int usuarioId);
    
}