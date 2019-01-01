using ObjectiveIoc.Abstractions;

namespace ObjectiveIoc.Business
{
    public interface IUpdateBusinessEntity
        : IHasId, IBusinessAspects, IEntity<IBusinessEntity>
    {

    }
}