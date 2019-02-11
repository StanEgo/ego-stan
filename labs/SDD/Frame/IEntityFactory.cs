namespace SDD.Frame
{
    /// <summary>
    /// Create default implementations for selected.
    /// <typeparamref name="TEntity"/>.
    /// </summary>
    public interface IEntityFactory<TEntity>
    {
        /// <summary>
        /// Create instance of <typeparamref name="TEntity"/>.
        /// </summary>
        TEntity Create();
    }
}
