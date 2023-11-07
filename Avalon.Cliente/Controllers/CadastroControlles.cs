using MediatR;
using Microsoft.AspNetCore.Mvc;
using Commands = Avalon.ClienteService.Features.Cadastro.Commands;

namespace Avalon.ClienteService.Cadastro.Controllers;

[ApiController]
[ApiVersion("1.0")]
[Route("v{version:apiVersion}/[controller]")]
[Consumes("application/json")]
[Produces("application/json")]
public class CadastroController : ControllerBase
{
    private readonly ILogger<CadastroController> _logger;
    private readonly ISender _mediator;

    public CadastroController(ILogger<CadastroController> logger, IMediator mediator)
    {
        _logger = logger;
        _mediator = mediator;
    }

    [HttpPost]
    public async Task<ActionResult<Commands.CriarNovoCliente.CriarNovoClienteDto>> CriarNovoClienteRepositoryAsync(
        [FromBody]Commands.CriarNovoCliente.CriarNovoClienteDto cadastro)
    {
        
        long result = await _mediator.Send(new Commands.CriarNovoCliente.CriarNovoCliente.Command(cadastro));
        return Ok();
        // return CreatedAtRoute( routeName:"ClienteById", routeValues:new{ ClienteId = result, version = "1.0" }, value: null );

    }

   
    
}
