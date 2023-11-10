using Avalon.ClienteService.Features.Cadastro.Commands.CriarNovoCliente;
using Avalon.ClienteService.Features.FaleConosco.Commands.ReceberContatoHomepage;
using Avalon.ClienteService.Repositories.Interfaces;
using DataAccess;
using MPSProject.CollaboratorService.Repositories.Model;

namespace Avalon.ClienteService.Repositories;

public class FaleConoscoRepository : IFaleConoscoRepository
{
    private readonly IDataAccess _dataAccess;
    
    public FaleConoscoRepository(IDataAccess dataAccess)
    {

        _dataAccess = dataAccess;
        
    }

    public async Task<int> GravarNovoContato(ReceberContatoHomepageDto contatoRepositoryDto)
    {
         var contato = ConverterContatoDto(contatoRepositoryDto);

        int contatoId = await _dataAccess.ExecuteScalarAsync<int>(
                "[dbo].[FaleConosco_GravarNovoContato]",
                contato
            );
        
        return contatoId;
    }


    /*
     * Privete Methods
     */
    private static Dictionary<string,object> ConverterContatoDto(ReceberContatoHomepageDto novoFaleConoscoRepositoryDto)
    {
        Dictionary<string,object> contato = new()
        {
            { "Nome", novoFaleConoscoRepositoryDto.Nome },
            { "Sobrenome", novoFaleConoscoRepositoryDto.Sobrenome },
            { "Email", novoFaleConoscoRepositoryDto.Email },
            { "Telefone", novoFaleConoscoRepositoryDto.Telefone },
            { "Assunto", novoFaleConoscoRepositoryDto.Assunto },
            { "Comentario", novoFaleConoscoRepositoryDto.Comentario }
        };


        return contato;
    }

    
}