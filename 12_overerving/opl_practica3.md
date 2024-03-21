# Dierenrijk

```csharp
var alleBeestjes = new List<Animal>();
alleBeestjes.Add(new Animal() {NaamBeest="Dodo", IsUitgestorven=true });
alleBeestjes.Add(new Cow() {NaamBeest="Milkakoe", KleurVlekken="Paars" } );
alleBeestjes.Add(new Snake() { NaamBeest = "Cobra", HeeftRattelstaart = false });
alleBeestjes.Add(new Snake() { NaamBeest = "Ratelslang", HeeftRattelstaart = true });

foreach (var beest in alleBeestjes)
{
    beest.ToonInfo();
}
```

```csharp
public class Animal
{
    public string NaamBeest { get; set; }
    public bool IsUitgestorven { get; set; }
    public virtual void ToonInfo()
    {
        Console.WriteLine($"****{NaamBeest}****");
        if (IsUitgestorven)
            Console.WriteLine("Dit dier is uitgestorven");
        else Console.WriteLine("Dit dier is niet uitgestorven");
    }
}

public class Mammal : Animal 
{
    public string Biotoop { get; set; }
    public override void ToonInfo()
    {
        base.ToonInfo();
        Console.WriteLine($"En heeft als biotoop:{Biotoop}");
    }
}

public class Rabbit : Mammal {
    public int LengteOren { get; set; }
    public override void ToonInfo()
    {
        base.ToonInfo();
        Console.WriteLine($"De lengte van dit konijn z'n oren is {LengteOren}");
    }
}
public class Cow : Mammal {
    public string   KleurVlekken { get; set; }
    public override void ToonInfo()
    {
        base.ToonInfo();
        Console.WriteLine($"Deze koe heeft {KleurVlekken} vlekken");
    }
}
public class Dog : Mammal { }
public class Reptile : Animal { }
public class Snake : Reptile 
{
    public bool HeeftRattelstaart { get; set; }
    public override void ToonInfo()
    {
        base.ToonInfo();
        if(HeeftRattelstaart)
            Console.WriteLine("Deze slang heeft een ratelstaart");
        else Console.WriteLine("Deze slang heeft geen ratelstraat");
    }
}
public class Iguana : Reptile { }
```

# HiddenBookmark

Zorg ervoor dat je ``ToonSite`` in de parentklasse ``Bookmark`` op ``virtual`` instelt.

```csharp
public class HiddenBookMark: BookMark
{
    public override void ToonSite()
    {
        Console.WriteLine("**********INCOGNITO MODE************");
        base.ToonSite();
        Console.WriteLine("**********INCOGNITO MODE************");
    }
}
```

# Ziekenhuis

## Deel 1

```csharp
public class Patient
{
    public string Naam { get; set; }
    public int UrenInZiekenhuis { get; set; }

    private const int basisKost= 50;
    private const int kostPerUur = 20;
    public virtual double BerekenKost()
    {
        int kost = basisKost + (UrenInZiekenhuis * kostPerUur);
        return kost;
    }

    public void ToonInfo()
    {
        Console.WriteLine($"{Naam} (Kost:{BerekenKost()})");
    }
}
```

## Deel 2

```csharp
public class VerzekerdePatient : Patient
{
    private const double korting = 0.1;
    public override double BerekenKost()
    {
        double totaalBasisKost = base.BerekenKost();
        return totaalBasisKost - (totaalBasisKost * korting);
    }
}
```

Aantonen werking:

Eenvoudig:

```csharp
Patient JosFromUSA = new Patient() 
    { Naam = "American Jos", UrenInZiekenhuis = 10 };
VerzekerdePatient JosFromBelgium = new VerzekerdePatient() 
    { Naam = "Belgische Jos", UrenInZiekenhuis = 10 };
JosFromUSA.ToonInfo();
JosFromBelgium.ToonInfo();
```

Complexer:

```csharp
List<Patient> allePatienten = new List<Patient>()
{
    new Patient() { Naam = "American Jos", UrenInZiekenhuis = 10 },
    new VerzekerdePatient() { Naam = "Belgische Jos", UrenInZiekenhuis = 10 },

};

foreach (var patient in allePatienten)
{
    patient.ToonInfo();
}
```

