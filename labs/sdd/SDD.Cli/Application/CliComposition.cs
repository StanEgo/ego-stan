using SDD.Application.Composition;

namespace SDD.Application
{
    /// <summary>
    /// <see cref="IComposition">Compose</see> CLI application.
    /// </summary>
    /// 
    /// <todo>
    /// Routes in composition that I think about applied to Web API could also
    /// be helpful for CLI. For example POST /account/auth { name: "stan",
    /// password: "!qa2WS3eD" } is the same as "sdd account auth --name stan
    /// --password !qa2Ws3eD".
    /// </todo>
    /// 
    /// <todo>
    /// Commands could be loaded automatically from any assemblies. CLI itself
    /// may be like a basic tool.
    /// </todo>
    /// 
    /// <todo>
    /// Can CLI commands be exposed automatically as Powershell cmdlets?
    /// </todo>
    public class CliComposition : IComposition
    {

    }
}
