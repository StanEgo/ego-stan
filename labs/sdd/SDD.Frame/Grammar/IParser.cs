using SDD.Application.Code;

namespace SDD.Grammar
{
    public interface IParser<TToken, TModel>
        : ICode<ITokenizer<TToken>, IResult<TModel>>
    {

    }
}
