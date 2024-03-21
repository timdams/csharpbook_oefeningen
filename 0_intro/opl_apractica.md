



## Oplossing Rommelzin

```csharp
Console.WriteLine("Geef je favoriete kleur:");
string favKleur = Console.ReadLine();
Console.WriteLine("Geef je favoriete eten:");
string favEten = Console.ReadLine();
Console.WriteLine("Geef je favoriete auto:");
string favBoek = Console.ReadLine();
Console.WriteLine("Geef je favoriete boek:");
string favAuto = Console.ReadLine();


Console.WriteLine("Je favoriete kleur is "+ favEten +". Je eet graag "+ favAuto +". Je lievelingsfilm is"+ favBoek +" en je favoriete boek is "+ favKleur +".");
```

## Met kleuren

```csharp
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

```csharp
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

```csharp
Console.WriteLine("Wat is je voornaam?");
string voornaam = Console.ReadLine();
Console.WriteLine("Wat is je achternaam?");
string achternaam = Console.ReadLine();
Console.WriteLine("Waar woon je?");
string adres = Console.ReadLine();
Console.WriteLine("Wat is je hobby?");
string hobby = Console.ReadLine();

Console.WriteLine("Goed. Hier volgt je visitekaartje");

Console.ForegroundColor = ConsoleColor.Red;
Console.Write("Naam: ");
Console.ResetColor();
Console.WriteLine(voornaam + " " + achternaam);
Console.ForegroundColor = ConsoleColor.Yellow;
Console.Write("Adres: ");
Console.ResetColor();
Console.WriteLine(adres);
Console.ForegroundColor = ConsoleColor.Green;
Console.Write("Hobby: ");
Console.ResetColor();
Console.WriteLine(hobby);
```

## Tekening

```csharp
Console.BackgroundColor = ConsoleColor.Red;
Console.WriteLine("       ");
Console.Write("  ");
Console.BackgroundColor = ConsoleColor.Green;
Console.Write("   ");
Console.BackgroundColor = ConsoleColor.Red;
Console.WriteLine("  ");
Console.Write("  ");
Console.BackgroundColor = ConsoleColor.Green;
Console.Write("   ");
Console.BackgroundColor = ConsoleColor.Red;
Console.WriteLine("  ");
Console.WriteLine("       ");

Console.ResetColor();
```