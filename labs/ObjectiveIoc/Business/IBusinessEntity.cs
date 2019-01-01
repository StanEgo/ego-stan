using ObjectiveIoc.Abstractions;

namespace ObjectiveIoc.Business
{
    public interface IBusinessEntity
        : IHasId, IHasLifetime, IBusinessAspects
    {
        
    }
}