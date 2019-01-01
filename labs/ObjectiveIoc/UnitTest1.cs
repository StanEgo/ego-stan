using System;
using ObjectiveIoc.Business;
using ObjectiveIoc.Platform;
using Xunit;
using Xunit.Abstractions;

namespace ObjectiveIoc
{
    // TODO:
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            Ioc.Entity<IBusinessEntity>();
        }
    }
}
