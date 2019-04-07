using SDD.Application.Code;

namespace SDD.Security.Authentication
{
    public interface IAuthentication
        : ICode<IAuthenticationRequest, IAuthenticationResponse>
    {

    }
}
