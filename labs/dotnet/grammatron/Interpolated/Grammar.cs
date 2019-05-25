namespace Grammatron.Interpolated
{
    /// <remarks>
    /// <para>
    ///     Quantifiers like <see cref="Optional"/>, <see cref="One"/>, etc.
    ///     may be used in "alignment" option of interpolated strings. It may
    ///     look like "...{model.Value, Many}...".
    /// </para>
    /// </remarks>
    public class Grammar
    {
        public const int Optional = 0;

        public const int One = 1;

        public const int Many = int.MaxValue;
    }
}
