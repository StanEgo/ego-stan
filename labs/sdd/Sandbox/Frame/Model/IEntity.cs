namespace SDD.Frame.Model
{
    /// <summary>
    /// Marker interface that class relates to <typeparamref name="T"/> entity.
    /// </summary>
    /// 
    /// <remarks>
    /// We may have a lot of classes supporting same entity. Partitions,
    /// view-models, CRUD-related classes, etc. Using this interface we can
    /// align all of them.
    /// </remarks>
    public interface IEntity<TEntity>
    {
        
    }
}