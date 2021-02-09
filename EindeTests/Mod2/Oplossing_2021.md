#

```java
static void Main(string[] args)
{
    string input = "j";
    do
    {
        Console.WriteLine("Onderschepte code");
        char[] code = MaakSignaal();
        Console.WriteLine();
        VisualiseerCode(code);
        AnalyseerCode(code);
        Console.WriteLine("Wenst u opnieuw te beginnen?");
        input = char.Parse(Console.ReadLine());
    } while (input == 'j');
}

private static void AnalyseerCode(char[] code)
{
    Console.WriteLine();
    Console.WriteLine($"Er werden {CountSpecials(code)} speciale tekens gevonden");
    if (IsVerdacht(CountSpecials(code)))
    {
        Console.WriteLine("Dit is een verdacht signaal");
    }
    else
        Console.WriteLine("Dit is geen verdacht signaal");
}

private static void VisualiseerCode(char[] code)
{
    Console.WriteLine("Detectie van de speciale tekens:");
    for (int i = 0; i < code.Length; i++)
    {
        if (NeedsColor(code[i]))
        {
            WriteCharInRed(code[i]);
        }
        else
            Console.Write(".");
    }
}

private static char[] MaakSignaal()
{
    const int S_LENGTH = 100;
    Random r = new Random();
    char[] code = new char[S_LENGTH];
    for (int i = 0; i < code.Length; i++)
    {
        code[i] = (char)r.Next('A', 'Z' + 1);
        Console.Write(code[i]);
    }
    return code;
}

private static bool IsVerdacht(int v)
{

    if (v % 3 == 0)
    {
        return true;
    }
    return false;
}

static bool NeedsColor(char c)
{
    switch (c)
    {
        case 'X':
        case 'Y':
        case 'Z':
        case 'Q':
            return true;
    }
    return false;
}

static void WriteCharInRed(char c)
{
    Console.ForegroundColor = ConsoleColor.Red;
    Console.Write(c);
    Console.ResetColor();
}

static int CountSpecials(char[] ar)
{
    int total = 0;
    for (int i = 0; i < ar.Length; i++)
    {
        if (NeedsColor(ar[i]))
            total++;
    }
    return total;
}

```