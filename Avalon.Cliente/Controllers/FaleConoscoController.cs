using MediatR;
using Microsoft.AspNetCore.Mvc;
using Commands = Avalon.ClienteService.Features.FaleConosco.Commands;

namespace Avalon.ClienteService.Cadastro.Controllers;

[ApiController]
[ApiVersion("1.0")]
[Route("v{version:apiVersion}/[controller]")]
[Consumes("application/json")]
[Produces("application/json")]
public class FaleConoscoController : ControllerBase
{
    private readonly ILogger<FaleConoscoController> _logger;
    private readonly ISender _mediator;

    public FaleConoscoController(ILogger<FaleConoscoController> logger, IMediator mediator)
    {
        _logger = logger;
        _mediator = mediator;
    }

    [HttpPost]
    public async Task<ActionResult> CriarNovoClienteRepositoryAsync(
        [FromBody]Commands.ReceberContatoHomepage.ReceberContatoHomepageDto cadastro)
    {
        
        long result = await _mediator.Send(new Commands.ReceberContatoHomepage.ReceberContatoHomepage.Command(cadastro));
        return Ok();
        // return CreatedAtRoute( routeName:"ClienteById", routeValues:new{ ClienteId = result, version = "1.0" }, value: null );

    }

   
    
}
