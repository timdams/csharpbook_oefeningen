# UML naar code

{% hint style='tip' %}
**Les(sen) uit deze oefening:** Een mens wordt geboren met handen, voeten en benen (technisch gezien moesten we 2 compositiet-objecten van type ``Hand`` en``Leg`` maken) daarom maken we de instanties aan in de constructor. Eventueel had je dit ook rechtstreeks in de klasse bij de instantievariabele kunnen doen (``private Head theHead = new Head();``).
{% endhint %}

```csharp
public class Head {}
public class Hand {}
public class Leg{}

public class Person
{
    public Person()
    {
       theHead =new Head(); 
       leftHand = new Hand();
       leftLeg = new Leg();
    }

    private Head theHead ;
    private Hand leftHand ;
    private Leg leftLeg;
}
```

{% hint style='tip' %}
**Les(sen) uit deze oefening:** Associaties zijn niet beperkt tot enkelvoudige objecten, vaak ga je ook arrays of lijsten nodig hebben om deze voor te stellen. 
{% endhint %}

```csharp
public class Wheel{}
public class Crankshaft{}
public class Piston{}

public class Engine
{
    private Crankshaft theCrank=new Crankshaft();
    private List<Piston> pistons = new List<Piston>(); //todo: piston objecten inplaatsen, zie voorbeeld Car-constructor
}

public class Car
{
    public Car() 
    {
        for(int i=0;i<4;i++)
            wheels.Add(new Wheel());
    }

    private List<Wheel> wheels=new List<Wheel>();

    private Engine mainEngine = new Engine();
}

public class Propeller
{

}

public class Boat 
{
    private Engine mainEngine = new Engine();
    private  List<Propeller> propellers = new List<Propeller>(); //todo: propeller objecten inplaatsen, zie voorbeeld Car-constructor
}
```

# Politiek

{% hint style='tip' %}
**Les(sen) uit deze oefening:** Dit was al een iets complexere oefening. De kracht van compositie is zichtbaar in de klasse ``Land`` waar we via de ``MaakRegering`` informatie binnenkrijgen om toe te wijzen aan de aggregaatobjecten (``President``, ``EersteMinister`` en ``Ministers``).  Kijk zeker goed hoe we de meegegeven lijst van ministers in ``MaakRegering`` toewijzen (m.b.v. een loop die de eerste minister overslaat)
{% endhint %}

```csharp
static void Main(string[] args)
{
    President ikke = new President() { Naam = "Tim" };
    List<Minister> mins = new List<Minister>();
    mins.Add(new Minister() { Naam="Bruno"});
    mins.Add(new Minister() { Naam = "Freya" });
    mins.Add(new Minister() { Naam = "Peter" });
    mins.Add(new Minister() { Naam = "Ann" });

    Land mijnLand = new Land();
    mijnLand.MaakRegering(ikke, mins);
    mijnLand.MaakRegering(ikke, mins); //Moet error geven
    for (int i = 0; i < 4; i++)
    {
        Console.WriteLine("Weer een jaar verder");
        mijnLand.JaarVerder();
    }
}
```

```csharp
public class Land
{
    private President President;
    private Minister EersteMinister;
    private List<Minister> Ministers = new List<Minister>(4);

    public void MaakRegering(President presin, List<Minister> minin)
    {
        if(President==null)
        {
            President = presin;
            EersteMinister = minin[0];
            if(minin.Count>=2)
            {
                for (int i = 1  ; i < minin.Count; i++)
                {
                    Ministers.Add(minin[i]);
                }
            }
        }
        else
        {
            Console.WriteLine("Gaat niet. Dit land heeft al een regering");
        }
    }

    public void JaarVerder()
    {
        if (President != null)
        {
            President.JaarVerder();
            if(President.Teller<=0)
            {
                Console.WriteLine("Regering is gedaan");
                President = null;
                EersteMinister = null;
                Ministers.Clear();
            }
        }
    }

}

public class Minister
{
    public string Naam { get; set; }
}

public class President: Minister
{
    public int Teller { get; private set; } = 4;
    public void JaarVerder()
    {
        Teller--;
    }
}
```

Met de uitbreiding:

```csharp
public class VerkiezingsUitslag
{
    static Random rng = new Random();


    public VerkiezingsUitslag()
    {
        VerkozenPresident = new President() { Naam = NaamGen() };
        VerkozenMinisters = new List<Minister>();

        for (int i = 0; i < 5; i++)
        {
            VerkozenMinisters.Add(new Minister() { Naam = NaamGen() });
        }
    }

    private President verkozenPresident = null;

    public President VerkozenPresident
    {
        get { return verkozenPresident ; }
        set { verkozenPresident = value; }
    }

    private List<Minister> verkozenMinisters ;

    public List<Minister> VerkozenMinisters
    {
        get { return verkozenMinisters ; }
        set { verkozenMinisters  = value; }
    }

    private string NaamGen()
    {
        string naam = "";
        for (int i = 0; i < rng.Next(5,10); i++)
        {
            naam += (char)rng.Next('a', 'z');
        }
        return naam;
    }
}
```

Start van Main kan dan korter:

```csharp
VerkiezingsUitslag uitslag2022 = new VerkiezingsUitslag();

Land mijnLand = new Land();
mijnLand.MaakRegering(uitslag2022.VerkozenPresident, uitslag2022.VerkozenMinisters);
```

# Moederbord

{% hint style='tip' %}
**Les(sen) uit deze oefening:** Deze kleine oefening is heel goed om aggregatie voor te stellen (een computer met onderdelen), waarbij ieder aggregaat-object een totaal andere interne structuur heeft. 
{% endhint %}

De output van onderstaande code zal zijn:


```text
Je hebt nog geen agp kaart
Je hebt nog 2 vrij ramsloten
Er zijn geen andere componenten aanwezig
```

```csharp
Moederbord Z390E_GAMING = new Moederbord(3);
Z390E_GAMING.CPUSlot = new CPU("IntelCorei9_9900K",4);
Z390E_GAMING.Ramslots.Add(new RamMemory("Corsair", 8));
Z390E_GAMING.TestMoederbord();
```

```csharp
public class Moederbord
{
    public Moederbord(int aantalRamsloten)
    {
        Ramslots = new List<RamMemory>(aantalRamsloten);
    }
    public AGPKaart AGPSlot { get; set; } = null;
    public CPU CPUSlot { get; set; } = null;
    public List<PCComponent> AndereComponenten { get; set; } = new List<PCComponent>();

    public List<RamMemory> Ramslots { get; set; }

    public void TestMoederbord()
    {
        if(AGPSlot==null)
            Console.WriteLine("Je hebt nog geen agp kaart");
        if(CPUSlot==null)
            Console.WriteLine("Je hebt nog geen cpu");
        if(Ramslots.Capacity!= Ramslots.Count)
        {
            Console.WriteLine($"Je hebt nog {Ramslots.Capacity-Ramslots.Count} vrij ramsloten");
        }
        if(AndereComponenten.Count==0)
            Console.WriteLine("Er zijn geen andere componenten aanwezig");
    }

}

public class PCComponent
{
    public string Merk { get; set; }
    public PCComponent(string merk) { Merk = merk; }
}

public class RamMemory : PCComponent
{
    public int GeheugenGrootte { get; set; }
    public RamMemory(string merk, int aantalGB) : base(merk)
    {
        GeheugenGrootte = aantalGB;
    }
}

public class AGPKaart : PCComponent
{
    public AGPKaart(string merk) : base(merk)
    { }
}

public class CPU : PCComponent
{
    public int KlokSnelheidInGhz { get; set; }
    public CPU(string merk, int snelheid) : base(merk)
    {
        KlokSnelheidInGhz = snelheid;
    }
}

```
