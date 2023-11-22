using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Avalon.ClienteService.Repositories.Model;

[Table("ClienteEndereco")]
public class ClienteEndereco
{
    [Key]
    [Required]
    public int ClienteEnderecoId { get; set; }
    [Required]
    public int ClienteId { get; set; }
    public string NomeEndereco { get; set; } = string.Empty;
    public string Endereco { get; set; } = string.Empty;
    public string Numero { get; set; } = string.Empty;
    public string Complemento { get; set; } = string.Empty;
    public string CEP { get; set; } = string.Empty;
    public string Cidade { get; set; } = string.Empty;
}