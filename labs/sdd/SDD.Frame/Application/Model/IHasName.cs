namespace SDD.Application.Model
{
    /// <summary>
    /// Defines that entity has a <see cref="Name"/>.
    /// </summary>
    public interface IHasName
    {
        /// <summary>
        /// Entity name.
        /// </summary>
        string Name { get; set; }
    }
}
