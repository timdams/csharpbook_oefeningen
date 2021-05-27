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

# Pokémons vergelijken

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

Minimale klassen

```java
class Kamer
{
    public int Oppervlakte { get; set; }
    public string Naam { get; set; }
    virtual public int Prijs { get; } = 400;
}

class BadKamer: Kamer
{
    public override int Prijs
    {
        get { return 500; }
    }
}

class Gang : Kamer
{
    public override int Prijs
    {
        get { return 10 * Oppervlakte; }
    }
}

class Salon : Kamer
{
    public bool HeeftSchouw { get; set; }
    public override int Prijs
    {
        get 
        {
            if (HeeftSchouw)
                return 500;
            return 300;
        }
    }
}

class Huis
{
    public List<Kamer> Kamers { get; set; } = new List<Kamer>();

    public int BerekenPrijs()
    {
        int prijs = 0;
        foreach (var kamer in Kamers)
        {
            prijs += kamer.Prijs;
        }
        return prijs;
    }
}
```