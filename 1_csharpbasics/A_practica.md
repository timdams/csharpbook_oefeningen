

{% hint style='tip' %}
Het is aanbevolen dat je vanaf nu per hoofdstuk een nieuwe solution aanmaakt op je computer. Per oefening maak je dan best een nieuw project aan dat je in de solution zet. Geef ieder project een duidelijke naam (bv EuroNaarDollar) zodat je later vlot je oefeningen kan terugvinden. Denk er aan dat je je projecten best enkel met cijfers en letters benoemd (dus beter EuroNaarDollar dan Euro-Dollar).

Meer uitleg over Projecten en Solutions en hoe je bovenstaande doet kan je [hier](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=a7eb4973-e87e-49a4-862e-ac47009783d6) terugvinden
{% endhint %}




{% hint style='tip' %}
Indien er in een oefening gevraagd wordt om bijvoorbeeld een getal naar een ander om te zetten (zie oa Euro naar Dollar) dan mag je dit getal in een variabele "hardcoded" plaatsen. We kunnen nog niet input van de gebruiker naar getallen omzetten en kunnen dus nog geen oefeningen maken waarin we dat doen.

Voor Euro naar Dollar schrijf je dus best bijvoorbeeld als eerste:
```java
double euroInput= 5.32;
```
{% endhint %}



## Simple maths
Schrijf een programma dat de uitkomst van volgende resultaten op het scherm toont:


```text
-1 + 4 * 6
( 35 + 5 ) % 7
14 + -4 * 6 / 11
2 + 15 / 6 * 1 - 7 % 2
```

Bewaar het resultaat van iedere opgave in een aparte variabele. Reken op papier of met je calculator na wat het resultaat moet zijn. Toon vervolgens de uitkomst (m.b.v. ``WriteLine``) telkens op het scherm en vergelijk die met je eigen berekening. Begrijp je waar de verschillen zitten (als die er zijn)?! Waarom moet je bij de derde en vierde expressie met double werken en niet bij de eerste 2?.

{% hint style='warning' %}
De % hier is de modulo-operator.
{% endhint %}


## Gemiddelde

Maak 3 variabelen aan van het type ``int`` genaamd ``september``, ``oktober`` en ``november``. Plaats in elke variabele de hoeveelheid uren slaap je die maand verwacht te doen. Bereken nu het gemiddelde van 3 maanden en toon het resultaat op het scherm (kies uiteraard 3 verschillende hoeveelheden slaap). Opgelet: het resultaat moet als een kommagetal worden getoond!

## Euro naar dollar

Ontwerp een toepassing waarmee je een bedrag, inclusief komma-getallen  in euro kan omrekenen naar dollar. Gebruik hierbij de huidige wisselkoers. Je hoeft niet af te ronden. Het resultaat op het scherm wordt als volgt weergegeven: ``[x] EUR is gelijk aan [y] USD``.

## Tafel en Console.Clear()

Met het statement ``Console.Clear();`` kan je de console - je raadt het nooit - leegmaken. Test deze code in het volgende programma:

Schrijf een programma dat de tafels van vermenigvuldigen geeft van 411 (dus 1x411= 411, 2x411= 822 tot en met 10x411= 4110). Toon telkens 1 zin en wacht dan tot de gebruiker op enter duwt om de volgende vermenigvuldiging op een nieuw scherm te tonen. De output ziet er dus als volgt uit:


```text
1 x 411 = 411
Druk op enter voor de volgende lijn.
[Scherm leeg gemaakt]
2 x 411 = 822
Druk op enter voor de volgende lijn.
[Scherm leeg gemaakt]
...
```


{% hint style='warning' %}
**Plaats 411 in een variabele aan de start van het programma en gebruik deze in je berekeningen verderop. Toon dat je code ook werkt door de inhoud van de variabele in een ander getal te veranderen zodat je van dat nieuwe getal nu de tafels van vermenigvuldiging krijgt.** Door de waarde 411 bovenaan in een variabele te steken kan je heel snel je programma een andere tafel laten berekenen, je hoeft dan gewoon de waarde van die variabele aan te passen.

{% endhint %}


Je kan wachten tot de gebruiker op enter duwt door gewoon een lege ``Console.ReadLine`` te doen, zoals volgende voorbeeld toont:

```java
Console.WriteLine("Eerste beeld");
Console.WriteLine("Druk enter om voort te gaan.");
Console.ReadLine();
Console.Clear();
Console.WriteLine("Tweede beeld");
```

{% hint style='tip' %}
Merk op dat ``Console.Clear()`` niet werkt zoals verwacht op Mac. 
{% endhint %}

## Kill/Death-ratio

Maak twee variabelen ``double kills`` en ``double deaths`` aan. Wijs er jouw typische scores aan toe die je haalt in een spel naar keuze. Bereken en toon vervolgens je kill/death-ratio.


{% hint style='warning' %}
**Begrijp je waarom we best een van beide variabelen in ``double`` zetten?** Lees de waarschuwing van de voorman bij Expressies zeker nog eens na... Of test eens wat er gebeurt indien je met ``int`` zou werken.

Merk op dat het vreemd is dat je een niet-geheel aantal kills of deaths kunt halen als je met ``double`` werkt. Dat kan natuurlijk niet. Je kunt niet 2,5 keer dood zijn gegaan in een spel. In hoofdstuk 4 gaan we dit oplossen (en er dus voor zorgen dat kills en deaths wel als ``int`` kan blijven staan, maar we toch een ``double`` als resultaat voor de kdratio krijgen)
{% endhint %}



{% hint style='tip' %}
De k/d ratio is de verhouding tussen het aantal kills da je in een spel hebt gehaald ten opzichte van het aantal keer dat je zelf bent gestorven, deads. Wanneer deze verhouding dus groter is dan 1 heb je vaker iemand gedood dan dat je zelf gestorven bent. Onder de 1 is dit net omgekeerd...en ben je dus niet zo goed in het spel dat je aan het spelen bent.
{% endhint %}

## BTW
Schrijf een programma waarin je het BTW-percentage 21% als een constante definieert door het keyword ``const`` voor de variabele te zetten. Vervolgens toon je een prijs naar keuze, met en zonder btw op het scherm. 



## Gewicht in space

Je massa is overal dezelfde. Je gewicht daarentegen is afhankelijk van de zwaartekracht van de plek waar je bent. Zo is je gewicht veel groter op Jupiter dan op Mars.

Maak een variabele ``double gewichtOpAarde`` aan. Wijs een gewicht toe (bv. het jouwe). Schrijf nu een programma dat onder elkaar jouw gewicht op verschillende planeten toont.

Hier de omzettingstabel (je gewicht op Mercurius is dus je gewicht op aarde x 0.38):

* Mercurius: 0.38
* Venus: 0.91
* Aarde: 1.00
* Mars: 0.38
* Jupiter: 2.34
* Saturnus: 1.06
* Uranus: 0.92
* Neptunus: 1.19
* Pluto: 0.06  (we laten de discussie achterwege of pluto wel of niet een planeet is)

De output zijn verschillende lijnen onder elkaar in de vorm van:

``Je weegt op [planeet] [gewichtopdieplaneet] kg.``

Plaats de zin met Jupiter in het rood, daar je daar het zwaarst weegt en die van pluto in het groen.



## Tekstmaker

Met de methode ``System.IO.File.WriteAllText();`` kan je een ``string`` naar een bestand wegschrijven.

Je geeft hierbij 2 variabelen mee: de bestandsnaam, en de inhoud van het bestand.

Volgende voorbeeld schrijft bijvoorbeeld de zin "Ik ben tim" weg naar een bestand dat zal aangemaakt worden genaamd "me.txt":

```java
System.IO.File.WriteAllText("me.txt", "Ik ben tim");
```

Schrijf een programma dat aan de gebruiker de naam van het bestand vraagt, gevolgd door wat er in het bestand moet geschreven worden. Vervolgens maak je dit bestand aan en plaats je die inhoud er in.

{% hint style='tip' %}
Als je enkel een bestandsnaam meegeeft (en geen volledige folderpath) dan wordt het bestand geplaatst op de plek waar het programma wordt uitgevoerd.

Standaard staat je gecompileerde programma in de bin\debug folder van je project.

Als je dus een solution hebt aangemaakt genaamd "Oefening" in de folder "C:\Temp" dan zal het bestand zich in de volgende folder bevinden "C:\Temp\Oefening\Oefening\bin\debug".

Je kan ook snel naar deze folder gaan door in de solution explorer aan de rechterzijde in VS te rechterklikken op je project en dan te kiezen voor: Open folder in file explorer.
{% endhint %}