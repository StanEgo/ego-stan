using System.Linq.Expressions;
using SDD.Web.Http;

namespace SDD.Specification.Grammar.Interpolated
{
    public delegate string Symbol<T>(T model);

    /// <remarks>
    /// <para>
    /// How to define quantifiers and logic operations? Embedding symbols like
    /// "*" "+" into text parts or add statements like "...{ Version.Many}..."
    /// or {... Version | SmthElse ... } or use interpolation formats:
    /// "... {model.Prop1:*}...{model.Prop2,1}...{model.Prop3,Many}". Or use
    /// brackets somehow.
    /// </para>
    /// 
    /// <para>
    /// Ideally would be to have custom class instead of Expression{Symbol{T}}
    /// that can converts from lambda expressions. This shortens grammars,
    /// allows to overload operations to write things like
    /// "...{model.HttpVersion as Version}...".
    /// </para>
    /// 
    /// <para>
    /// Would expression-bodied members help somehow?
    /// </para>
    /// </remarks>
    public class HttpGrammar : Grammar
    {
        public Expression<Symbol<HttpVersion>> Version => model
            => $"HTTP/{model.Major}.{model.Minor}"
        ;

        /// <remarks>
        /// TODO: How to reference HTTP Version? I need both this.Version
        /// and model.HttpVersion to be mentioned somehow. Combine somehow
        /// e.g. "... {model.HttpVersion = Version}"?
        /// </remarks>
        public Expression<Symbol<HttpRequestLine>> Request => model
            => $"{model.Method} {model.RequestUri} {model.HttpVersion}"
        ;
    }
}
