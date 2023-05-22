> Dank aan Wael Orraby.


Klassen:
```java
public abstract class Reisbestemming : IComparable
{
    public static Random R = new Random();

    public Reisbestemming()
    {
        afstandVanAarde = R.Next(400, 10001);
    }
    private int afstandVanAarde;
    public int AfstandVanAarde
    {
        get { return afstandVanAarde; }
    }

    public int CompareTo(object? obj)
    {
        int result = 0;
        Reisbestemming temp = obj as Reisbestemming;
        if (temp != null)
        {
            if (afstandVanAarde > temp.afstandVanAarde)
                result= 1;
            if (afstandVanAarde < temp.afstandVanAarde)
                result= - 1;
        }
        else
            throw new ArgumentException("Object is not a Reisbestemming");
        return result;
    }
    public override string ToString()
    {
        return $"{this.GetType().Name}:{afstandVanAarde}" ;
    }
}

internal class Planeet : Reisbestemming
{
}

internal class RijkePlaneet : Planeet​, IEnergieGever
{
    public long GeefEnergie()
    {
        return Convert.ToInt64(this.AfstandVanAarde * 0.1);
    }
}


    internal class TankTussenstation : Reisbestemming, IEnergieGever
{
    public long GeefEnergie()
    {
        return Convert.ToInt64(R.Next(500, 1501));
    }
}

internal class Ruimteschip 
{
    private int afstandVanAarde = 0;

    public long Energie { get; private set; } = 300;
    public override string ToString()
    {
        return $"Je hebt {Energie} energie en bent {afstandVanAarde} units verwijderd van de aarde.";
    }

    public bool StartReis(Reisbestemming r)
    {
        bool result = false;
        int verschil = r.AfstandVanAarde - afstandVanAarde;
        if (Energie >= verschil)
        {
            Energie -= verschil;
            Console.WriteLine($"Bestemming bereikt. Nog {Energie} energie over. Laten we proberen bij te tanken.");
            afstandVanAarde += r.AfstandVanAarde;
            EnergieBijtanken(r);
            result = true;
        }
        else
            Console.WriteLine("Dit schip heeft niet genoeg energie daarvoor.");
        return result;
    }
    public void EnergieBijtanken(Reisbestemming r)
    {
        if(r is IEnergieGever energieGever)
        {
            Energie += energieGever.GeefEnergie();
            Console.WriteLine($"Hier werd bijgetankt. Je kreeg {energieGever.GeefEnergie()} energie en staat nu op {Energie} energie.");
        }
        else
            Console.WriteLine("Hier kan niet bijgetankt worden");
    }
}

internal class Wereld
{
    static Random r = new Random();
    public static List<Reisbestemming> GenereerWereld(int aantal)
    {
        List<Reisbestemming> ReisbestemmingList = new List<Reisbestemming>();
        for (int i = 0; i < aantal; i++)
        {
            int kans = r.Next(1,5);
            if (kans == 1)
                ReisbestemmingList.Add(new Planeet());
            else if (kans == 2)
                ReisbestemmingList.Add(new RijkePlaneet());
            else
                ReisbestemmingList.Add(new TankTussenstation());
        }
        ReisbestemmingList.Sort();
        return ReisbestemmingList;
    } 
}

```

Program.cs:

```java
var world = Wereld.GenereerWereld(10);
Console.WriteLine("Dit is je reisplan:");
foreach (var item in world)
{
    Console.WriteLine(item);
}
Console.WriteLine();
Ruimteschip r = new Ruimteschip();
Console.WriteLine("Dit is je schip:");
Console.WriteLine(r);
Console.WriteLine();

int teller = 0;
bool kanVerder = true;
Console.WriteLine("De reis gaat van start:");
Console.WriteLine();
while (r.Energie > 0 && teller < world.Count​ && kanVerder)
{
    Console.WriteLine($"We proberen te reizen naar bestemming {teller + 1}");
    kanVerder = r.StartReis(world[teller]);
    teller++;
    Console.WriteLine();
}
Console.WriteLine(r);

```