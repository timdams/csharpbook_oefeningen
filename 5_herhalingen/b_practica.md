<!---NOBOOKSTART--->

{% hint style='tip' %}
Begin pas aan deze oefeningen wanneer je voldoende geoefend hebt door de vorige 2 delen oefeningen op te lossen.

Deze oefeningen zijn oefeningen die je moet kunnen indien je hoofdstuk 6 goed en wel beheerst. Ze zijn dus een goede maat om te weten of je het hoofdstuk al voldoende in de vingers hebt.

Bekijk zeker de Wiskunde-quizprogramma-opdracht!
{% endhint %}
<!---NOBOOKEND--->

## Grootste getal
Vervolledig deze code zodat ook getoond wordt welke de grootste waarde is die werd ingevoerd.

```java
int x= 0;
int y= 0;
do
{
    y = y + x;
    Console.WriteLine("Voer gehele waarden in (32767=stop)");
    string instring= Console.ReadLine();
    x = Convert.ToInt32(instring);
    //....

}while (x != 32767);
Console.WriteLine($"Som is {y}");
```

## Boekhouder
Maak een 'boekhoud-programma': de gebruiker kan continu positieve en negatieve getallen invoeren. Telkens hij op enter duwt wordt de huidige invoer aan de balans bijgevoegd.
Je houdt volgende zaken bij:

* De balans van alle ingevoerde getallen: dit is gewoon de som van de getallen. Als de gebruiker dus de getallen 4, -10 en 8 invoerde dan zal de balans op +2 staan  (4 -10 + 8).
* De som van alle negatieve invoeren. Als de gebruiker dus 4, -10, 8 en -6 invoerde dan zal dit getal op -16 staan (= -10 -6).
* De som van alle positieve invoeren. Als de gebruiker dus 4, -10, 8 en -6 invoerde dan zal dit getal op +12 staan (= 4 + 8). 
* Het gemiddelde van alle ingevoerde getallen.

Deze 4 getallen worden steeds geüpdatet en getoond wanneer de gebruiker een nieuw getal invoert en op enter duwt.

## Hoger Lager

Simulatie van het "hoger-lager" spel. Het programma kiest een random-getal van 1 tot en met 100 (telkens inbegrepen). Vervolgens wordt de gebruiker gevraagd om een gok te doen en toont het programma of de gok juist was, te laag was ("hoger") of te hoog ("lager"). Het programma blijft gokken van de gebruiker accepteren tot de gok juist is of de gebruiker besluit te stoppen. Het aantal beurten wordt op het einde van het spel getoond en de mogelijkheid om opnieuw te spelen.

### Limiet
Pas het Hoger Lager programma aan zodat er een maximum aantal pogingen is toegestaan.

## Wiskundequiz
Maak een applicatie die je kan gebruiken om je tafels van vermenigvuldigen te oefenen. De applicatie vraagt steeds een willekeurige vermenigvuldiging (enkel getallen tussen 1 tot en met 10) en de gebruiker moet de oplossing invoeren.
Indien correct gaat de gebruiker verder. Bij fout stopt het programma en wordt getoond hoeveel keer je juist hebt ingevoerd.

## Wiskundequiz met levels

Bouw levels in de voorgaande wiskundequiz. Per 5 juiste antwoorden, stijg je 1 level. Het level bepaald het bereik van getallen die gegenereerd worden bij de oefening. Bijvoorbeeld level 1 enkel getallen van 1 tot en met 5, level 2 tot en met 10, level 3 tot en met 20 etc.

PRO: Kan je ervoor zorgen dat het bereik van de getalgeneratie met een formule afhankelijk is van het level? Zodat je de grenzen per level niet moet hardcoden?

## Wiskunde-quizprogramma

Integreer voorgaande quiz met een menu dat je bijvoorbeeld in codemenu hebt gemaakt. Het menu wordt aan de start getoond en geeft de gebruiker de optie om te kiezen wat hij wenst te doen:
* Gewoon spelen
* Starten op een bepaald level (de gebruiker moet vervolgens het level invoeren)
* Studeren: de oplossing wordt steeds getoond. De gebruiker hoeft niet in te voeren, elke 5 seconden verschijnt de volgende opgave met oplossing.

## Tekenen

Twee getallen van 2 tot en met 20 worden ingelezen (invoercontrole!). Er moet een open rechthoek afgedrukt worden bestaande uit `*`en waarbij de ingelezen getallen respectievelijk de breedte en de hoogte van de rechthoek voorstellen. Als bijvoorbeeld 10 en 4 werden ingelezen, wordt de volgende rechthoek getoond:

<!---{line-numbers:false}--->
```text
* * * * * * * * * *
*                 *
*                 *
* * * * * * * * * *
```

## Steen schaar papier
Maak een applicatie waarbij de gebruiker steen-schaar-papier met de computer kan spelen. De gebruiker kiest telkens steen, schaar of papier en drukt op enter. Vervolgens kiest de computer willekeurig steen, schaar of papier (gebruik de Random.Next() methode, waarbij je deze van  1 tot en met 3 laat varieren). 
Vervolgens krijgt de winnaar 1 punt:
* Steen wint van schaar, verliest van papier.
* Papier wint van steen, verliest van schaar.
* Schaar wint van papier, verliest van steen.
* Indien beide hetzelfde hebben wint niemand een punt.

Op het scherm wordt telkens getoond wie de huidige ronde heeft gewonnen en hoeveel de tussenscore is. De eerste (pc of gebruiker) die 10 punten haalt wint.

Teken een flowchart van je applicatie.

{% hint style='tip' %}
Los dit op met ``enum`` : je code zal een pak leesbaarder worden
{% endhint %}

## Codemenu

Maak een applicatie die bij het opstarten een keuze menu toont. Het menu toont 5 verschillende oefeningen naar keuze. Telkens de gebruiker in het menu een oefening kiest (door a, b, c, d of e in te voeren) wordt de code van die oefening getoond. Vervolgens kan de gebruiker op enter duwen zodat terug het menu verschijnt, zodat de gebruiker een nieuwe oefening kan kiezen

Extra: maak je menu visueel interessanter (m.b.v. kaders en kleuren)




## Become Neo

![Neo Tim](../assets/neotim.png)

Volgende code genereert een beeld zoals dat ook in de cultfilm The Matrix (1999) plaatsvindt. 
```java
Random rangen = new Random();
Console.ForegroundColor = ConsoleColor.Green;
while (true)
{
    //Genereer nieuw random teken:
    char teken = Convert.ToChar(rangen.Next(62, 400));
    //Zet teken op scherm
    Console.Write(teken);
    
    //10 ms pauze tussen ieder frame (pas gerust aan)
    System.Threading.Thread.Sleep(10); 
    
    //Af en toe donker kleurtje
    if(rangen.Next(0, 3) == 0)
    {
        Console.ForegroundColor = ConsoleColor.DarkGreen;
    }
    else
    {
        Console.ForegroundColor = ConsoleColor.Green;
    }
}
```

Vul de code aan zodat de karakters random kleuren krijgen. Kan je het nog cooler maken?

## BeerSong
Schrijf een BeerSong-generator zoals onderstaande output. Merk op dat de laatste 5 zinnen anders zijn:

```
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.

97 bottles of beer on the wall, 97 bottles of beer.
Take one down and pass it around, 96 bottles of beer on the wall.

96 bottles of beer on the wall, 96 bottles of beer.
Take one down and pass it around, 95 bottles of beer on the wall.

95 bottles of beer on the wall, 95 bottles of beer.
Take one down and pass it around, 94 bottles of beer on the wall.

...

4 bottles of beer on the wall, 4 bottles of beer.
Take one down and pass it around, 3 bottles of beer on the wall.

3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.

2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
```
