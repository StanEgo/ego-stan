using System.Linq.Expressions;

namespace ParseGen
{
    public class Model
    {
        public string Name { get; set; }
    }

    public class SubModel
    {
        
    }

    public delegate string Symbol<T>(T model);

    public class SampleGrammar
    {
        public const string Open = "{";

        public string Close = "}";

        public Expression<Symbol<Model>> Model => model => $"Text {Open}{model.Name}{Close}";
    }
}