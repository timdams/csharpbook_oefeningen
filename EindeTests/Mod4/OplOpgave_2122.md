> Dank aan Wael Orraby.



Klasses:

```java
 abstract class Toestel
{
    protected char tekenChar = 'o';
    public void Teken()
    {
        Console.Write(tekenChar);
    }
    public abstract int BerekenMoeilijkheidsgraad();
}

internal class Trampoline : Toestel
{
    static Random random = new Random();
    private int moeilijkheidsgraad;
    public Trampoline()
    {
        tekenChar = 't';
        
        moeilijkheidsgraad = random.Next(1, 5);
    }
    public override int BerekenMoeilijkheidsgraad()=> this.moeilijkheidsgraad;   
}

internal class UltraTrampoline : Trampoline, IDodelijk
{
    public UltraTrampoline()
    {
        tekenChar = 'T';
    }

    public bool VeiligheidsActief
    {
        get
        {
            return false;
        }
    }

    public override int BerekenMoeilijkheidsgraad()
    {
        return base.BerekenMoeilijkheidsgraad() + 10;
    }
}

internal class Klimmuur : Toestel
{
    public Klimmuur(int inaantalHandvaten)
    {
        tekenChar = 'm';
        aantalHandvaten = inaantalHandvaten;
    }
    private int aantalHandvaten;
    public override int BerekenMoeilijkheidsgraad()
    {
        if (aantalHandvaten % 2 == 0)
            return 3;
        return 4;
    }
}

internal class DeadWall : Klimmuur, IDodelijk
{
    private bool veiligheidsNetten;

    public bool VeiligheidsActief
    {
        get
        {
            return veiligheidsNetten;
        }
    }

    public DeadWall(bool heeftVeiligheidsnetten) : base(21)
    {
        veiligheidsNetten = heeftVeiligheidsnetten;
        tekenChar = 'M';
    }
    public override int BerekenMoeilijkheidsgraad()
    {
        if (VeiligheidsActief) return 5;
        return 10;
    }
}

internal class Parkoer
{
    static Random r = new Random();
    List<Toestel> toestellenLijst = new List<Toestel>();
    public Parkoer(int x, bool y)
    {
        for (int i = 0; i < x; i++)
        {
            int rng = r.Next(1, 5);
            switch (rng)
            {
                case 1:
                    toestellenLijst.Add(new Trampoline());
                    break;
                case 2:
                    toestellenLijst.Add(new UltraTrampoline());
                    break;
                case 3:
                    toestellenLijst.Add(new Klimmuur(r.Next(10, 51)));
                    break;
                case 4:
                    toestellenLijst.Add(new DeadWall(y));
                    break;
            }
        }
    }
    public void VerwijderDodelijke()
    {
        var tempLijst = new List<Toestel>();
        foreach (var item in toestellenLijst)
        {
            if (!(item is IDodelijk))
            {
                tempLijst.Add(item);
            }
        }
        toestellenLijst = tempLijst;
    }
    private int BerekenMoeilijkheidsgraad()
    {
        int som = 0;
        foreach (var item in toestellenLijst)
        {
            som += item.BerekenMoeilijkheidsgraad();
        }
        return som;
    }
    public void ToonParkoers()
    {
        foreach (var item in toestellenLijst)
        {
            if (item is IDodelijk)
                Console.BackgroundColor = ConsoleColor.Red;
            else
                Console.BackgroundColor = ConsoleColor.Green;
            Console.ForegroundColor = ConsoleColor.Black;
            item.Teken();
            Console.ResetColor();
        }
        Console.WriteLine($"\nMoeilijkheidsgraad = {BerekenMoeilijkheidsgraad()}");
    }
}
```

Program.cs

```java
List<Parkoer> parkoersList = new List<Parkoer>();
Random r = new Random();
Console.WriteLine("5 Parkoers gemaakt. Met welke wil je verder?");
for (int i = 0; i < 5; i++)
{
    parkoersList.Add(new Parkoer(10, r.Next() / 2 == 0 ? true : false));
}
for (int i = 0; i < parkoersList.Count; i++)
{
    Console.WriteLine($"Parkoer {i + 1}");
    parkoersList[i].ToonParkoers();
    Console.WriteLine();
}
Console.WriteLine("Typ het nummer in van het parkoer waar je verder mee wenst te gaan:");
int parkoerKeuze = int.Parse(Console.ReadLine());
Console.WriteLine("Wil je in dit parkoer de dodelijke elementen verwijderen ? (j/n)");
string verwijderKeuze = Console.ReadLine();
if (verwijderKeuze.ToLower() == "j")
{
    parkoersList[parkoerKeuze - 1].VerwijderDodelijke();
    Console.WriteLine("Verwijderd. Dit is het nieuwe parkoers : ");
}
else
{
    Console.WriteLine("Oke. Dit is het parkoers : ");
    
}
parkoersList[parkoerKeuze - 1].ToonParkoers();
```