using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MPSProject.CollaboratorService.Repositories.Model;

[Table("Cliente")]
public class Cliente
{
    [Key]
    [Required]
    public int ClienteId { get; set; }
    [Required]
    public string NumeroInscricao { get; set; } = string.Empty;
    [Required]
    public string Nome { get; set; } = string.Empty;
    [Required]
    public string Sobrenome { get; set; } = string.Empty;
    [Required]
    public string razaoSocial { get; set; } = string.Empty;

}