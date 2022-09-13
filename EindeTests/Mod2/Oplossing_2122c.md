```java
static void Main(string[] args)
    {
        double[] verkochteMenus = new double[100];
        int teller = 0;
        while (teller < verkochteMenus.Length)
        {
            verkochteMenus[teller] = BestelHamburger();
        }
    }

    static double BestelHamburger()
    {

        ToonMenu();
        string keuzeHamburger = "";

        do
        {
            Console.WriteLine("Welke hamburger wenst u?(gewoon, fish, veggie)");
            keuzeHamburger = Console.ReadLine();
        } while (!(keuzeHamburger == "gewoon" || keuzeHamburger == "fish" || keuzeHamburger == "veggie"));

        Console.WriteLine("Wenst u frietjes? (j/n)");
        string wilFrietjes = Console.ReadLine();
        int aantalFrietjes = 0;
        if (wilFrietjes == "j")
            aantalFrietjes = BestelFrietjes();

        Console.WriteLine("Wenst u drank? (j/n)");
        string wilFrisdrank = Console.ReadLine();
        Frisdranken keuzeDrank = Frisdranken.Geen;
        if (wilFrisdrank == "j")
            keuzeDrank = BestelDrinken();

        return BerekenTotaal(keuzeHamburger, aantalFrietjes, keuzeDrank);
    }

    private static void ToonMenu()
    {
        Console.WriteLine("Euro tekens zullen als vraagteken getoond worden");
        Console.WriteLine("\nGewone hamburger: €5");
        Console.WriteLine("Fishburger: €6");
        Console.WriteLine("Veggieburger: €3");
        Console.WriteLine("Water €2");
        Console.WriteLine("Fanta €3");
        Console.WriteLine("Cola €3");
        Console.WriteLine("Frietjes: €2 per frietje");
    }

    static double BerekenTotaal(string hamburger, int aantalFriet = 1, Frisdranken frisdrank = Frisdranken.Geen)
    {
        double totaal = 0;
        switch (hamburger)
        {
            case "gewoon": totaal += 5; Console.BackgroundColor = ConsoleColor.Green; break;
            case "fish": totaal += 6; Console.BackgroundColor = ConsoleColor.Blue; break;
            case "veggie": totaal += 3; Console.BackgroundColor = ConsoleColor.Red; break;
        }
        Console.Write("H");
        Console.ResetColor();

        totaal += (aantalFriet * 2);
        for (int i = 0; i < aantalFriet; i++)
        {
            Console.Write("I");
        }


        switch (frisdrank)
        {

            case Frisdranken.Water:
                totaal += 2;
                Console.WriteLine("W");
                break;
            case Frisdranken.Fanta:
                totaal += 3;
                Console.WriteLine("F");
                break;
            case Frisdranken.Cola:
                totaal += 3;
                Console.WriteLine("C");
                break;
            default:
                break;
        }

        //Promoties
        if (aantalFriet > 0 && frisdrank != Frisdranken.Geen)
        {
            totaal -= 5;
            Console.WriteLine("Je hebt de box promotie!");
        }
        if (hamburger == "veggie" && aantalFriet == 1 && frisdrank == Frisdranken.Water)
        {
            totaal -= 3;
            Console.WriteLine("Je hebt de hipster promotie!");
        }

        Console.WriteLine($"Dit kost je: {totaal:0.00}");
        return totaal;
    }

    enum Frisdranken { Geen, Water = 1, Fanta, Cola };
    static Frisdranken BestelDrinken()
    {
        Console.WriteLine("Welke frisdrank wenst u? 1.Water, 2.Fanta, 3. Cola");
        return (Frisdranken)int.Parse(Console.ReadLine());


    }
    static int BestelFrietjes()
    {
        Console.WriteLine("Hoeveel frietjes wenst u? (1 tot 10)");
        return int.Parse(Console.ReadLine());
    }
```