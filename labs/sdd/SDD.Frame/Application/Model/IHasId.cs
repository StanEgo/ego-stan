namespace SDD.Application.Model
{
    /// <summary>
    /// Defines that entity has an unique <see cref="Id"/>.
    /// </summary>
    /// 
    /// <typeparam name="TKey">
    /// Type of the <see cref="Id"/>.
    /// </typeparam>
    public interface IHasId<TKey>
    {
        /// <summary>
        /// Unique entity identifier.
        /// </summary>
        TKey Id { get; set; }
    }
}
