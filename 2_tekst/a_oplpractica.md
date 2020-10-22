
![](../assets/infoclip.png)

* [Bespreking oefeningen Systeem informatie en Weerstandberekenaar](https://ap.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=7e2513f7-7002-4687-a214-a97000751f5e)

# Code oplossingen

## Unicode Art

```java
            string myname = @"▄▄▄█████▓ ██▓ ███▄ ▄███▓   ▓█████▄  ▄▄▄       ███▄ ▄███▓  ██████ 
▓  ██▒ ▓▒▓██▒▓██▒▀█▀ ██▒   ▒██▀ ██▌▒████▄    ▓██▒▀█▀ ██▒▒██    ▒ 
▒ ▓██░ ▒░▒██▒▓██    ▓██░   ░██   █▌▒██  ▀█▄  ▓██    ▓██░░ ▓██▄   
░ ▓██▓ ░ ░██░▒██    ▒██    ░▓█▄   ▌░██▄▄▄▄██ ▒██    ▒██   ▒   ██▒
  ▒██▒ ░ ░██░▒██▒   ░██▒   ░▒████▓  ▓█   ▓██▒▒██▒   ░██▒▒██████▒▒
  ▒ ░░   ░▓  ░ ▒░   ░  ░    ▒▒▓  ▒  ▒▒   ▓▒█░░ ▒░   ░  ░▒ ▒▓▒ ▒ ░
    ░     ▒ ░░  ░      ░    ░ ▒  ▒   ▒   ▒▒ ░░  ░      ░░ ░▒  ░ ░
  ░       ▒ ░░      ░       ░ ░  ░   ░   ▒   ░      ░   ░  ░  ░  
          ░         ░         ░          ░  ░       ░         ░  
                            ░                                    ";
            Console.WriteLine(myname);
```

## ASCI Art & Colors

```java

Console.Write("▄▄▄█████▓ ██▓ ███▄ ▄███▓   ");
Console.ForegroundColor = ConsoleColor.Red; 
Console.Write("▓█████▄"); 
Console.ResetColor(); 
Console.Write("  ▄▄▄       ███▄ ▄███▓  ██████ \n");
Console.Write("▓  ██▒ ▓▒▓██▒▓██▒▀█▀ ██▒   "); 
Console.ForegroundColor = ConsoleColor.Red; 
Console.Write("▒██▀ ██▌"); Console.ResetColor(); 
Console.Write("▒████▄    ▓██▒▀█▀ ██▒▒██    ▒ \n");
Console.Write("▒ ▓██░ ▒░▒██▒▓██    ▓██░   "); 
Console.ForegroundColor = ConsoleColor.Red; 
Console.Write("░██   █▌"); Console.ResetColor(); 
Console.Write("▒██  ▀█▄  ▓██    ▓██░░ ▓██▄   \n");
Console.Write("░ ▓██▓ ░ ░██░▒██    ▒██    "); 
Console.ForegroundColor = ConsoleColor.Red; 
Console.Write("░▓█▄   ▌"); Console.ResetColor(); 
Console.Write("░██▄▄▄▄██ ▒██    ▒██   ▒   ██▒\n");
Console.Write("  ▒██▒ ░ ░██░▒██▒   ░██▒   "); 
Console.ForegroundColor = ConsoleColor.Red; Console.Write("░▒████▓ "); 
Console.ResetColor(); Console.Write(" ▓█   ▓██▒▒██▒   ░██▒▒██████▒▒\n");
string blood = @"  ▒ ░░   ░▓  ░ ▒░   ░  ░    ▒▒▓  ▒  ▒▒   ▓▒█░░ ▒░   ░  ░▒ ▒▓▒ ▒ ░
░     ▒ ░░  ░      ░    ░ ▒  ▒   ▒   ▒▒ ░░  ░      ░░ ░▒  ░ ░
░       ▒ ░░      ░       ░ ░  ░   ░   ▒   ░      ░   ░  ░  ░  
░         ░         ░          ░  ░       ░         ░  
                ░ ";
Console.WriteLine(blood);
```



## Weerstandsberekenaar

```java
int ring1 = 5;
int ring2 = 7;

int weerstandswaarde = ring1 * 10 + ring2;

Console.WriteLine("╔═══════════════╦═══════════════╦═══════════════╗");
Console.WriteLine("║ Ring 1        ║ Ring 2        ║   Weerstand   ║");
Console.WriteLine("╟───────────────╫───────────────╢───────────────╢");
//De tabs zorgen ervoor dat de volgende ║ steeds op de zelfde plaats komt,
//ongeacht de lengte van de variabelen ring1,ring2 en weerstandswaarde
Console.WriteLine($"║ {ring1}\t\t║{ring2}\t\t║{weerstandswaarde}\t\t║");
Console.WriteLine($"╚═══════════════╩═══════════════╩═══════════════╝");



//PRO
int tolerantie = 4;
double totweerstand = weerstandswaarde * Math.Pow(10, tolerantie);
```