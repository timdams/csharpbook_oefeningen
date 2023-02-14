# Dierentuin advanced
Voeg een filter toe aan de dierentuin applicatie uit [een eerder hoofdstuk](../13_advancedovererving/A_Practica.md):

* Filter praten: er wordt gevraagd welke dieren moeten praten (Koe, Slang of Varken) vervolgens zullen enkel die dieren praten (tip: "is" operator uit les van gisteren)

# Pokémon vergelijken
Implementeer de ``Equals`` methode (via ``override``) in je ``Pokemon`` klasse. Twee Pokémon zijn dezelfde indien volgende zaken gelijk zijn:

* Basis stats
* Naam
* Level

# Een eigen huis (*Essential*)

Gebruik compositie én overerving om een klasse ``Huis`` te voorzien van enkele kamers, waarbij iedere kamer een klasse op zich is (denk aan ``BadKamer``, ``Salon``, etc). Alle kamers erven over van de klasse ``Kamer``.
Iedere kamer heeft een oppervlakte (in vierkante meter), een naam en prijs. Standaard is de prijs van een kamer 400euro, maar mogelijke child-klassen zullen deze property soms overriden. De Prijs is een readonly property (zonder setter, en heeft ook geen achterliggende instantievariabele).

Maak minstens volgende klassen:

* Badkamer: kost 500 euro
* Gang: kost 10euro per vierkante meter dat deze kamer groot is
* Salon: kost 300 euro indien er geen schouw aanwezig is (via ``bool`` bijhouden) anders 500euro


De klasse ``Huis`` heeft een lijst van kamers. De klasse heeft ook een methode ``BerekenPrijs`` die de totale prijs van het huis berekent gebaseerd op de prijzen van iedere kamer in de lijst.

Test je klasse door enkele huizen te maken en er enkele kamers in te plaatsen (bepaal zelf hoe je de kamers aan het huis toevoegt: via methode, constructor, etc) en vervolgens de prijs ervan te tonen.


## Mapmaker

Voorzie een ``Teken`` methode die een huis kan tekenen, gebruikmakend van de ``Teken``-methoden van de kamers. Hiervoor dien je een ``X`` en ``Y`` coördinaat per , alsook lengtes en breedter per huis én kamer te hebben zodat je deze op de juiste plekken op het scherm kan plaatsen.

Kan je ervoor zorgen dat een architect nieuwe kamers kan toevoegen en verwijderen?

# Magic
Bekijk de vraag en het goedgekeurde antwoord op [volgende pagina](https://stackoverflow.com/questions/20524837/card-game-architecture-for-cards)

Kan je de manager aanpassen zodat deze niet met ``card1`` en ``card2`` werkt, maar met een ``List<Card>``.

Voeg zelf enkele kaarten toe en verzin ook enkele afgeleide ``Card``-types  , bv ``Land`` en ``Artifact``.

# Ganzenbord Dams Van Camp editie (*Essential*)

Bordspelen zoals Ganzenbord of Monopoly zijn goede oefeningen om je polymorfisme mee te oefenen. Het speelbord is niet meer dan een lijst van objecten, met ieder vakje een object in die lijst. Echter, sommige vakjes kunnen meer dan andere en je lijst bevat dus objecten van verschillende child-klassen die allemaal overerven van een basisklasse ``Vakje`` of iets dergelijks. Volgende opgave uit een oud examen toont dit. Kan je deze oefening maken?

{% hint style='tip' %}
Volgende opgave komt uit  de vaardigheidsproefopdracht voor 2e zit examen van dit vak (OOP) in augustus 2021.
{% endhint %}

## Intro

De kinderen van meneer Dams en Van Camp spelen graag Ganzenbord. Laatst toen we speelden vroegen ze zich af of mijn studenten eigenlijk ganzenbord zouden kunnen programmeren?
"Uiteraard!" antwoordde meneer Dams. "Weliswaar een vereenvoudigde versie, maar toch. Ze zouden dat wel kunnen, ja", vulde hij fier aan.

En hier zit je nu dus, opgescheept met het programmeren van de basisfunctionaliteit van ganzenbord voor 1 speler (geen flauw benul hoe ganzenbord werkt? Geen probleem! Alles wordt duidelijk doorheen de opgave!)


## Ganzenbord single player edition

Ganzenbord, the single player edition, wordt gespeeld door één speler die moet proberen zo ver mogelijk te geraken op een traject van vakjes. Sommige vakjes doen iets met de speler wanneer deze op het vakje belandt (bijvoorbeeld een stapje vooruit), anderen doen niets.

Het bord wordt aan de start van ieder spel random aangemaakt. De speler moet een dobbelsteen werpen om te weten hoeveel stappen z'n pion vooruit zal gaan. De speler verdient punten hoe verder hij geraakt.

## Te maken klassen

### ``Dobbelsteen`` 

Deze eenvoudige klasse heeft een statische methode ``Rol`` en geeft een willekeurig getal, namelijk 1, 2 of 3. 

###  ``Speelvakje`` 

Het spelbord zal opgebouwd worden door een reeks van speelvakjes. Daarom maken we eerst dit vakje.

Een vakje wordt gedefinieerd door:

* Een read-only int-property ``BeweegVakjes`` (met private set): deze eigenschap geeft aan hoeveel vakjes vooruit (positief) of achteruit (negatief) de speler zal gaan als op dit vakje wordt geland.
* Een default constructor die de ``BeweegVakjes`` instelt op een waarde als volgt:
	* 30% kans op +1 of +2
    * 20% kans op -1 of -2
    * 50% kans op 0
* Een virtuele methode ``ToonVakje`` dat op de huidige locatie van de cursor in de console de ``BeweegVakjes``waarde van het vakje op het scherm schrijft. Indien de waarde positief of 0 is, toon je dit met een + voor. Bijvoorbeeld: +2 of +0. Een negatief toon je met de - , zoals -2.


### ``Ganzenbord`` 

Een ganzenbord heeft altijd een lijst,``SpeelVakjes`` van 10 ``Speelvakje``-objecten. Deze zijn niet publiek zichtbaar.

Een ganzenbord heeft:

* Een default constructor die de lijst vult met 10 ``Speelvakje``-objecten.
* Een instantievariabele ``pionIndex`` die aangeeft op welke vakje in de lijst de speler zich momenteel bevindt. 
* Een autoproperty ``HuidigeScore`` die standaard op 0 staat.
* Een methode ``BeweegPion`` die een ``int`` als parameter aanvaardt en een ``bool`` teruggeeft. De werking van de methode wordt verderop uitgelegd.
* Een methode ``TekenBord`` die het ganzenbord op het scherm toont zoals verderop uitgelegd.

### ``BeweegPion()`` 

Deze methode zal de speler voortbewegen op het bord en laten weten of de speler het einde heeft gehaald heeft of niet.

De speler kan een getal (het getal dat hij met de dobbelsteen verderop zal rollen) aan deze methode meegeven zodat het volgende gebeurt:

De ``pionIndex`` wordt verhoogd met het getal dat wordt meegeven, vervolgens: 

* Indien ``pionIndex`` hierdoor hoger wordt dan 9 en dus voorbij het laatste vakje wordt gegaan, dan wint de speler en wordt eerst de ``HuidigeScore`` met 10 verhoogd en wordt vervolgens ``true`` teruggegeven om aan te geven dat de speler gewonnen is.
* Indien ``pionIndex`` eindigt op een getal 8 of lager, dan gebeurt het volgende:
    * In de lijst van ``SpeelVakje``-objecten wordt gekeken op welk vakje de speler is aangekomen. De ``BeweegVakjes`` waarde van dit vakje wordt bijgeteld of afgetrokken van ``pionIndex``. Dit wordt de nieuwe locatie van de speler. Er gebeurt niets meer na het belanden op dit nieuwe vakje (ook al is het een vakje waar vooruit of achteruit zou moeten gegaan worden). 
    * De methode geeft ``false`` terug indien ``pionIndex`` terug een getal tussen 0 en 8 wordt, anders ``true`` indien hoger dan 8 (hij is dan gewonnnen-. Indien de speler op een index onder 0 belandt wordt ``false`` teruggegeven, wordt de score met 10 verlaagd én wordt de ``pionIndex`` finaal op 0 teruggezet (reset), ongeacht waar de speler op negatief belandde.

### ``TekenBord()``

Deze methode zal de 10 vakjes naast elkaar op het scherm visualiseren door de lijst ``SpeelVakjes`` te overlopen en van ieder object de ``ToonVakje`` methode aan te roepen.
Vervolgens wordt de ``pionIndex`` locatie gebruikt om dat vakje op het scherm te overschrijven met een 'T'

Indien de speler dus op index 3 (het vierde vakje) zit van een willekeurig bord, dan kan de output zijn:

```text
-1+2+1-T+0+0-2+1+1+0
```

Dus het eerste vakje heeft waarde -1, het volgende 2, het derde 1, het vierde zien we niet want daar staat het mannetje (het was was blijkbaar een negatief vakje) en  zien we een T, dan krijgen we twee vakjes met waarde 0.

## Main spelloop

De main spelloop werkt als volgt:

* Een nieuw ``Ganzenbord`` object wordt aangemaakt.
* Een loop wordt gestart die blijft duren tot de speler aan het einde geraakt. Deze loop doet het volgende:
  * Het scherm wordt leeggemaakt.
  * Het spelbord wordt getoond mbv van de ``TekenBord`` methode.
  * Een nieuw getal wordt met de ``Rol`` methode van de dobbelsteen gerold. Dit getal wordt op het scherm getoond , onder het spelbord ``Je rolde 2``
  * De loop pauzeert nu tot de gebruiker op enter duwt.
  * Het gerolde getal wordt aan de  ``BeweegPion``-methode meegeven en het resultaat van die methode wordt gebruikt om te bepalen of de loop nog een iteratie zal doen of niet.
* Finaal wordt de ``HuidigeScore`` van de speler getoond.

## Polymorfisme komt er aan

Voeg volgende uitbreidingen toe nadat je een werkend geheel hebt.

Maak een klasse ``KleurVakje`` dat overerft van ``SpeelVakje``

Dit vakje doet alles wat een gewoon vakje doet, het zal enkel de ``ToonVakje`` method aanvullen zodat het huidige vakje een rode achtergrond met witte letters heeft indien de ``BeweegVakjes`` waarde negatief is. Anders groen met zwarte letters bij positieve of waarde  0.

Aan de start van het spel wordt aan de speler gevraagd of hij de kleuren of zwartwit versie van het spel wil spelen.

Voeg een overloaded constructor aan ``GanzenBord`` toe die een bool aanvaardt. Deze bool geeft aan of de speler een kleuren of klassiek zwart/wit speelbord wil gebruiken. Afhankelijk van deze parameter wordt dan het juiste soort vakjes in de ``SpeelVakjes`lijst geplaatst.

Bij het opstarten van het spel vraag je aan de gebruiker of hij de kleur of de zwartwit versie van Ganzenbord wil spelen.

# Mapmaker "all-in-one-project"

Begin aan het all-in-project  "[Map Maker](../A_DEEL2_AllInOne/1_MapMapker.md)". Stop aan de sectie interfaces (die je pas in volgend hoofdstuk zult leren gebruiken). Je zal in dit project dingen herkennen die je eerder al in de "Een eigen huis" oefening hebt moeten maken. 

# (Pro²) Methoden als objecten

{% hint style='tip' %}
Deze oefening gaat erg ver voorbij de leerstof van dit boek en is enkel bedoeld voor diegene die 'above and beyond' willen gaan in hun kennis.
{% endhint %}

Tot hiertoe hebben we altijd gepraat over enerzijds objecten, en anderzijds methoden. Twee zaken die wel een relatie met elkaar hebben (een klasse kan methoden hebben, een methode kan objecten als parameter of return type hebben). Maar wat als ik je vertel dat je ook methoden als objecten kunt gebruiken. Het concept "delegate" laat ons toe om methoden als parameters doorheen een applicatie door te geven. Hier een droog, maar duidelijk voorbeeld ([bron](https://www.tutorialsteacher.com/csharp/csharp-delegates))

```java
public delegate void MyDelegate(string msg); //declaring a delegate

class Program
{
    static void Main(string[] args)
    {
        MyDelegate del = MethodA; //same as MyDelegate del = new MyDelegate(MethodA);
        del("Hello world");
    }

    static void MethodA(string message)
    {
        Console.WriteLine("Called ClassA.MethodA() with parameter: " + message);
    }
}
```

Vanaf nu kan je de variabele ``del`` als object gebruiken én aanroepen:

```java
del("Hello World!");
```

Of zelfs doorgeven als parameter

```java
static void Main(string[] args)
{
    MyDelegate del = MethodA;
    InvokeDelegate(del);
}

static void InvokeDelegate(MyDelegate del) // MyDelegate type parameter
{
    del("Hello World");
}
```

Omdat delegates al wat oldschool zijn geworden, heeft .NET ook al vele jaren wat meer generieke (en dus bruikbaardere) versies hiervan, namelijk ``Action<T>`` en ``Func<T>``. De werking hiervan legt deze gekende man stap voor stap [uit in deze blog](https://timdams.com/2012/04/19/using-delegates-func-and-lambdas-a-tutorial-with-soldiers/).

**Kan je de hele tekst volgen en de gemaakte finale oefening uitbreiden naar een echte "applicatie"?**
