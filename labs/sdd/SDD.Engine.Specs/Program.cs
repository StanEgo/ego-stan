using System;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using SDD.Application.Code;

namespace SDD.Engine.Specs
{
    // TODO: Попробовать набросать схему начиная с роутинга и до последующей обработки?

    // TODO: Продумать ещё раз код в том плане, чтобы я мог его описывать через
    // выражения, которые могут компилироваться. Может, всё-таки, работать с делегатами,
    // за которыми может стоять некоторый instance.
    // TODO: Добавить в ICode метод и in/out.
    public delegate TOutput Code<in TInput, out TOutput>(TInput input);

    /// <summary>
    /// TODO: Парсеры.
    /// </summary>
    /// 
    /// <remarks>
    /// <para>
    /// TODO: По идее, описание должно быть декларативным, чтобы парсер мог
    /// сгенерироваться. Для начала, парсер может описываться через булевое
    /// выражение с соответствующим токенизатором на входе.
    /// </para>
    /// 
    /// <para>
    /// Может быть парсер описания роутов. Который из заданной строки выстроит
    /// роут.
    /// </para>
    /// 
    /// TODO: Попробовать набросать контракты для комбинаторных парсеров и может
    /// примитивную реализацию и внимательно анализировать на применимость к обработке
    /// роутинга. Может парсеры могут реализовывать ICode. Может можно
    /// как-то сделать CodeExpression, который формально может кастится к ICode.
    /// 
    /// https://github.com/benjamin-hodgson/Pidgin - здесь парсеры секвенсятся
    /// и я тоже планировал сделать такой секвенсинг для ICode.
    /// Может быть какой-то общий IResult.
    /// </remarks>
    public interface IParser
    {

    }

    // TODO: Pipe = Chain of Responsibility.

    public class HttpJsonDecoder<TModel>
        : ICode<HttpRequest, TModel>
    {
        //TODO:
        //TModel ICode<HttpRequest, TModel>.Do(HttpRequest request)
        //{
        //    return JsonConvert.DeserializeObject<TModel>(request.Body.ToString());
        //}
    }

    public class ValidationResult<TModel> //TODO:Option/Monad/Result.
    {
        public Exception Exception { get; set; }

        public TModel Model { get; set; }
    }

    public interface IValidator<TModel>
    {
        ValidationResult<TModel> Validate(TModel model);
    }

    public class CodeExpression<TInput, TOutput>
    {
        
    }

    public class Pipe<TInput>
    {
        public static CodeExpression<TInput, TOutput> To<TOutput>()
        {
            return new CodeExpression<TInput, TOutput>();
        }
    }

    public interface ICodeFactory
    {
        void In<TInput>();
        void Out<TOutput>();
    }

    public interface ICompositionContext
    {
        //TODO:Parent composition
        void Dispatch<TMessage>(TMessage message);
    }

    /// TODO:Возможно, будет удобно сделать универсальный класс для формирования
    /// пути. Могут быть различные реализации и т.п. Как лучше, сделать Route
    /// цепочкой вроде Route.Term("/api").Number(). Может это будет что-то вроде
    /// комбинаторных парсеров? Скажем, реюзинг парсера Number.
    /// TODO: Или это не цепочка, а дерево.
    public class Route
    {
        public static Route Get(string pattern)
        {
            throw new NotImplementedException(); //TODO:
        }

        public Route Then(string pattern)
        {
            throw new NotImplementedException(); //TODO:
        }
    }

    // TODO: Я хотел роуты описывать единообразно. Для тестов и т.п.
    public class SomeApiComposition
    {
        public static readonly Route Api = Route.Get("/api");
        public static readonly Route ApiContacts = Api.Then("contacts");

        public void Compose(ICompositionContext context)
        {
            context.Dispatch(Api);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            ICodeFactory factory = null;

            // Like C#
            // string -> JsonModel<T> -> IValidator<T>
            // var decoder = Pipe<HttpRequest>.To<>
            // container.Register<ICode<HttpRequest, Any>>
        }
    }
}
