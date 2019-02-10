namespace SDD.Frame.Model
{
    /// <summary>
    /// This interface defines identified entities by using a
    /// <see cref="Id"/> property.
    /// </summary>
    /// 
    /// <typeparam name="TKey">
    /// Type of the <see cref="Id"/>.
    /// </typeparam>
    public interface IHasId<TKey>
    {
        TKey Id { get; set; }
    }
}
