namespace SDD.Frame.Flow
{
    /// <summary>
    /// A capability of getting a <typeparamref name="TProduct"/>
    /// from specific <typeparamref name="TInput"/>.
    /// </summary>
    public interface IFeature<TInput, TProduct>
    {
        /// <summary>
        /// Get a <typeparamref name="TProduct"/> from provided
        /// <paramref name="input"/>.
        /// </summary>
        TProduct Get(TInput input);
    }
}
