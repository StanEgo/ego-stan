using System;

namespace SDD.Application.Code
{
    public interface IResult<TModel>
    {
        Exception Exception { get; }

        TModel Model { get; }
    }
}
