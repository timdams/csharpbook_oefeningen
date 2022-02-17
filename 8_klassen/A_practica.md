# Klassen objecten introductie

## Week 1



### RapportModule

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_RapportModule).

Hoe dit werkt? [Bekijk zeker eerst dit filmpje](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=a79f075c-7ac7-4a66-97d4-ae2a00dca02a)
{% endhint %}

Ontwerp een klasse ``Rapport`` die je zal tonen wat je graad is gegeven een bepaald behaald percentage. Het enige dat je aan een ``Rapport``-object moet kunnen geven is het behaalde percentage (int) dat wordt bijgehouden via een auto-property genaamd ``Percentage``. Via een methode ``PrintGraad`` kan de behaalde graad weergegeven worden, gebaseerd op dit percentage. Dit zijn de mogelijkheden:

* Minder dan 50%: ``"Niet geslaagd"``.
* Tussen 50% en 68% (68 incl.): ``"Voldoende"``.
* Tussen 68% en 75% (75 incl.): ``"Onderscheiding"``.
* Tussen 75% en 85% (85 incl.): ``"Grote onderscheiding"``.
* Meer dan 85%: ``"Grootste onderscheiding"``.

Test je klasse door enkele objecten in je ``main`` en te onderzoeken of deze de juiste graden op het scherm printen. Bijvoorbeeld:

```java
Rapport mijnpunten = new Rapport();
mijnpunten.Percentage = 65;
mijnpunten.PrintGraad();
```

Werkt het naar behoren?! Voer nu de bijhorende unit tests uit om alles extra te controleren: Test=> Run All Tests.


### Nummers

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_Nummers).
{% endhint %}

Maak een klasse ``Nummers``. Deze klasse bevat 2 getallen (type ``int``) genaamd ``Getal1`` en ``Getal2`` die via een autoproperty kunnen aangepast worden. Er zijn 4 methoden die telkens een ``int`` teruggeven, behalve ``Quotient`` dat een ``double`` teruggeeft:

* ``Som``: geeft de som van beide getallen terug.
* ``Verschil``: geeft het verschil van beide getallen terug.
* ``Product``: geeft het product van beide getallen terug.
* ``Quotient``: geeft de deling van het eerste door het tweede getal terug; toon een foutboodschap (``"Kan niet delen door 0"``) op het scherm indien er een deling door nul zal gebeuren. Gebruik ``Console.WriteLine`` om deze boodschap in de methode te laten verschijnen en geeft ``0.0`` terug als resultaat.

Toon in je ``main`` aan dat je code werkt.

Volgende code zou bijvoorbeeld onderstaande output moeten geven:

```java
Nummers paar1 = new Nummers();
paar1.Getal1 = 12;
paar1.Getal2 = 34;
Console.WriteLine($"Paar: {paar1.Getal1}, {paar1.Getal2}");

int berekendeSom =  paar1.Som();
Console.WriteLine($"Som =  {berekendeSom}");

Console.WriteLine($"Verschil = {paar1.Verschil()}");
Console.WriteLine($"Product = {paar1.Product()}");
Console.WriteLine($"Quotient = {paar1.Quotient()}");
```

Output:

```text
Paar: 12, 34
Som = 46
Verschil = -22
Product = 408
Quotient = 0,352941176470588
```


### Studentklasse

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_Studentklasse).
{% endhint %}

Maak een nieuwe klasse ``Student``.


Deze klasse heeft 6 autoproperties:

* ``Naam`` (``string``)
* ``Leeftijd`` (``int``)
* ``Klas`` (maak dit van een ``enum``)
* ``PuntenCommunicatie`` (``int``)
* ``PuntenProgrammingPrinciples`` (``int``)
* ``PuntenWebTech`` (``int``)

Voeg aan de klasse een methode ``BerekenTotaalCijfer`` toe. Wanneer deze methode wordt aangeroepen dan wordt het gemiddelde van de 3 punten  teruggegeven als double zodat dit op het scherm kan getoond worden.

Voeg aan de klasse  ook de methode ``GeefOverzicht`` toe. Deze methode zal een volledig "Rapport" van de student tonen (inclusief het gemiddelde m.b.v. de BerekenTotaalCijfer-methode).

Test je programma door enkele studenten aan te maken en in te stellen. Volgende main zou dan de bijhorende output moeten krijgen:

```java
    Student student1= new Student();
    student1.Klas = Klassen.TI1;
    student1.Leeftijd = 21;
    student1.Naam = "Joske Vermeulen";
    student1.PuntenCommunicatie = 12;
    student1.PuntenProgrammingPrinciples = 15;
    student1.PuntenWebTech = 13;

    student1.GeefOverzicht();
```

Output:

```text
Joske Vermeulen, 21 jaar
Klas: TI1

Cijferrapport:
**********
Communicatie:             12
Programming Principles:   15
Web Technology:           13
Gemiddelde:               13.3
```

### PizzaTime

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_PizzaTime).
{% endhint %}

Maak een klasse Pizza. Deze klasse heeft een aantal instantievariabelen:

* ``toppings`` (``string``): bevat beschrijving van wat er op ligt, bv. ananas, peperoni, etc.
* ``diameter`` (``integer``): doorsnede van de pizza in cm.
* ``price`` (``double``): prijs van de pizza in euro.

Zorg ervoor dat je met behulp van full properties (met dezelfde namen, maar met hoofdletter) deze 3 velden kan uitlezen en aanpassen. 

Bouw controle in zodat de instantievariabelen geen foute waarden kunnen gegeven worden: 
* geen negatieve price en diameter
* pizza zonder toppings is niet toegestaan (toppings mag geen lege string zijn). 

Indien een niet toegestane waarde aan een property wordt gegeven dan wordt deze gewoon genegeerd en gebeurt er verder niet (de property, en dus instantievariabele, behoudt met andere woorden de waarde die het ervoor al had).

Maak in je main een aantal pizza-instanties aan en toon de werking van de properties aan.

### Figuren


{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_Figuren).
{% endhint %}

Maak een eenvoudige klasse ``Rechthoek`` aan die een lengte en breedte als private instantievariabelen heeft (type ``int``). Deze kunnen enkel via full properties ingesteld worden en nooit onder 1 gaan.

Maak ook een klasse ``Driehoek`` die een basis en hoogte als instantievariabelen (type ``int``) heeft en bijhorende full props. 

Beide klassen hebben een methode ``ToonOppervlakte`` die de oppervlakte van de figuur in kwestie op het scherm toont.

Toon de werking van het project aan door een aantal instanties van ``Driehoek`` en ``Rechthoek`` te maken, met verschillende groottes. Roep van iedere figuur de ``ToonOppervlakte``-methode aan.

## Week 2

### Verjaardag
Maak een applicatie die aan de gebruiker z'n geboortedatum vraagt (dag/maand, bv 18/3). Vervolgens toont het programma op welke dag hij volgend jaar jarig zal zijn (Monday, Tuesday, etc.) én hoeveel dagen hij nog moet wachten. Uiteraard gebruik je ``DateTime`` voor deze applicatie.

{% hint style='tip' %}
Je hebt geen eigen klasse nodig. Doel van deze oefening is dat je leert werken met de bestaande ``DateTime`` en ``TimeSpan`` klassen. Je mag dus alles in de main schrijven.
{% endhint %}


{% hint style='tip' %}
Gegeven een object van het type DateTime genaamd ``myDate``. Volgende wat uitgebreide code geeft de naam van de dag terug in de taal van het systeem waarop je applicatie draait:

```java
string dagLokaleTaal = System.Globalization.DateTimeFormatInfo.CurrentInfo.GetDayName(myDate.DayOfWeek)
```
{% endhint %}

Voorbeeld invoer en uitvoer:

```java
Wanneer is je verjaardag (d/m, bv 18/3)
20/5
Je bent over 124 dagen jarig op een Dinsdag
```

### Bibliotheek

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_Bibliotheek).
{% endhint %}

Boeken in een bibliotheek mogen maximum 14 dagen uitgeleend worden.  De klasse ``BibBoek`` heeft volgende informatie:

* ``Ontlener``: De naam van de ontlener (autoproperty type ``string``, beginwaarde = "onbekend")
* ``Uitgeleend``: De datum dat het boek werd uitgeleend ( private get, public set).
* ``InleverDatum``: De datum dat het boek ten laatste terug moet ingeleverd worden (readonly property van het type ``DateTime``): deze geeft steeds een datum terug 14 dagen na de datum die via ``Uitgeleend`` werd ingesteld.

De achterliggende instantievariabele bij ``Uitgeleend`` wordt standaard ingesteld bij de object-creatie op de huidige tijd (``DateTime.Now`` toewijzen aan de achterliggende instantievariabele). Als je dus vergeet de ``Uitgeleend`` property in te stellen later dan heeft deze zeker een waarde.

De klasse heeft ook een methode ``VerlengTermijn`` waar je een parameter type ``int`` aan kunt meegeven. Deze methode werkt als volgt:
De meegegeven waarde stelt het aantal dagen dat het boek extra mag uitgeleend worden. We gaan dit in orde brengen door de de ``Uitgeleend`` waarde met die dagen te verhogen. Als het boek dus was uitgeleend op 18 maart en het wordt verleng met 3 dagen dan maken van van ``Uitgeleend`` 21 maart.

Test je klasse door enkele objecten ervan aan te maken.

### BankManager

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_BankManager).
{% endhint %}

#### Deel 1

We maken een ``Rekening`` klasse die kan gebruikt worden om de bankrekening van een klant voor te stellen. Deze heeft volgende zaken:

* Een instantievariabele van het type ``int`` genaamd ``balans``. Deze variabele houdt het totale bedrag bij dat op de rekening staat.
* 2 autoproperties van type ``string`` namelijk ``NaamKlant`` en ``RekeningNummer``.
* 1 readonly property  ``Balans`` die de balans teruggeeft.

Voorzie 3 methoden:

1. ``HaalGeldAf``: bepaald bedrag (als parameter type ``int``) wordt van de ``balans`` verwijderd.
2. ``StortGeld``: bepaald bedrag (als parameter type ``int``) wordt op de rekening gezet en aan ``balans`` toegevoegd.
3. ``ToonInfo``: het totale bedrag op de rekening wordt getoond op het scherm, alsook de naam van de klant en het rekeningnummer (*ook de staat wanneer je deel 2 hebt gemaakt wordt getoond*).

Pas de ``HaalGeldAf`` methode aan zodat als returntype het bedrag (``int``) wordt teruggegeven. Indien het gevraagde bedrag meer dan de ``balans`` is dan geef je al het geld terug dat nog op de rekening staat en toon je in de console dat niet al het geld kon worden gegeven (error die verschijnt: ``Rekening leeg nu``.)

Maak 2 instanties van het type ``Rekening`` aan en toon aan dat je geld van de ene Rekening aan de andere kunt geven, als volgt:

```java
//rekening 2 geeft 300 euro aan rekening 1
rekening1.StortGeld(rekening2.HaalGeldAf(300));
```

Test je klasse.

1. Nieuwe klant aanmaken
2. Status van bestaande klant tonen 
3. Geld op een bepaalde Rekening zetten 
4. Geld van een bepaalde Rekening afhalen
5. Geld tussen 2 Rekeningen overschrijven

Voorzie extra functionaliteit naar keuze.

##### Deel 2
Voeg aan de ``Rekening``-klasse een autoproperty,genaamd ``Staat``, met private set toe van het type ``RekeningStaat`` toe, dat een enumeratie bevat. De Rekening kan in volgende staten zijn ``Geldig``, ``Geblokkeerd``. Een rekening is Geldig wanneer een nieuwe rekening wordt geopend.

Maak een bijhorende publieke Methode waarmee je de Rekening van staat kunt veranderen. Deze methode (noem ze ``VeranderStaat``) vereist geen parameters. Telkens je ze aanroept wordt de staat omgewisseld. Als dus het object momenteel op ``Geldig`` stond, dan wordt ze nu ``Geblokkeerd`` en omgekeerd.

Indien een persoon geld van of naar een Geblokkeerde rekening wil sturen dan zal er een error op het scherm verschijnen, namelijk ``Gaat niet. Rekening geblokkeerd.``. Idem bij de ``StortGeld`` methode.

Indien de ``HaalGeldAf`` methode wordt aangeroepen en er werd meer geld afgehaald dan de balans dan zal de rekening ook op Geblokkeerd gezet worden na het verschijnen van de foutboodschap ("Rekening leeg nu").



### Persoon

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H1_Persoon).
{% endhint %}

Ontwerp en implementeer een klasse Persoon met 2 autoproperties (``string``) ``Achternaam`` en ``Voornaam``. 

Voeg bovendien een full property ``GeboorteDatum`` toe (type ``DateTime``). De geboortedatum kan enkel waarden tussen 1/1/1990 en vandaag (moment dat code wordt uitgevoerd) liggen. Indien dit niet de situatie is, wordt de huidige datum van uitvoeren gebruikt. 

Definieer vervolgens een methode ``BerekenLeeftijd``, die op basis van de ingestelde geboortedatum en de huidige datum (dat programma wordt uitgevoerd) de leeftijd (als ``int``) van de persoon teruggeeft.  



### Sports

#### Sportspeler

Kies je favoriete sport of game. Maak een klasse aan die een speler uit deze sport kan voorstellen. Verzin een 4-tal private instantievariabelen die deze spelers hebben, alsook 2 methoden die de speler moet kunnen uitvoeren. 

Voorzie een methode ``StelIn`` die je toelaat om de private instantievariabeles in te stellen:

Voorzie ook minstens 1 ``naam`` (``string``) instantievariabele.

Voorzie per instantievariabele ook telkens een full property. Waar nodig zorg je er voor dat er geen illegale waarden kunnen ingesteld worden (bv mutsnummer bij waterpolo gaat maar van 1 tot 13).

Bijvoorbeeld:

* klasse ``Waterpolospeler``
* instantievariabelen:
  * ``spelerNaam``(``string``)
  * ``mutsNummer`` (``int``)
  * ``isDoelman`` (``bool``)
  * ``isReserve``(``bool``)
  * ``reeks`` (``string``, bv "Cadet")

Methoden: ``GooiBal``, ``Watertrappen``, ``StelIn``

De methode ``StelIn`` zou dan zou kunnen aangeroepen worden:

```java
speler1.StelIn("Tim", 5, false, true, "tweedeklas");
```

Wanneer de methoden worden aangeroepen zal er een tekst (mbv Console.WriteLine in de methode) op het scherm verschijnen die bv zegt ``Ik (Jos) gooi de bal``. Waarbij de naam van de speler in kwestie uit het Naam instantievariabele wordt gebruikt om mee getoond te worden.

Maak vervolgens een console-applicatie aan waarin je de werking van de klasse aantoont. Maar in de applicatie een aantal speler-objecten aan, vervolgens stel je hun properties in. Vervolgens roep je enkele methoden van de spelers aan en toon je via (Console.WriteLine) ook de properties van de individuele spelerobjecten.

Toon m.a.w. aan dat je:

* Een klasse kunt maken (in een aparte file!)
* Instanties (objecten) van deze klasse kunt maken
* Kunt werken met deze instanties (properties instellen én uitlezen, aanroepen van methoden)

{% hint style='tip' %}
#### enums

Kan je in voorgaand voorbeeld het instantievariabele ``reeks`` vervangen door een instantievariabele reeks dat een enum als datatype heeft?
{% endhint %}

### Dobbelstenen	

Ontwerp en implementeer een klasse genaamd Dobbelstenen, die twee klassieke D6 dobbelstenen voorstelt. De klasse heeft een ``WerpEnTel6`` methode, waarin 1000 keer met dit paar dobbelstenen wordt gegooid. Bereken hoeveel keer een dubbel zes voorkomt, dit wordt vervolgens getoond op het scherm.

Deze klasse bevat dus niets meer dan deze ene methode. Het lijkt erop alsof je ook dobbelsteencode etc moet implementeren maar dat hoeft dus niet. De methode "gooit" gewoon 1000x na elkaar 2 getallen m.b.v de Random-klasse, telkens die 2 gegooide getallen 6 zijn onthoud je dit.


