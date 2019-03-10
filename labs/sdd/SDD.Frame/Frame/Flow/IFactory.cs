using System;

namespace SDD.Frame.Flow
{
    /// <summary>
    /// Instance creation.
    /// </summary>
    public interface IFactory
    {
        /// <summary>
        /// Create instance of <typeparamref name="TEntity"/>.
        /// </summary>
        TEntity Create<TEntity>();

        /// <summary>
        /// Create instance of <paramref name="type"/>.
        /// </summary>
        object Create(Type type);
    }
}
