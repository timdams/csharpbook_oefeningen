# Prijzen met foreach

Maak een array die tot 20 prijzen (``double``) kan bewaren. Vraag aan de gebruiker om 20 prijzen in te voeren en bewaar deze in de array. Doorloop vervolgens m.b.v. een ``foreach``-lus de volledige array en toon enkel de elementen op het scherm wiens prijs hoger of gelijk is aan €5.00. Toon op het einde van het programma het gemiddelde van alle prijzen (dus inclusief de lagere prijzen).

# Computer-winkel

Een firma heeft een grote lijst met computeronderdelen en wil hier de nodige filters op kunnen toepassen.

## Computeronderdeel
De klasse computeronderdeel bestaat uit volgende autoproperties:

* Prijs (int)
* ID (int)
* InDoos (bool)

Voorts heeft de klasse een default constructor die voorgaande autoproperties op willekeurige waarden instelt (prijs positief tot max 1000, ID een getal tussen 100 en 999)

De klasse heeft 1 methode ``ToonInfo`` die de 3 waarden van het object naar het scherm stuurt:

```text
Prijs: 845, ID: 45, InDoos: true
```

## Filteren

Maak in je hoofdprogramma een List<ComputerOnderdeel> dat je vult met 100 willekeurige  aangemaakte objecten.
Vervolgens:

* Roep de ``ToonInfo`` methode aan van ieder computeronderdeel in de lijst aan.
* Roep de ``ToonInfo`` methode aan van ieder computeronderdeel met een prijs boven de 400.
* Idem nu voor alle onderdelen die in een doos zitten.
* Idem nu voor alle onderdelen die een even ID hebben én wiens prijs onder de 200 ligt.

Tussen iedere filter toon je op het scherm wat de volgende lijst juist voorstelt (bv "Nu tonen we alle onderdelen in een doos").

## Managen

Vraag nu aan de gebruiker wat er met de lijst moet gebeuren:

1. Alle objecten in een doos verwijderen
2. Alle objecten met een prijs kleiner dan 100 verwijderen.

Toon het resultaat van de aangepaste lijst (door de ``ToonInfo`` van ieder object in de lijst aan te roepen.)

## Finale

Kan je hier een volledige applicatie van maken die een computerfirma als een soort inventaristool kan gebruiken? (en dus met de nodige menu's en mogelijkheden om bijvoorbeeld een nieuw onderdeel toe te voegen.) Kijk zeker eens naar volgende oefening daaromtrent.

{% hint style='tip' %}
Dit soort "de array als inventaris"-oefeningen waarbij je allerlei zaken met die array moet doen zijn geliefkoosde oefeningen en zal je vaak zien terugkomen.
{% endhint %}

# Pokédex

Maak een eenvoudige Pokédex (een *"bibliotheek van pokémon"*) die als volgt werkt. De gebruiker kan kiezen uit 5 menu-opties:

1. Voeg Pokémon toe. Deze optie zal een random Pokémon object aanmaken en achteraan de Pokédex toevoegen.
2. Toon Pokédex. Deze optie zal alle pokémon in de pokédex op het scherm tonen door de ShowInfo methode van ieder object in de lijst aan te roepen.
3. Remove random: deze optie zal een pokémon op een willekeurige plek in de lijst verwijderen.
4. Verwijder alles: deze optie zal de pokédex leeg maken.
5. Stoppen: het programma sluit af.

Het menu blijft getoond worden tot de gebruiker de optie 5 kiest.

## Pokédex++ (PRO)

Bekijk het voorbeeld in [dit artikel](https://apwt.gitbook.io/ziescherper/appendix/strings#uitgewerkt-met-pokemon). Kan je je pokédex van zonet integreren met deze informatie?


# Student Organizer

We gaan nu de Student-klasse uit een vorige hoofdstuk (zie onderaan de opgave) gebruiken om een ``List<Student>`` van studenten te vullen.

Maak daarom een studenten-lijst aan die 5 studenten bevat :

Initialiseer alle properties van iedere student op een standaard-waarde via de default constructor.
 
Het programma start op en geeft de gebruiker een menu waaruit kan gekozen worden:

1. Student gegevens invoeren (eerstvolgende student wordt ingevuld)
Vervolgens moet de gebruiker kiezen welke student (nummer) moet ingevuld worden, van 1 tot 5. Vervolgens kan de gebruiker de gegevens 1 voor 1 invullen (oude gegevens worden zonder pardon overschreven).

 
2. Student gegevens tonen (alle studenten)
Wanneer de gebruiker voor 2 kiest dan wordt de GeefOverzicht-methode aangeroepen van iedere student zodat de 5 ‘rapportjes’ onder elkaar op het scherm 

Extra's:
Bouw extra functionaliteit naar keuze bij de StudentOrganizer, zoals:
* Vragen aan de gebruiker of de oude gegevens overschreven mogen worden, indien deze reeds ingevuld zijn.
* Inbouwen van een eenvoudige zoekfunctie. Je kan bijvoorbeeld zoeken op naam (exacte invoer) of alle studenten tonen die in een bepaalde klas zitten of wiens punten onder/boven een bepaalde waarde zitten. Je kan dit als extra menuitem inbouwen, waarbij een nieuw menu verschijnt dat de gebruiker de verschillende zoekmogelijkheden voorstelt.
* Verwijderen van een student (waarbij alle gegevens worden gewist)
* Controle in alle methode inbouwen zodat ‘lege studenten’ worden genegeerd. Wanneer bijvoorbeeld menu item 2 wordt uitgevoerd (alle studenten tonen) dan worden enkel de ingevulde studenten getoond.


## StudentKlasse
```java
enum Klassen { EA1, EA2, EA3, EA4}

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

{% hint style='tip' %}
Je kan aan de gebruiker enkel strings als input vragen. Om dus zijn ingevoerde klas om te zetten naar een enum gebruik je ofwel:
a) een switch of if-else structuur die naargelang de invoer een andere enumwaarde toekent aan een enumvariabele
b) (PRO) je gebruikt ``Enum.Parse()`` (vb : ``Klassen mijnKlas= (Klassen)Enum.Parse(typeof(Klassen), "EA2");``)
{% endhint %}

# Bookmark Manager

Maak een "bookmark manager". Deze tool zal in de console aan de gebruiker 5 favoriete sites vragen: ``naam`` en ``url``. Vervolgens zal de tool alle sites in een lijst tonen met een nummer voor. De gebruiker kan dan de nummer intypen en de tool zal automatisch de site in een vereenvoudigde versie op het scherm tonen. 

Je opdracht:

1. Maak een array of ``List`` waarin je 5 bookmark objecten kan plaatsen. 
2. Vul de applicatie aan zodat de gebruiker: een bestaand bookmark kan verwijderen en een bestaand bookmark kan aanpassen

{% hint style='tip' %}
Probeer met behulp van hulpmethoden in Program.cs om zo veel mogelijk code te herbruiken.
{% endhint %}

Enkele zaken die je nodig hebt:

**BookMark klasse:**
```java
class BookMark
{

    public string Naam { get; set; }
    public string URL { get; set; }
    public void ToonSite()
    {
        WebClient wc = new WebClient();
        string result = wc.DownloadString(URL);
        Console.WriteLine(GetPlainTextFromHtml(result));
    }
    //Bron: https://www.mercator.eu/mercator/std/info_aruba/reporting-hoe-gegevens-afdrukken-met-html-tags.html
    private string GetPlainTextFromHtml(string htmlString)
    {
        string htmlTagPattern = "<.*?>";
        var regexCss = new Regex("(\\<script(.+?)\\</script\\>)|(\\<style(.+?)\\</style\\>)", RegexOptions.Singleline | RegexOptions.IgnoreCase);
        htmlString = regexCss.Replace(htmlString, string.Empty);
        htmlString = Regex.Replace(htmlString, htmlTagPattern, string.Empty);
        htmlString = Regex.Replace(htmlString, @"^\s+$[\r\n]*", "", RegexOptions.Multiline);
        htmlString = htmlString.Replace("&nbsp;", " ");
        return htmlString;
    }
}
```


Voorbeeld van hoe de bookmark klasse zal werken:

```java
BookMark u = new BookMark();
u.Naam = "Google";
u.URL = "https://www.google.be";
u.ToonSite();
```

Kan je je eigen "console browser" maken?

# Speelkaarten

Maak een klasse ``Speelkaart`` die je kan gebruiken om een klassieke kaart met getal en "kleur" voor te stellen. 

* Een kaart heeft 2 eigenschappen, een getal van 1 tot en met 13 (boer=11, koningin= 12, heer= 13).
* Een kleur, de zogenaamde suite. Deze stel je voor via een enumtype en kan als waarden Schoppen, Harten, Klaveren of Ruiten zijn.


Schrijf nu 2 loops die de 52 kaarten van een standaard pak in een ``List<SpeelKaart>`` lijst plaatst.

Maak een applicatie die telkens een willekeurige kaart uit de *stapel* trekt en deze aan de gebruiker toont. De kaart wordt na het tonen ook uit de lijst verwijderd. Door met een willekeurig getal te werken hoef je dus je deck niet te schudden.

### OO Textbased game (PRO)

Bij de all-in-one projecten van dit semester vind je als eerst een tekstgebaseerde game ([hier](../A_DEEL2_AllInOne/2_OOTextGame.md)). Volg deze uitleg, maak het spel en voeg je eigen zotte ideeën toe.
