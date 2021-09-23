
## Gemiddelde

```csharp
int september = 224;
int oktober = 177;
int november = 210;
double gemiddelde = (september + oktober + november) / 3.0;
Console.WriteLine("Je sliep gemiddeld:"+gemiddelde + " uren per maand.");     
```


## Euro naar dollar

```csharp
int bedragInEuro = 54;
double koers = 1.03;
double bedragInDollar = bedragInEuro * koers;
Console.WriteLine(bedragInEuro + " EUR is gelijk aan "+bedragInDollar + " USD.");
```

## Tafel en Console.Clear()

```csharp
int tafel = 411;
int getal = 1;

Console.WriteLine(tafel+"x"+getal+"="+ (tafel*getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
getal++;
Console.ReadLine();
Console.Clear();
Console.WriteLine(tafel + "x" + getal + "=" + (tafel * getal));
      
```

## Kill/Death-ratio

```csharp
int kills=44;
double deaths = 9.0;

Console.WriteLine("Je k/d-ratio is "+(kills/deaths));
```

## BTW
```csharp
double prijs = 20;
double BTW = 21.0;

double berekening = prijs + (prijs / 100) * BTW;

Console.WriteLine(prijs + "euro zonder btw, " + berekening + " euro met BTW");    
```

## Gewicht in space

```csharp
double gewichtOpAarde = 80.6;
double gMerc = 0.38;
double gVenus = 0.91;
//enzovoort

Console.WriteLine("Je weegt op Mercurius "+ (gewichtOpAarde*gMerc)+ " kg.");
Console.WriteLine("Je weegt op Venus " + (gewichtOpAarde * gVenus) + " kg.");
//enzovoort
```

## Tekstmaker

```java
Console.WriteLine("Filenaam?");
string filen = Console.ReadLine();
Console.WriteLine("Inhoud bestand?");
string inhoud = Console.ReadLine();

System.IO.File.WriteAllText(filen, inhoud);
```