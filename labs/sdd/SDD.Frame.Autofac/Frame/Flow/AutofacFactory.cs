using System;
using Autofac;
using SDD.Application.Factory;

namespace SDD.Application.Flow
{
    /// <summary>
    /// <see cref="IFactory"/> implemented using Autofac IoC library.
    /// </summary>
    public class AutofacFactory : IFactory
    {
        private IContainer _container;

        /// <summary>
        /// Construct.
        /// </summary>
        public AutofacFactory(IContainer container)
        {
            _container = container;
        }

        #region -- IFactory interface ------------------------------------------
        /// <inheritdoc />
        TContract IFactory.Create<TContract>()
        {
            return _container.Resolve<TContract>();
        }

        /// <inheritdoc />
        object IFactory.Create(Type type)
        {
            return _container.Resolve(type);
        }
        #endregion -------------------------------------------------------------
    }
}
