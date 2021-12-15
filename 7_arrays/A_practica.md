

{% hint style='tip' %}
Een aantal oefeningen is geïnspireerd op oefeningen van [Exercism.io](https://exercism.io/tracks/csharp/exercises).
{% endhint %}

## Opwarmers

* Vul een array van ints met alle getallen van 1 tot 100. Druk de array af.
* Vul een array van ints met alle even getallen tot en met 100. Druk de array af.
* Vraag aan de gebruiker 3 keer een getal, stop deze in een array, druk deze array af.
* Maak een array aan en plaats daarin de 4 namen van je beste vrienden in volgorde van "beste vriend" tot "minst beste vriend". Toon nu de namen op het scherm, onder elkaar, met telkens ervoor "Beste vriend", "Tweede beste vriend", "Derde beste vriend", "Minst beste vriend".
*  Maak een array van 20 booleans en zorg dat alle oneven indexen False zijn. (druk deze af).
* Maak een array van 20 bool-waarden. Deze waarden zijn willekeurig. Print de array. Toon hoeveel keer true en hoeveel keer false er in de array zit. Opgelet, je doe de visualisatie in aparte loop nadat je deze hebt aangemaakt. Voorts tel je de true en false variabelen in nog eens een aparte loop.
* Vul een array met 10 random doubles tussen 0 en 10. Toon het gemiddelde ervan.
* Maak een enum Schooltype met mogelijke waarden TSO, BSO, ASO, KSO. Maak een array van 20 Schooltype-waarden. Vul deze met willekeurige schooltypes. Toon de array. Toon hoe vaak ieder schooltype in de array voorkomt.

## Pittiger 

Sommige oefeningen zijn op randje van PRO. U weze gewaarschuwd.

{% hint style='tip' %}
Je mag in deze oefeningen NIET gebruik maken van ``.Reverse()``, ``.BinarySearch()`` etc. Alles moet je manueel kunnen. Enkel sorteren mag je automatisch doen met ``.Sort()``.

Als er dus staat "lees 20 getallen in", dan moet je die in volgorde bewaren in je array. Vervolgens begin je die array te manipuleren.
{% endhint %}

1.	Er worden 20 getallen ingelezen. De getallen worden in omgekeerde volgorde afgedrukt.
2.	Er worden 20 getallen ingelezen. De getallen worden 1 plaats naar voor verschoven afgedrukt, d.w.z. eerst het tweede ingelezen getal, dan het derde ingelezen getal, dan het vierde ingelezen getal , ... , dan het laatste ingelezen getal en tenslotte het eerste ingelezen getal.
3.	Er worden 20 getallen ingelezen. De getallen worden 3 plaatsen naar achter verschoven afgedrukt, d.w.z. eerst het derde laatste ingelezen getal, dan het voorlaatste ingelezen getal, dan het laatste ingelezen getal, dan het eerste ingelezen getal, dan het tweede ingelezen getal en tenslotte het vierde laatste ingelezen getal.
4.	Er worden 20 getallen ingelezen. De getallen worden geroteerd (verschoven) afgedrukt over een aantal elementen x zoals in de vorige opgave. Maak dus de vorige oefening maar nu is ``3`` een variabele die je op voorhand kan instellen.
5.	Een rij van 100 getallen wordt ingelezen. Druk de inhoud van de rij af in 3 kolommen. De getallen worden gerangschikt rij per rij.  Als je input bijvoorbeeld volgende reeks getallen is: ``4 5 8 7 5 2 6 8 7 1 3 2``, dan wordt dit je output:
        ```java
        4 5 8
        2 5 7
        6 7 8
        1 2 3
        ```
6.	Een rij van 100 getallen wordt ingelezen. Druk de inhoud van de rij af in 3 kolommen. De getallen worden gerangschikt kolom per kolom (hier mag je ``Sort`` gebruiken).

## Vraag Array
Maak een array die 6 strings kan bevatten. Ieder element van de array bevat een vraag (naar keuze te verzinnen) als string waar de gebruiker met een getal op moet antwoorden.
Maak een array aan die tot 6 ints kan bevatten. Lees 1 voor 1 de vraag uit de string-array uit en toon deze op het scherm. Lees vervolgens het antwoord uit dat de gebruiker intypt en bewaar dit als int in de 2e array.

Na de 6 vragen toon je vervolgens de vragen opnieuw met achter iedere vraag het antwoord van de gebruiker.


![Mogelijk uitvoer programma](../assets/5_arrays/arvraag.png)

## Array Zoeker

Maak een programma dat eerst weer aan de gebruiker om 10 waarden vraagt die in een array worden gezet.

Vervolgens vraagt het programma welke waarde verwijderd moet worden. Wanneer de gebruiker hierop antwoordt met een nieuwe waarde dan zal deze nieuw ingevoerde waarde in de array gezocht worden. Indien deze gevonden wordt dan wordt deze waarde uit de array verwijderd en worden alle waarden die erachter komen met een plaatsje naar links opgeschoven, zodat achteraan de array terug een lege plek komt.

Deze laatste plek krijgt de waarde -1.

Toon vervolgens alle waarden van de array.

Indien de te zoeken waarde meer dan 1 keer voorkomt, wordt enkel de eerst gevonden waarde verwijderd.

![Voorbeeld uitvoer](../assets/5_arrays/practarray3.png)

## LeveringsBedrijf
Maak een programma voor een koeriersbedrijf.  Maak een array die 10 postcodes bevat (zelf te kiezen) van gemeenten waar het bedrijf naar levert. Maak een tweede array die de prijs bevat per kg voor iedere respectievelijke gemeente.  Het eerste element  van deze array bevat dus de prijs/kg om naar de gemeente te leveren die als eerste in de array met postcodes staat.

Vraag aan de gebruiker een postcode en het gewicht van het pakket. Vervolgens wordt de prijs/kg opgezocht voor die gemeente en wordt de prijs berekend, gegeven het ingegeven gewicht.

Indien het bedrijf niet levert aan de ingetypte postcode dan wordt een foutmelding weergegeven.


```text
Geef gewicht pakket
45
Naar welke postcode wenst u dit pakket te versturen?
2020
Dit zal 9630 euro kosten.
```

## Bob

Kan je "Bob" programmeren die als volgt werkt:

>Bob is a lackadaisical teenager. In conversation, his responses are very limited.
>Bob answers 'Sure.' if you ask him a question.
>He answers 'Whoa, chill out!' if you yell at him.
>He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
>He says 'Fine. Be that way!' if you address him without actually saying anything.
>He answers 'Whatever.' to anything else."

Bekijk steeds de laatste 2 tekens die de gebruiker invoert om de response van Bob te bepalen. 

Kan je een gesofisticeerdere bot maken? 

{% hint style='tip' %}
``myInputstring.Contains(somestring)`` geeft een ``bool`` terug indien ``somestring`` voorkomt in de variabele ``myInputstring`` van het type ``string``.
{% endhint %}

Gebruik een array om de antwoorden in te bewaren. 

## PRO: Bob++

Kan je met een array eerdere vragen van de gebruiker bewaren om zo complexere antwoorden te genereren?

## Hamming distance
De *hamming distance* is het aantal tekens dat twee reeksen verschillen indien we ieder element vergelijken op dezelfde plaats in de andere reeks.

Maak een programma dat aan de gebruiker vraagt om twee DNA strings in te voeren (een reeks bestaande uit de letters G, A, C & T). Beide reeksen moeten even lang zijn.

Bereken de hamming distance tussen beide reeksen.

De hamming distance van volgende twee DNA strings is 7, omdat er 7 elementen in beide strings staan die niet gelijk zijn aan mekaar op dezelfde plek (aangeduid met ``^``).

```
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
```

## Password generator (PRO)
Ontwerp een consoletoepassing waarmee je een wachtwoord genereert voor een gebruiker. Het wachtwoord is opgebouwd uit:

de 2 eerste letters van de familienaam: de 1ste letter is een hoofdletter, de 2de letter is een kleine letter. 
Daarna worden de 2 letters gewisseld;
het zonenummer van het telefoonnummer zonder de 0;
het eerste cijfer van de postcode in het kwadraat.

> Gebruik de ``ToCharArray()`` methode die je op een string kunt toepassen, zoals hier getoond: ``char[] chars = myEpicName.ToCharArray();`` 

{% hint style='warning' %}
Schrijf nooit een paswoord manager die je paswoorden gortdroog als ``string`` bewaart. **Secure code** schrijven is een hele discipline op zich en laat je best nog even links liggen tot je C# goed in de vingers hebt.
{% endhint %}