using System;
using SDD.Frame;

namespace SDD.Application.Model
{
    /// <summary>
    /// Basic implementation of <see cref="IEntityFactory{TEntity}"/>.
    /// </summary>
    /// 
    /// <remarks>
    /// <para>
    /// TODO:Make the basic implementation of entity creations. Just a quick MVP.
    /// Probably it would be good to have some basic reflection/emission toold
    /// in SDD.Application.
    /// </para>
    /// 
    /// <para>
    /// TODO:It may be interesting if we can dispatch creation for extended
    /// interfaces to their factories. For instance, IEntityFactory&lt;IRole&gt;
    /// may call IEntityFactory&lt;IHasLifetime&gt;. The question is, how to do
    /// this? Access to the IServiceResolver with dynamic invocations is not a
    /// good idea. IEntityFactory may handle all contracts, but then it becomes
    /// huge with the single strategy for all contracts.
    /// </para>
    /// </remarks>
    public class SimpleEntityFactory<TEntity>
        : IEntityFactory<TEntity>
    {
        private readonly Type[] _contracts;

        /// <summary>
        /// Construct.
        /// </summary>
        public SimpleEntityFactory()
        {
            _contracts = typeof(TEntity).GetInterfaces();
        }

        /// <inheritdoc />
        TEntity IEntityFactory<TEntity>.Create()
        {
            throw new NotImplementedException();
        }
    }
}
