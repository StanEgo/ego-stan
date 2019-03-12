namespace SDD.Security.Authentication
{
    public interface IAuthenticationResponse
    {
        /// <summary>
        /// TODO:Unique secure token to be used by further authorizations.
        /// </summary>
        string Token { get; set; }
    }
}
