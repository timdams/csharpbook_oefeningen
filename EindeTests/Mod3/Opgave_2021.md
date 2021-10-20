## Haventerminal
Nu dat het Suez-kanaal vastzit is het de moment voor de Antwerpse haven om de grootste haven van de wereld te worden. Jouw expertise werd ingeroepen om te helpen om de containerterminal te vernieuwen zodat verdachte containers sneller kunnen gevat worden en we zo het drugsprobleem indijken.


### Container klasse
Maak een klasse Container met:
* Autoproperties met private set: 
  * Bedrijf (string)
  * Beschrijving (string)
  * LaatstAangepast (DateTime) 
  * GemaaktOp (DateTime)
* Autoproperty: Beschrijving (string)
* Full property:
  * Gewicht (int)
    * Het gewicht kan nooit onder 0 of boven 100 gezet worden.
    * Indien een foutieve waarde wordt meegegeven verschijnt er op het scherm “Fout gewicht. Ingesteld op 100” en wordt het gewicht op 100 ingesteld.
    * Telkens het Gewicht wordt aangepast wordt er 1 dag bij LaatstAangepast toegevoegd. Ongeacht of het om een geldige waarde ging of niet. 

{% hint style='tip' %}
Tip: De logica is dat telkens het gewicht van de container wordt aangepast, dit een hele werkdag duurt.
{% endhint %}

* Overloaded constructor die de Bedrijf, Beschrijving en Gewicht als parameters instelt. Voorts zet de constructor GemaaktOp en LaatsteAangepast op de huidige tijd en datum.

* Methoden:
  * Ledig: deze zal de beschrijving van de container op “leeg” zetten en het gewicht op 0. Het bedrijf blijft!
  * InWerking: deze methode geeft een TimeSpan object terug dat bestaat uit het verschil tussen LaatsteAangepast en GemaaktOp.
  * AddContainer:  deze methode geeft niets terug en aanvaardt 1 parameter van het type Container.
    * Indien de meegeven container van dezelfde Bedrijf  is als de container zelf, dan zal het volgende gebeuren.
      * Indien de som van de gewichten van beide containers samen minder dan 100 is dan zal het gewicht van de meegegeven container opgeteld worden bij die van de huidige container. De beschrijving van de huidige container zal bestaan uit de huidige beschrijving gevolgd door “ en [beschrijving meegegeven container]” . Als dus de meegegeven container (de parameter) als beschrijving “Eten” had en de huidige container “Water” dan wordt de beschrijving van de huidige container “Water en Eten”.
      Vervolgens wordt de meegegeven container leeg gemaakt met de Ledig methode.
    * Als de som van beide containers bij samenvoegen boven de 100 zou komen dan verschijnt er een tekst "Kan container niet adden. Dit zou gewicht boven de 100 brengen" en stopt de methode.
    * Als de bedrijven  verschillend zijn van beide container bij samenvoegen boven de 100 zou komen dan verschijnt er een tekst "Containers zijn niet van zelfde bedrijf. Kan niet samenvoegen." en stopt de methode.

### Scanner klasse
Deze klasse heeft één static methode ScanContainer.
Deze methode geeft een string terug en aanvaardt 1 Container object als parameter.

Deze methode zal een tekstueel rapport opstellen van de meegegeven container. Dit rapport ziet er als volgt uit en wordt als string door de methode teuggegeven:


```
---CONTAINERREPORT [BEDRIJF]---
        Lading:[BESCHRIJVING]
        Gewicht lading=[GEWICHT]
----------------
```

* Waarbij de waarden tussen vierkante haken uiteraard vervangen worden door de properties van de container.
* Het bedrijf wordt in allcaps (dus volledig in hoofdletters) getoond.

Indien de container 5 of meer dagen aanpassingen bevat (kan je via InWerking zien)   verschijnt er nog een extra zin:

```text
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
```

 
### Werking klassen
Schrijf een korte applicatie die het volgende doet.
* Maak 2 containers aan van hetzelfde bedrijf. De eerste container bevat “Graan” de andere “Water”. Het gewicht van iedere container is 30.
* Voeg nu de 2e container (met water) toe aan de eerste container met de AddContainer methode.
* Maak een loop die 10x loopt en het volgende doet:
  * Het gewicht van de eerste container wordt telkens met 10 verhoogt.
  * Het rapport van de eerste container wordt op scherm getoond gebruik makend van de ScanContainer methode uit de Scanner klasse.


### Voorbeeld uitvoer:

```text
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=70
----------------
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=80
----------------
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=90
----------------
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=100
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
----------------
Fout gewicht. Ingesteld op 100
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=100
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
----------------
Fout gewicht. Ingesteld op 100
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=100
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
----------------
Fout gewicht. Ingesteld op 100

---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=100
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
----------------
Fout gewicht. Ingesteld op 100
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=100
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
----------------
Fout gewicht. Ingesteld op 100
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=100
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
----------------
Fout gewicht. Ingesteld op 100
---CONTAINERREPORT TIM NV---
        Lading:Graan en Water
        Gewicht lading=100
*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan
----------------
```