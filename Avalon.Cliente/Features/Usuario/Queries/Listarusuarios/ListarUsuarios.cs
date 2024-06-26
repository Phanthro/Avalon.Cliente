using AutoMapper;
using Avalon.ClienteService.Features.Helpers;
using Avalon.ClienteService.Repositories.Interfaces;
using MediatR;

namespace Avalon.ClienteService.Features.Usuario.Queries.ListarUsuarios;

public class ListarUsuarios
{

    public record Query() : IQuery<IEnumerable<ListarUsuariosDto>>;

    public class Handler : IRequestHandler<Query, IEnumerable<ListarUsuariosDto>>
    {
        private readonly IUsuarioRepository _usuarioRepo;
        private readonly IMapper _mapper;

        public Handler(IUsuarioRepository usuarioRepo, IMapper mapper)
        {
            _usuarioRepo = usuarioRepo;
            _mapper = mapper;
        }

        public async Task<IEnumerable<ListarUsuariosDto>> Handle(Query request, CancellationToken cancellationToken)
        {
            var dbResult = await _usuarioRepo.ListarUsuarios();

            var result = dbResult.Select(x=> new ListarUsuariosDto{
                UsuarioId = x.UsuarioId,
                Email = x.Email,
                IsAtivo = x.IsAtivo,
                Nome = x.Nome
            });

            return result;
            
        }
    }

}