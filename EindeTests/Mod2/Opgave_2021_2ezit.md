> Volgende opgave was de vaardigheidsproefopdracht voor 2e zit examen van dit vak (Programming Principles) in juni 2021.


## Intro

Zeilen zal nooit meer hetzelfde zijn. Vanaf 2021 zal het wereldkampioenschap zeilen enkel nog virtueel doorgaan. Jou is gevraagd om de nodige software te schrijven zodat 4 zeilers , virtueel, tegen elkaar kunnen strijden.

## Opstart

Iedere Zeilkampioenschap bestaat uit X wedstrijden. Iedere wedstrijd dient, per speler, de tijd bijgehouden worden. Op het einde van het kampioenschap (= X wedstrijden) wordt bepaald welke zeiler het snelste in totaal was. Iedere Kampioenschap zal steeds door 3 zeilers afgelegd worden.

* Wanneer het programma start wordt gevraagd uit hoeveel wedstrijden het kampioenschap zal bestaan
  * Zolang de gebruiker geen getal tussen 1 tot en met 10 antwoordt zal de vraag opnieuw gesteld worden.
  * Je mag er van uitgaan dat de gebruiker enkel getallen invoert.
* Maak 3 int arrays aan, 1 array per zeiler. De lengte van iedere array is het aantal wedstrijden dat in de vorige vraag werd gesteld.
* Start een loop die even vaak zal uitgevoerd worden als er wedstrijden zijn.
  * De werking van de loop wordt in volgende sectie uitgelegd (“Wedstrijden”)
* Wanneer alle wedstrijden zijn gezeild sluit de loop af en komen we in het finale deel waarin de winnaar bekend wordt gemaakt, etc.
  * De werking van dit deel wordt in de sectie “Afronden” uitgelegd
* Finaal kan de gebruiker optioneel op zoek gaan naar valspspelers. Dit wordt in de sectie “FraudeSpotter” uitgelegd.

## Wedstrijden

Iedere loop wordt er een wedstrijd gezeild, als volgt:

* Eerst wordt een zin getoond: “Wedstrijd X” waarbij X vervangen wordt door de huidige wedstrijd die van start gaat, beginnende bij 1.
* Een methode Wedstrijd  wordt aangeroepen. Deze methode geeft een array als resultaat terug.
   * In de methode worden 3 random tijden berekend (1 tijd per speler). Deze 3 getallen zijn steeds doubles tussen 10.0 tot en met 100.0 en stelt de tijd in minuten van de speler voor
      * Er is 1% kans dat het getal 20 wordt gegenereerd (zie finale sectie over fraudespotting) . Alle overige andere getallen hebben 99% kans om gegenereerd te worden
   * De methode zal deze 3 tijden in een array (met lengte 3) plaatsen en teruggeven als resultaat. Het eerste element bevat de tijd van de eerste speler, het tweede element van speler 2, en zo voort.
* Breng de 3 tijden van de Wedstrijd-methode in de loop over naar de arrays van iedere speler individueel. 
   * Als dus speler 1 in ‘wedstrijd 1’ 55 minuten heeft gezeild en in ‘wedstrijd 2’ 99.3 dan zal z’n array na iteratie 2 er als volgt uitzien indien er 6 wedstrijden gaan gezeild worden:
 
* Vervolgens worden de 3 wedstrijdtijden getoond (in volgorde van speler: dus eerste die van speler 1, enz) waarbij de snelste van de 3 tijdens in het groen wordt getoond en de traagste tijd in het rood.
* Er wordt ook de gemiddelde tijd getoond van de 3 tijden samen.

## Afronden 

Als alles goed is gegaan (en alle wedstrijden zijn gezeild) bevatten de 3 arrays nu alle tijden van de spelers. Geef deze 3 arrays mee aan een nieuwe methode BerekenWinnaar.
Deze methode zal volgende informatie op het scherm plaatsen en niets teruggeven:

1.	De winnaar: de winnaar is degene wiens som van alle tijden het kleinst is (dus de snelste tijd in totaal).
2.	De verliezer: degene wiens soms het grootst is.
3.	Snelste tijd: de speler die in alle wedstrijden de snelste tijd heeft gezeild (laagste getal). Toon de tijd in uren en minuten  én om welke speler het gaat (0,1, 2).
4.	Gemiddelde tijd: per speler toon je de gemiddelde tijd (ook in uren en minuten).

## FraudeSpotter 

Finaal wordt aan de gebruiker gebruikt of deze op zoek wil gaan naar valsspelers. Indien de gebruiker ‘n’ (neen) antwoord zal het programma afsluiten. Bij ‘j’ worden de 3 arrays aan een methode FraudeSpotter  meegegeven.
Deze methode geeft een bool terug.
De methode zal de 3 arrays analyseren. Iedere speler die 20minuten als wedstrijdtijd in z’n array heeft staan is vermoedelijk een valsspeler. De methode zal voor iedere speler tonen ofwel tonen:

``Speler x: in orde`` indien speler nergens 20  heeft (met x nummer van de speler, beginnende bij 1)

``Speler x: mogelijke fraude`` indien speler wel ergens 20  heeft 

Van zodra de methode minstens 1 mogelijke valsspeler heeft gevonden zal de methode true teruggeven, in alle andere gevallen false.

Indien de methode true heeft teruggegeven zal er in de main volgende zin op het scherm verschijnen: ``Er werd mogelijk gefraudeerd. Dit kampioenschap is afgelast``. Zoniet verschijnt er ``Dit kampioenschap bevat geen vreemde tijden en kan goedgekeurd worden, jeuj!``.
