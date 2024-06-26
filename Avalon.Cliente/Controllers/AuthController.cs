using Avalon.ClienteService.Misc.Extensions;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Commands = Avalon.ClienteService.Features.Login.Commands;

namespace Avalon.ClienteService.Cadastro.Controllers;

[ApiController]
[ApiVersion("1.0")]
[Route("v{version:apiVersion}/[controller]")]
[Consumes("application/json")]
[Produces("application/json")]
public class AuthController : ControllerBase
{
    private readonly ILogger<AuthController> _logger;
    private readonly ISender _mediator;
    public AuthController(ILogger<AuthController> logger, IMediator mediator)
    {
        _logger = logger;
        _mediator = mediator;
    }


    [HttpGet("login")]
    [Authorize("BasicPolicy")]
    public IActionResult Login()
    {
            
        try
        {

            var token = User.FindFirst("access-token")?.Value?? throw new Exception();
            var expiration = User.FindFirst("validTo")?.Value?? throw new Exception();
            var permissoes = User.FindFirst("permissoes")?.Value?? "[]";

            var cookieOptions = new CookieOptions
            {
                HttpOnly = true,
                Secure = false,
                SameSite = SameSiteMode.Lax,
                Expires = DateTime.Now.AddHours(1),
            };

            Response.Cookies.Append("avalon-token", token, cookieOptions);


            return Ok(new
                {
                    status = "Ok",
                    error = "Login Ok.(1)",
                    jtw = token,
                    permissoes = JsonConvert.DeserializeObject<int[]>(permissoes),
                });

        }
        catch
        {
            return Unauthorized();
        }
    }

    [HttpGet("ValidaToken")]
    [Authorize]
    public IActionResult ValidaToken()
    {

        try {
            var username = User.FindFirst("username")?.Value?? throw new Exception();
            var email = User.FindFirst("e-mail")?.Value?? throw new Exception();
            var usuarioId = User.FindFirst("usuarioId")?.Value?? throw new Exception();
            var permissoes = User.FindFirst("permissoes")?.Value?? throw new Exception();
            return Ok(new {username, email, usuarioId, permissoes});    
        } catch {
            return BadRequest("Token inválido");
        }



    }


}

