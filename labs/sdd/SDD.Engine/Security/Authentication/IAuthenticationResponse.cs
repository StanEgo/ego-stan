using SDD.Application.Model;

namespace SDD.Security.Authentication
{
    public interface IAuthenticationResponse
        : IEntity<IAccount>
    {
        /// <summary>
        /// TODO:Unique secure token to be used by further authorizations.
        /// </summary>
        string Token { get; set; }
    }
}
