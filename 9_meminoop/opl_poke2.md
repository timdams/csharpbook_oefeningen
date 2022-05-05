# Meetlat

```java
public class Meetlat
{
    private double lengte;
    public double BeginLengte
    {
        set { lengte=value; }
    }

    public double LengteInM
    {
        get{ return lengte;}
    }

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

# Pokémon deel 1

```java
class Pokemon
{


    private int hp_base;
    public int HP_Base
    {
        get { return hp_base; }
        set { hp_base = value; }
    }

    private int attack_base;
    public int Attack_Base
    {
        get { return attack_base; }
        set { attack_base = value; }
    }

    private int defense_base;
    public int Defense_Base
    {
        get { return defense_base; }
        set { defense_base = value; }
    }

    private int speed_base;
    public int Speed_Base
    {
        get { return speed_base;  }
        set { speed_base = value; }
    }

    private int specialattack_base;
    public int SpecialAttack_Base
    {
        get { return specialattack_base; }
        set { specialattack_base = value; }
    }

    private int specialdefense_base;
    public int SpecialDefense_Base
    {
        get { return specialdefense_base; }
        set { specialdefense_base = value; }
    }

    public int Nummer { get; set; } = -1;
    public string Naam { get; set; } = "Onbekend";
    public string Type { get; set; } = "no type"; //TIP= met enum ipv string

    //Level

    private int level;
    public int Level
    {
        get { return level; }
        private set { level = value; }
    }

    public void VerhoogLevel()
    {
        Level++;
    }

    public double Average
    {
        get
        {
            double gemiddelde = 0;
            gemiddelde = Total / 6.0;
            return gemiddelde;
        }
    }

    public int Total
    {
        get
        {
            return (HP_Base + Defense_Base + Attack_Base + SpecialAttack_Base + SpecialDefense_Base + Speed_Base);
        }
    }

    public int HP_Full
    {
        get
        {
            int resultaat = (((HP_Base + 50) * Level) / 50) + 10;
            return resultaat;
        }
    }

    public int Speed_Full
    {
        get
        {
            return ((Speed_Base * Level) / 50) + 5;
        }
    }

    //etc.
}
```

# Pokémontester

```java
Pokemon aPoke= new Pokemon();
Console.WriteLine("Geef hp:");
aPoke.HP_Base= Convert.ToInt32(Console.ReadLine());
Console.WriteLine("Geef attack:");
aPoke.Attack_base= Convert.ToInt32(Console.ReadLine());

//enz

aPoke.ShowInfo();

Console.WriteLine("Tot welke level wilt u leveren?");
int levels= Convert.ToInt32(Console.ReadLine());
for(int i=0;i<levels;i++)
{
    aPoke.VerhoogLevel();
}
Console.WriteLine($"Na {levels} keer het level te verhogen:");
aPoke.ShowInfo();
```

# Pokemon generator

```java
private static Random ran=new Random();
public static Pokemon GeneratorPokemon ()
{
    Pokemon temp= new Pokemon();
    temp.HP_base= ran.Next(1,100);
    temp.Attack_base=ran.Next(1,100);
    return temp;
}
```

Aanroep:

```java
Pokemon myNewPokemon= GeneratorPokemon();
Pokemon myOtherPokemon= GeneratorPokemon();
```

# Pokémon-battle

```java
public static int Battle(Pokemon poke1, Pokemon poke2)
{
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

    return 0;
}
```