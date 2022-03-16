# Meetlat


```java
public class Meetlat
{
    public Meetlat(int lengtestart)
    {
        lengteInM=lengtestart;
    }

    private double lengte;
    public double BeginLengte
    {
        set { lengte=value; }
    }

    private double lengteInM;

    public double LengteInCm
    {
        get{ return lengte*100;}
    }

    public double LengteInKm
    {
        get{ return lengte/1000;}
    }

    public double LengteInVoet
    {
        get{ return lengte*3.2808;}
    }
}
```

# Digitale kluis

```java
public class DigitaleKluis
{
    private int code = 0x0000;

    public DigitaleKluis(int startcode)
    {
        Code = startcode;
    }

    public bool CanShowCode { get; set; }


    public int CodeLevel
    {
        get
        {
            return (code / 1000);
        }
    }

    public int Code
    {
        get
        {
            if (CanShowCode)
                return code;
            else
                return -666;
        }

        private set
        {
            code = value;
        }
    }

    private int aantalPogingen;
    public bool TryCode(int testcode)
    {
        if (aantalPogingen < 10)
        {
            aantalPogingen++;
            if (testcode == -666)
            {
                Console.WriteLine("CHEATER");
                return false;
            }
            else if (testcode == code)
            {
                Console.WriteLine($"Deze code is geldig. Aantalpogingen = {aantalPogingen}");
                return true;
            }
            Console.WriteLine("Dat is geen geldige code");
            
        }
        else
            Console.WriteLine("Je hebt je 10 pogingen opgebruikt.Sorry.");
        return false;
    }
}
```

# Bibliotheek deel 2

```java
public class BibBoek
{
    private static int uitleenDagen = 14;
	public static void VeranderAlgemeneUitleenTermijn(int nieuweDagen)
	{
		uitleenDagen = nieuweDagen;
	}
	public BibBoek()
	{
		Uitgeleend = DateTime.Now.AddDays(-1);
	}
	
	public BibBoek(string inOntlener, DateTime inUitleen)
	{
		Ontlener= inOntlener;
		if(inUitleen>DateTime.Now)
			throw new Exception("Kan niet uitlenen in de toekomst");
		else
			Uitgeleend= inUitleen;
	}
	

    public string Ontlener { get; set; } = "onbekend";
    private DateTime uitgeleend = DateTime.Now;
    public DateTime Uitgeleend
    {
        set
        {
            uitgeleend = value;
        }
        private get 
        {
            return uitgeleend;
        }
    }
    public DateTime InleverDatum
    {
        get
        {
            return uitgeleend.AddDays(uitleenDagen);
        }
    }

    public void VerlengTermijn(int aantalDagen)
    {
        Uitgeleend = uitgeleend.AddDays(aantalDagen);
    }
}
```

# Pokemon met deel 2

We laten de reeds bestaande properties en methoden niet meer zien in deze oplossing:
```java

public class Pokemon
{
    //reeds bestaande properties en methoden
    // ...
    
    
    //En nu de nieuwe zaken:
    public void VerhoogLevel()
    {
        if(NoLevelingAllowed)
        {
            Console.WriteLine("Levelingo of Pokemons not allowed. Change NoLevelingAllowed to false to reenable leveling");
        }
        else
        {
            TimesLeveled++;
            Level++;
        }
    }
    //Nieuw deel

    //Default constructor
    public Pokemon()
    {
        HP_Base=10;
        Attack_Base=10;
        Defense_Base=10;
        SpecialAttack_Base = 10;
        SpecialDefense_Base = 10;
        Speed_Base=10;
  
    }
    //Overloaded constructor
    public Pokemon(int hp, int att, int def, int spec_att, int spec_def, int speed)
    {
        HP_Base=hp;
        Attack_Base=att;
        Defense_Base=def;
        SpecialAttack_Base = spec_att;
        SpecialDefense_Base = spec_def;
        Speed_Base=speed;  
    }

    //static deel
    public static int TimesLeveled{get; private set;}  
    public static int TimesBattled{get; private set;}
    public static int TimesBattleDraw{get; private set;}
    public static int TimesRandomGenerated{get; private set;}
    public static bool NoLevelingAllowed{get; private set;}

    public static void Info()
    {
        Console.WriteLine($"Aantal keer geleveled:{TimesLeveled}");
        Console.WriteLine($"Aantal keer gevochten:{TimesBattled}");
        Console.WriteLine($"Waarvan {TimesBattleDraw} keren gelijke stand");
        Console.WriteLine($"Er werden {TimesRandomGenerated} random pokemons aangemaakt"); 
    }

    private static Random ran=new Random();
    public static Pokemon GeneratorPokemon ()
    {
        TimesRandomGenerated++;
        Pokemon temp= new Pokemon();
        temp.HP_base= ran.Next(1,100);
        temp.Attack_base=ran.Next(1,100);
        return temp;
    }
    public static int Battle(Pokemon poke1, Pokemon poke2)
    { 
        TimesBattled++;
        if(poke1 ==null && poke2 == null)
            return 0;
        if(poke1==null)
            return 2;
        if(poke2==null)
            return 1;

        if(poke1.Average > poke2.Average)
            return 1;
        else if (poke2.Average< poke2.Average)
            return 2;

        TimesBattleDraw++;
        return 0;
    }
}
```

# Pokemon Natures

```java
enum PokeNatures {Adamant	,Bashful	,Bold ,Brave ,Calm ,Careful	,Docile ,Gentle ,Hardy ,Hasty ,Impish ,Jolly ,Lax ,Lonely ,Mild ,Modest ,Naive ,Naughty	,Quiet ,Quirky ,Rash ,Relaxed	,Sassy ,Serious	,Timid }

enum StatTypes {Attack, Special_Attack, Defense, Special_Defense, Speed}

```

In klasse Pokemon

```java
static Random rng = new Random();

private PokeNatures Nature {private set; get; }

public Pokemon(int hp, int att, int def, int spec_att, int spec_def, int speed)
{
    //...
    Nature = (PokeNatures)rng.Next(0,26)
}


private int NatureEffect(StatType currentStat)
{

    switch(Nature)
    {
        case PokeNatures.Adamant:
            if(currentStat == StatType.Attack)
                return 10;
            else if(currentStat == StatType.Special_Attack)
                return -10;
            else return 0;
            break;
        case PokeNatures.BashFull:
            //etc.
    }
    return 0;
}


public int Speed_Full
{
    get
    {
        return ((Speed_Base * Level) / 50) + 5 ) +  (((Speed_Base * Level) / 50) + 5 ) * NatureEffect(StatTypes.Speed);
    }
}

//en idem voor andere full stats

```

# Sport simulator

```java
public class Waterpolospeler
{
    private string spelersNaam;

    public string SpelersNaam
    {
        get { return spelersNaam; }
        private set { spelersNaam = value; }
    }

    private int mutsNummer;

    public int MutsNummer
    {
        get { return mutsNummer; }
        private set
        {
            if (value > 0 && value < 14) //checken dat de waarde van de muts tussen de 0 en 14 is
            {
                mutsNummer = value; //als het zo is dan zal de waarde aan de muts worden gegeven
            }
        }
    }

    private bool isDoelman;

    public bool IsDoelman
    {
        get { return isDoelman; }
        private set { isDoelman = value; }
    }
    private bool isReserve;

    public bool IsReserve
    {
        get { return isReserve; }
        private set { isReserve = value; }
    }

    private string reeks;

    public string Reeks
    {
        get { return reeks; }
        private set { reeks = value; }
    }
    public void Stelin(string naamin, int nummerin, bool doelin, bool reservein, string reeksin)
    {
        SpelersNaam = naamin;
        MutsNummer = nummerin;
        IsDoelman = doelin;
        IsReserve = reservein;
        Reeks = reeksin;
    }
    public void Gooibal()
    {
        Console.WriteLine($"Ik ({this.SpelersNaam}) gooi de bal");
    }

    public void Watertrappen()
    {
        Console.WriteLine($"nummer {this.MutsNummer} is aan het watertrappelen");
    }
    public void Tooninfo()
    {
        Console.WriteLine($@"
Naam: {SpelersNaam}
Mutsnummer: {MutsNummer}
Is doelman: {IsDoelman}
Is reserve: {IsReserve}
Reeks: {Reeks}

");


    }

    public static void SimuleerSpeler(Waterpolospeler testspeler)
    {
        for (int i = 0; i < 3; i++)
        {
            testspeler.Watertrappen();
        }
        for (int i = 0; i < 3; i++)
        {
            testspeler.Gooibal();
        }
    }

    public static void SimuleerWedstrijd(Waterpolospeler speler1, Waterpolospeler speler2)
    {
        Random rgen = new Random();
        if (rgen.Next(0, 10) < 5)
        {
            Console.WriteLine($"de winnaar is: {speler1.SpelersNaam}");
        }
        else
        {
            Console.WriteLine($"de winnaar is: {speler2.SpelersNaam}");
        }
    }
    public static Waterpolospeler BesteSpeler(Waterpolospeler speler1, Waterpolospeler speler2)
    {
        Random rgen = new Random();
        if (rgen.Next(0, 10) < 5)
        {
            return speler1;
        }
        else
        {
            return speler2;
        }
    }
}
```
