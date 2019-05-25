using SDD.Application.Model;

namespace SDD.Security.Authentication
{
    public interface IAuthenticationRequest
        : IHasId<string>
        , IEntity<IAccount>
    {
        string Signature { get; set; }
    }
}
