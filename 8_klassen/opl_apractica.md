

# Oefeningen

## RapportModule

```java
class Rapport
{
    public int Percentage {get;set;}
    public void PrintGraad()
    {
        if(Percentage < 50)
            Console.WriteLine("Niet geslaagd");
        else if(Percentage <= 68)
            Console.WriteLine("Voldoende");
        else if(Percentage <= 75)
            Console.WriteLine("Onderscheiding");
        else if(Percentage <= 85)
            Console.WriteLine("Grote onderscheiding");
        else Console.WriteLine("Grootste onderscheiding");
    }
}
```


## Nummers

```java
class Nummers
{
    public int Getal1 { get; set; }
    public int Getal2 { get; set; }

    public int Som() { return Getal1 + Getal2; }
    public int Verschil() { return Getal1 - Getal2; }
    public int Product() { return Getal1 * Getal2; }

    public double Quotient()
    {
        if(Getal2==0)
        {
            Console.WriteLine("Kan niet delen door 0");
            return 0;
        }
        return Getal1 / (double)Getal2;
    }
}
```

## Studentklasse

```java
enum Klassen { TI1,TI2,TI3 }

public class Student
{
    public string Naam { get; set; }
    public int Leeftijd { get; set; }
    public Klassen Klas { get; set; }

    public int PuntenCommunicatie { get; set; }
    public int PuntenProgrammingPrinciples { get; set; }
    public int PuntenWebTech { get; set; }

    public double BerekenTotaalCijfer()
    {
        return (PuntenCommunicatie + PuntenProgrammingPrinciples + PuntenWebTech) / 3.0;
    }

    public void GeefOverzicht()
    {
        Console.WriteLine($"{Naam}, {Leeftijd} jaar");
        Console.WriteLine($"Klas: {Klas}");
        Console.WriteLine();
        Console.WriteLine("Cijferrapport");
        Console.WriteLine("*************");
        Console.WriteLine($"Communicatie:\t\t{PuntenCommunicatie}");
        Console.WriteLine($"Programming Principles:\t{PuntenProgrammingPrinciples}");
        Console.WriteLine($"Web Technology:\t\t{PuntenWebTech}");
        Console.WriteLine($"Gemiddelde:\t\t{BerekenTotaalCijfer()}");
    }
}
```

## PizzaTime

```java
    class Pizza
    {
		private string toppings;

		public string Toppings
		{
			get 
			{			
				return toppings; 
			}
			set 
			{
				if (value != "")
				{
					toppings = value;
				}		
			}
		}
		private int diameter;

		public int Diameter
		{
			get { return diameter; }
			set 
			{
				if (value > 0)
				{
					diameter = value;
				}
			}
		}

		private double prijs;

		public double Prijs
		{
			get { return prijs; }
			set 
			{
				if (value >0)
				{
					prijs = value;
				}			 
			}
		}
	}
```


## Figuren

```java
class Rechthoek
{
    private int lengte = 1;
    public int Lengte
    {
        get { return lengte; }
        set { if (value >= 1) lengte = value; }
    }

    private int breedte = 1;

    public int Breedte
    {
        get { return  breedte; }
        set { if (value >= 1) breedte = value; }
        }

    public void ToonOppervlakte()
    {
        Console.WriteLine($"{Lengte*Breedte}");
    }
}
```

Driehoek is quasi hetzelfde, met uiteraard een andere berekening van de oppervlakte.


# Week 2

## Verjaardag

```java
Console.WriteLine("Geef je verjaardag (formaat: d/m . Bv 18/3)");
DateTime verj = DateTime.Parse(Console.ReadLine());


if (verj < DateTime.Today)
    verj = verj.AddYears(1);


string dagLokaal = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetDayName(verj.DayOfWeek);
TimeSpan dagenOver = verj - DateTime.Today;

Console.WriteLine($"Je ben jarig over {dagenOver.Days} dagen en dat is op een {dagLokaal}.");
```


## Bibliotheek

```java
public class BibBoek
{
    private const int AANTALUITLEENDAGEN = 14;
    public string Ontlener { get; set; } = "onbekend"
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
            return uitgeleend.AddDays(AANTALUITLEENDAGEN);
        }
    }

    public void VerlengTermijn(int aantalDagen)
    {
        Uitgeleend = uitgeleend.AddDays(aantalDagen);
    }
}
```



## BankManager


```java
public enum RekeningStaat { Geblokkeerd, Geldig }
public class Rekening
{

    public RekeningStaat Staat { get; private set; } = RekeningStaat.Geldig;

    public string RekeningNummer { get; set; }
    public string NaamKlant { get; set; }

    private int balans;
    public int Balans
    {
        get {return balans;}
    }
    //methoden
    public int HaalGeldAf(int bedrag)
    {
        if (Staat == RekeningStaat.Geldig)
        {
            if (bedrag > balans)
            {
                int over = balans;
                balans = 0;
                Console.WriteLine("Rekening leeg nu");
                VeranderStaat();
                return over;
            }
            else
            {
                balans -= bedrag;
                return bedrag;
            }
        }
        else
        {
            Console.WriteLine("Gaat niet. Rekening geblokkeerd.");
            return 0;
        }
    }
    public void StortGeld(int bedrag)
    {
        if (Staat == RekeningStaat.Geldig)
            balans += bedrag;
        else
            Console.WriteLine("Gaat niet. Rekening geblokkeerd.");
    }
    public void ToonBalans()
    {
        Console.Write($"Naam:\t\t{NaamKlant}\nRekeningnummer: {Rekeningnummer}\nStaat:\t\t{Staat}\nBalans:\t\t");
        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine($"${balans}\n");
        Console.ResetColor();
    }
    public void VeranderStaat()
    {
        if (Staat == RekeningStaat.Geldig)
            Staat = RekeningStaat.Geblokkeerd;
        else
            Staat = RekeningStaat.Geldig;
    }

}

```

```java
Rekening tim = new Rekening();
tim.StortGeld(1000);
Rekening student = new Rekening();
do
{
    Console.WriteLine("Hoeveel geld wil je naar de student overschrijven ?");
    int bedrag = int.Parse(Console.ReadLine());

    student.StortGeld(tim.HaalGeldAf(bedrag));

    tim.ToonBalans();
    student.ToonBalans();
} while (true);
```

## Persoon

```java
class Persoon
{
    public string Voornaam { get; set; }
    public string Achternaam { get; set; }
    private DateTime geboorteDatum;

    public DateTime GeboorteDatum
    {
        get { return geboorteDatum; }
        set
        {

            {
                if (value > new DateTime(1990, 1, 1) && value < DateTime.Today)
                    geboorteDatum = value;
                else
                    geboorteDatum = DateTime.Today;
            }
        }
    }

    public int BerekenLeeftijd()
    {
       
        int leeftijd = DateTime.Now.Year - geboorteDatum.Year;

        if (DateTime.Now.Month < geboorteDatum.Month || (DateTime.Now.Month == DateTime.Now.Month && DateTime.Now.Day < geboorteDatum.Day))
            leeftijd--;

        return leeftijd;
    }
}
```

## Dobbelstenen

```java
class Dobbelstenen
{
    public void WerpEnTel6()
    {
        Random r = new Random();
        int aantalZes = 0;
        for (int i = 0; i < 1000; i++)
        {
            if (r.Next(1, 7) == 6 && r.Next(1, 7) == 6)
                aantalZes++;
        }
        Console.WriteLine($"{aantalZes} keren 6 gegooid. Dat is {aantalZes/10.0}%");
    }
}
```