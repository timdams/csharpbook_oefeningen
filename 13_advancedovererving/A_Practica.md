{% hint style='tip' %}
Nu je overerving in de vingers krijgt, is het tijd om de ingebouwde "Class designer" van Visual Studio eens te bekijken. Volgende kennisclip toont hoe je deze handige tool kunt installeren en gebruiken:
[Class diagram en de class designer in Visual Studio](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=4d0a4b76-eed7-45e3-ba3f-ae8500fd94e9)
{% endhint %}

# Extra ToString aan bestaande projecten
Voeg ToString toe aan bestaande van volgende projecten. Ik raad aan dat je dit even test in een nieuwe applicatie waarin je de bestaande klasse even toevoegt en niet de hele main overneemt.

## Pokémon extra

Implementeer de ToString() methode in je ``Pokemon`` klasse zodat deze z'n full stats toont wanneer je schrijft:

```csharp
Console.WriteLine(myPokemon);
```

## Bookmark extra

Implementeer de ToString() methode in zowel de ``Bookmark`` als de ``HiddenBookmark`` klasse. Bij bookmark moet de output bestaan uit de titel van de site, gevolgd door de url tussen haakjes, bv:

```text
Google (www.google.com)
```

Bij ``HiddenBookmark`` wordt er achteraan nog "---HIDDEN---" gezet:


```text
Reddit (www.reddit.com)  ---HIDDEN---
```

Zorg ervoor dat er géén dubbele code in HiddenBookmark staat (tip: ``base()``).


# Boek (*Essential*)

Maak een klasse ``Boek``  en gebruik auto-properties voor de velden:

* ISBN (``long``)
* Titel (``string``)
* Auteur (``string``)
 
Maak voorts een full property voor ``Prijs`` (``double``)

Maak een child-klasse die van ``Boek`` overerft genaamd ``TekstBoek``. Een ``TekstBoek`` heeft één extra property:

* ``SchoolGraad`` (``int``)

Maak een child-klasse die van ``Boek`` overerft genaamd ``KoffietafelBoek``. Deze klasse heeft geen extra velden.


Voorts kunnen boeken "opgeteld" worden om als omnibus uitgebracht te worden. De titel wordt dan "Omnibus van X". waarbij X de Auteurs bevat, gescheiden met een komma. De prijs van een Omnibus is steeds de som van beide boeken gedeeld door 2. **Schrijf een ``static`` methode ``TelOp`` die twee ``Boek`` objecten als parameter aanvaardt en als returntype een nieuw ``Boek`` teruggeeft.** Deze methode voeg je toe aan de klasse ``Boek``

In beide child-klassen, override de ``Prijs``-setter zodat:
a)	Bij ``TekstBoek`` de prijs enkel tussen 20 en 80 kan liggen
b)	Bij ``KoffietafelBoek`` de prijs enkel tussen 35 en 100 kan liggen

{% hint style='tip' %}
PRO:  Bekijk gerust de appendix indien je wilt weten hoe je de ``+`` operator kunt overriden om boeken op te tellen.
{% endhint %}

* Zorg ervoor dat boeken de ``ToString`` overriden zodat je boekobjecten eenvoudig via ``Console.WriteLine(mijnBoek)`` hun info op het scherm tonen. Ze tonen deze info als volgt: "Titel - Auteur (ISBN) _ Prijs"  (bv The Shining - Stephen King (05848152) _ 50)


Maak boeken aan van de 3 klassen, toon dat de prijs niet altijd zomaar ingesteld kan worden.

# Money, money, money (*Essential*)
Maak enkele klassen die een bank kan gebruiken (of hergebruik je ``BankManager`` code uit hoofdstuk 1)

1. Abstracte klasse ``Rekening``: deze bevat een methode ``VoegGeldToe``  en ``HaalGeldAf``. Het saldo van de rekening wordt in een private variabele bijgehouden (en via de voorgaande methoden aangepast) die enkel via een read-only property kan uitgelezen worden. Voorts is er een abstracte methode ``BerekenRente`` de rente als double teruggeeft.
2. Een klasse ``BankRekening`` die een Rekening is. De rente van een BankRekening is 5% wanneer het saldo hoger is dan 100 euro, zoniet is deze 0%. 
3. Een klasse ``SpaarRekening`` die een Rekening is. De rente van een SpaarRekening bedraagt steeds 2%.
4. Een klasse ``ProRekening`` die een SpaarRekening is. De ProRekening hanteert de Rente-berekening van een SpaarRekening (``base.BerekenRente``) maar zal per 1000 euro saldo nog eens 10 euro verhogen. 

Schrijf deze klassen en toon de werking ervan in je main.




# Geometric figures (*Essential*)

Maak een abstracte klasse ``GeometricFigure``. Iedere figuur heeft een hoogte, breedte en oppervlakte. Maak autoproperties voor van ``Hoogte`` en ``Breedte``. De ``Oppervlakte`` is een read-only property want deze wordt berekend gebaseerd op de hoogte en breedte. Deze berekening gebeurt in de methode ``BerekenOppervlakte``: deze roep je met andere woorden aan in de getter van ``Oppervlakte`` en dat resultaat geeft de getter terug 

{% hint style='warning' %}
Let er dus op dat ``Oppervlakte`` enkel een getter heeft. Een Setter schrijven zou vreemde bugs geven: wat als de gebruiker de Oppervlakte van de figuur zo aanpast, maar wel andere hoogte en breedte heeft ingesteld? Je zou dan een foute oppervlakte krijgen daar die niet berekend wordt.
{% endhint %}

Voorzie een abstracte methode ``BerekenOppervlakte`` die een int teruggeeft.

Maak 3 klassen:

* Rechthoek: erft over van GeometricFigure. Oppervlakte is gedefinieerd als ``breedte * hoogte``.
* Vierkant: erft over van Rechthoek. Voorzie een constructor die lengte en breedte als parameter aanvaard: deze moeten gelijk zijn, indien niet zet je deze tijdens de constructie gelijk. Voorzie een 2e constructor die één parameter aanvaardt dat dan geldt als zowel de lengte als breedte. Deze klasse gebruikt de methode BerekenOppervlakte van de Rechthoek-klasse.
* Driehoek: erft over van GeometricFigure. Oppervlakte is gedefinieerd als ``breedte*hoogte/2``.

Maak een applicatie waarin je de werking van deze klassen aantoont


# Dierentuin
Maak een console-applicatie waarin je een zelfverzonnen abstract klasse Dier in een List<Dier> kunt plaatsen. Ieder dier heeft een gewicht en een methode ``Zegt`` (die abstract is) die het geluid van het dier in kwestie op het scherm zal tonen. Maak enkele childklassen die overerven van Dier en uiteraard de ``Zegt`` methode overriden.

Plaats enkele dieren in de nieuw aangemaakt lijst.
Vervolgens verschijnt er een menu Wanneer de gebruiker 'q' kiest stopt het programma.Het keuze menu heeft volgende opties:

1. Dier verwijderen , gevolgd door de gebruiker die invoert het hoeveelste dier weg moet uit de List.
2. Diergewicht gemiddelde: het gemiddelde van alle dieren hun gewicht wordt getoond
3. Dier praten: alle dieren hun Zegt() methode wordt aangeroepen en via WriteLine getoond
4. Opnieuw beginnen: de List wordt leeggemaakt en het programma zal terug van voor af aan beginnen. Waarbij de lijst terug gevuld wordt met enkele start dieren.

Probeer zo modulair mogelijk te werken.
