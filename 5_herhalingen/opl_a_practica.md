
![](../assets/infoclip.png)

* [Oplossingen eerste opwarmers](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=be06eb23-fc0f-4863-93e1-ac79008c180a)

# Oplossing practica deel 1
## Oplossing Tafels van vermenigvuldiging:
```java
int teller= 1;
while(teller <= 10)
{
    int product= teller * 10;
    Console.WriteLine($"{teller} x 10 = {product}");
    teller++;
}
```

## Oplossing DNA Transscriptie
```java
string inp= "", DNA= "", RNA= "";
do
{
    Console.WriteLine("Voer G, C, T of A in");
    inp = Console.ReadLine();
    switch(inp)
    {
        case "G":
            DNA += "G";
            RNA += "C";
            break;
        case "C":
            DNA += "C";
            RNA += "G";
            break;
        case "T":
            DNA += "T";
            RNA += "A";
            break;
        case "A":
            DNA += "A";
            RNA += "U";
            break;
        default:
            Console.WriteLine("Onbekende invoer. We stoppen ermee.");
            inp = "stop";
            break;
    }
}while(inp != "stop");
Console.WriteLine("Resultaat:");
Console.WriteLine(DNA);
Console.WriteLine(RNA);	  
```

## Oplossing Armstrong nummer
```java
    Console.WriteLine("Voer getal in:");
    int getal= Convert.ToInt32(Console.ReadLine());
    //1° Aantal cijfers ontdekken
    int aantalcijfers= 0;
    int deling= 0;
    int maaltien= 10;
    do
    {
        deling = getal / maaltien;
        maaltien *= 10;
        aantalcijfers++;
    } while (deling != 0);
    
    //2° Kijken of het armstrong is
    int som = 0;
    int enkelgetal = 0;
    int aantalloops = aantalcijfers;
    int tussengetal = getal;
    while (aantalloops > 0)
    {
        enkelgetal = tussengetal / (int)Math.Pow(10, aantalloops - 1);
        som += (int)Math.Pow(enkelgetal, aantalcijfers);

        tussengetal = tussengetal - (enkelgetal * (int)Math.Pow(10, aantalloops - 1));
        aantalloops--;
    }

    if (som == getal)
    {
        Console.WriteLine("Getal is een armstrong getal!");
    }
```

## Oplossing Euler project
```java
int som= 0;
for (int i= 0; i <= 1000; i++)
{
    if(i % 3 == 0 || i % 5 == 0)
    {
        som += i;
    }
}
Console.WriteLine($"Som:{som}");
```

