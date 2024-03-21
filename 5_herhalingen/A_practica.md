

{% hint style='tip' %}
Vanaf dit hoofdstuk zul je véél meer oefeningen voorgeschoteld krijgen dan je kan afwerken in 1 labo tijd (I dare you ;) ). Selecteer zelf de oefeningen die je wenst te doen en sla die over waarvan je overtuigd bent ze al te kunnen. 
{% endhint %}


{% hint style='tip' %}
De oefeningen zijn, in de mate van het mogelijke, gerangschikt op relatieve moeilijkheidsgraad.
{% endhint %}

{% hint style='tip' %}
Indien niet expliciet vermeld mag je kiezen met wat voor loop (``for``, ``while``, ``do while``) je het probleem zal oplossen. Denk echter steeds goed na wat voor loop de beste keuze is. Indien je van te voren weet hoe vaak de loop moet uitgevoerd worden, dan is een ``for`` de beste keuze. Weet je dat niet dan kies je voor ``while`` of `` do while`` (weet je nog het verschil tussen beiden?).
{% endhint %}

# De opwarmers

{% hint style='tip' %}
Oefeningen waar *n* wordt gebruikt geven aan dat dit een getal is dat je aan de gebruiker vraagt aan de start.
{% endhint %}

## Opwarmers 1

* Toon alle natuurlijke getallen van 1 tot *n*. (bv 1,2,3,4,5,6)
* Toon alle natuurlijke getallen van *n* tot 1. (bv 6,5,4,3,2,1)
* Toon alle even getallen tussen 1 en 100. (2,4,6,...100)
* Toon alle oneven getallen tussen 1 en 100. (1,3,5,7,...99)
* Toon de som van alle getallen van 1 tot *n* (dus 1+2+3+4+...+n).
* Toon de som van alle even getallen van 1 tot *n*. (voorbeeld:indien de gebruiker 7 invoerde dan zal er 12 op het scherm verschijnen , namelijk (2+4+6)).
* Toon de som van alle oneven getallen van 1 tot *n*. 

## Opwarmers van opwarmers




{% hint style='tip' %}
Met afsluitwaarde bedoelen we een waarde die de gebruiker moet invoeren om het programma te stoppen. Dus zolang de gebruiker NIET die afsluitwaarde invoert zal het programma om nieuwe waarden blijven vragen.
{% endhint %}

1. Lees een willekeurig aantal getallen van de gebruiker (de gebruiker kiest zelf de getallen) met als afsluitwaarde 0. Bereken de som en druk die af. Je blijft dus de getallen van de gebruiker optellen tot deze 0 invoert, dan stopt het programma.
2. Lees een willekeurig aantal getallen in met als afsluitwaarde 0. Druk het aantal strikt positieve en het aantal strikt negatieve getallen af.
3. Lees een willekeurig aantal getallen in met als afsluitwaarde -32768. Bepaal het aantal strikt positieve getallen, het aantal strikt negatieve getallen en het aantal getallen gelijk aan nul. Druk deze aantallen af.
4. Lees een willekeurig aantal getallen in met als afsluitwaarde 0. Bereken het product en druk dit af.
5. (PRO) Lees een getal in en druk de som van zijn cijfers af. 
6. Lees een willekeurig aantal positieve getallen in en bereken het (afgekapt) gemiddelde ervan. De afsluitwaarde is een willekeurig negatief getal.
7. Lees een willekeurig aantal getallen in met afsluitwaarde -32768. Druk het kleinste getal af en het aantal keer dat het voorkomt. Als de gebruiker volgende reeks invoerde: "3,2,1,2,3,1,4,5,1,2,-32768'. Dan komt er 1 als kleinste getal op het scherm en 3 (omdat 1 drie maal werd ingetypt)
8. Een reeks in stijgende volgorde gesorteerde getallen wordt ingelezen. De invoer moet stoppen indien er een fout in de sorteervolgorde voorkomt.
9. Een reeks getallen wordt ingelezen. De invoer moet stoppen indien er twee maal achter elkaar een nul wordt ingelezen. Het gemiddelde van de reeks getallen wordt afgedrukt. De laatste twee nullen tellen uiteraard niet mee voor de bepaling van het gemiddelde.
10. Bepaal de som van de kwadraten van de even natuurlijke getallen van 50 tot 100 (inbegrepen). De som wordt afgedrukt.
11. Een reeks van 100 getallen wordt ingelezen. Van de positieve getallen moet er afgedrukt worden hoeveel deelbaar waren door 2, hoeveel deelbaar waren door 3 en hoeveel door 6.
12. Druk de som af van de eerste 30 termen van de volgende reeksen:
 * 6 + 12 + 18 + 24 + 30 + ...
 * 4 + 12 + 20 + 28 + 36 + ...
 * 1 + 2 + 4 + 8 + 16 + ...
 * 1 + 1/2 + 1/4 + 1/8 + 1/16 + ...
 * 1 + 1/3 + 1/5 + 1/7 + 1/9 + ...
 * 1/2 + 1/3 + 1/5 + 1/9 + 1/17 + ...
13. Druk de som af van de eerste 20 termen van de volgende reeksen:
 * 4 + 8 + 12 + 16 + 20 + ...
 * 4 + 10 + 16 + 22 + 28 + ...
 * 1 + 3 + 9 + 27 + 81 + ...
 * 1/2 + 1/4 + 1/6 + 1/8 + 1/10 + ...
 * 1 + 1/2 + 1/4 + 1/8 + 1/16 + ...
 * 1 + 1/3 + 1/7 + 1/15 + 1/31 + ...


## Tafels van vermenigvuldigen 1 
Gebruik de kracht van loops om pijlsnel de tafels van vermenigvuldigen op het scherm te tonen *van een getal naar keuze*(dus bijvoorbeeld 2x1, 2x2, tot 2x10 en alles daartussen).

## Tafels van supervermenigvuldigen   (*Essential*)
Gebruik de kracht van **geneste** loops om pijlsnel alle tafels van vermenigvuldigen op het scherm te tonen *van de getallen 1 tot en met n*(dus 1x1, 1x2,... 1xn, 2x1, 2x2,...,2xn tot en met n x n).

## RNA Transscriptie (*Essential*)

DNA heeft steeds een RNA-complement (DNA is het gevolg van RNA transscriptie). Schrijf een programma dat een ingevoerde DNA-string omzet naar een RNA-string. De gebruiker voert steeds 1 DNA-nucleotide in per keer en duwt op enter, de RNA string wordt steeds groter. Na 12 karakters stopt het programma.

De omzetting is als volgt:
* G wordt C
* C wordt G
* T wordt A
* A wordt U

Als de gebruiker dus ``ACGTGGTCTTAA`` heeft ingevoerd moet het resultaat: ``UGCACCAGAAUU`` zijn. 

Ga er van uit dat de gebruiker letter per letter invoert (telkens dus enter na een letter) en je de omgezette string doet groeien (m.b.v. ``+=``).

## Armstrong nummer (PRO)
Een getal is een *narcistisch getal* of *armstronggetal* als het de som is van zijn eigen cijfers elk tot de macht verheven van het aantal cijfers.

* 9 is een Armstrong nummer, want 9 = 9^1 = 9
* 10 is geen Armstrong nummer, want 10 != 1^2 + 0^2 = 1
* 153 is een  Armstrong nummer, want: 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
* 154 is geen  Armstrong nummer, want: 154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190

Schrijf een programma dat aan de gebruiker een getal vraagt en vervolgens toont of het ingevoerde getal een Armstrong-nummer is of niet.

{% hint style='tip' %}
Je zou deze oefening kunnen oplossen door het ingevoerde getal als string op te splitsen in individuele char's. Maar we raden je aan om de "wiskunde" weg te volgen zodat je terdege leert met loops en wiskunde te werken.

Stel dat je het getal 4563 hebt:

* Eerst deel je 4563 door 1000. Dit geeft **4**. 
* We trekken 4x1000 van 4563 af. Dit geeft 563.
* Deel 563 door 100. Dit geeft **5**.
* We trekken 5x100 van 563 af. Dit geeft 63.
* Deel 63 door 10. Dit geeft **6**.
* We trekken 6 x 10 van 63 af. Dit geeft **3**
{% endhint %}

{% hint style='tip' %}
Je kan van een string weten hoe groot deze is als volgt:

```csharp
//veronderstellend dat myInputGetal van het type string is
int lengte= myInputGetal.Length;  
```
Je kan dan nu met ``Math.Pow(10,lengte-1)`` berekenen vanaf welke exponent van 10 we moeten beginnen werken.
{% endhint %}


## Schaak-elo met loop 

Zorg ervoor dat je Schaak-elo programma "blijft werken" als volgt:

1° De gebruiker geeft z'n begin Elo-rating op
2° Een loop start en vraagt nu telkens de Elo-rating van de huidige tegenstander, gevolgd door de uitslag. Telkens wordt de nieuwe Elo-rating van de gebruiker getoond. Wanneer de gebruiker een negatieve rating voor z'n volgende tegenstander opgeeft stopt de loop.

## Euler project (*Essential*)
Maak volgende opdracht van [projecteuler.net](http://projecteuler.net):
>Indien we alle natuurlijke getallen van 0 tot en met 10 oplijsten die een meervoud van 3 of 5 zijn, dan krijgen we de getallen 3,5,6,9 en 10. De som van deze 4 getallen is 33.
Maak nu een programma dat de som van alle veelvouden van 3 of 5 weergeeft van 0 tot en met 1000 (dit zou 234168 moeten geven).

{% hint style='tip' %}
De modulo-operator (``%``) is je grote held hier. Een getal is een veelvoud van x indien ``getal % x`` 0 als resultaat geeft.
{% endhint %}

## For doordenker (PRO)
Schrijf een programma dat de volgende output geeft, gegeven dat de gebruiker een maximum waarde invoert, dus als hij 4 ingeeft dan zal de driehoek maximum 4 breed worden. Gebruik enkel 2 keer 2 geneste for-loops!
```
*
**
***
****
***
**
*
```
