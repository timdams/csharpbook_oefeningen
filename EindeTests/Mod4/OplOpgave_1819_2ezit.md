> Dank aan Wael Orraby.

Klassen:
```java
enum Kleuren {Rood=1, Geel, Groen };
internal class Schilderij: IComparable
{
    public static Random r = new Random();
    protected int aantalRodeVlakken=0;


    protected Kleuren[,] vlakkenArray = new Kleuren[10, 10];
    public Schilderij(int x, int y)
    {
        vlakkenArray = new Kleuren[x, y];
        for (int i = 0; i < vlakkenArray.GetLength(0); i++)
        {
            for (int j = 0; j < vlakkenArray.GetLength(1); j++)
            {
                vlakkenArray[i, j] = (Kleuren)r.Next(1, 4);
                if (vlakkenArray[i, j] == Kleuren.Rood)
                    aantalRodeVlakken++;
            }
        }
    }
    public Schilderij(): this(10,10)
    {
        
    }
    public virtual void TekenSchilderij()
    {
        
        for (int i = 0; i < vlakkenArray.GetLength(0); i++)
        {
            for (int j = 0; j < vlakkenArray.GetLength(1); j++)
            {
                if (vlakkenArray[i, j] == Kleuren.Rood)
                {
                    Console.BackgroundColor = ConsoleColor.Red;     
                }
                else if (vlakkenArray[i, j] == Kleuren.Geel)
                {
                    Console.BackgroundColor = ConsoleColor.Yellow;
                }
                else
                {
                    Console.BackgroundColor = ConsoleColor.Green;
                }
                Console.Write(" ");
                Console.ResetColor();
            }
            Console.WriteLine();
        }
    }
    public int KrijgData()
    {
        return aantalRodeVlakken;
    }

    public int CompareTo(object? obj)
    {
        double thisWaarde = WaardeBepaler.BerekenWaarde(this.KrijgData());
        double thatWaarde = WaardeBepaler.BerekenWaarde((obj as Schilderij).KrijgData());
        return thatWaarde.CompareTo(thisWaarde);
    }
}

internal class Picasso : Schilderij
{
    public Picasso():base(15,15)
    {
        
    }   
}

internal class WaardeBepaler
{
    public static double BerekenWaarde(int​ aantalRodeVlakken)
    {
        return Math.Round(Math.Sqrt(1000 * aantalRodeVlakken), 1);
    }
}

internal class Koper
{
    private List<Schilderij> schilderijenList = null;
    public Koper()
    {
        Budget = 1500;
        schilderijenList = new List<Schilderij>();
    }
    private double budget;

    public double Budget
    {
        get { return budget; }
        private set { budget = value; }
    }


    public bool Koop(Schilderij schilderij)
    {
        double schilderijWaarde = WaardeBepaler.BerekenWaarde(schilderij.KrijgData());
        if (Budget >= schilderijWaarde)
        {
            Budget -= schilderijWaarde;
            schilderijenList.Add(schilderij);
            return true;
        }
        return false;
    }
    public int TotaleWinst()
    {
        int totaleWinst = 0;
        foreach (var item in schilderijenList)
        {
            totaleWinst += (int)WaardeBepaler.BerekenWaarde(item.KrijgData());
        }
        return totaleWinst;
    }
    public List<Schilderij> SorteerBezit()
    {
        schilderijenList.Sort();

        return schilderijenList;
    }
    public void KrijgSchilderij(Koper other)
    {
        if (other.schilderijenList.Count > 0)
        {
            this.schilderijenList.Add(other.schilderijenList[0]);
            other.schilderijenList.RemoveAt(0);
        }
    }
}
```

Program.cs


```java
static void Main(string[] args)
{

    Koper speler = new Koper();
    Koper computer = new Koper();
    bool kunnenOfWillenKopen = true;
    int PicassosKans;
    Random r = new Random();
    while (kunnenOfWillenKopen)
    {
        kunnenOfWillenKopen = true;
        Schilderij bieding = new Schilderij();
        PicassosKans = r.Next(1, 11);
        if (PicassosKans <= 3)
        {
            bieding = new Picasso();
        }

        bieding.TekenSchilderij();
        Console.WriteLine($"SchilderijWaarde : {WaardeBepaler.BerekenWaarde(bieding.KrijgData())}");
        Console.WriteLine("Wenst u die schilderij te kopen ? (j/n)");
        string koperAntw = Console.ReadLine().ToLower();
        if (koperAntw == "j")
        {
            if (speler.Koop(bieding))
                Console.WriteLine("Schilderij gekocht!");
            else
            {
                Console.WriteLine("Budget van speler is niet genoeg!");
                kunnenOfWillenKopen = false;
            }
        }
        else if (computer.Koop(bieding))
            Console.WriteLine("Schilderij verkocht!");
        else
        {
            Console.WriteLine("Budget van computer is niet genoeg!");
            kunnenOfWillenKopen = false;
        }
    }


    if (speler.TotaleWinst() + speler.Budget > computer.TotaleWinst() + computer.Budget)
        Console.WriteLine($"Je bent gewonnen!");
    else
        Console.WriteLine("De computer is gewonnen");
    Console.WriteLine("Uw schilderijen na het sorteren:\n");

    foreach (var item in speler.SorteerBezit())
    {
        item.TekenSchilderij();
        Console.WriteLine("");
    }
    speler.KrijgSchilderij(computer);
    Console.WriteLine("Uw schilderijen na het krijgen van een schilderij:\n");
    foreach (var item in speler.SorteerBezit())
    {
        item.TekenSchilderij();
        Console.WriteLine("");
    }
}
```