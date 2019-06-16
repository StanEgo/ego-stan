using SDD.Application.Code;

namespace SDD.Specification.Grammar
{
    public interface IParser<TToken, TModel>
        : ICode<ITokenizer<TToken>, IResult<TModel>>
    {

    }
}
