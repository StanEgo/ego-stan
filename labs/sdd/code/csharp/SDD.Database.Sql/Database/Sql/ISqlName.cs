using SDD.Application.Model;

namespace SDD.Database.Sql
{
    public interface ISqlName : IHasName
    {
        string Schema { get; set; }

        string Name { get; set; }
    }
}
