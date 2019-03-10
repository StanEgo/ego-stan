using SDD.Frame.Model;

namespace SDD.Team
{
    /// <summary>
    /// Basic entity contract.
    /// </summary>
    public interface IBaseEntity<TEntity>
        : IEntity<TEntity>
        , IHasId<long>
        , IHasLifetime
        
    {

    }
}
