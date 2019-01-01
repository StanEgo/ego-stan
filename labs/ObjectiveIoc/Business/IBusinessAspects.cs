using ObjectiveIoc.Abstractions;

namespace ObjectiveIoc.Business
{
    public interface IBusinessAspects : IHasName
    {
        string TraitA { get; set; }

        string TraitB { get; set; }
    }
}
