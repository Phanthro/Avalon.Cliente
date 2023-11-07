using MediatR;

namespace Avalon.ClienteService.Features.Helpers;

public interface IQuery<out TResponse> : IRequest<TResponse>
{
}