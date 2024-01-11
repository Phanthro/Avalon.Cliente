using Avalon.ClienteService.Features.Usuario.Queries.ObterPermissoesUsuario;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Query = Avalon.ClienteService.Features.Usuario.Queries;

namespace Avalon.ClienteService.Cadastro.Controllers;

[ApiController]
[ApiVersion("1.0")]
[Route("v{version:apiVersion}/[controller]")]
[Consumes("application/json")]
[Produces("application/json")]
public class UsuarioController : ControllerBase
{
    private readonly ILogger<UsuarioController> _logger;
    private readonly ISender _mediator;

    public UsuarioController(ILogger<UsuarioController> logger, IMediator mediator)
    {
        _logger = logger;
        _mediator = mediator;
    }

    [HttpGet("obterListaDeUsuarios")]
    public async Task<IActionResult> ObterListaDeUsuarios()
    {
        
        IEnumerable<Query.ListarUsuarios.ListarUsuariosDto> result = await _mediator.Send(new Query.ListarUsuarios.ListarUsuarios.Query());
        var retorno = new Retorno(result);
        if(retorno.Status != 200)
        {
            return BadRequest(retorno);
        }
        return Ok(retorno);

    }

    [HttpGet("PermissoePorUsuarioId/{usuarioId:int}")]
    public async Task<IActionResult> ObterPermissoesUsuario(int usuarioId)
    {
        
        IEnumerable<ObterPermissoesUsuarioDto> result = await _mediator.Send(new Query.ObterPermissoesUsuario.ObterPermissoesUsuario.Query(usuarioId));
        var retorno = new Retorno(result);
        return Ok(retorno);

    }

   
    
}
