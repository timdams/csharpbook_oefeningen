
{% hint style='tip' %}
Bekijk volgende kennisclip waarin wordt uitgelegd hoe je meerdere projecten in 1 solution in VS kunt plaatsen:
![](../assets/infoclip.png)
[Meerdere projecten in 1 solution](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=a7eb4973-e87e-49a4-862e-ac47009783d6)

**Probeer vanaf nu per hoofdstuk 1 solution aan te maken met daarin meerdere projecten (1 project per oefening)**
{% endhint %}

<!---NOBOOKEND--->
{% hint style='tip' %}
Sommige oefeningen zullen soms **(PRO)** in de titel hebben. Dit zijn pittigere oefeningen. Probeer ze zeker, maar laat je niet ontmoedigen als ze niet direct lukken. Het kan erg nuttig zijn om enkele hoofdstukken later nog eens terug naar deze oefeningen te gaan zien, wie weet kan je ze dan wel oplossen.
{% endhint %}



## Unicode Art

Genereer je naam in Unicode Art met een van de [vele online generators](https://www.google.com/search?q=unicode+art+generator&oq=unicode+art&aqs=chrome.0.0j69i57j0l2j0i22i30l3.3647j0j1&sourceid=chrome&ie=UTF-8). Toon deze art (m.b.v. WriteLine of Write) aan de start van een van een bestaande programma zodat nu je naam wordt getoond wanneer het programma start, gevolgd door de rest.

## String interpolation

Kies 2 oefeningen uit het vorige hoofdstuk waarin je output op het scherm moest geven. Pas string interpolatie m.b.v. ``$`` (manier 2) toe in deze 2 oefeningen.

## Unicode Art & Colors

Gebruik je kennis van het verschil tussen `Console.Write`  en `Console.WriteLine`, alsook de werking van kleuren in console-applicaties, om je Unicode-art naam van de eerdere oefening nu van kleur te voorzien. Zorg ervoor dat minstens 1 letter in een andere kleur is.

{% hint style='tip' %}
Dit is een redelijke lange oefening, doe deze best op het einde.

Deze oefening kan je op 2 manieren oplossen:
1. Je gebruikt een combinatie van ``Write`` en ``Console.SetCursorPosition``
2. Je knipt je tekening op in stukken die je met verschillende ``Write`` en ``WriteLines`` op het scherm zet. Volgend voorbeeld toont bijvoorbeeld hoe je een vierkantje van sterretjes tekent waarbij het midden van het vierkant rood is:

```java
Console.WriteLine("***");
Console.Write("*");
Console.ForegroundColor = ConsoleColor.Red;
Console.Write("*");
Console.ResetColor();
Console.WriteLine("*");
Console.WriteLine("***");
```
{% endhint %}

## Systeem informatie

{% hint style='tip' %}
Volgende 2 oefeningen zijn al iets stevigers. Iedere oefening eindigt met een (PRO) gedeelte dat je best enkel doet als je een uitdaging wenst.
{% endhint %}

### Deel 1

Maak een applicatie die de belangrijkste computer-informatie (geheugen, etc) aan de gebruiker toont m.b.v. de [``Environment`` bibliotheek](https://docs.microsoft.com/en-us/dotnet/api/system.environment?view=netcore-3.1#properties).
Zoals je ziet wordt het geheugen in bytes teruggegeven. Zorg ervoor dat het geheugen steeds in mega of gigabytes op het scherm wordt getoond.

**Formateer de informatie met behulp van de $-notatie  zodat deze  deftig getoond worden en de gebruiker snel de belangrijke informatie over z'n systeem te zien krijgt.**

### Deel 2 (PRO)

Ook informatie over de harde schijven kan je verkrijgen (in bits). 
Dit vereist wel dat je bovenaan je programma volgende lijn bijschrijft: ``using System.IO``. 

Vervolgens kan je in je programma schrijven:

```java
long cdriveinbytes = DriveInfo.GetDrives()[0].AvailableFreeSpace;  
long totalsize = DriveInfo.GetDrives()[0].TotalSize;  
```

De lijn met ``using`` is om aan te geven dat we iets uit de ``System.IO`` bibliotheek nodig hebben, namelijk ``DriveInfo``.
Schrijven we dat niet dan moeten we in onze code DriveInfo aanroepen met z'n volledige path: ``System.IO.DriveInfo....``

De 0 tussen rechte haakjes is de index van welke schijf je informatie wenst. 0 is de eerste harde schijf, 1 de tweede, enzovoort. 

Vraag aan de gebruiker het nummer van de harde schijf waar meer informatie over moet getoond worden. 

{% hint style='warning' %}
Opgelet: sta toe dat de gebruiker 1 voor de eerste harde schijf mag gebruiken, 2 voor de tweede, enzovoort. Je zal dus in code nog manueel 1 moeten aftrekken van de invoer van de gebruiken.
Bv:

```java
int invoer=int.Parse(Console.ReadLine()) - 1; 
long totalsize = DriveInfo.GetDrives()[invoer].TotalSize;  
```
{% endhint %}

## Weerstandberekenaar

Stel dat je in het labo een weerstand vastneemt en je kent de kleurcodes van de streepjes wel, maar niet hoe je die kunt omzetten naar de effectieve weerstandswaarde. In dit programma kunnen we de gebruiker helpen.

![Bron afbeelding: https://www.esdsite.nl](../assets/1_csharpbasics/colors.jpg)

### Deel 1

Maak een programma dat de weerstandwaarde berekent gebaseerd op:

* Ring 1: die de tientallen voorstelt
* Ring 2: die de eenheden voorstel
* (PRO) Ring 3: die de exponent (10 tot de macht) voorstelt. (tip:``Math.Pow(10,ring3)``)

Gebruik twee variabelen van het type ``int`` waar je getal van 0 tot 9 telkens aan kan toewijzen. (we veronderstellen dus dat de gebruiker de kleurcode heeft omgezet naar een getal en dat toewijst aan de variabele)

Test dat je rekening klopt om gebaseerd op 2 (of 3) ringen de weerstandswaarde te berekenen. 

### Deel 2

Plaats het geheel in een mooie Unicode-tabel

Hier enkele nuttige tekens:

```
╔═══════════════╦═══════════════╗
║               ║               ║
╟───────────────╫───────────────╢
║               ║               ║
╚═══════════════╩═══════════════╝
```

Gebruik $-string interpolatie om de informatie in de tabel te tonen zodat je volgende uitvoer kunt genereren:

![Je zal er geen UX-prijzen mee verdienen, maar it's a start](../assets/1_csharpbasics/tabel.png)

of:

![Nog een voorbeeld](../assets/1_csharpbasics/tabel2.png)

{% hint style='warning' %}
Gebruik tabs ("\t") om ervoor te zorgen dat je tabel mooi blijft wanneer je door de string interpolatie langere variabelen gaat plaatsen.
{% endhint %}

### Deel 3 (PRO)

Kan je afhankelijk van de ringwaarde het getal in de tabel in de juiste kleur zetten conform de weerstandskleuren (tip: je zal ``Write`` en ``if`` of ``switch`` moeten leren gebruiken).

{% hint style='warning' %}
Onder ander de kleur bruin is niet beschikbaar in de console. Wil je die kleur toch hebben, dan kan je werken met volgende handige bibliotheek: [ColorfulConsole](http://colorfulconsole.com/). In [volgende filmpje](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=87338728-f9ef-4201-8bd4-ac4c00988e72) leg ik uit hoe je deze bibliotheek installeert en gebruikt.
{% endhint %}

## Shell-starter (PRO)

Je kan de output van een ``Process.Start()`` programma naar je console scherm sturen. Dit vereist wat meer code. Volgend voorbeeld zal de output van het commando ``ipconfig /all`` op het scherm tonen:

```java
System.Diagnostics.Process process = new System.Diagnostics.Process();
process.StartInfo.FileName = "ipconfig";
process.StartInfo.Arguments = "/all"; 
process.StartInfo.UseShellExecute = false;
process.StartInfo.RedirectStandardOutput = true;
process.StartInfo.RedirectStandardError = true;
process.Start(); //start process

// Read the output (or the error)
string output = process.StandardOutput.ReadToEnd(); //normal output
Console.WriteLine(output);
string err = process.StandardError.ReadToEnd(); //error output (if any)
Console.WriteLine(err);
//Continue
Console.WriteLine("Klaar");
```

{% hint style='tip' %}
Let er op dat dit voorbeeld niet perfect werkt met een shell-commando dat even duurt. Denk bijvoorbeeld aan ``ping``. De output komt namelijk pas op het scherm als het commando is afgelopen. Test zelf maar eens!
{% endhint %}

Maak enkele kleine C# programma's die bepaalde shell-commando's zullen uitvoeren, eventueel na input van de gebruiker.
Enkele nuttige shell-commando's in de netwerk-sfeer zijn bijvoorbeeld:

<!---{line-numbers:false}--->
```text
hostname
arp -a
getmac
nslookup google.com
netstat
```

Andere toffe commando's kunnen zijn:

<!---{line-numbers:false}--->
```text
chrome.exe ap.be
notepad mytest.txt
```

Of de naam van een bestand dat je wilt openen, maar dan met het hele path:

<!---{line-numbers:false}--->
```text
c:\Temp\mydocument.docx
```

<!---{pagebreak}--->