# UML naar code

Kan je volgende 2 UML-diagrammen implementeren in code? Uiteraard kan je dat: make it happen!

![Iedereen bestaat nog steeds uit een hoofd, handen en benen](../assets/6_klassen/compuml.png)
[bron](https://www.visual-paradigm.com/guide/uml-unified-modeling-language/uml-aggregation-vs-composition/)

![Een groter compositievoorbeeld](../assets/6_klassen/multipplecompuml.png)
[bron](http://www.jot.fm/issues/issue_2004_11/column5/)

# Politiek (*Essential*)
Maak een programma om de politieke situatie van een land te simuleren.


Maak volgende klassen:
* Land
* Minister
* President

## Minister
Een Minister heeft geen speciale eigenschappen. Enkel een autoproperty om de Naam van de minister in bij te houden

## President
Een President is een minister maar met 1 extra property met private setter: hij heeft een Teller (autoproperty type ``int``) die start op 4 alsook een methode `JaarVerder`die deze teller bij iedere aanroep met 1 verlaagt.

## Land
* Een land heeft 0 of 1 president (of koning, kies zelf)
* Een land heeft 0 of 1 eerste minister
* Een land heeft 0 tot 4 ministers (via een ``List<Minister>``)

Al deze compositieobjecten zijn private.
Een land heeft volgende publieke methoden:

### ``MaakRegering``

Deze methode aanvaardt volgende parameters:
  
1. 1 president object die aan de private president variabele wordt toegekend
  
2. Een ``List<Minister>`` object waarin  tussen de 1 tot en met 5 ministers in staan: de eerste minister in de lijst wordt toegewezen aan de private eerste minister variabele. De overige ministers in de lijst worden aan de private lijst van ministers toegewezen.

Deze methode zal enkel iets doen indien er geen president in het land is (``null``). Indien er reeds een regering is dan zal er een foutboodschap verschijnen.

### ``JaarVerder``

Deze methode aanroepen zal de ``JaarVerder`` aanroepen op de president indien deze er is (en dus niet ``null`` is). Deze methode controleert ook of de ``Teller`` van de president na deze aanroep op 0 staat. Als dat het geval is dan worden alle ministers en president in het land op ``null`` gezet.

## Eindfase

Controleer je klasse Land door enkele ministers en een president te maken en deze in een object van het type Land via ``MaakRegering`` door te geven. Test dan wat er gebeurt indien je enkele malen ``JaarVerder`` op het land aanroept.
    
## Verkiezingen

Maak klasse ``VerkiezingsUitslag``. Deze klasse heeft een default constructor die volgende twee properties random waarden zal geven:

* Een full property met private set ``VerkozenPresident`` van het type ``President``.
* Een full property met private set ``VerkozenMinisters`` van het type ``List<Minister>``.

Maak in je hoofdprogramma een ``VerkiezingsUitslag``-object aan en gebruik deze om de ``MaakRegering``methode van je Land van de nodige informatie te voorzien.

# Moederbord

Maak een klasse ``Moederbord`` die een, je raadt het nooit, moederbord van een computer voorstelt. Kies een van de vele moederborden die je online vindt ([enkele voorbeelden](https://www.google.com/search?biw=1368&bih=802&tbm=isch&sa=1&ei=4oK9XNqCKt3UmwXbk5-4Cg&q=motherboard+parts&oq=motherboard+parts&gs_l=img.3..0l10.1974.2413..2560...0.0..0.68.290.5......1....1..gws-wiz-img.aurN6S4Da0I#imgrc=_)) en bekijk uit welke delen een moederbord bestaat ('heeft een').

Maak voor ieder deel een aparte klasse. Voorzie vervolgens via compositie de nodige objecten in je moederbord. Denk er aan dat je bijvoorbeeld 2 (of 4) RAM-slots hebt en dus hier ofwel een array moet voorzien van het type ``List<RAM>``, oftewel twee aparte delen ``RAMSlot1`` en ``RAMSlot2``.

Maak een methode ``TestMoederbord`` in de klasse ``Moederbord``. Wanneer je deze aanroept zal deze weergeven welke onderdelen nog leeg zijn (``==null``).

Iedere module moet via een property langs buiten ingesteld worden. (beeld je in dat je effectief een moederbord ineenknutselt):

```csharp
Moederbord Z390E_GAMING = new Moederbord();
Z390E_GAMING.AGP= new AGPSlot("GeForceRTX2080");
Z390E_GAMING.CPU= new CPUSlot("IntelCorei9_9900K");
//etc.
```

Kan je zelf een computer samenstellen door enkele objecten van verschillende types aan te maken en deze aan je moederbord-object toe te wijzen? 

# Risk

## Land
In het bordspel Risk heeft ieder *Land*-object volgende eigenschappen:

* Naam van het land
* Lijst met buurlanden
* Leger dat in het land gestationeerd staat.

De referenties in deze beide zijn aggregaties: wanneer het land verdwijnt dan verdwijnen niet de buurlanden en ook niet de legers die er op gestationeerd zijn (ze kunnen gewoon naar een ander land bewegen).

Voorts implmenteert het de *ToString* methode en zal het de informatie oplijsten als volgt:

``*[Naamland] (Buurlanden:[oplijsten buurlanden, enkel de naam]) . Grootte gestationeerd leger: *[grootte van het leger]``

## Leger

De Leger klasse heeft een capaciteit (sterkte) die enkel positief kan zijn.

Ieder Leger-objecthoudt via een referentie ook bij waar het leger gestationeerd is (referentie naar het Land-object). 

## Bordspel

Maak een klasse *Bordspel* dat een lijst van Land-objecten bevat (dit is compositie: wanneer het bordspel in brand wordt gestoken dan zijn ook de landen er op weg).

Maak een vereenvoudigde voorstelling van de landkaart met de Bordspel klasse, enkele Land-objecten en enkele legers. 

Voeg aan de *Bordspel* klasse een methode "ToonKaart": deze methode zal de landen in de lijst onder elkaar schrijven (via de ToString methode van Land).

Maak een methode ``VerplaatsLeger`` dat 2 referenties naar 2 landen aanvaardt. Wanneer de aanroept gebeurt zal eerst gecontroleerd worden of het eerste land een leger bevat (zoniet wordt er een exception opgeworpen). Indien dit in orde is dan zal het leger in kwestie verhuizen naar 2e land op voorwaarde dat daar ook geen leger al is. Als dat wél het geval is dan wordt het leger in het eerste land verwijderd, en wordt de capaciteit van het 2e leger verhoogd met die van het eerste leger.

# (PRO) Textbased RPG 
Bekijk het volgende All-in-One project :[OO Textbased Game](../A_DEEL2_AllInOne/2_OOTextGame.md).

Dit project gebruikt alle materie tot en met dit hoofdstuk. Kan je dit project maken én , belangrijker, uitbreiden met nieuwe functionaliteit?
