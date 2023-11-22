using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Avalon.ClienteService.Repositories.Model;

[Table("ClienteDetalhe")]
public class ClienteDetalhe
{
    [Key]
    [Required]
    public int ClienteDetalheId { get; set; }
    [Required]
    public int ClienteId { get; set; }
    public string NomeContato { get; set; } = string.Empty;
    public string Telefone { get; set; } = string.Empty;
    public string Celular { get; set; } = string.Empty;
    public string WhatsApp { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string ProdutoInsteressado { get; set; } = string.Empty;
    public string ComoConheceu { get; set; } = string.Empty;

}