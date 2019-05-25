namespace SDD.Web.Http
{
    /// <summary>
    /// HTTP Version.
    /// </summary>
    /// 
    /// <remarks>
    /// <a href="https://tools.ietf.org/html/rfc2616#section-3.1">RFC</a>.
    /// </remarks>
    public class HttpVersion
    {
        public byte Major { get; set; }

        public byte Minor { get; set; }
    }
}
