# Prijzen met foreach

```csharp
var prijzen = new double[20];
for (int i = 0; i < prijzen.Length; i++)
{
    Console.WriteLine($"Geef prijs {i}:");
    prijzen[i] = double.Parse(Console.ReadLine());
}

double som = 0;
Console.WriteLine("Prijzen groter of gelijk aan 5:");
foreach (var prijs in prijzen)
{
    som += prijs;

    if(prijs>=5.00)
    {
        Console.WriteLine(prijs);
    }
}
Console.WriteLine($"Gemiddelde is {som/prijzen.Length}");
```

# Computer-winkel

Dank aan Jasper Van Meel voor deze oplossing! Ook dank aan de andere studenten die een oplossing instuurden. Doe zo voort!

```csharp
class ComputerOnderdeel
{
    private static Random rng = new Random();

    public int Prijs { get; set; }

    public int ID { get; set; }

    public bool InDoos { get; set; }

    public ComputerOnderdeel()
    {
        Prijs = rng.Next(0, 1001);
        ID = rng.Next(100, 1000);

        if (rng.Next() % 2 == 0)
        {
            InDoos = true;
        }
    }

    public void ToonInfo()
    {
        Console.WriteLine($"Prijs: {Prijs}, ID: {ID}, InDoos: {InDoos}");
    }
}
```

```csharp 

static void Main(string[] args)
{
    //Console.WriteLine("Hello World!");

    List<ComputerOnderdeel> onderdelen = new List<ComputerOnderdeel>();

    //100 computeronderdelen aanmaken
    for (int i = 0; i < 100; i++)
    {
        onderdelen.Add(new ComputerOnderdeel());
    }

    //ToonInfo() voor alle onderdelen
    Console.WriteLine("ToonInfo() voor alle onderdelen in de lijst:");
    ToonInfo_Alle(onderdelen);

    //ToonInfo() voor onderdelen met prijs > 400
    ToonInfo_PrijsGroterDan400(onderdelen);

    //ToonInfo() voor onderdelen in een doos
    ToonInfo_OnderdelenInDoos(onderdelen);

    //ToonInfo() voor onderdelen met even ID & prijs < 200
    ToonInfo_EvenIDPrijsGroterDan200(onderdelen);


    //verwijder alle onderdelen waarvoor InDoos == true
    Verwijder_InDoos(onderdelen);

    //verwijder alle onderdelen waarvoor price < 100
    Verwijder_PrijsOnder100(onderdelen);


    //ToonInfo() van overgebleven onderdelen
    Console.WriteLine("\n\n\nInformatie van de overgebleven onderdelen:");
    ToonInfo_Alle(onderdelen);
}

static void ToonInfo_Alle(List<ComputerOnderdeel> onderdelen)
{
    foreach (var item in onderdelen) 
    { 
        item.ToonInfo(); 
    }
}

static void ToonInfo_PrijsGroterDan400(List<ComputerOnderdeel> onderdelen)
{
    Console.WriteLine("\n\n\nToonInfo() voor alle onderdelen met een prijs > 400:");
    foreach (var item in onderdelen)
    {
        if (item.Prijs > 400)
        {
            item.ToonInfo();
        }
    }
}

private static void ToonInfo_OnderdelenInDoos(List<ComputerOnderdeel> onderdelen)
{
    Console.WriteLine("\n\n\nToonInfo() voor alle onderdelen in een doos:");
    foreach (var item in onderdelen)
    {
        if (item.InDoos == true)
        {
            item.ToonInfo();
        }
    }
}

private static void ToonInfo_EvenIDPrijsGroterDan200(List<ComputerOnderdeel> onderdelen)
{
    Console.WriteLine("\n\n\nToonInfo() voor alle onderdelen met een even ID & prijs < 200");
    foreach (var item in onderdelen)
    {
        if (item.ID % 2 == 0 && item.Prijs < 200)
        {
            item.ToonInfo();
        }
    }
}

private static void Verwijder_InDoos(List<ComputerOnderdeel> onderdelen)
{
    string userInput = "";

    do
    {
        Console.WriteLine("\n\n\nWil je alle onderdelen die in een doos zitten verwijderen? (y/n)");
        userInput = Console.ReadLine();
    } while (userInput != "y" && userInput != "n" && userInput != "yes" && userInput != "no");

    if (userInput == "y" || userInput == "yes")
    {
        for (int i = onderdelen.Count - 1; i >= 0; i--)
        {
            if (onderdelen[i].InDoos)
            {
                onderdelen.Remove(onderdelen[i]);
            }
        }
        Console.WriteLine("Verwijderd.");
    }
}

private static void Verwijder_PrijsOnder100(List<ComputerOnderdeel> onderdelen)
{
    string userInput = "";

    do
    {
        Console.WriteLine("\n\n\nWil je alle onderdelen met een prijs lager dan 100 verwijderen? (y/n)");
        userInput = Console.ReadLine();
    } while (userInput != "y" && userInput != "n" && userInput != "yes" && userInput != "no");

    if (userInput == "y" || userInput == "yes")
    {
        for (int i = onderdelen.Count - 1; i >= 0; i--)
        {
            if (onderdelen[i].Prijs < 100)
            {
                onderdelen.Remove(onderdelen[i]);
            }
        }
        Console.WriteLine("Verwijderd");
    }
}
```
# Student Organizer

Dank aan Marouane Mairouche op wiens code volgende oplossing is gebaseerd.

```csharp
static void Main(string[] args)
{
    List<Student> Lijst = new List<Student>()
    {
        new Student(),
        new Student(),
        new Student(),
        new Student(),
        new Student()
    };
    
    string exit = "";

    do
    {
        ToonMenuOpties();
        exit = Console.ReadLine().ToUpper();
        switch (exit)
        {
            case "A":
                VoerNieuweStudentInLijstIn(Lijst);
                break;
            case "B":
                ToonAlleStudentenVanLijst(Lijst);
                break;
            case "C":
                ToonStudentVanLijst(Lijst);
                break;


            case "D":
                VerwijderStudentVanLijst(Lijst);
                break;
        }
    } while (exit != "Q");

}

private static void ToonMenuOpties()
{
    Console.WriteLine("Maak een keuze");
    Console.WriteLine("A) Student gegevens invoeren");
    Console.WriteLine("B) Student gegevens tonen");
    Console.WriteLine("C) Gebruik zoek functie");
    Console.WriteLine("D) Student gegevens verwijderen");
    Console.WriteLine("Q) Programma afsluiten");
}

private static void VoerNieuweStudentInLijstIn(List<Student> Lijst)
{
    Console.WriteLine("Welke studentnummer wil je invoeren?");
    int student = int.Parse(Console.ReadLine()) - 1;

    if (Lijst[student].Naam != "Onbekend")
    {
        Console.WriteLine("Wilt u de gegevens overschrijven?[Y/N]");
        string option = Console.ReadLine().ToUpper();

        if (option == "Y")
        {
            Lijst[student] = Student.MaakStudentViaReadLine();
        }
    }
    else
    {
        Lijst[student] = Student.MaakStudentViaReadLine();
    }
}

private static void ToonAlleStudentenVanLijst(List<Student> Lijst)
{
    foreach (var item in Lijst)
    {
        if (item.Naam != "Onbekend")
        {
            item.GeefOverzicht();
        }
    }
}

private static void ToonStudentVanLijst(List<Student> Lijst)
{
    Console.WriteLine("Geef de naam van de student");
    string name = Console.ReadLine();
    foreach (var item in Lijst)
    {
        if (item.Naam == name)
        {
            item.GeefOverzicht();
        }
    }
}

private static void VerwijderStudentVanLijst(List<Student> Lijst)
{
    Console.WriteLine("Welke studentnummer wil je invoeren?");
    int student = int.Parse(Console.ReadLine()) - 1;
    Lijst[student] = new Student();
}
}
```

# Speelkaarten

Main:
```csharp
List<Speelkaart> boekKaarten = new List<Speelkaart>();
for (int i = 0; i < 4; i++)
{
    for (int j = 1; j < 14; j++)
    {
        Speelkaart toAdd = new Speelkaart() { Getal=j, Suite=(Suit)i  };
        boekKaarten.Add(toAdd);
    }
}
Random r = new Random();
while (boekKaarten.Count > 0)
{
    Speelkaart getrokken = boekKaarten[r.Next(0, boekKaarten.Count)];
    Console.WriteLine("Getrokken kaart=");
    Console.WriteLine($"{getrokken.Suite}  {getrokken.Getal}");
    boekKaarten.Remove(getrokken);
    Console.ReadKey();
}
```

Speelkaart klasse:

```csharp
public enum Suit {Schoppen, Harten, Klaveren, Ruiten}

public class Speelkaart
{
    public int Getal { get; set; }
    public Suit Suite { get; set; }

}
```
# Computer-winkel

Bounty: wie wil z'n oplossing hier? ;)

# Student Organizer

Bounty: wie wil z'n oplossing hier? ;)

# Bookmark Manager

Merk het (her)gebruik van methoden op, alsook het gebruik van enum om de leesbaarheid van de code te verbeteren in de ``ToonHoofdMenu`` switch

```csharp
public enum Keuzes { List,Show,Edit,Delete}

static void Main(string[] args)
{
    List<BookMark> sites = VraagEnVulBookmarkList();
    Console.Clear();
    ToonHoofdMenu(sites);
}

private static void ToonHoofdMenu(List<BookMark> sites)
{
    while (true)
    {
        Console.WriteLine("Wat wil je doen? 0=list,1=show, 2=edit, 3=remove");
        Keuzes inp = (Keuzes)Convert.ToInt32(Console.ReadLine());
        switch (inp)
        {
            case Keuzes.List:
                ShowAll(sites);
                break;
            case Keuzes.Show:
                OpenSite(sites);
                break;
            case Keuzes.Edit:
                EditSite(sites);
                break;
            case Keuzes.Delete:
                RemoveSite(sites);
                break;
            default:
                break;
        }
        Console.WriteLine("Druk op een toets om verder te gaan.");
        Console.ReadKey();
        Console.Clear();
    }
}

private static List<BookMark> VraagEnVulBookmarkList()
{
    Console.WriteLine("Geef je favoriete sites:");
    List<BookMark> sites = new List<BookMark>();
    for (int i = 0; i < 2; i++)
    {
        Console.WriteLine($"Geef site {i} in:");
        Console.WriteLine("Naam?");
        string naam = Console.ReadLine();
        Console.WriteLine("URL?");
        string url = Console.ReadLine();

        BookMark siteToAdd = new BookMark()
        {
            Naam = naam,
            URL = url
        };
        sites.Add(siteToAdd);
    }

    return sites;
}

private static void RemoveSite(List<BookMark> sites)
{
    int keuze = AskAction(sites, "verwijderen");
    sites.RemoveAt(keuze);
}

private static void EditSite(List<BookMark> sites)
{
    int keuze = AskAction(sites,"editeren");
    Console.WriteLine("Geef nieuwe naam [leeglaten= niet veranderen]");
    string newna = Console.ReadLine();
    if (newna != "")
        sites[keuze].Naam = newna;

    Console.WriteLine("Geef nieuwe url [leeglaten= niet veranderen]");
    string newurl = Console.ReadLine();
    if (newurl != "")
        sites[keuze].URL = newurl;

}

private static void OpenSite(List<BookMark> sites)
{
    int keuze=AskAction(sites, "openen");
    sites[keuze].ToonSite();
}

private static void ShowAll(List<BookMark> sites)
{
    for (int i = 0; i < sites.Count; i++)
    {
        Console.WriteLine($"{i}.{sites[i].Naam} ({sites[i].URL})");
    }
}

private static int AskAction(List<BookMark> sites, string action)
{
    Console.WriteLine($"Welke wil je {action}?");
    ShowAll(sites);
    int keuze = Convert.ToInt32(Console.ReadLine());
    return keuze;
}

```