using MediatR;

namespace Avalon.ClienteService.Features.Helpers;

public interface ICommand<out TResponse> : IRequest<TResponse>
{
}