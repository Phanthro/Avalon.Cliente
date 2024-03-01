using Avalon.ClienteService.Features.Helpers;
using Avalon.ClienteService.Repositories.Interfaces;
using MediatR;

namespace Avalon.ClienteService.Features.Usuario.Commands.CriarNovoUsuario;

public class CriarNovoUsuario
{
    public record Command(CriarNovoUsuarioDto UsuarioDto) : ICommand<long>;

    public class Handler : CriarNovoUsuarioDtoValidator, IRequestHandler<Command, long>
    {
        private readonly IUsuarioRepository _usuarioRepo;

        public Handler(IUsuarioRepository usuarioRepo)
        {
            _usuarioRepo = usuarioRepo;
        }

        public async Task<long> Handle(Command request, CancellationToken cancellationToken)
        {
            Validate(request);
            // var dbResult = await _usuarioRepo.ClienteCriarNovo(request.ClientDto);

            return await Task.FromResult(0);
            
        }

    }
}