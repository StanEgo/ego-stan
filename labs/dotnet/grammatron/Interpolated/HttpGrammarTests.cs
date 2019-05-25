using System.Linq.Expressions;
using Grammatron.Model.Http;
using Xunit;

namespace Grammatron.Interpolated
{
    public class HttpGrammarTests
    {
        [Fact]
        public void Version_Debug()
        {
            var http = new HttpGrammar();
            
            var call = http.Version.Body as MethodCallExpression;
            Assert.NotNull(call);

            var method = call.Method;
            var methodName = $"{method.DeclaringType.FullName}.{method.Name}";
            Assert.Equal("System.String.Format", methodName);
            Assert.Equal(3, call.Arguments.Count);

            var template = call.Arguments[0] as ConstantExpression;
            Assert.NotNull(template);
            Assert.Equal("HTTP/{0}.{1}", template.Value);

            var castMajor = call.Arguments[1] as UnaryExpression;
            Assert.NotNull(castMajor);

            var propertyMajor = castMajor.Operand as MemberExpression;
            Assert.NotNull(propertyMajor);
            Assert.Equal(nameof(HttpVersion.Major), propertyMajor.Member.Name);

            var castMinor = call.Arguments[2] as UnaryExpression;
            Assert.NotNull(castMinor);

            var propertyMinor = castMinor.Operand as MemberExpression;
            Assert.NotNull(propertyMinor);
            Assert.Equal(nameof(HttpVersion.Minor), propertyMinor.Member.Name);
        }
    }
}
