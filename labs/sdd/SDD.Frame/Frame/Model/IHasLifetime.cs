using System;

namespace SDD.Frame.Model
{
    /// <summary>
    /// Defines that entity has a lifetime between <see cref="Created"/>
    /// and <see cref="Deleted"/>.
    /// </summary>
    public interface IHasLifetime
    {
        /// <summary>
        /// Date and time when entity was created.
        /// </summary>
        DateTimeOffset Created { get; set; }

        /// <summary>
        /// Date and time when entity was deleted.
        /// </summary>
        DateTimeOffset? Deleted { get; set; }
    }
}
