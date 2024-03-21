Deel 1 en 2

```csharp

abstract class Doos
{
    public Doos(int id)
    {
        ID = id;
    }
    public int ID { get; private set; }
    public int Gewicht { get; set; }
    public string Inhoud { get; set; }

    public virtual int KostPrijs
    {
        get { return Gewicht * 10; }
    }
}

class Container : Doos
{
    public Container(int id) : base(id)
    {
    }

    public override int KostPrijs => base.KostPrijs + 5;
}

class SecureContainer : Container, ISafe
{
    public SecureContainer(int id) : base(id)
    {
    }
    private int leesAttempts = 0;
    public override int KostPrijs
    {
        get
        {
            leesAttempts++;
            if (isVerzegeld) return 0;
            return base.KostPrijs;
        }
    }
    private bool isVerzegeld = false;
    public int GeefLeesAttempts()
    {
        return leesAttempts;
    }

    public void VerzegelInhoud()
    {
        isVerzegeld = true;
    }
}

class PostDoos : Doos
{
    public PostDoos(int id) : base(id)
    {
    }
    public override int KostPrijs => 10;
}

interface ISafe
{
    void VerzegelInhoud();
    int GeefLeesAttempts();
}

class DHLSchip
{
    private List<Doos> vrachtRuim = new List<Doos>();

    public 
    {
        get
        {
            return vrachtRuim;
        }
        private set
        {
            vrachtRuim = value;
        }

    }
    public bool VoegDoosToe(Doos toAdd)
    {
        //Bereken gewicht
        int gewicht = BerekenGewicht();
        if (gewicht + toAdd.Gewicht > 10)
            throw new Exception("Te zwaar. Doos niet toegevoegd");
        else
            vrachtRuim.Add(toAdd);

        return true;
    }

    private int BerekenGewicht()
    {
        int gewicht = 0;
        foreach (var doos in vrachtRuim)
        {
            gewicht += doos.Gewicht;
        }

        return gewicht;
    }

    public string Naam { get; set; }
    public void ToonManifest()
    {
        Console.WriteLine(this.Naam);
        foreach (var doos in vrachtRuim)
        {
            Console.Write($"\n- {doos.Inhoud}\t{doos.Gewicht}\t{doos.KostPrijs}");
            if(doos is ISafe)
            {
                var temp = doos as ISafe;
                Console.Write($"#####{temp.GeefLeesAttempts()}");
            }
        }

        Console.WriteLine($"$TOTAAL GEWICHT\t\t{BerekenGewicht()}");
        Console.WriteLine($"$TOTAAL PRIJS\t\t{BerekenPrijs()}");
    }
    private int BerekenPrijs()
    {
        int prijs = 0;
        foreach (var doos in vrachtRuim)
        {
            prijs += doos.KostPrijs;
            if (doos is ISafe) prijs += 10;
        }
        return prijs;
    }
}
```

## Extra 1 (mooiere output):

In Doos:

```csharp
public override string ToString()
{
    return $"{GetType.Name} , Gewicht: {Gewicht} , Prijs: {Prijs}, {Inhoud}"
}
```

In SecureContainer:

```csharp
public override string ToString()
{
    string verz="nee";
    if(isVerzegeld)
        verzegeld="ja";
    return base.ToString()+ $" , Verzegeld={verzegeld}"; 
}
```

## Extra 2:
```csharp
static void Vergrendel(DHLSchip schip)
{
    foreach(var container in schip.VrachtRuim)
    {
        if(container is ISafe)
        {
            (container as ISafe).VerzegelInhoud();
        }
    }
}
```

## Extra 3

Voeg best volgende methoden toe aan DHlSchip en werk uit m.b.v. relevante List-methoden in vrachtRuim:

```csharp
public void VerwijderContainer(int index){ vrachtRuim.RemoveAt(index);}
public void VerplaatsContainer(int index, int nieuweIndex){...}
public void VervangContainer(int index, Container vervanging){...}
public void DupliceerContainer(int index){...}
```

Voeg vervolgens relevante vragen in menu toe en geef info door.