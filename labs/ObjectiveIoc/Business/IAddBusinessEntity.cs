using ObjectiveIoc.Abstractions;

namespace ObjectiveIoc.Business
{
    public interface IAddBusinessEntity
        : IEntity<IBusinessEntity>, IBusinessAspects
    {

    }
}