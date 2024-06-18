> Deze opgave was onderdeel van de vaardigheidsproefopdracht voor het examen van dit vak (OOP) in juli 2024 (licht aangepast)

# Opgave 1

Het Oude Egypte met z'n faraos, pyramides, vreemde goden en mummies spreekt tot de verbeelding. Voor een firma ga je een simulatie van het Oude Egypte maken. 


## Klassen

### Pharaoh

De klasse heeft volgende eigenschappen :

- **Name (auto, string)**: De naam van de Pharaoh.
- **ReignStartYear (full, int)**: Het jaar waarin de Pharaoh begon met regeren. Kan enkel negatief zijn.
- **ReignEndYear (full, int)**: Het jaar waarin de regering van de Pharaoh eindigde. Kan enkel negatief zijn. Kan nooit kleiner zijn dan ReignStartYear, zoniet dan worden beide waarden verwisseld voor ze toegekend worden.

Voorts heeft iedere Pharaoh een private lijst van Achievements, waarin de belangrijkste prestaties of gebeurtenissen tijdens de regering van de Pharaoh in worden bijgehouden. Deze lijst bevat strings.

De klasse heeft volgende methoden:

- **CalculateReignLength() -> int**: Bereken de lengte van de regeringsperiode van de Pharaoh, uitgedrukt in jaren. 
- **AddAchievement(string achievement)**: Voeg een prestatie toe aan de lijst van belangrijke prestaties. Dit stelt je in staat om dynamisch prestaties toe te voegen aan het record van de Pharaoh.
- **ShowAchievements()**: Deze methode zal alle prestaties van de Pharaoh onder elkaar oplijsten op het scherm.

Je dient twee constructors te implementeren voor de `Pharaoh` klasse:

1. Een constructor die alle eigenschappen als parameters neemt, inclusief `ReignEndYear`. De constructor controleert dat ReignEndYear later is dan ReignStartYear.
2. Een constructor die `ReignEndYear` weggelaten, voor het geval het einde van de regering onbekend is. `ReignEndYear`wordt dan op 0 gezet.

# Dynasty

Deze  klasse modelleert een dynastie in het oude Egypte, met eigenschappen en methoden die de relatie en informatie van meerdere Pharaoh's binnen dezelfde dynastie weergeven:

De klasse heeft volgende eigenschappen

- **Name (auto,string, )**: De naam van de dynastie, bijvoorbeeld "18e Dynastie".
- **StartYear (full, int)**: Het jaar waarin de dynastie begon. Kan enkel negatief zijn. 
- **EndYear (full, int)**: Het jaar waarin de dynastie eindigde. Kan enkel negatief zijn. Kan nooit kleiner zijn dan StartYear.

De klasse heeft ook een lijst van `Pharaoh` objecten die de Pharaoh's binnen deze dynastie vertegenwoordigen.


## Methoden

- **AddPharaoh(Pharaoh pharaoh)**: Voeg een `Pharaoh` object toe aan de lijst van Pharaoh's. Deze methode maakt het mogelijk om Pharaoh's dynamisch toe te voegen aan een dynastie. Indien een Pharaoh wordt toegevoegd wiens regeerperiode niet overlapt met die van de dynastie, dan wordt er een Exception opgeworpen. Voorbeeld: dynastie is van -500 tot -300, dan zal de Pharaoh die leefde tussen -510 en -480 wél worden toegevoegd. Maar de Pharaoh die leefde tussen -600 en -530 niet.
- **CalculateDuration() -> int**: Bereken de duur van de dynastie, uitgedrukt in jaren. 
- **ShowEvents()**: Deze methode toont alle achievements van de Pharaohs in deze dynastie door de `ShowAchievements` methode van iedere faroah in de lijst aan te roepen, voorafgegaan door de naam van de Pharaoh.
- **ShowPharaohs**: Deze methode lijst de Pharaohs op die in de lijst van Pharaoh objecten staat. 

## Hoofdprogramma

Schrijf een applicatie die

1. Creëer ten minste twee `Pharaoh` objecten met verschillende namen, regeerperioden, en voeg aan elk minimaal twee prestaties toe met de `AddAchievement` methode. Zorg ervoor dat de regeerperioden van deze Pharaoh's overlappen met de periode van de dynastie die je in stap 2 zult creëren.

2. Maak een `Dynasty` object en initialiseer deze met een naam en de start- en eindjaren. Zorg ervoor dat de start- en eindjaren negatieve getallen zijn om de historische tijdlijn van het Oude Egypte na te bootsen.

3. Voeg de `Pharaoh` objecten toe aan de `Dynasty` met behulp van de `AddPharaoh` methode. Vang eventuele exceptions op die worden opgeworpen als een Pharaoh niet binnen de periode van de dynastie valt.

4. Roep de `CalculateDuration` methode aan op je `Dynasty` object om de duur van de dynastie te tonen.

5. Gebruik de `ShowEvents` methode van de `Dynasty` klasse om alle prestaties van de Pharaoh's binnen die dynastie te tonen.

