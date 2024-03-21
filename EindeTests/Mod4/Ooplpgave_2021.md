

```csharp
class GPSLocation
{
    static Random rng = new Random();
    public GPSLocation(): this(rng.Next(1,10), rng.Next(1,10))
    {
        
    }
    public GPSLocation(int lat, int lon)
    {
        Latitude = lat;
        Longitude = lon;
    }

    public int Latitude { get; set; }
    public int Longitude { get; set; }
    public override string ToString()
    {
        return $"Latitude:{Latitude}, Longitude:{Longitude}";
    }
}
```

```csharp
class AdvancedGPSLocation: GPSLocation
{
    public AdvancedGPSLocation():base()
    {
        Height = 1;
    }
    public AdvancedGPSLocation(int lat, int lon, int h): base(lat, lon)
    {
        Height = h;
    }
    public int Height { get; set; }

    public override string ToString()
    {
        return $"{base.ToString()}, Height:{Height}";
    }
}
```



```csharp
interface ITrackable
{
    GPSLocation GetCurrentLocation();
}
```

```csharp
class SportItem
{
    public override string ToString()
    {
        return "een eenvoudig sportitem";
    }
}
```

```csharp
class Drinkbus : SportItem, ITrackable
{
    public GPSLocation GetCurrentLocation()
    {
        return new GPSLocation();
    }

    public override string ToString()
    {
        return "een drinkbus";
    }
}
```

```csharp
class Rugzak : ITrackable
{
    public GPSLocation GetCurrentLocation()
    {
        return new AdvancedGPSLocation();
    }

    private Dictionary<string, SportItem> inhoud = new Dictionary<string, SportItem>();

    public Dictionary<string, SportItem> Inhoud
    {
        get { return inhoud; }
        set { inhoud = value; }
    }


    public override string ToString()
    {

        string result =$"Rugzak op locatie:  {GetCurrentLocation()} \n Met inhoud:";
        foreach (var item in inhoud)
        {
            result += $"\n\t\t{item.Key} ({item.Value})";
            if (item.Value is ITrackable)
            {
                result += "\n\t\t\t-Laatste locatie is " + ((ITrackable)item.Value).GetCurrentLocation();
            }
            else
                result += "\n\t\t\t-Geen tracker aanwezig";
        }
        return result;
    }

    public void Visualiseer()
    {
        var loc = GetCurrentLocation();
        Console.SetCursorPosition(loc.Latitude, loc.Latitude);
        Console.Write("r");
        foreach (var item in inhoud)
        {
            if(item.Value is Drinkbus)
            {
                var locw = (item.Value as Drinkbus).GetCurrentLocation();
                Console.SetCursorPosition(locw.Latitude, locw.Latitude);
                Console.Write("D");
            }

        }
    }
}
```

```csharp
class Program
{
    static void Main(string[] args)
    {
        Rugzak r = new Rugzak();
        Console.WriteLine("Hoeveel sportitems moeten er in de rugzak?");
        int am = int.Parse(Console.ReadLine());
        Random rng = new Random();
        for (int i = 0; i < am; i++)
        {
            SportItem toadd;
            if (rng.Next(0, 2) == 0)
                toadd = new SportItem();
            else
                toadd = new Drinkbus();
            Console.WriteLine($"Ik koos {toadd} voor je. Welke key moet dit krijgen?");
            r.Inhoud.Add(Console.ReadLine(), toadd);
        }
        Console.WriteLine("Klaar. Druk op enter telkens hierna om nieuwe visualisatie te doen");
        Console.ReadLine();
        while(true)
        {
            Console.Clear();
            Console.WriteLine(r);
            Console.ReadLine();
            Console.Clear();
            r.Visualiseer();
            Console.ReadLine();
        }
    }
}
```