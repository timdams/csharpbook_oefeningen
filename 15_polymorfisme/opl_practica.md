# Dierentuin advanced

In main

```java
//dieren staan ergens in List<Dier> diertjes
//gebruiker gaf bij invoer f in als keuze:
if(userinput=="f")
{
    Console.WriteLine("Welk dier?")
    string dierkeuze=Console.ReadLine();

    switch(dierkeuze)
    {
        case "Slang":
            foreach(var dier in diertjes)
            {
                if(dier is Slang)
                {
                    (dier as Slang).Zegt();
                }
            }
            break;
        case "Varken":
            //idem met Varken 
    }
}
```

## Pro-pro oplossing

Voorgaande resulteert in aardig wat quasi identieke code in de switch. Je kan zelf een generieke methode maken (hebben we niet in leerstof gezien) als volgt (in hoofdprogramma):

```java
static void Zegt<T>(List<Dier>dieren) where T: Dier
{
    foreach(var dier in dieren)
    {
        (dier as T)?.Zegt();
    }
}
```

(de ``where`` is een zogenaamde constraint, uitgelegd [hier](17_gencols/2_genericclasses_en_constraints.md))

In de switch krijg je dan:

```java
case "Slang":
    Zegt<Slang>(dieren);
    break;
case "Varken":
    Zegt<Varken>(dieren);
    break;
    //...
```

# Pokémon vergelijken

In klasse ``Pokemon``:

```java
public override bool Equals(object obj)
{

    Pokemon tevgl = obj as Pokemon;

    if(Naam==tevgl.Naam && Level == tevgl.Level)
    {
        if (HP_Base == tevgl.HP_Base && Attack_Base == tevgl.Attack_Base && ... )
            return true;
    }

    return false;
}
```

# Een eigen huis


## Main:

```java
Huis myHuis = new Huis();
myHuis.Kamers.Add(new Salon() { HeeftSchouw = true });
myHuis.Kamers.Add(new Gang() {Oppervlakte=20 });
myHuis.Kamers.Add(new BadKamer());
myHuis.Kamers.Add(new Kamer());

Console.WriteLine(myHuis.BerekenPrijs());
```

## Klassen

```java
public class Huis
{
    public List<Kamer> Kamers { get; set; } = new List<Kamer>();
    public int BerekenPrijs()
    {
        int totaal = 0;
        foreach (var kamer in Kamers)
        {
            totaal += kamer.Prijs;

        }
        return totaal;
    }
}

public class Kamer
{
    public int Oppervlakte { get; set; }
    public string Naam { get; set; }
    public virtual int Prijs {get {return 400;}}

}

public class BadKamer : Kamer
{
    public override int Prijs {get {return 500;}} 
}

public class Salon : Kamer
{
    public bool HeeftSchouw { get; set; }
    public override int Prijs
    {
        get
        {
            if (HeeftSchouw) return 300;
            return 500;
        }
    }
}
public class Gang : Kamer
{
    public override int Prijs 
    {
        get
        {
            return Oppervlakte * 10;
        }    
    } 
    
}
```
