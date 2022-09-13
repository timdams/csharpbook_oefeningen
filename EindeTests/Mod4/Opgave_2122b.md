> Volgende opgave was de vaardigheidsproefopdracht voor het inhaalexamen van dit vak (OOP) in augustus 2022

# Inleiding

Na vele jaren vloeken op de roosters, heeft de firma "Roosteren-maar" eindelijk besloten hun roostersoftware aan te passen. Aan jou deze taak om een deftig roosterprogramma te schrijven. Veel succes gewenst!

# Basisklassen

De applicatie bestaat vooreerst uit een aantal elementaire klassen die gebruikt zullen worden om een dagrooster op te stellen.

## Vak

Een vak heeft een titel (type ``string``), een duur (``int``) en een toegewezen lector (type ``Lector``, zie verder). Voorzie de nodige properties hiervoor, wetende dat:
a) de duur enkel 1 of 2 uur kan zijn, niets anders. Controleer hier op.
b) de titel standaard "Onbekend" is.

De klasse override ``ToString`` en toont een object  als volgt: ``Titel - Lector`` (bijvoorbeeld: ``OOP - Jansens``).

Standaard heeft een nieuw gemaakt Vak-object een Lector-object met als naam "Nog Toe te wijzen``.

## Lector

Een lector heeft een naam (``string``) en een maximaal aantal uur (``maxUur``, type ``int``) dat de persoon les kan geven op een week. De  waarde van ```maxUur`` is altijd 6. Voorzie dit via een readonly property. 


## Rooster

Deze klasse heeft een private lijst van Vakken die standaard leeg is. Deze lijst stelt de dagrooster voor en bevat alle vakken van de dag. 

De klasse heeft een property ``VrijeUren``: deze geeft een ``int`` terug en bevat de totale som van alle duren van de vakken in de lijst. Als er dus 2 vakken in de lijst staan, 1 van 1 uur duur, de andere van 2uur duur, dan zal deze property 3 teruggeven (1+2).

De klasse heeft voorts volgende methoden:

a) ``ToonRooster``: deze methode zal ieder vak in de lijst via ``ToString`` op het scherm onder elkaar tonen. Indien een vak 2uur duurt dan zal het vak 2x onder elkaar getoond worden. Voorbeeld output:

```
OOP -Jansens
Programming Principles - DuBru
Programming Principles - DuBru
Java - Gates
```

b) ``VoegVakToe``: deze methode aanvaardt een ``Vak``-object. Dit object wordt aan de lijst toegevoegd indien dat kan. Een rooster kan nooit meer dan 8uur totale duur bevatten (gebruik ``VrijeUren`` hiervoor). Als je dus een vak van 2uur probeert probeert toe te voegen terwijl de roosterlijst reeds 7uur bevat, dan zal dit niet lukken en wordt er een RoosterException teruggegooid (maak deze Exception klasse zelf aan).

c) ``VerbeterRooster``: wanneer deze methode wordt aangeroepen dan zal de lijst met vakken gesorteerd worden volgens 1° hun naam alfabetisch 2° hun duur (lange vakken eerst).

d) ``WijsLectorToe`` : deze methode aanvaart een index x (``int``) en een ``Lector`` object. De methode zal de meegegeven lector toewijzen (en de bestaande overschrijven) aan het vak in lijst met de index "x" die je als parameter hebt meegeven. Indien er geen vak bestaat met die index dan verschijnt er een foutboodschap.


# Specialisatieklassen

## LaboVak

LaboVak is een Vak. Deze zal als ``ToString`` aangeroepen wordt achteraan de titel nog "(labo)" toevoegen. Bijvoorbeeld: ``OOP (labo) - Jansens``.

Deze heeft een constructor waar je een ``Vak``-object aan kan meegeven. De informatie van dit object wordt gebruikt om het LaboVak in te stellen (je neemt dus de duur, lector en titel over uit het object en wijst dit toe aan het huidige LaboVak-object).



Een labovak kan ook 3uur duren en is dus niet beperkt tot 1 of 2 uur duur.

## HalfTijdseLector

Een halftijdse lector kan maar de helft van een gewone lector aan maximale uren ingeroosterd worden.


# Hoofdprogramma

In het hoofdprogramma wordt een lijst van 3 lectoren aangemaakt (kies zelf de namen), waarvan 1 een halftijdselector is.

Maak een applicatie die bovenstaande klassen gebruikt door aan de gebruiker een menu aan te bieden met volgende items (bepaal zelf hoe je de input van de gebruiker gaat verwerken):

* **Toon rooster**: de huidige rooster wordt op het scherm getoond.
* **Voeg vak toe**: de gebruiker dient vervolgens de naam van het vak te geven, de duur, en welke lector (voor de lector geeft hij gewoon de index in, 0, 1 of 2 en gebruik je vervolgens de lector in de lijst die je aanmaakte aan de start van het programma). Indien de gebruiker bij duur 3 ingeeft dan wordt dit vak automatisch een labovak.
* **Verbeter rooster**: dit zal de VerbeterRooster methode aanroepen.
* **Toon labo's**: Enkel de LaboVak-objecten in het rooster worden opp het scherm getoond.

# WeekRooster


Maak een klasse ``WeekRooster``. Deze klasse heeft 5 lijsten van het type ``Vak``, 1 voor iedere weekdag. De klasse heeft een default constructor en zal een random rooster aanmaken door de 5 week-lijsten te vullen met telkens 4 willekeurige ``Vak``-objecten (20% kans op een ``LaboVak``).

De klasse heeft volgende methode:

* **Toon rooster**: deze zal de rooster per dag onder elkaar op het scherm tonen en voor iedere lijst de dag tonen.


Voeg aan het hoofdmenu de optie **Toon weekrooster**. Deze zorgt ervoor dat een ``WeekRooster`` object wordt aangemaakt dat vervolgens op het scherm wordt getoond.