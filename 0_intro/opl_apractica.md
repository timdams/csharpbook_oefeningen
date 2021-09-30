



## Oplossing Rommelzin

```java
Console.WriteLine("Wat is je favoriete kleur?");
string favKleur = Console.ReadLine();
Console.WriteLine("Wat is je favoriete eten?");
string favEten = Console.ReadLine();
Console.WriteLine("Wat is je favoriete boek?");
string favBoek = Console.ReadLine();
Console.WriteLine("Wat is je favoriete auto?");
string favAuto = Console.ReadLine();


Console.WriteLine("Je favoriete kleur is"+ favEten +". Je eet graag"+ favAuto +". Je lievelingsfilm is"+ favBoek +" en je favoriete boek is "+ favKleur);
```

## Met kleuren

```java
//...
//Op het einde
Console.BackgroundColor = ConsoleColor.Blue;
Console.Write("Je favoriete kleur is "+ favEten);
Console.BackgroundColor = ConsoleColor.Green;
Console.Write(".Je eet graag"+ favAuto);
Console.BackgroundColor = ConsoleColor.Red;
Console.Write(".Je lievelingsfilm is "+ favBoek);
Console.BackgroundColor = ConsoleColor.Yellow;
Console.WriteLine(" en je favoriete boek is "+ favKleur + ".");
```

Of per woord:

```java
//...
//Op het einde
Console.BackgroundColor = ConsoleColor.Blue;
Console.Write("Je ");
Console.BackgroundColor = ConsoleColor.Green;
Console.Write("favoriete ");
Console.BackgroundColor = ConsoleColor.Red;
Console.Write("kleur ");
Console.BackgroundColor = ConsoleColor.Yellow;
Console.Write("is ");
Console.BackgroundColor = ConsoleColor.Lime;
Console.Write(favEten);
//enzovoort
```


## Visitekaart

```java
Console.WriteLine("Wat is je naam?");
string naam = Console.ReadLine();
Console.WriteLine("Waar woon je?");
string adres = Console.ReadLine();
Console.WriteLine("Wat is je hobby?");
string hobby = Console.ReadLine();
Console.WriteLine("Waarom koos je voor deze opleiding?");
string opleiding = Console.ReadLine();
Console.WriteLine("Waarom koos je voor AP?");
string ap = Console.ReadLine();

Console.WriteLine("Goed. Hier volgt je visite kaartje"");

Console.WriteLine("Naam: " + naam); 
Console.WriteLine("Adres: "+ adres); 
Console.WriteLine("Hobby: "+ hobby); 
Console.WriteLine("Waarom deze opleiding volgen:" +opleiding ); 
Console.WriteLine("Waarom op AP:" + ap); 
```

## Tekening

```java
Console.BackgroundColor = ConsoleColor.Red; 
Console.WriteLine("       ");
Console.Write("  ");
Console.BackgroundColor = ConsoleColor.Green;
Console.Write("   ");
Console.BackgroundColor = ConsoleColor.Red;
Console.WriteLine("  ");
Console.WriteLine("       ");

Console.ResetColor();
```