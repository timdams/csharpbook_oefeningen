> Volgende opgave was de vaardigheidsproefopdracht voor 2e zit examen van dit vak (OOP) in augustus 2021.

# Intro

De kinderen van meneer Dams spelen graag Ganzenbord. Laatst toen we speelden vroegen ze zich af of mijn studenten eigenlijk ganzenbord zouden kunnen programmeren?
"Uiteraard!" antwoordde meneer Dams. "Weliswaar een vereenvoudigde versie, maar toch. Ze zouden dat wel kunnen, ja", vulde hij fier aan.

En hier zit je nu dus, opgescheept met het programmeren van de basisfunctionaliteit van ganzenbord voor 1 speler (geen flauw benul hoe ganzenbord werkt? Geen probleem! Alles wordt duidelijk doorheen de opgave!)




\pagebreak

## Ganzenbord single player edition

Ganzenbord, the single player edition, wordt gespeeld door één speler die moet proberen zo ver mogelijk te geraken op een traject van vakjes. Sommige vakjes doen iets met de speler wanneer deze op het vakje belandt (bijvoorbeeld een stapje vooruit), anderen doen niets.

Het bord wordt aan de start van ieder spel random aangemaakt. De speler moet een dobbelsteen werpen om te weten hoeveel stappen z'n pion vooruit zal gaan. De speler verdient punten hoe verder hij geraakt.

# Te maken klassen

## Dobbelsteen (1p)

Deez eenvoudige klasse heeft een statische methode ``Rol`` en geeft een willekeurig getal, namelijk 1, 2 of 3. 

##  Speelvakje (2p)

Het spelbord zal opgebouw worden door een reeks van speelvakjes. Daarom maken we eerst dit vakje.

Een vakje wordt gedefinieerd door:

* Een read-only int-property ``BeweegVakjes``: deze eigenschap geeft aan hoeveel vakjes vooruit (positief) of achteruit (negatief) de speler zal gaan als op dit vakje wordt geland.
* Een default constructor die de ``BeweegVakjes`` instelt op een waarde als volgt:
	* 30% kans op +1 of +2
    * 20% kans op -1 of -2
    * 50% kans op 0
* Een virtuele methode ``ToonVakje`` dat op de huidige locatie van de cursor in de console de ``BeweegVakjes``waarde van het vakje op het scherm schrijft. 

\pagebreak

## Ganzenbord (2p)

Een ganzenbord heeft altijd een lijst,``SpeelVakjes`` van 10 ``Speelvakje``-objecten. Deze zijn niet publiek zichtbaar.

Een ganzenbord heeft:

* Een default constructor die de lijst vult met 10 ``Speelvakje``-objecten.
* Een instantievariabele ``pionIndex`` die aangeeft op welke vakje in de lijst de speler zich momenteel bevindt. 
* Een autoproperty ``HuidigeScore`` die standaard op 0 staat.
* Een methode ``BeweegPion`` die een ``int`` als parameter aanvaardt en een ``bool`` teruggeeft. De werking van de methode wordt verderop uitgelegd.
* Een methode ``TekenBord`` die het ganzenbord op het scherm toont zoals verderop uitgelegd.

### BeweegPion (2p)

Deze methode zal de speler voortbewegen op het bord en laten weten of de speler het einde heeft gehaald heeft of niet.

De speler kan een getal (het getal dat hij met de dobbelsteen verderop zal rollen) aan deze methode meegeven zodat het volgende gebeurt:

De ``pionIndex`` wordt verhoogd met het getal dat wordt meegeven, vervolgens: 

* Indien ``pionIndex`` hierdoor hoger wordt dan 9 en dus voorbij het laatste vakje wordt gegaan, dan wint de speler en wordt eerst de ``HuidigeScore`` met 10 verhoogd en wordt vervolgens ``true`` teruggegeven om aan te geven dat de speler gewonnen is.
* Indien ``pionIndex`` eindigt op een getal 8 of lager, dan gebeurt het volgende:
    * In de lijst van ``SpeelVakje``-objecten wordt gekeken op welk vakje de speler is aangekomen. De ``BeweegVakjes`` waarde van dit vakje wordt bijgeteld of afgetrokken van ``pionIndex``. Dit wordt de nieuwe locatie van de speler. Er gebeurt niets meer na het belanden op dit nieuwe vakje (ook al is het een vakje waar vooruit of achteruit zou moeten gegaan worden). 
    * De methode geeft ``false`` terug indien ``pionIndex`` terug een getal tussen 0 en 8 wordt, anders ``true`` indien hoger dan 8 (hij is dan gewonnnen-. Indien de speler op een index onder 0 belandt wordt ``false`` teruggegeven, wordt de score met 10 verlaagd én wordt de ``pionIndex`` finaal op 0 teruggezet (reset), ongeacht waar de speler op negatief belandde.

### TekenBord (2p)

Deze methode zal de 10 vakjes naast elkaar op het scherm visualiseren door de lijst ``SpeelVakjes`` te overlopen en van ieder object de ``ToonVakje`` methode aan te roepen.
Vervolgens wordt de ``pionIndex`` locatie gebruikt om dat vakje op het scherm te overschrijven met een 

Indien de speler dus op index 3 zit van een willekeurig bord, dan kan de output zijn:

```text
-121T00-2110
```



# Main spelloop (3p)

De main spelloop werkt als volgt:

* Een nieuw ``Ganzenbord`` object wordt aangemaakt.
* Een loop wordt gestart die blijft duren tot de speler aan het einde geraakt. Deze loop doet het volgende:
  * Het scherm wordt leeggemaakt.
  * Het spelbord wordt getoond mbv van de ``TekenBord`` methode.
  * Een nieuw getal wordt met de ``Rol`` methode van de dobbelsteen gerold. Dit getal wordt op het scherm getoond , onder het spelbord ``Je rolde 2``
  * De loop pauzeert nu tot de gebruiker op enter duwt.
  * Het gerolde getal wordt aan de  ``BeweegPion``-methode meegeven en het resultaat van die methode wordt gebruikt om te bepalen of de loop nog een iteratie zal doen of niet.
* Finaal wordt de ``HuidigeScore`` van de speler getoond.

# Uitbreiding (4p)

Voeg volgende uitbreidingen toe nadat je een werkend geheel hebt.

Maak een klasse ``KleurVakje`` dat overerft van ``SpeelVakje``

Dit vakje doet alles wat een gewoon vakje doet, het zal enkel de ``ToonVakje`` method aanvullen zodat het huidige vakje een rode achtergrond met witte letters heeft indien de ``BeweegVakjes`` waarde negatief is. Anders groen met zwarte letters bij positieve of waarde  0.

Aan de start van het spel wordt aan de speler gevraagd of hij de kleuren of zwartwit versie van het spel wil spelen.

Voeg een overloaded constructor aan ``GanzenBord`` toe die een bool aanvaardt. Deze bool geeft aan of de speler een kleuren of klassiek zwart/wit speelbord wil gebruiken. Afhankelijk van deze parameter wordt dan het juiste soort vakjes in de ``SpeelVakjes`lijst geplaatst.

Bij het opstarten van het spel vraag je aan de gebruiker of hij de kleur of de zwartwit versie van Ganzenbord wil spelen.

# Kwaliteit code (2p)


