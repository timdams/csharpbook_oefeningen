
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
Console.WriteLine("Geef de zijde");
double zijde = double.Parse(Console.ReadLine());
double omtrek = zijde * 4; 
double oppervlakte= Math.Pow(zijde, 2);
Console.WriteLine($"Zijde: {zijde}");
Console.WriteLine($"Omtrekt: {omtrek}");
Console.WriteLine($"Oppervlakte: {oppervlakte}");
```

## Stacking armor calculator

```java
Console.WriteLine("Geef nominal health");
int nomH = int.Parse(Console.ReadLine());

Console.WriteLine("Geef armor ");
int armor = int.Parse(Console.ReadLine());

int effH =(int)((1+Armor/100.0)* nomH);

Console.WriteLine(effH);
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

## Geometric-fun

```java
Console.WriteLine("Geef de hoek in graden");
double hoekInGraden = int.Parse(Console.ReadLine());
double hoekInRadialen = hoekInGraden * ( Math.PI/180);

Console.WriteLine($"Sinus van {hoekInGraden} graden is {Math.Sin(hoekInRadialen)}");
Console.WriteLine($"Cosinus van {hoekInGraden} graden is {Math.Cos(hoekInRadialen)}");
Console.WriteLine($"Tangens van {hoekInGraden} graden is {Math.Tan(hoekInRadialen)}");
```

## BMI Berekenaar
```java
Console.WriteLine("Geef je gewicht in kg");
double gewicht = double.Parse(Console.ReadLine());
Console.WriteLine("Geef je lengte in cm");
double lengte = double.Parse(Console.ReadLine())/100;

double bmi = gewicht / Math.Pow(lengte, 2);

Console.WriteLine($"Je BMI is {Math.Round(bmi,2)}");
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
