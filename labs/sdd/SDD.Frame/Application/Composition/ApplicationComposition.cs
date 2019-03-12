using SDD.Security;

namespace SDD.Application.Composition
{
    /// <summary>
    /// TODO:Attempt to define basic application skeleton.
    /// </summary>
    public class ApplicationComposition : IComposition
    {
        public ISecurityComposition Security { get; }

        public ApplicationComposition(ISecurityComposition security)
        {
            Security = security;
        }
    }
}
