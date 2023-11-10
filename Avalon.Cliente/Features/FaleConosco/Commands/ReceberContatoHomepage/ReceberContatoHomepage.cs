using Avalon.ClienteService.Features.Helpers;
using Avalon.ClienteService.Repositories.Interfaces;
using MediatR;

namespace Avalon.ClienteService.Features.FaleConosco.Commands.ReceberContatoHomepage;

public class ReceberContatoHomepage
{
    public record Command(ReceberContatoHomepageDto ClientDto) : ICommand<long>;

    public class Handler : ReceberContatoHomepageDtoValidator, IRequestHandler<Command, long>
    {
        private readonly IFaleConoscoRepository _faleConoscoRepo;

        public Handler(IFaleConoscoRepository faleConoscoRepo)
        {
            _faleConoscoRepo = faleConoscoRepo;
        }

        public async Task<long> Handle(Command request, CancellationToken cancellationToken)
        {
            Validate(request);
            var dbResult = await _faleConoscoRepo.GravarNovoContato(request.ClientDto);

            return dbResult;
            
        }

    }
}