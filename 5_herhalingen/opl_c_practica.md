# Oplossing practica deel 3

## Oplossing grootste getal
Toe te voegen lijnen aangeduid met ``//NEW``.
```java
int x= 0;
int y= 0;
int grootste= int.MinValue; //NEW
do
{
    y = y + x;
    Console.WriteLine("Voer gehele waarden in (32767=stop)");
    string instring= Console.ReadLine();
    x = Convert.ToInt32(instring);
    if (x > grootste && x != 32767) //NEW
        grootste = x; //NEW
} while (x != 32767);
Console.WriteLine($"Som is {y}");
Console.WriteLine($"Grootste getal is {grootste}");//NEW
```

## Oplossing Boekhouder

[Uitleg via filmpje](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=72f4f97f-5baa-4f9f-8985-b0c000f4f1ce)

```java
string invoer = "";
int somPos = 0;
int somNeg = 0;
int somTotaal = 0;
int teller = 0;
do
{
    
    Console.WriteLine("Geef getal. q is stoppen");
    invoer = Console.ReadLine();
    if (invoer != "q")
    {
        teller++;
        int getalInvoer = int.Parse(invoer);
        somTotaal += getalInvoer;
        if(getalInvoer>0)
        {
            somPos += getalInvoer;
        }
        else
        {
            somNeg += getalInvoer;
        }
        Console.WriteLine($"Som pos: {somPos}");
        Console.WriteLine($"Som neg: {somNeg}");
        Console.WriteLine($"Som totaal: {somTotaal}");
        Console.WriteLine($"Gemiddelde : {(double)somTotaal/teller}");
    }
} while (invoer !="q");

Console.WriteLine("FINAAL:");
Console.WriteLine($"Som pos: {somPos}");
Console.WriteLine($"Som neg: {somNeg}");
Console.WriteLine($"Som totaal: {somTotaal}");
Console.WriteLine($"Gemiddel : {somTotaal / teller}");
```


### WiskundeQuiz

```java
string gebruikersInput = "";
int gebruikersGetal = 0;
const int BEGIN_WAARDE = 1;
const int EIND_WAARDE = 10;
const int LEVEL_UP_WAARDE = 5;
Random randomGetal = new Random();
int eersteFactor, tweedeFactor, totaal;
int correcteOplossingen = 0;
int levels = 1;
bool correct = true;

Console.WriteLine("Welkom bij de wiskunde quiz, druk op 'q' om te stoppen of antwoord op de onderstaande vragen: ");
do
{

    eersteFactor = randomGetal.Next(BEGIN_WAARDE, (EIND_WAARDE + 1)*levels);
    tweedeFactor = randomGetal.Next(BEGIN_WAARDE, (EIND_WAARDE + 1)*levels);
    totaal = eersteFactor * tweedeFactor;
    Console.WriteLine($"{eersteFactor} * {tweedeFactor} = ? ");
    gebruikersInput = Console.ReadLine();
    if (gebruikersInput != "q")
    {
        gebruikersGetal = Convert.ToInt32(gebruikersInput);
        if (gebruikersGetal == totaal)
        {
            Console.WriteLine($"correct, het juiste antwoord was inderdaad: {totaal}");
            correcteOplossingen++;
            if (correcteOplossingen % LEVEL_UP_WAARDE == 0)
            {
                levels++;
                Console.WriteLine($"Je hebt een nieuw niveau bereikt, je niveau is nu: {levels}");
            }
        }
        else
        {
            Console.WriteLine("Fout...");
            Console.WriteLine($"Je had {correcteOplossingen} correcte oplossingen.");
            correct = false;
        }
    }
} while (gebruikersInput != "q" && correct);

if (correct)
{
    Console.WriteLine($"Je had {correcteOplossingen} correcte oplossingen.");
}
```
Dank aan Olivier Van Ransbeeck!

## Oplossing BeerSong
```java
for (int i= 99; i > 2; i--)
{
    Console.WriteLine($"{i} bottles of beers on the wall, {i} bottles of beer.");
    Console.WriteLine($"Take one down and pass it around, {i - 1} bottles of beer on the wall.");
}
Console.WriteLine("2 bottles of beer on the wall, 2 bottles of beer.\n" +
                    "Take one down and pass it around, 1 bottle of beer on the wall.\n" +

                    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
                    "Take it down and pass it around, no more bottles of beer on the wall.\n" +

                    "No more bottles of beer on the wall, no more bottles of beer.\n" +
                    "Go to the store and buy some more, 99 bottles of beer on the wall.");
```
