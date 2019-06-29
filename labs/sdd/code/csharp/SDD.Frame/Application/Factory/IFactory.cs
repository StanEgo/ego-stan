using System;

namespace SDD.Application.Factory
{
    /// <summary>
    /// Instance creation.
    /// </summary>
    public interface IFactory
    {
        /// <summary>
        /// Create instance of <typeparamref name="TContract"/>.
        /// </summary>
        TContract Create<TContract>();

        /// <summary>
        /// Create instance of <paramref name="type"/>.
        /// </summary>
        object Create(Type type);
    }
}
