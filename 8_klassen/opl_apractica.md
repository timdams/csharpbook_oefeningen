# DateTime

## Klokje

```java
while (true)
{
    Console.WriteLine(DateTime.Now.ToString("HH:mm:ss"));
    System.Threading.Thread.Sleep(1000);
    Console.Clear();
}
```

## Verjaardag

```java
Console.WriteLine("Geef je verjaardag (formaat: d/m . Bv 18/3)");
DateTime verj = DateTime.Parse(Console.ReadLine());


if (verj < DateTime.Today)
    verj = verj.AddYears(1);

TimeSpan dagenover = verj - DateTime.Today;

Console.WriteLine($"Je verjaart over {dagenover.Days} dagen");
```

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
        else if(Percentage < 68)
            Console.WriteLine("Voldoende");
        else if(Percentage < 75)
            Console.WriteLine("Onderscheiding");
        else if(Percentage < 85)
            Console.WriteLine("Grote onderscheiding");
        else Console.WriteLine("Grootste onderscheiding");
    }
}
```

Gebruik/test:

```java
Rapport tim =new Rapport();
tim.Percentage = 78;
tim.PrintGraad();
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
            Console.WriteLine("Error");
            return 0;
        }
        return Getal1 / Getal2;
    }
}
```

## Figure

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
        Console.WriteLine($"Oppervlakte is= {Lengte*Breedte}"  );
    }
}
```

Driehoek is quasi hetzelfde, met uiteraard een andere berekening van de oppervlakte.

## Studentklasse

```java
enum Klassen { EA1, EA2, EA3}

class Student
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
        Console.WriteLine($"Gemiddelde:\t\t{BerekenTotaalCijfer():0.0}");
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

# Week 2

## BibBoek

```java
class BibBoek
{
    private const int AANTALUITLEENDAGEN = 14;
    public string Ontlener { get; set; }
    public DateTime UitgeleendOp { get; private set; } = DateTime.Now;
    public DateTime TeruggevenOp
    {
        get
        {
            return UitgeleendOp.AddDays(AANTALUITLEENDAGEN);
        }
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

## BankManager
*Gebaseerd op de oplossing van Ethan De Bois.*

```java
class Rekening
{
    private string naamKlant;
    private string rekeningNummer;
    private int balans;
    public State RekeningState { get; private set; } = (State)0;

    public string Rekeningnummer
    {
        get { return rekeningNummer; }
        set { rekeningNummer = value; }
    }

    public string NaamKlant
    {
        get { return naamKlant; }
        set { naamKlant = value; }
    }

    //methoden
    public int HaalGeldAf(int bedrag)
    {
        if (RekeningState == State.Geldig)
        {
            if (bedrag > balans)
            {
                balans -= balans;
                Console.WriteLine("Niet al het geld kon teruggegeven worden.");
                return balans;
            }
            else
            {
                balans -= bedrag;
                return bedrag;
            }
        }
        else
        {
            Console.WriteLine("Kan niet afhalen - Rekening geblokkeerd.");
            return 0;
        }
    }
    public void StortGeld(int bedrag)
    {
        if (RekeningState == State.Geldig)
            balans += bedrag;
        else
            Console.WriteLine("Kan niet storten - Rekening geblokkeerd.");
    }
    public void ToonBalans()
    {
        Console.Write($"Naam:\t\t{naamKlant}\nRekeningnummer: {Rekeningnummer}\nStaat:\t\t{RekeningState}\nBalans:\t\t");
        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine($"${balans}\n");
        Console.ResetColor();
    }
    public void ChangeState()
    {
        if (RekeningState == (State)0)
            RekeningState = (State)1;
        else
            RekeningState = (State)0;
    }

}
enum State { Geldig, Geblokkeerd }
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

    public int Leeftijd
    {
        get
        {
            int leeftijd = DateTime.Now.Year - geboorteDatum.Year;

            if (DateTime.Now.Month < geboorteDatum.Month || (DateTime.Now.Month == DateTime.Now.Month && DateTime.Now.Day < geboorteDatum.Day))
                leeftijd--;

            return leeftijd;
        }
    }
}
```