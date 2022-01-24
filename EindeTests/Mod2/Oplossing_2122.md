
```java

enum risicoNiveau { Laag, Verhoogd, Kritiek };
static void Main(string[] args)
{
    const int arrayLengte = 100;
    bool afsluiten = false;

    while (!afsluiten)
    {
        int nummerPersoon = 0;
        string[] namen = new string[arrayLengte];
        string[] namenAnoniem = new string[namen.Length];
        bool[] toegelatenArray = new bool[namen.Length];

        for (int i = 0; i < namen.Length; i++)
        {
            namen[i] = "leeg";
        }

        Console.Clear();
        bool herhalen = true;
        while (herhalen)
        {
            Console.WriteLine($"Voer de naam in van persoon {nummerPersoon + 1}");
            string naam = Console.ReadLine().ToLower();
            if (naam == "stop")
            {
                herhalen = false;
            }
            else
            {
                namen[nummerPersoon] = naam;
                bool goedAntwoord = true;

                do
                {
                    Console.WriteLine("Werd deze persoon toegelaten? j/n");
                    string keuze = Console.ReadLine().ToLower();
                    switch (keuze)
                    {
                        case "j":
                            goedAntwoord = true;
                            toegelatenArray[nummerPersoon] = true;
                            break;
                        case "n":
                            goedAntwoord = true;
                            toegelatenArray[nummerPersoon] = false;
                            break;
                        default:
                            goedAntwoord = false;
                            break;
                    }
                } while (!goedAntwoord);
                if (toegelatenArray[nummerPersoon])
                {
                    Console.WriteLine($"De persoon met naam {namen[nummerPersoon]} werd ingevoerd. Hij werd toegelaten");
                }
                else
                {
                    Console.WriteLine($"De persoon met naam {namen[nummerPersoon]} werd ingevoerd. Hij werd niet toegelaten");
                }
                nummerPersoon++;
            }

        }
        ToonTracerRapport(namen, toegelatenArray);
        Console.WriteLine("Moeten de gebruikersnamen anoniem gemaakt worden? j/n");
        if (Console.ReadLine().ToLower() == "j")
        {
            namenAnoniem = MaakAnoniem(namen, toegelatenArray);
            ToonTracerRapport(namenAnoniem, toegelatenArray);
        }
        Console.WriteLine("Wilt u afsluiten? j/n");
        if (Console.ReadLine().ToLower() == "j")
        {
            afsluiten = true;
        }
    }

}
static void ToonTracerRapport(string[] namenArray, bool[] toegelatenArray)
{
    int aantalPersonen = 0;
    int aantalNietToegelaten = 0;
    double procentNietToegelaten = 0;
    risicoNiveau risico = risicoNiveau.Laag;
    const double kritiek = 0.75;
    const double verhoogd = 0.35;

    for (int i = 0; i < toegelatenArray.Length; i++)
    {
        if (!toegelatenArray[i] && namenArray[i] != "leeg")
        {
            aantalNietToegelaten++;
        }
        else if (toegelatenArray[i] && namenArray[i] != "leeg")
        {
            aantalPersonen++;
        }
    }
    procentNietToegelaten = Convert.ToDouble(aantalNietToegelaten) / aantalPersonen;
    if (procentNietToegelaten > kritiek)
    {
        risico = risicoNiveau.Kritiek;
    }
    else if (procentNietToegelaten > verhoogd)
    {
        risico = risicoNiveau.Verhoogd;
    }
    Console.Clear();
    Console.WriteLine($"Aantal ingevoerde personen = {aantalPersonen}");
    Console.WriteLine($"Daarvan werden er {aantalNietToegelaten} personen niet toegelaten, dat is {procentNietToegelaten:P}.");
    Console.WriteLine($"Risico : {risico}\n");

    Console.WriteLine("Volgende personen werden niet toegelaten:");
    for (int i = 0; i < aantalPersonen; i++)
    {
        if (!toegelatenArray[i] && namenArray[i] != "leeg")
        {
            Console.WriteLine($"- {namenArray[i]}");
        }
    }
}
static string[] MaakAnoniem(string[] namen, bool[] toegelatenArray)
{
    string[] anoniemeNamen = new string[namen.Length];
    Array.Copy(namen, anoniemeNamen, namen.Length);
    for (int i = 0; i < anoniemeNamen.Length; i++)
    {
        if (namen[i] != "leeg")
        {
            if (!toegelatenArray[i] && namen[i] != "leeg")
            {
                anoniemeNamen[i] = "*****";
            }
        }

    }
    return anoniemeNamen;
}

```