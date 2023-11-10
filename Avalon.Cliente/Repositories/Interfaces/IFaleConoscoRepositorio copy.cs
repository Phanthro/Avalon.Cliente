using Avalon.ClienteService.Features.FaleConosco.Commands.ReceberContatoHomepage;

namespace Avalon.ClienteService.Repositories.Interfaces;

public interface IFaleConoscoRepository
{
    Task<int> GravarNovoContato(ReceberContatoHomepageDto clienteRepositoryDto);
}