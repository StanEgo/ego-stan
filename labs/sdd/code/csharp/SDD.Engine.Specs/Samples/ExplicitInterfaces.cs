using System;
using System.Runtime.CompilerServices;

namespace SDD.Samples
{
    /// <summary>
    /// TODO: Как лучше иницилизировать сэмплы, если они явно реализуют
    /// интерфейсы?
    /// </summary>
    [CompilerGenerated]
    internal class ArtifactDoc
    {

    }

    public interface ILifeTime
    {
        DateTimeOffset Created { get; set; }
        DateTimeOffset? Disposed { get; set; }
    }

    /// <summary>
    /// TODO:Реализация вспомогательных method extensions.
    /// </summary>
    /// 
    /// <pros>
    /// <item>Могут быть использованы в конструкторе</item>
    /// </pros>
    public static class ILifetimeExtensions
    {
        public static T Lifetime<T>(this T instance, DateTimeOffset created)
            where T : ILifeTime
        {
            instance.Created = created;

            return instance;
        }

        public static T Lifetime<T>(
            this T instance,
            DateTimeOffset created,
            DateTimeOffset disposed
        )
            where T : ILifeTime
        {
            instance.Created = created;
            instance.Disposed = disposed;

            return instance;
        }
    }

    public class Person : ILifeTime
    {
        DateTimeOffset ILifeTime.Created { get; set; }
        DateTimeOffset? ILifeTime.Disposed { get; set; }

        public static readonly Person Person1 = new Person()
            .Lifetime(DateTime.UtcNow)
            .Lifetime(DateTime.UtcNow, DateTime.UtcNow.AddDays(1))
        ;

        public Person()
        {
            this
                .Lifetime(DateTime.UtcNow)
                .Lifetime(DateTime.UtcNow, DateTime.UtcNow.AddDays(1))
            ;
        }
    }
}
