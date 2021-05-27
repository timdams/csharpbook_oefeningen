# Dierentuin advanced
Voeg een filter toe aan de dierentuin applicatie uit [een eerder hoofdstuk](../13_advancedovererving/A_Practica.md):

* Filter praten: er wordt gevraagd welke dieren moeten praten (Koe, Slang of Varken) vervolgens zullen enkel die dieren praten (tip: "is" operator uit les van gisteren)

# Pokemons vergelijken
Implementeer de ``Equals`` methode (via ``override``) in je ``Pokemon`` klasse. Twee Pokémons zijn dezelfde indien volgende zaken gelijk zijn:

* Basis stats
* Naam
* Level



# Een eigen huis

Gebruik compositie én overerving om een klasse ``Huis`` te voorzien van enkele kamers, waarbij iedere kamer een klasse op zich is (denk aan ``BadKamer``, ``Salon``, etc). Alle kamers erven over van de klasse ``Kamer``.
Iedere kamer heeft een oppervlakte (in vierkante meter), een naam en prijs. Standaard is de prijs van een kamer 400euro, maar mogelijke child-klassen zullen deze property soms overriden:

Maak minstens volgende klassen:

* Badkamer: kost 500 euro
* Gang: kost 10euro per vierkante meter dat deze kamer groot is
* Salon: kost 300 euro indien er geen schouw aanwezig is (via ``bool`` bijhouden) anders 500euro


De klasse ``Huis`` heeft een array van kamers. De klasse heeft ook een methode ``BerekenPrijs`` die de totale prijs van het huis berekent gebaseerd op de prijzen van iedere kamer in de array.

Test je klasse door enkele huizen te maken en er enkele kamers in te plaatsen (bepaal zelf hoe je de kamers aan het huis toevoegt: via methode, constructor, etc) en vervolgens de prijs ervan te tonen.


## Mapmaker

Voorzie een ``Teken`` methode die een huis kan tekenen, gebruikmakend van de ``Teken``-methoden van de kamers. Hiervoor dien je een ``X`` en ``Y`` coördinaat per , alsook lengtes en breedter per huis én kamer te hebben zodat je deze op de juiste plekken op het scherm kan plaatsen.

Kan je ervoor zorgen dat een architect nieuwe kamers kan toevoegen en verwijderen?

# Magic
Bekijk de vraag en het goedgekeurde antwoord op [volgende pagina](https://stackoverflow.com/questions/20524837/card-game-architecture-for-cards)

Kan je de manager aanpassen zodat deze niet met ``card1`` en ``card2`` werkt, maar met een ``List<Card>``.

Voeg zelf enkele kaarten toe en verzin ook enkele afgeleide ``Card``-types  , bv ``Land`` en ``Artifact``.

# Mapmaker

Begin aan het all-in-project  "[Map Maker](../A_DEEL2_AllInOne/1_MapMapker.md)". Stop aan de sectie interfaces (die je pas in volgend hoofdstuk zult leren gebruiken).
