
![](../assets/infoclip.png)

* [Bespreking BMI met if](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=8d5602e2-ef82-486c-ba60-a981009b3a61)
* [Bespreking Ohmberekenaar](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=3d9dcd19-a130-4287-8ef2-a981009dc942)
* [Bespreking Orakeltje van Delphi, part Deux](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=d0ff5c46-9839-483f-97dd-a98100a28b9d)
* [Bespreking Kleurcode weerstand naar Ohm](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=a272f856-78cd-44a6-afbd-a981009f7253)


# Code

## BMI met if

Voeg volgende code toe aan het bestaande BMI programma:
```java
if(bmi < 18.5)
{
    Console.ForegroundColor = ConsoleColor.Red;
    Console.WriteLine("Ondergewicht");
}
else if(bmi < 25)
{
    Console.ForegroundColor = ConsoleColor.Green;
    Console.WriteLine("Normaal gewicht");
}
else if (bmi < 30)
{
    Console.ForegroundColor = ConsoleColor.DarkYellow;
    Console.WriteLine("Overgewicht");
}
else if (bmi < 40)
{
    Console.ForegroundColor = ConsoleColor.Red;
    Console.WriteLine("Zwaarlijvigheid");
}
else
{
    Console.ForegroundColor = ConsoleColor.Magenta;
    Console.WriteLine("Ernstige zwaarlijvigheid");
}
```


## Schaak-elo met if

```java
const int K = 10;
Random rng = new Random();
Console.WriteLine("Rating speler A?");
double ra = double.Parse(Console.ReadLine());
if(ra<0)
{
    Console.BackgroundColor = ConsoleColor.Red;
    ra = rng.Next(500, 3001);
    Console.WriteLine($"Negatieve rating mag niet. Ik pas deze aan naar random getal, namelijk {ra}.");
    Console.ResetColor();
}
Console.WriteLine("Rating speler B?");
double rb = double.Parse(Console.ReadLine());
if (rb < 0)
{
    Console.BackgroundColor = ConsoleColor.Red;
    rb = rng.Next(500, 3001);
    Console.WriteLine($"Negatieve rating mag niet. Ik pas deze aan naar random getal, namelijk {rb}.");
    Console.ResetColor();
}



double ea = 1 / (1 + Math.Pow(10, (rb - ra) / 400.0));
double eb = 1 / (1 + Math.Pow(10, (ra - rb) / 400.0));


Console.WriteLine("Wie is er gewonnen? A, B of D  (draw)");
string whowon = Console.ReadLine();
double puntA = 0;
double puntB = 0;
if(whowon=="A")
{
    puntA = 1;
}
else  if (whowon =="B")
{
    puntB = 1;
}
else if (whowon =="D")
{
    puntA = 0.5;
    puntB = 0.5;
}
else
{
    puntA = 1;
    Console.WriteLine("Onbekende waarde. Ik laat A winnen.");
}


double ranew = ra + K * (puntA - ea);
double rbnew = rb + K * (puntB - eb);
Console.WriteLine("Indien a wint:");
Console.WriteLine($"Nieuwe rating van A:{Math.Round(ranew, 0)}");
Console.WriteLine($"Nieuwe rating van A:{Math.Round(rbnew, 0)}");
```

## Schoenverkoper

### a

```java
Console.WriteLine("Hoeveel schoenen koopt de klant?");
int aantal = Convert.ToInt32(Console.ReadLine());
int kortingBoven = 9;
int prijs = 0;
if (aantal <= kortingBoven)
{
    prijs = aantal * 20;
}
else
{
    prijs = kortingBoven * 20;
    prijs += (aantal - kortingBoven) * 10;
}
Console.WriteLine($"Prijs is {prijs}");
```

### b
```java
Console.WriteLine("Hoeveel schoenen koopt de klant?");
int aantal = Convert.ToInt32(Console.ReadLine());
Console.WriteLine("Boven hoeveel schoenen wordt de korting gegeven?");
int kortingBoven = Convert.ToInt32(Console.ReadLine());
int prijs = 0;
if (aantal <= kortingBoven)
{
    prijs = aantal * 20;
}
else
{
    prijs = kortingBoven * 20;
    prijs += (aantal - kortingBoven) * 10;
}
Console.WriteLine($"Prijs is {prijs}");
```
## Enum seizoenen

```java
enum Seizoenen { Winter, Lente, Zomer, Herfst, Onbekend}     
```

```java
Console.WriteLine("Geef een maandnummer (1 tot 12)");
int maand = Convert.ToInt32(Console.ReadLine());
Seizoenen huidigSeizoen = Seizoenen.Onbekend;
switch(maand)
{
    case 1:
    case 2:
    case 3:
        huidigSeizoen = Seizoenen.Winter;
        break;
    case 4:
    case 5:
    case 6:
        huidigSeizoen = Seizoenen.Lente;
        break;
    case 7:
    case 8:
    case 9:
        huidigSeizoen = Seizoenen.Zomer;
        break;
    case 10:
    case 11:
    case 12:
        huidigSeizoen = Seizoenen.Herfst;
        break;
    default:
        huidigSeizoen = Seizoenen.Onbekend;
        break;

}

if(huidigSeizoen== Seizoenen.Winter || huidigSeizoen== Seizoenen.Herfst)
    Console.WriteLine("Dat is een koud seizoen!");
else if(huidigSeizoen == Seizoenen.Zomer || huidigSeizoen == Seizoenen.Lente)
    Console.WriteLine( "Dat is een warm seizoen!");
else //Seizoen.Onbekend
    Console.WriteLine("Dat is geen seizoen!");

```

## Bankrekening controle

```java
//voorbeeldrekenignummer 000 1459325 57
Console.WriteLine("Geef eerste 3 cijfers");
long deel1= long.Parse(Console.ReadLine());
Console.WriteLine("Geef de volgende 7 cijfers");
long deel2= long.Parse(Console.ReadLine());
Console.WriteLine("Geef de laatse 2 cijfers");
int checksum= int.Parse(Console.ReadLine());

int controle=(int)((deel1*Math.Pow(10,7) + deel2)%97);
if(controle == checksum)
{
    Console.WriteLine("Geldige rekening");
}
else
{
    Console.WriteLine("Niet geldige rekening");
}
```


## Schaakstuk


De omslachtige manier:
```java
enum Kleur {Wit, Zwart};
enum Schaakstukken {Pion, Toren, Loper, Paard, Koning, Koningin}
public static void Main()
{
    Random rng = new Random();
    
    string stuk1="";
    switch((Kleur)rng.Next(0,2))
    {	
        case Kleur.Wit:
            stuk1 += "wit ";
            break;
        default:
            stuk1 += "zwart ";
            break;
    }
    
    switch((Schaakstukken)rng.Next(0,6))
    {	
        case Schaakstukken.Pion:
            stuk1 += "pion";
            break;
        case Schaakstukken.Toren:
            stuk1 += "toren";
            break;
        case Schaakstukken.Loper:
            stuk1 += "loper";
            break;
        case Schaakstukken.Paard:
            stuk1 += "paard";
            break;
        case Schaakstukken.Koning:
            stuk1 += "koning";
            break;
        case Schaakstukken.Koningin:
            stuk1 += "koningin";
            break;
        default:
            stuk1 += "onbekend";
            break;
    }
    Console.WriteLine(stuk1);
    
    //doe bovenstaande nog 2x
}

```

De snelle manier:

```java
enum Kleur {Wit, Zwart};
enum Schaakstukken {Pion, Toren, Loper, Paard, Koning, Koningin}
public static void Main()
{
    Random rng=new Random();
    
    Console.WriteLine($"{(Kleur)rng.Next(0,2)} {(Schaakstukken)rng.Next(0,6)}");
    Console.WriteLine($"{(Kleur)rng.Next(0,2)} {(Schaakstukken)rng.Next(0,6)}");
    Console.WriteLine($"{(Kleur)rng.Next(0,2)} {(Schaakstukken)rng.Next(0,6)}");
}
```
