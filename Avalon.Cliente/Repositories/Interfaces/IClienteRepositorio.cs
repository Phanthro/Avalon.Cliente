
using Avalon.ClienteService.Features.Cadastro.Commands.CriarNovoCliente;

namespace Avalon.ClienteService.Repositories.Interfaces;

public interface IClienteRepository
{
    Task<int> ClienteCriarNovo(CriarNovoClienteDto ClienteRepositoryDto);
}