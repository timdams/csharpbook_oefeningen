```csharp
const int MIN_DAG= 1;
const int MAX_DAG= 5;

Console.WriteLine("Wat wil je doen? Covidbeslissingshelper (c) of covidquiz (q)");
char keuze = char.Parse(Console.ReadLine());
switch (keuze)
{
    case 'q':
        Random generator = new Random();
        int vraagGetal = generator.Next(MIN_DAG, MAX_DAG+1);
        Console.WriteLine($"Je bent al {vraagGetal} dagen in quarantaine");
        Console.WriteLine("Hoeveel dagen moet je wachten voor je getest moet worden?");
        int antwoordGebruiker = int.Parse(Console.ReadLine());
        int oplossing = MAX_DAG - vraagGetal;
        if(antwoordGebruiker == oplossing)
        {
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Correct");
        }
        else
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("Fout");
        }
        break;
    case 'c':
        bool moetInQuarantine = false;
        Console.WriteLine("Vertoon je covid symptomen?(j/n)");
        string symptomenVraag = Console.ReadLine();
        if(symptomenVraag== "n")
        {
            Console.WriteLine("In nauw contact gekomen met iemand die ziek is?(j/n)");
            string nauwcontactVraag = Console.ReadLine();
            if (nauwcontactVraag == "n")
            {
                Console.BackgroundColor = ConsoleColor.Green;
                Console.WriteLine("Je mag naar school blijven gaan");
            }
            else
                moetInQuarantine = true;
        }
        if(symptomenVraag=="j" || moetInQuarantine)
        {
            Console.WriteLine("Ga in quarantaine en laat je testen");
            Console.WriteLine("Heb je een positieve test?(j/n)");
            string posTestGebruiker = Console.ReadLine();
            if(posTestGebruiker=="j")
            {
                Console.BackgroundColor = ConsoleColor.Red;
                Console.WriteLine("7 dagen quarantine");
            }
            else
            {
                Console.BackgroundColor = ConsoleColor.Green;
                Console.WriteLine("Naar school wanneer genezen");
            }
        }
        break;
    default:
        Console.WriteLine("Verkeerde invoer");
        break;
}
```