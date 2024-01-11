using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Avalon.ClienteService.Repositories.Model;

[Table("Usuario")]
public class Usuario
{
    [Key]
    [Required]
    public int UsuarioId { get; set; }
    [Required]
    public int ClienteId { get; set; }
    [Required]
    public string Nome { get; set; } = string.Empty;
    [Required]
    public string Sobrenome { get; set; } = string.Empty;
    [Required]
    public string Email { get; set; } = string.Empty;
    [Required]
    public bool IsAtivo { get; set; }

}