## Main.cs

```csharp
Container c = new Container("TIM NV","Graan",30);
Container d = new Container("TIM NV", "Water", 30);
c.VoegContainerToe(d);
for (int i = 0; i <10; i++)
{
    c.Gewicht+=10;
    Console.WriteLine(Scanner.ScanContainer(c));
}
```

## Container.cs

```csharp
class Container
{
    public Container(string firma, string desc, int gewicht)
    {
        Bedrijf = firma;
        Beschrijving = desc;
        Gewicht = gewicht;
        GemaaktOp = DateTime.Now;
        LaatstAangepast = DateTime.Now;
    }

    public string Bedrijf { get; private set; }
    public string Beschrijving { get; set; }

    public DateTime LaatstAangepast { get; private set; }
    public DateTime GemaaktOp { get; private set; }

    private int gewicht;
    public int Gewicht
    {
        get { return gewicht; }
        set
        {
            LaatstAangepast = LaatstAangepast.AddDays(1);
            if (value <= 100 && value >= 0)
                gewicht = value;
            else
            {
                Console.WriteLine("Fout gewicht. Ingesteld op 100");
                gewicht = 100;
            }
        }
    }

    public void VoegContainerToe(Container cont)
    {
        if (cont.Bedrijf == Bedrijf)
        {
            if (cont.Gewicht + Gewicht < 100)
            {
                Gewicht += cont.Gewicht;
                Beschrijving = $"{Beschrijving} en {cont.Beschrijving}";
                cont.Ledig();
            }
            else
            {
                Console.WriteLine("Kan container niet toevoegen. Dit zou gewicht boven de 100 brengen");
            }
        }
        else
        {
            Console.WriteLine("Containers zijn niet van zelfde firma. Kan niet samenvoegen.");
        }
    }

    public void Ledig()
    {
        Beschrijving = "leeg";
        Gewicht = 0;
    }

    public TimeSpan InWerking()
    {
        return LaatstAangepast - GemaaktOp;
    }
}
```

## Scanner.cs

```csharp
class Scanner
{
    public static string ScanContainer(Container cont)
    {
        string report = $"\n---CONTAINERREPORT {cont.Bedrijf.ToUpper()}---";
        report += $"\n\tLading:{cont.Beschrijving}";
        if (cont.Gewicht==0)
        {
            report += "\n\tContainer is leeg";
        }
        else
            report += $"\n\tGewicht lading={cont.Gewicht}";

        if(cont.InWerking().TotalDays >= 5)
        {
            report+="\n*****Deze container heeft verdacht veel gewichtsveranderingen ondergaan";
        }
        report += "\n----------------";
        return report;
    }
}
```