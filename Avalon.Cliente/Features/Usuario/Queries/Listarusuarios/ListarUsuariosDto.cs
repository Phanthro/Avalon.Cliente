namespace Avalon.ClienteService.Features.Usuario.Queries.ListarUsuarios;

public class ListarUsuariosDto
{
    public int UsuarioId { get; set; }
    public string Nome { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public bool IsAtivo { get; set; }
    
    
}