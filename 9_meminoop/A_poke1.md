{% hint style='tip' %}
Er zijn geen aparte Exception handling oefeningen. De bedoeling is dat je zelf steeds in je oefening naar een goede plek(ken) zoekt waar deze kan toegepast worden.
{% endhint %}


# Meetlat

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H2_Meetlat).
{% endhint %}

Maak een klasse ``Meetlat``. Via een write-only property ``BeginLengte`` kan de gebruiker de lengte van een voorwerp instellen (in meter, type ``double``) van de instantievariabele ``lengte``.
 
Via een reeks read-only properties (die transformeren) kan de gebruiker deze lengte in verschillende eenheden uitlezen namelijk (alles van type ``double``):

* ``LengteInM``
* ``LengteInCm``
* ``LengteInKm``
* ``LengteInVoet`` (1m= 3.2808ft)

Voorbeeld gebruik van klasse:

```java
Meetlat mijnLat = new Meetlat();
mijnLat.BeginLengte = 2;
Console.WriteLine($"{mijnLat.LengteInM} meter is {mijnLat.LengteInVoet} voet.");
```



# Pokémon

We gaan een programma schrijven dat ons toelaat enkele basis-eigenschappen van specifieke Pokémon te berekenen terwijl ze levellen.
Nadruk van deze oefening is het juist gebruiken van properties. Bekijk de cheat sheet bij twijfel.  

{% hint style='tip' %}
Disclaimer: de informatie in deze tekst is een vereenvoudigde versie van de echte Pokémon-stats in de mate dat ik het allemaal een beetje kon begrijpen en juist interpreteren.
{% endhint %}

## Hoe Pokémon werken

Korte uitleg over Pokémon en hun interne werking: Iedere Pokémon wordt uniek gemaakt door z’n base-stats, deze zijn voor iedere Pokémon anders. Deze base-stats  (punt 3) zijn onveranderlijk en blijven dus doorheen het hele leven van een Pokémon dezelfde. Je kan de base-stats als het dna van een Pokémon beschouwen.

De full-stats (punt 9) zijn echter de stats die de effectieve ‘krachten’ van een Pokémon bepalen in een gevecht. Deze stats worden berekend gebaseerd op de vaste base-stats en het huidige level van de Pokémon. Hoe hoger het level van de Pokémon, hoe hoger dus zijn full-stats. 

![Pokémon](../assets/6_klassen/Pokémons.png)


![](../assets/infoclip.png)
* [Meer uitleg bij bovenstaande tekening](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=245f5d03-dbe4-49d9-b9e9-ab720084b984)



## De Pokémonopdracht

{% hint style='tip' %}
[Maak je oplossing in een kopie van volgende solution met bijhorende unittests](https://github.com/timdams/ZIESCHERPER_TESTS_H2_PokémonsBasic).

Merk op dat enkel de basis aspecten tot en met de sectie "Level-gebaseerde stats" getest worden.
{% endhint %}


Maak een consoleapplicatie met daarin een klasse Pokémon die de werking zoals hierboven beschreven heeft:

### Base-stats
De base-stats worden als ``int`` bewaard. Maak voor al deze basis-eigenschappen full properties, namelijk:

* ``HP_Base``
* ``Attack_Base``
* ``Defense_Base``
* ``SpecialAttack_Base``
* ``SpecialDefense_Base``
* ``Speed_Base``

### Extra stats

Voorts wordt een Pokémon ook gedefinieerd door z’n Naam (``string``), Type (string, bv. ``grass & poison``) en Nummer (``int``), maak hiervoor auto properties aan.

> Met ``Nummer`` bedoelen we de Pokémon index die je in de Pokédex kunt opzoeken. Zo heeft Bulbasaur nummer 1 en Pikachu heeft 25. 

{% hint style='tip' %}
Nog een goede reden nodig om met ``enum`` te werken? Het Type van een Pokémons zou je eigenlijk beter met een enum datatype kunnen doen dan met een string. 
{% endhint %}


### Level

Voeg een fullproperty ``Level`` toe (``int``). Deze heeft een public get, maar een private setter.

Voeg een publieke methode ``VerhoogLevel`` toe. Deze methode zal, via de private setter van ``Level``, het level van de Pokémon met 1 verhogen. Deze methode heeft géén parameters nodig en return'd niets.

### Statistieken

Voeg 2 read-only properties toe (enkel get, géén set) genaamd ``Average`` (``double``) en ``Total`` (``int``):

* De ``Average``-property geeft het gemiddelde van de 6 base-stats terug, dus ``(HP_Base + Attack_Base + Defense_Base + SpAttack_Base + SpDefense_Base +Speed_Base)/6``.

* De ``Total``-property geeft de som terug van de 6 basestats. Daar de base stats niet evolueren met het level veranderen dus ``Average`` en ``Total`` ook niet van zodra de base-stats werden ingesteld, toch mag je beide statistieken steeds herberekenen in de get.

{% hint style='tip' %}
Merk op dat je voor deze twee properties dus geen instantievariable nodig hebt. Dit geldt ook voor de hier na beschreven "level-gebaseerde stats".
{% endhint %}

### Level-gebaseerde stats

De eigenschappen van de Pokémon **die mee evolueren met het level** gaan we steeds als read-only properties van het type ``int`` implementeren:

* Voeg een read-only property ``HP_Full``  toe om de maximum health voor te stellen. Deze wordt berekend als volgt: ``( ( (HP_Base + 50) * Level) / 50) + 10 `` wanneer de get wordt aangeroepen.
* Voeg voor iedere  ander base-stat een *XX_Full* readonly property toe . Dus ``Defense_Full``, ``Speed_Full``, etc. Ook deze properties zijn readonly. Deze stats worden berekend als volgt: ``( (stat_Base*Level) / 50 ) + 5``.
Attack_Full bijvoorbeeld wordt dus berekend als: ``( (Attack_Base * Level) / 50) + 5``

{% hint style='tip' %}
Merk op dat de formules enkel met ``int`` werken. Het effect hiervan zal zijn dat je full-stats niet per level veranderen, maar pas om de paar levels, daar we informatie "verliezen" door in de deling met ``int`` te werken.
{% endhint %}

### Maak enkele Pokémon

Kies enkele Pokémon uit [deze lijst](https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_base_stats) en maak in je Main enkele Pokémon-objecten aan met de juiste eigenschappen.

Opgelet: **Je dient dus enkel de base stats in te stellen. Alle andere zaken zijn op deze stats en het huidige level van de Pokémon gebaseerd**.

Toon aan dat de ``Average``, ``Total``, ``HP`` en andere stats correct berekend worden (controleer in de tabel op de voorgaande url). 

{% hint style='tip' %}
De volgende stats zouden steeds hetzelfde moeten zijn: ``Average``, ``Total``, ``Naam``, ``Nummer``, ``Type`` en de base_stats.

De volgende stats zouden moeten veranderen naarmate je levelt: level-gebaseerde stats en ``Level``. 
{% endhint %}

#### Level-up tester

Maak een kleine loop die je toelaat om per loop een bepaalde Pokémon z’n level met 1 te verhogen en vervolgens toon je dan z’n nieuwe stats.

Test eens hoe de stats na bv 100 levels evolueren. Je zal zien dat bepaalde stats pas na een paar keer levelen ook effectief beginnen stijgen.

**Voeg extra functionaliteit toe naar keuze.**

## Deel 2: De Pokémontester

{% hint style='tip' %}
Bekijk zeker eerst of jouw Pokémons oplossing juist is (vergelijk met de oplossing in deze cursus) voor je verder gaat.
{% endhint %}


Het is een heel gedoe om telkens manueel de informatie van een Pokémon op het scherm te outputen. Voeg een methode ``public void ShowInfo()`` toe aan je Pokémons klasse. Deze methode zal alle relevante informatie (alle properties!) in een mooie vorm op het scherm tonen, bv:


```text
Pikachu (level 5)
Base stats:
    * Health = 56
    * Speed = 30
    etc
Full stats:
    * Health = 100
    etc.
```

Maak nu een nieuwe console-applicatie genaamd "Pokémon Tester":

1. Voeg je ``Pokémons``-klasse-bestand toe aan dit project. Verander de "namespace" van dit bestand naar de namespace van je nieuwe console-applicatie .
2. Maak enkele Pokémon objecten aan en stel hun base stats in.
3. Schrijf een applicatie die aan de gebruiker eerst de 6 base-stats vraagt. Vervolgens wordt de Pokémon aangemaakt met die stats en worden de full-stats aan de gebruiker getoond.
4. Vraag nu aan de gebruiker tot welke level de Pokémon moet gelevelled worden. Roep zoveel keer de LevelUp-methode aan van de Pokémon. (of kan je dit via een parameter doorgeven aan ``LevelUp``?!)
5. Toon terug de full-stats van de nu ge-levelde Pokémon.

## Deel 3: Pokémon-battler

### Pokémon generator

Maak een methode met volgende signatuur: ``static Pokémons GeneratorPokémons()``. Plaats deze methode *niet* in je Pokémon-klasse, maar in  Program.cs.

Deze methode zal telkens een Pokémon aanmaken met willekeurige base-stats. Bepaal zelf hoe je dit gaat doen.

### Battle tester

Voeg een methode met volgende signatuur toe aan je hoofdprogramma (dus ook weer in Program.cs):
``static int Battle(Pokémons poke1, Pokémons poke2)``.

De methode zal een getal teruggeven dat aangeeft welke van de twee Pokémons een gevecht zou winnen. 1= poke1, 2 = poke2, 0 = gelijke stand.

Controleer steeds of 1 of beide van de meegegeven Pokémons niet ``null`` zijn. Indien er 1 ``null`` is dan wint uiteraard de andere. Indien allebei ``null`` wint niemand (dus return je 0). Test of dit werkt!

Bepaal zelf hoe Pokémons vechten (bv. degene met de hoogste average van full-stats). Werk niet enkel met de base-stats, daar deze constant zijn. Het is leuker dat het level ook een invloed heeft (maar ga niet gewoon het level vergelijken).

### Alles samen

Genereer 2 willekeurige Pokémons met je generator en laat ze vechten met je battle-methode. Toon wat output aan de gebruiker zodat hij ziet wat er allemaal gebeurt (en gebruik zeker de ``ShowInfo`` methode om dit snel te doen). Kan je dit in een loop zetten en wat leuker maken met Pokémons die telkens levelen als ze een gevecht winnen?!

### Meer info
Voor de volledige info over Pokémon hun stats. [Klik hier.](https://bulbapedia.bulbagarden.net/wiki/Statistic "Stats Pokémon")


# Bankmanager 2

Breidt de bankmanager oefening uit het vorige hoofdstuk uit met volgende functionaliteiten:
* Voorzie Exception Handling op alle plaatsen waar potentiële problemen kunnen opdoeken.
* Voorzie in je programma een methode ``SimuleerOverdracht``. Je kan aan deze methode 2 ``Rekening`` objecten meegeven. Vervolgens zal de methode 5x een willekeurig bedrag van de ene naar de andere rekening sturen, hierbij wisselen de rekeningen om de beurt wie verzender en wie ontvanger is. Wanneer de methode klaar is wordt er niets teruggestuurd.
* Maak een methode ``CreeerTienerRekening`` in je programma. Deze methode geeft een nieuwe rekening terug waar de balans reeds op 50 staat. De methode aanvaardt 1 parameter: de naam van de klant, dat vervolgens in het nieuwe object wordt ingesteld. 
