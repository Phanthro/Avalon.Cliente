using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Avalon.ClienteService.Repositories.Model;

[Table("Cliente")]
public class Cliente
{
    [Key]
    public int ClienteId { get; set; }
    public string NumeroInscricao { get; set; } = string.Empty;
    public string Nome { get; set; } = string.Empty;
    public string Sobrenome { get; set; } = string.Empty;
    public string RazaoSocial { get; set; } = string.Empty;

}