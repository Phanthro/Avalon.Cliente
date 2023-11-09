namespace Avalon.ClienteService.Features.Cadastro.Commands.CriarNovoCliente;

public class CriarNovoClienteDto
{
    public string NumeroInscricao { get; set; } = "";
    public string TipoInscricao { get; set; } = "";
    //Cliente
    public string Nome { get; set; } = "";
    public string Sobrenome { get; set; } = "";
    //Endereco
    public string NomeEndereco { get; set; } = "";
    public string DataDeNasciemnto { get; set; } = "";
    public string CEP { get; set; } = "";
    public string Bairro { get; set; } = "";
    public string Endereco { get; set; } = "";
    public string Complemento { get; set; } = "";
    public string Numero { get; set; } = "";
    public string Cidade { get; set; } = "";
    //Contato
    public string NomeContato { get; set; } = "";
    public string Telefone { get; set; } = "";
    public string Celular { get; set; } = "";
    public string WhatsApp { get; set; } = "";
    public string Email { get; set; } = "";
    //Outros
    public string ProdutoInteressado { get; set; } = "";
    public string ComoConheceuOPosto { get; set; } = "";

}