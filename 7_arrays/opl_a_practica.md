# Oplossingen deel 1

## Oplossing opwarmers


```java
int[] getallen = new int[100];
for (int i = 0; i < getallen.Length; i++)
{
    getallen[i] = i + 1;
}

for (int i = 0; i < getallen.Length; i++)
{
    Console.WriteLine(getallen[i]);
}
```

```java
int[] getallen = new int[51];
for (int i = 0; i < getallen.Length; i++)
{
    getallen[i] = i * 2;
}

for (int i = 0; i < getallen.Length; i++)
{
    Console.WriteLine(getallen[i]);
}
```

```java
int[] getallen = new int[3];
for (int i = 0; i < getallen.Length; i++)
{
    Console.WriteLine($"Geef getal {i+1}:");
    getallen[i] = int.Parse(Console.ReadLine());
}
Console.WriteLine("Array bevat:");

for (int i = 0; i < getallen.Length; i++)
{
    Console.WriteLine(getallen[i]);
}
```

```java
string[] vrienden = { "Vincent", "Olga", "Bill", "Gotoman" };
Console.WriteLine($"Beste vriend is  {vrienden[0]}");
Console.WriteLine($"Tweede beste vriend is  {vrienden[1]}");
Console.WriteLine($"Derde beste vriend is  {vrienden[2]}");
Console.WriteLine($"Minst vriend is  {vrienden[3]}");
```

```java 
bool[] bits = new bool[20];
for (int i = 0; i < bits.Length; i++)
{
    if (i % 2 == 1)
        bits[i] = false;
    else
        bits[i] = true;
}

for (int i = 0; i < bits.Length; i++)
{
    Console.WriteLine(bits[i]);
}
```


```java 
bool[] bits = new bool[20];
Random r = new Random();
for (int i = 0; i < bits.Length; i++)
{
    if (r.Next(0,2)==0)
        bits[i] = false;
    else
        bits[i] = true;
}

int pos = 0;
int neg = 0;
for (int i = 0; i < bits.Length; i++)
{
    Console.WriteLine(bits[i]);
    if (bits[i] == true)
        pos++;
    else
        neg++;
}

Console.WriteLine($"Aantal positief {pos}");
Console.WriteLine($"Aantal negatief {neg}");
```

```java 
double[] getallen = new double[10];
Random r = new Random();

for (int i = 0; i < getallen.Length; i++)
{
    getallen[i] = r.NextDouble() * 10;
}

double gemiddelde = 0;
for (int i = 0; i < getallen.Length; i++)
{
    gemiddelde += getallen[i];
}
Console.WriteLine($"Gemiddelde is {gemiddelde/getallen.Length}");
```

```java
enum SchoolType { BSO, ASO, TSO, KSO};
static void Main(string[] args)
{
    SchoolType[] lijst = new SchoolType[20];
    Random r = new Random();

    for (int i = 0; i < lijst.Length; i++)
    {
        lijst[i] = (SchoolType)r.Next(0, 4);
    }

    int aantalBSO = 0;
    int aantalKSO = 0;
    int aantalASO = 0;
    int aantalTSO = 0;

    for (int i = 0; i < lijst.Length; i++)
    {
        Console.WriteLine(lijst[i]);
        switch (lijst[i])
        {
            case SchoolType.BSO:
                aantalBSO++;
                break;
            case SchoolType.ASO:
                aantalASO++;
                break;
            case SchoolType.TSO:
                aantalTSO++;
                break;
            case SchoolType.KSO:
                aantalKSO++;
                break;
            default:
                break;
        }

    }

    Console.WriteLine($"Aantal BSO: {aantalBSO}");
    Console.WriteLine($"Aantal TSO: {aantalTSO}");
    Console.WriteLine($"Aantal ASO: {aantalASO}");
    Console.WriteLine($"Aantal KSO: {aantalKSO}");
}
```



## Array Zoeker
Om niet steeds 10 getallen tijdens testen te moeten invullen gebruik ik ``Random`` om snel 10 getallen willekeurig te genereren:

```java
int[] ar = new int[10];
Random rand = new Random();
for (int i = 0; i < ar.Length; i++)
{
    ar[i] = rand.Next(1, 100);
    Console.WriteLine(ar[i]);
}
Console.WriteLine("Welk getal moet verwijderd worden?");
int todel = Convert.ToInt32(Console.ReadLine());

//index van te zoeken getal zoeken
int index = -1;
bool found = false;
for (int i = 0; i < ar.Length; i++)
{
    if(!found && ar[i] == todel)
    {
        found = true;
        index = i;
    }
}

//alle elementen vanaf index met 1 plekje vooruitschuiven
if(found)
{
    for (int i = index; i < ar.Length-1; i++)
    {
        ar[i] = ar[i + 1];
    }
    ar[ar.Length - 1] = -1; //laatste element op -1
}

//Array tonen
for (int i = 0; i < ar.Length; i++)
{
    Console.WriteLine(ar[i]);
}
```

## Leveringsbedrijf

Je kan dit ook oplossen met ``BinarySearch`` maar dan moet je wel de postcodes gesorteerd plaatsen in de array (sorteren via ``Array.Sort`` in code zal niet werken daar dan de relatie met ``kgpergemeente`` verloren gaat).

```java
int[] postcodes = { 1000, 2020, 2013, 4500, 2340, 1200, 9999, 6666, 2362, 2340 };

int[] kgpergemeente = { 12, 214, 3, 15, 56, 900, 13, 5, 111, 43 };

Console.WriteLine("Geef gewicht pakket");
int gewicht = Convert.ToInt32(Console.ReadLine());
Console.WriteLine("Naar welke postcode wenst u dit pakket te versturen?");
int postcode = Convert.ToInt32(Console.ReadLine());

//Zoek postcode
bool gevonden = false;
int index = 0;
do
{

    if (postcodes[index] == postcode)
    {
        gevonden = true;
    }
    else
        index++;
} while (!gevonden && index < postcodes.Length);
//berekenprijs
if (gevonden)
{
    int prijs = gewicht * kgpergemeente[index];
    Console.WriteLine($"Dit zal {prijs} euro kosten.");
}
else
    Console.WriteLine("Postcode niet gevonden!");
```

## Hamming Distance
Methode ``IsRealDNA`` hoorde niet bij opgave, maar is handig als om extra gebruiksvriendelijkheid aan te bieden:
```java
static void Main(string[] args)
{
    Console.WriteLine("Geef DNA string 1");
    char[] dna1 = Console.ReadLine().ToCharArray();
    Console.WriteLine("Geef DNA string 2");
    char[] dna2 = Console.ReadLine().ToCharArray();
    if (dna1.Length == dna2.Length && IsRealDNA(dna1) && IsRealDNA(dna2))
    {
        int hamdist = 0;
        for (int i = 0; i < dna1.Length; i++)
        {
            if (dna1[i] != dna2[i])
                hamdist++;
        }
        Console.WriteLine($"Distance is {hamdist}");
    }
    else
    {
        Console.WriteLine("Error: DNA strings niet van gelijke lengte of bevat illegale tekens");
    }
}

static bool IsRealDNA(char[] dna)
{
    for (int i = 0; i < dna.Length; i++)
    {
        char tocheck = dna[i];
        if (tocheck != 'G' && tocheck != 'C' & tocheck != 'A' && tocheck != 'T')
            return false;
    }
    return true;
}
```

## Puzzelen met array

```java

static void Main(string[] args)
{
    const int LENGTE = 20;
    int[] arr = new int[LENGTE];
    Random r = new Random();
    Console.WriteLine("Start:");
    for (int i = 0; i < arr.Length; i++)
    {
        //Console.WriteLine($"Geef getal {i+1}");
        //arr[i]= int.Parse(Console.ReadLine());
        arr[i] = r.Next(1, 101);
        Console.Write($"{arr[i]},");
    }
    //Opwarmer 1
    Console.WriteLine("\nOpwarmer 1");
    for (int i = arr.Length - 1; i >= 0; i--)
    {
        Console.Write($"{arr[i]},");
    }
    //Opwarmer 2
    Console.WriteLine("\nOpwarmer 2");
    int[] moved = new int[arr.Length];
    for (int i = 0; i < arr.Length; i++)
    {
        moved[i] = arr[(i + 1) % LENGTE];
    }
    PrintArray(moved);
    //Opwarmer 3
    Console.WriteLine("\nOpwarmer 3");
    int[] moved3 = new int[arr.Length];
    for (int i = 0; i < arr.Length; i++)
    {
        moved3[(i+3)%LENGTE] = arr[i];
    }
    PrintArray(moved3);
    //Opwarmer 4
    Console.WriteLine("\nOpwarmer 4");
    Console.WriteLine("Hoeveel plaatsen opschuiven?");
    int aantal = int.Parse(Console.ReadLine());
    int[] moved4 = new int[arr.Length];
    for (int i = 0; i < arr.Length; i++)
    {
        moved4[(i + aantal) % LENGTE] = arr[i];
    }
    PrintArray(moved4);
    //Opwarmer 5
    Console.WriteLine("\nOpwarmer 5");
    const int GETALPERKOLOM = 3;
    for (int i = 2; i < arr.Length; i++)
    {
        if((i)% GETALPERKOLOM == 0)
        {
            int[] temp = new int[GETALPERKOLOM];
            for (int j = 0; j < temp.Length; j++)
            {
                temp[j] = arr[i + j - GETALPERKOLOM];
            }
            Array.Sort(temp);
            for (int k = 0; k < temp.Length; k++)
            {
                Console.Write($" {temp[k]}");
            }
            Console.WriteLine();
        }
    }
    static void PrintArray(int[] inarr)
    {
        for (int i = 0; i < inarr.Length; i++)
        {
            Console.Write($"{inarr[i]},");
        }
    }
```

Opwarmer 6
```java
static void Main(string[] args)
{
    Random r = new Random();
    int[] getallen = new int[100];
    const int kolomBreedte = 3;

    //We simuleren input gebruiker met Random
    for (int i = 0; i < getallen.Length; i++)
    {
        getallen[i] = r.Next(0, 100);
    }


    for (int i = 0; i < getallen.Length/kolomBreedte; i++)
    {
        int[] kolom = new int[kolomBreedte];
        for (int j = 0; j < kolomBreedte; j++)
        {
            kolom[j] = getallen[i * kolomBreedte + j];
        }
        SorteerEnToonArray(kolom);
    }

    // Dit gedeelte is nodig indien de originele array geen exact veelvoud van het aantal elementen per deelarray
    int overschot = getallen.Length % kolomBreedte;
    if(overschot !=0)
    {
        int[] kolom = new int[overschot];
        for (int i = 0; i < overschot; i++)
        {
            kolom[i] = getallen[getallen.Length - 1 - i];
        }
        SorteerEnToonArray(kolom);
    }
}

private static void SorteerEnToonArray(int[] kolom)
{
    Array.Sort(kolom);
    for (int k = 0; k < kolom.Length; k++)
    {
        Console.Write($"{kolom[k]} ");
    }
    Console.WriteLine();
}
```
## Vraag Array
```java
string[] vragen =
{
    "Hoe oud ben je?",
    "Wat is je postcode?",
    "Hoeveel broers heb je?",
    "Hoeveel zussen heb je?",
    "Wanneer ben je geboren?",
    "Hoeveel is 3+5?"
};
int[] antwoorden = new int[vragen.Length];

for (int i = 0; i < vragen.Length; i++)
{
    Console.WriteLine(vragen[i]);
    antwoorden[i] = Convert.ToInt32(Console.ReadLine());
}

Console.WriteLine("Je antwoorden:");
for (int i = 0; i < vragen.Length; i++)
{
    Console.WriteLine($"{vragen[i]}: {antwoorden[i]}");
}
```

# Oplossingen deel 2

## Parkeergarage

```java
static void Main()
{
    Console.WriteLine("Geef aantal auto's in:");
    int aantal = Convert.ToInt32(Console.ReadLine());

    double[] duur = new double[aantal];

    for (int i = 0; i < duur.Length; i++)
    {
        Console.WriteLine($"Geef parkeertijd auto {i + 1} in (uren)");
        duur[i] = Convert.ToDouble(Console.ReadLine());

    }

    ToonResultaat(duur);
}

static void ToonResultaat(double[] duur)
{
    double somDuur = 0;
    double somKost = 0;
    Console.WriteLine("Auto\tDuur\tKost");
    for (int i = 0; i < duur.Length; i++)
    {
        double kost = berekenKosten(duur[i]);
        somKost += kost;
        somDuur += duur[i];
        
        Console.WriteLine($"{i+1}\t{duur[i]}\t{berekenKosten(duur[i])}");
    }
    Console.WriteLine($"Totaal\t{somDuur}\t{somKost}");
}

static double berekenKosten(double duur)
{

    double kost = 2;
    if (duur > 3)
    {
        double extra = Math.Ceiling(duur - 3);
        kost += (extra * 0.5);

    }
    if (duur >= 24)
    {
        kost = 10;
    }
    return kost;
}
```

## ArrayViewer

```java
static void VisualiseerArray(int[] array)
{
    for (int i = 0; i < array.Length; i++)
    {
        Console.Write($"{array[i]}\t");
    }
    Console.Write(Environment.NewLine);
}
```

## Caesar Encryptie

```java
static char[] DeCrypt(char[] cipertext, int key)
{
    return Encrypt(cipertext, -key);
}

static char[] Encrypt(char[] plaintext, int key)
{
    char[] result = new char[plaintext.Length];
    //werkt enkel voor kleine letters
    for (int i = 0; i < plaintext.Length; i++)
    {
        if (plaintext[i] == ' ')
            result[i] = ' ';
        else
        {
            int newchar = (int)plaintext[i] + key;
            if (newchar > 122) //nodig voor encrypt
                newchar -= 26;
            else if (newchar < 97) //nodig voor decrypt
                newchar += 26;

            result[i] = (char)newchar;
        }
    }
    return result;
}
```

## Determinant

```java
static int BerekenDeterminant(int[,] aMatrix)
{
    return aMatrix[0, 0] * aMatrix[1, 1] - aMatrix[0, 1] * aMatrix[1, 0];
}
```

## Robot simulator

```java
enum richtingen {Noord, Oost, Zuid, West};
static void Main(string[] args)
{
    int x = 7;
    int y = 3;
    richtingen richting = richtingen.Noord;
    bool[,] map = new bool[20, 20];

    string tekst = "AALAALALAAARAARAA";

    char[] opdrachten = tekst.ToCharArray();

    for (int i = 0; i < opdrachten.Length; i++)
    {
        switch (opdrachten[i])
        {
            case 'R':
                richting = RoteerRechts(richting);
                break;
            case 'L':
                richting = RoteerLinks(richting);
                break;
            case 'A':
                //missing: checken dat er niet uit randen wordt gegaan
                switch (richting)
                {
                    case richtingen.Noord:
                        y--;
                        break;
                    case richtingen.Oost:
                        x++;
                        break;
                    case richtingen.Zuid:
                        y++;
                        break;
                    case richtingen.West:
                        x--;
                        break;
                    default:
                        break;
                }
                map[x, y] = true;
                break;
        }
        TekenKaart(map);
        Console.ReadKey();
    }
}

private static void TekenKaart(bool[,] map)
{
    Console.Clear();
    for (int i = 0; i < map.GetUpperBound(0); i++)
    {
        for (int j = 0; j < map.GetUpperBound(1); j++)
        {
            if (map[j, i] == false)
                Console.Write(".");
            else
                Console.Write("X");
        }
        Console.Write(Environment.NewLine);
    }
}

private static richtingen RoteerLinks(richtingen richting)
{
    switch (richting)
    {
        case richtingen.Noord:
            return richtingen.West;
            break;
        case richtingen.Oost:
            return richtingen.Noord;
            break;
        case richtingen.Zuid:
            return richtingen.Oost;
            break;
        case richtingen.West:
            return richtingen.Zuid;
            break;
    }
    return richtingen.Noord;
}

private static richtingen RoteerRechts(richtingen richting)
{
    switch (richting)
    {
        case richtingen.Noord:
            return richtingen.Oost;
            break;
        case richtingen.Oost:
            return richtingen.Zuid;
            break;
        case richtingen.Zuid:
            return richtingen.West;
            break;
        case richtingen.West:
            return richtingen.Noord;
            break;
    }
    return richtingen.Noord;
}
```
