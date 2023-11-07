
namespace Avalon.ClienteService.Features.Helpers;

public interface IValidator<ICommand>
{
    void Validate(ICommand request);
}