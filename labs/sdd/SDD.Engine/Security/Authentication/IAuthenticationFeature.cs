using SDD.Application.Flow;

namespace SDD.Security.Authentication
{
    public interface IAuthenticationFeature
        : IFeature<IAuthenticationRequest, IAuthenticationResponse>
    {

    }
}
