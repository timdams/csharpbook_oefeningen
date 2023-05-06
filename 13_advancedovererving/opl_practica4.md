# Pokémon Extra

Voeg dit toe aan ``Pokemon`` klasse:
```java
public override string ToString()
{
    string toResturn =  $"{Naam}(Level:{Level})\n" +
        $"Base stats:\n" +
        $"\tHP_Base= {HP_Base}\n" +
        $"\tAttack_Base= {Attack_Base}\n";
        //Enz
    return toReturn;
}
```

# Bookmark Extra

Voeg dit toe aan ``Bookmark``:

```java
public override string ToString()
{
    return $"{Naam} ({URL})";
}
```

En dit aan ``HiddenBookmark``:

```java
public override string ToString()
{
    return base.ToString() + "---HIDDEN---";
}
```

# Book

## Deel 1

```java
public class Book
{
    public long ISBN { get; set; }
    public string Title { get; set; }
    public string Author { get; set; }

    private double price;

    public virtual double Price
    {
        get { return price; }
        set { price = value; }
    }

    public static Book TelOp(Book b1, Book b2)
    {
        Book result = new Book();

        result.Title = $"Omnibus van {b1.Author},{b2.Author}";
        result.Price = (b1.Price + b2.Price) / 2;

        return result;
    }

}

public class TextBook : Book
{
    public int GradeLevel { get; set; }

    public override double Price
    {
        get { return base.Price; }
        set
        {
            if (value >= 20 && value <= 80)
                base.Price = value;
        }
    }

    class CoffeeTableBook : Book
    {
        public override double Price
        {
            get { return base.Price; }
            set
            {
                if (value >= 35 && value <= 100)
                    base.Price = value;
            }
        }
    }
}
```

## Deel 2

Voeg dit toe aan de klasse ``Book``

```java
public override string ToString()
{
    return $"{Title} - {Author}({ISBN}) {Price}";
}
```


## Money, Money, Money

```java
public abstract class Rekening
{
    private double saldo = 0;
    public double Saldo
    {
        get { return Saldo; }
    }
    public void VoegGeldToe(double hoeveel)
    {
        saldo += hoeveel;
    }

    public bool HaalGeldAf(double hoeveel)
    {
        if (saldo - hoeveel < 0)
            return false;

        saldo -= hoeveel;
        return true;
    }

    public abstract double BerekenRente();

}

public class BankRekening : Rekening
{
    public override double BerekenRente()
    {
        if(Saldo>0)
        {
            return Saldo + (Saldo*0.05);
        }
        return Saldo;
    }
}

public class SpaarRekening : Rekening
{
    public override double BerekenRente()
    {
        return Saldo+(Saldo*0.02);
    }
}

public class ProRekening : SpaarRekening
{
    public override double BerekenRente()
    {
        int aantal1000 =(int)Saldo / 1000;
        return base.BerekenRente() + aantal1000*10;
    }
}
```

# Geometric Figures

```java
public abstract class GeometricFigure
{
    public int Hoogte { get; set; }
    public int Breedte { get; set; }
    public double Oppervlakte
    {
        get
        {
            return BerekenOppervlakte();
        }
    }
    public abstract double BerekenOppervlakte();
}

public class Rechthoek : GeometricFigure
{
    public override double BerekenOppervlakte()
    {
        return Breedte * Hoogte;
    }
}

public class Vierkant: Rechthoek
{
    public Vierkant(int b, int h)
    {
        if (b!=h)
        {
            b = h;
        }
        Hoogte = h;
        Breedte = b;
    }

    public Vierkant(int l)
    {
        Hoogte = Breedte = l;
    }
}

public class Driehoek: GeometricFigure
{
    public override double BerekenOppervlakte()
    {
        return (Breedte * Hoogte) / 2;
    }
}
```

# Dierentuin

```java
Console.WriteLine("H13 Dierentuin");
List<Dier> Dieren = new List<Dier>();

string answer = "";
while (answer != "q")
{
    Console.WriteLine("wat wilt u doen?");
    Console.WriteLine("a = verwijder, b = gemiddelde gewicht, c = praten, d = opnieuw opstarten, q = stoppen ");
    answer = Console.ReadLine();
    switch (answer)
    {
        case "a":
            Console.WriteLine($"op welke plaats wilt u het verwijderen van 0 tot {Dieren.Count}");
            int nummer = Convert.ToInt32(Console.ReadLine());
            if (nummer < Dieren.Count)
                Dieren.RemoveAt(nummer);
            else
                Console.WriteLine("Dat nummer bestaat niet");
            break;
        case "b":
            int totaal = 0;
            foreach (var animal in Dieren)
            {
                totaal += animal.Gewicht;
            }
            double gemiddelde = totaal / Dieren.Count;
            Console.WriteLine("gemiddelde gewicht = " + gemiddelde);
            break;
        case "c":
            foreach (var animal in Dieren)
            {
                animal.Zegt();
            }
            break;
        case "d":
            Dieren.Clear();
            break;

        default:
            break;
    }

}
```

```java
public abstract class Dier
{
    private int gewicht = 50;

    public int Gewicht
    {
        get { return gewicht; }
        set { gewicht = value; }
    }

    public abstract void Zegt();

}

public class Koe : Dier
{
    public override void Zegt()
    {
        Console.WriteLine("moooeeee");
    }
}
public class Hond : Dier
{
    public override void Zegt()
    {
        Console.WriteLine("woef");
    }
}
public class Vis : Dier
{
    public override void Zegt()
    {
        Console.WriteLine("blub");
    }
}
```