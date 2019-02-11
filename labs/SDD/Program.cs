using SDD.Application.Model;
using SDD.Team.Security;

namespace SDD
{
    class Program
    {
        static void Main(string[] args)
        {
            var factory = new SimpleEntityFactory<IRole>();
        }
    }
}
