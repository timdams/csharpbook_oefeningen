
![](../assets/infoclip.png)

* [Bespreking oplossingen hoofdstuk 3](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=0c5972b4-e091-40dc-84dc-a97600d27428)

## Supercomputer

```java
double getal1 = double.Parse(Console.ReadLine());
double getal2 = double.Parse(Console.ReadLine());
double getal3 = double.Parse(Console.ReadLine());
Console.WriteLine($"Gemiddelde is {(getal1+getal2+getal3)/3}");
```

## Vierkant

```java
Console.WriteLine("Geef de zijde:");
double zijde = double.Parse(Console.ReadLine());
double omtrek = zijde * 4; 
double oppervlakte= Math.Pow(zijde, 2);

Console.WriteLine($"Omtrek is {omtrek}");
Console.WriteLine($"Oppervlakte is {oppervlakte}");
```

## Elo-schaak

Input van de gebruiker wordt niet getoond maar zal je zelf hopelijk wel kunnen:

```java
const int K = 10;
double ra = 1000; //vraag dit aan de gebruiker
double rb = 1100; //vraag dit aan de gebruiker

double ea= 1 /(1+Math.Pow(10,(rb-ra)/400.0));
double eb = 1 / (1 + Math.Pow(10, (ra - rb) / 400.0));

double ranew = ra + K * (1 - ea);
double rbnew = rb + K * (0 - eb);
Console.WriteLine("Indien a wint:");
Console.WriteLine(Math.Round(ranew,0));
Console.WriteLine(Math.Round(rbnew,0));
//idem voor de 2 andere scenarios)
```


## Balk

```java
Console.WriteLine("Geef lengte");
int lengte = int.Parse(Console.ReadLine());
Console.WriteLine("Geef breedte ");
int breedte = int.Parse(Console.ReadLine());
Console.WriteLine("Geef hoogte ");
int hoogte = int.Parse(Console.ReadLine());

int opp = 2*lengte*breedte + 2*lengte*hoogte + 2* breedte*hoogte;

Console.WriteLine($"lengte: {lengte}");
Console.WriteLine($"breedte: {breedte}");
Console.WriteLine($"hoogte: {hoogte}");
Console.WriteLine($"oppervlakte: {opp}");
Console.WriteLine($"inhoud: {lengte*breedte*hoogte}");
```

## Geometric fun

```java
Console.WriteLine("Geef de hoek in graden:");
double hoekInGraden = double.Parse(Console.ReadLine());
double hoekInRadialen = hoekInGraden * ( Math.PI/180);

Console.WriteLine($"Sinus van {hoekInGraden} graden is {Math.Sin(hoekInRadialen)}");
Console.WriteLine($"Cosinus van {hoekInGraden} graden is {Math.Cos(hoekInRadialen)}");
Console.WriteLine($"Tangens van {hoekInGraden} graden is {Math.Tan(hoekInRadialen)}");
```

## BMI Berekenaar 
```java
Console.WriteLine("Wat is uw lengte in cm?");
double lengteInMeter = Convert.ToDouble(Console.ReadLine())/100;

Console.WriteLine("Wat is uw gewicht in kg?");
double gewicht = Convert.ToDouble(Console.ReadLine());

double bmi = gewicht / Math.Pow(lengteInMeter, 2);
Console.WriteLine($"Een persoon met een lengte van {lengteInMeter} m en een gewicht van {gewicht} kg heeft een BMI van {Math.Round(bmi,2)}");
   
```

## Op-de-poef
```java
int poef = 0;
int bedrag = 0;


Console.WriteLine("Voer bedrag in:");
bedrag = int.Parse(Console.ReadLine());
poef += bedrag;
Console.WriteLine($"De poef staat op {poef} euro");
Console.WriteLine("Voer bedrag in:");
bedrag = int.Parse(Console.ReadLine());
poef += bedrag;
Console.WriteLine($"De poef staat op {poef} euro");
Console.WriteLine("Voer bedrag in:");
bedrag = int.Parse(Console.ReadLine());
poef += bedrag;
Console.WriteLine($"De poef staat op {poef} euro");
Console.WriteLine("Voer bedrag in:");
bedrag = int.Parse(Console.ReadLine());
poef += bedrag;
Console.WriteLine($"De poef staat op {poef} euro");
Console.WriteLine("Voer bedrag in:");
bedrag = int.Parse(Console.ReadLine());
poef += bedrag;
Console.WriteLine($"De poef staat op {poef} euro");

Console.WriteLine("*****************");
double weken = Math.Ceiling(poef / 10.0);
string zin = $"Het totaal van de poef is {poef} en zal {weken} weken duren om volledig afbetaald te worden.";
Console.WriteLine(zin);
```
