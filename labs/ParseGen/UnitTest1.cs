using System.Linq.Expressions;
using Xunit;

namespace ParseGen
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            var grammar = new SampleGrammar();
            
            var call = grammar.Model.Body as MethodCallExpression;
            Assert.NotNull(call);

            var method = call.Method;
            var methodName = $"{method.DeclaringType.FullName}.{method.Name}";
            Assert.Equal("System.String.Format", methodName);
            Assert.Equal(4, call.Arguments.Count);
            
            var template = call.Arguments[0] as ConstantExpression;
            Assert.NotNull(template);
            Assert.Equal("Text {0}{1}{2}", template.Value);

            var constant = call.Arguments[1] as ConstantExpression;
            Assert.NotNull(constant);
            Assert.Equal("{", constant.Value);

            var argument = call.Arguments[2] as MemberExpression;
            Assert.NotNull(argument);
            var parameter = argument.Expression as ParameterExpression;
            Assert.NotNull(parameter);
            Assert.Equal("model", parameter.Name);

            var property = call.Arguments[3] as MemberExpression;
            Assert.NotNull(property);
            Assert.Equal("Close", property.Member.Name);
            Assert.True(false, property.Expression.GetType().ToString());
        }
    }
}
