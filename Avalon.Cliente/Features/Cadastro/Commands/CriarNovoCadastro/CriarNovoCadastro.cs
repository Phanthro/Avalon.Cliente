using Avalon.ClienteService.Features.Helpers;
using Avalon.ClienteService.Repositories.Interfaces;
using MediatR;

namespace Avalon.ClienteService.Features.Cadastro.Commands.CriarNovoCliente;

public class CriarNovoCliente
{
    public record Command(CriarNovoClienteDto ClientDto) : ICommand<long>;

    public class Handler : CriarNovoClienteDtoValidator, IRequestHandler<Command, long>
    {
        private readonly IClienteRepository _cadastroRepo;

        public Handler(IClienteRepository cadastroRepo)
        {
            _cadastroRepo = cadastroRepo;
        }

        public async Task<long> Handle(Command request, CancellationToken cancellationToken)
        {
            Validate(request);
            var dbResult = await _cadastroRepo.ClienteCriarNovo(request.ClientDto);

            return dbResult;
            
        }

    }
}