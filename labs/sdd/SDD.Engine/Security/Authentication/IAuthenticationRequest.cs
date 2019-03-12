using SDD.Application.Model;

namespace SDD.Security.Authentication
{
    public interface IAuthenticationRequest : IHasId<string>
    {
        string Signature { get; set; }
    }
}
