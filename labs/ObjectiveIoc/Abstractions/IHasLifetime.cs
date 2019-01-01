using System;

namespace ObjectiveIoc.Abstractions
{
    public interface IHasLifetime
    {
        DateTime Created { get; set; }

        DateTime Deleted { get; set; }
    }
}
