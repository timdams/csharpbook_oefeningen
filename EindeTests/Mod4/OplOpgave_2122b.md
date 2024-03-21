> Dank aan Wael Orraby.


Klassen:
```csharp
internal class Vak: IComparable​
{
    public Vak()
    {
        vakLector = new Lector() { Naam = "Nog Toe te wijzen" };

    }
    public string Titel { get; set; } = "Onbekend";
    private Lector vakLector;

    public Lector VakLector
    {
        get { return vakLector; }
        set { vakLector = value; }
    }

    protected int duur;

    public virtual int Duur
    {
        get { return duur; }
        set
        {
            if (value > 0 && value < 3)
                duur = value;
        }
    }
    public override string ToString()
    {
        return $"{this.Titel} - {this.VakLector.Naam}";
    }

    public int CompareTo(object? obj)
    {
        Vak temp = obj as Vak;
        if(temp != null)
        {
            int stringC = this.Titel.CompareTo(temp.Titel);
            if (stringC == 0)
            {
                return this.Duur.CompareTo(temp.Duur);
            }
            else return stringC;

        }
        return 0;
    }
}

internal class LaboVak : Vak
{
    public LaboVak(Vak v)
    {
        this.Duur = v.Duur;
        this.VakLector = v.VakLector;
        this.Titel = v.Titel;
    }
    public override int Duur {
        get { return base.Duur; }
        set 
        { 
            if (value > 0 && value < 4) 
                this.duur = value; 
        } 
    }
    public override string ToString()
    {
        return "(labo) "+ base.ToString();
    }
}

internal class Lector
{
    public string Naam { get; set; } = "Nog toe te wijzen";

    public virtual int MaxUur
    {
        get { return 6; }
    }
}

internal class HalfTijdseLector : Lector
{
    public override int MaxUur
    {
        get 
        { 
            return base.MaxUur / 2; 
        }
    }
}

internal class RoosterException : Exception
{
    public RoosterException(string message) : base(message)
    {
    }
}

internal class Rooster
{
    private List<Vak> vakkenLijst = new List<Vak>();
    private int vrijeUren;

    public int VrijeUren
    {
        get
        {
            int result = 0;
            foreach (var item in vakkenLijst)
            {
                result += item.Duur;
            }
            return result;
        }
    }
    public void ToonRooster()
    {
        foreach (var item in vakkenLijst)
        {
            for (int i = 0; i < item.Duur; i++)
            {
                Console.WriteLine(item);
            }
        }
    }
    public void VoegVakToe(Vak niewVak)
    {
        if ((VrijeUren + niewVak.Duur) <= 8)
        {
            vakkenLijst.Add(niewVak);
        }
        else
            throw new RoosterException($"Kan niet togevoegd worden, omdat de rooster mag max 8 uur bevatten en de huidige duur in de rooster is {VrijeUren}");
    }
    public void VerbeterRooster()
    {
        vakkenLijst.Sort();
    }
    public void WijsLectorToe(int index, Lector l)
    {
        if (index >= 0 && index < vakkenLijst.Count)
            vakkenLijst[index].VakLector = l;
        else
            Console.WriteLine("Index id out of Range of the list!");
    }

    internal void ToonLabos()
    {
        foreach (var item in vakkenLijst)
        {
            if (item is LaboVak)
            {
                for (int i = 0; i < item.Duur; i++)
                {
                    Console.WriteLine(item);
                }
            }
        }
    }
}

internal class WeekRooster
{
    static Random r = new Random();

    List<Vak>[] weekLijsten = new List<Vak>[]{new List<Vak>(),new List<Vak>(),new List<Vak>(),new List<Vak>(),new List<Vak>()};

    public WeekRooster()
    {
        for (int j = 0; j < 5; j++)
        {
            for (int i = 0; i < 4; i++)
            {
                if (r.Next(1, 6) == 1)
                {
                    weekLijsten[j].Add(new LaboVak(new Vak()));        
                }
                else
                {
                    weekLijsten[j].Add(new Vak());
                }
            }
        }

    }
    public void ToonRooster()
    {
        for (int i = 0; i < weekLijsten.Length; i++)
        {
            if(i==0)
                Console.WriteLine("Maandag : ");
            else if (i == 1)
                Console.WriteLine("Dinsdag : ");
            else if (i == 2)
                Console.WriteLine("Woensdag : ");
            else if (i == 3)
                Console.WriteLine("Donderdag : ");
            else
                Console.WriteLine("Vrijdag : ");
            foreach (var item in weekLijsten[i])
            {
                Console.WriteLine(item);
            }
            Console.WriteLine();
        }
        
    }
}

```

Program.cs
```csharp
List<Lector> lectorsList = new List<Lector>(3);
Rooster r = new Rooster()​;
lectorsList.Add(new Lector { Naam = "Dams" });
lectorsList.Add(new Lector { Naam = "Van Eyken" });
lectorsList.Add(new HalfTijdseLector { Naam = "segers" });
int antwoord = 0;
while (antwoord != 666)
{


    Console.WriteLine("Kies een nummer uit dit menu : ");
    Console.WriteLine("1- Toon rooster.");
    Console.WriteLine("2- Voeg vak toe.");
    Console.WriteLine("3- Verbeter rooster.");
    Console.WriteLine("4- Toon labo's.");
    Console.WriteLine("5- Toon weekrooster.");
    Console.WriteLine("666- Stoppen");
    antwoord = int.Parse(Console.ReadLine());

    if (antwoord == 1)
        r.ToonRooster();

    if (antwoord == 2)
    {
        Console.WriteLine("Vaknaam : ");
        string vaknaam = Console.ReadLine();
        Console.WriteLine("Duur : ");
        int duur = int.Parse(Console.ReadLine());
        Console.WriteLine("Kies een nummer van de lector : ");
        Console.WriteLine("0 : Dams");
        Console.WriteLine("1 : Van Eyken");
        Console.WriteLine("2 : Horsman");
        int lector = int.Parse(Console.ReadLine());
        Vak v = new Vak() { Titel = vaknaam, Duur = duur , VakLector = lectorsList[lector]};
        if (duur == 3)
        {
            LaboVak lv = new LaboVak(v);
            lv.Duur = duur;
            r.VoegVakToe(lv);
        }
        else
            r.VoegVakToe(v);
    }
    if (antwoord == 3)
        r.VerbeterRooster();
    if (antwoord == 4)
    {
        r.ToonLabos();
    }
    if (antwoord == 5)
    {
        WeekRooster wr = new WeekRooster();
        wr.ToonRooster();
    }
}
```