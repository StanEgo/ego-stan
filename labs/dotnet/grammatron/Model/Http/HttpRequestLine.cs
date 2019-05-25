namespace Grammatron.Model.Http
{
    /// <summary>
    /// Model for the HTTP request line.
    /// </summary>
    /// 
    /// <remarks>
    /// <a href="https://tools.ietf.org/html/rfc2616#section-5.1">RFC</a>.
    /// </remarks>
    public class HttpRequestLine
    {
        public string Method { get; set; }

        public string RequestUri { get; set; }

        public HttpVersion HttpVersion { get; set; }
    }
}
