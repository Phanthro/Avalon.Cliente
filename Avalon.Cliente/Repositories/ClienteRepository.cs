using Avalon.ClienteService.Features.Cadastro.Commands.CriarNovoCliente;
using Avalon.ClienteService.Repositories.Interfaces;
using DataAccess;
using MPSProject.CollaboratorService.Repositories.Model;

namespace Avalon.ClienteService.Repositories;

public class ClienteRepository : IClienteRepository
{
    private readonly IDataAccess _dataAccess;
    
    public ClienteRepository(IDataAccess dataAccess)
    {

        _dataAccess = dataAccess;
        
    }

    public async Task<int> ClienteCriarNovo(CriarNovoClienteDto request)
    {
        var (cliente, clienteEndereco, clienteDetalhe) = ConverterCadastroDto(request);

        int clienteId = await _dataAccess.ExecuteScalarAsync<int>(
                "[dbo].[Cliente_CriarNovo]",
                cliente
            );
        
        clienteEndereco.Add("clienteId", clienteId);

        await _dataAccess.ExecuteScalarAsync<int>(
                "[dbo].[ClienteEndereco_CriarNovo]",
                clienteEndereco
            );
        
        clienteDetalhe.Add("clienteId", clienteId);

        await _dataAccess.ExecuteScalarAsync<int>(
                "[dbo].[ClienteDetalhe_CriarNovo]",
                clienteDetalhe
            );

        return clienteId;
        
    }


    /*
     * Privete Methods
     */
    private static (Dictionary<string,object>, Dictionary<string,object>, Dictionary<string,object> ) ConverterCadastroDto(CriarNovoClienteDto novoClienteRepositoryDto)
    {
        Dictionary<string,object> cliente = new()
        {
            { "NumeroInscricao", novoClienteRepositoryDto.NumeroInscricao },
            { "TipoInscricao", novoClienteRepositoryDto.TipoInscricao },
            { "Nome", novoClienteRepositoryDto.Nome },
            { "DataNascimento", novoClienteRepositoryDto.DataDeNasciemnto },
            { "Sobrenome", novoClienteRepositoryDto.Sobrenome },
            { "RazaoSocial", string.Empty }
        };

        Dictionary<string,object> clienteEndereco = new()
        {
            { "NomeEndereco", novoClienteRepositoryDto.NomeEndereco },
            { "Endereco", novoClienteRepositoryDto.Endereco },
            { "Numero", novoClienteRepositoryDto.Numero },
            { "Complemento", novoClienteRepositoryDto.Complemento },
            { "CEP", novoClienteRepositoryDto.CEP },
            { "Cidade", string.Empty }
        };

        Dictionary<string,object> clienteDetalhe = new()
        {
            { "NomeContato", string.Empty },
            { "Telefone", novoClienteRepositoryDto.Telefone },
            { "Celular", novoClienteRepositoryDto.Celular },
            { "WhatsApp", novoClienteRepositoryDto.WhatsApp },
            { "Email", novoClienteRepositoryDto.Email },
            { "ProdutoInteressado", novoClienteRepositoryDto.ProdutoInteressado },
            { "ComoConheceu", novoClienteRepositoryDto.ComoConheceuOPosto }
        };

        return (cliente, clienteEndereco, clienteDetalhe);
    }

    
}