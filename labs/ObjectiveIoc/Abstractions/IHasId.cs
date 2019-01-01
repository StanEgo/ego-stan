namespace ObjectiveIoc.Abstractions
{
    public interface IHasId<TKey>
    {
        TKey Id { get; set; }
    }

    public interface IHasId : IHasId<int>
    {
        
    }
}