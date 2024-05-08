# Oplossingen 

# Figures with interfaces

{% hint style='tip' %}
**Les(sen) uit deze oefening:** de Array.Sort methode werkt enkel indien je individuele objecten de ``IComparable``-interface implementeren. Polymorfisme komt hier ook bij kijken want de parameter die binnenkomt is van het type object (daar de interface beschreven is voor alle mogelijke klassen). M.b.v. ``is`` en ``as`` is het een goede oefening om steeds te controleren of dat het binnenkomende object wel voldoet.
{% endhint %}


```csharp
public class Rechthoek: IComparable
{
    //Alle vorige zaken
    //...

    public int CompareTo(object obj)
    {
        Rechthoek temp = obj as Rechthoek;
        if(temp!=null)
        {
            if (temp.Breedte * temp.Lengte > Breedte * Lengte)
                return -1;
            else if (temp.Breedte * temp.Lengte < Breedte * Lengte)
                return 1;
            return 0;
        }
        throw new Exception("Object niet van type Rechthoek");
    }
}
```

# Carbon footprint

{% hint style='tip' %}
**Les(sen) uit deze oefening:** Dankzij polymorfisme kunnen we objecten van eender welk type ook tijdelijk beschouwen als een soort "interface-objecten": we kunnen dan enkel die zaken waar de interface uit bestaat aanroepen op het object. Ook hier gebruiken we het ``as`` keyword om een object om te zetten (en te controleren of het gelukt is) naar z'n interface. Vervolgens is het maar een kwestie van de klassieke loop-code om een lopende som en grootste waarde te vinden.
{% endhint %}



```csharp

List<object> vervuilers = new List<object>();
vervuilers.Add(new Plant());
vervuilers.Add(new Huis() { Volume = 200 });
vervuilers.Add(new Fabriek() { Werknemers = 10 });
vervuilers.Add(new Auto() { Merk = AutoMerk.Audi });
vervuilers.Add(new Plant());
vervuilers.Add(new Huis() { Volume = 100 });
vervuilers.Add(new Fabriek() { Werknemers = 25 });
vervuilers.Add(new Auto() { Merk = AutoMerk.Volvo });

int som = 0;
int max = -1;
int maxindex = -1;
for (int i = 0; i < vervuilers.Count; i++)
{

    var vuileI = vervuilers[i] as ICarbonFootPrint;
    if (vuileI != null)
    {
        int print = vuileI.BerekenFootPrint();
        Console.WriteLine($"{vervuilers[i].GetType()}:{print}");
        som += print;
        if (print > max)
        {
            max = print;
            maxindex = i;
        }
    }
}
Console.WriteLine($"Gemiddelde footprint is {som/vervuilers.Count}");
if(maxindex>-1)
    Console.WriteLine($"{vervuilers[maxindex]} op positie {maxindex} heeft grootste footprint {max}");
```


```csharp
public class Huis : ICarbonFootPrint
{
    public int Volume { get; set; }
    private double footprintfactor = 1;
    public int BerekenFootPrint()
    {
        return (int)(Volume * 10 * footprintfactor);
    }

    public void VerlaagFootprint()
    {
        if (BerekenFootPrint() > 1)
            footprintfactor -= 0.1;
    }
}

public class Fabriek : ICarbonFootPrint
{
    public int Werknemers { get; set; }
    private int factor = 100;
    public int BerekenFootPrint()
    {
        return Werknemers * factor;
    }

    public void VerlaagFootprint()
    {
        if (factor > 5)
            factor--;
    }
}

public enum AutoMerk { BMW, Volvo, Audi }
public class Auto : ICarbonFootPrint
{
    public AutoMerk Merk { get; set; }
    private int factor = 1;
    public int BerekenFootPrint()
    {
        switch (Merk)
        {
            case AutoMerk.BMW:
                return 10 + factor;
                break;
            case AutoMerk.Volvo:
                return 12 + factor;
                break;
            case AutoMerk.Audi:
                return 14 + factor;
                break;
            default:
                break;
        }
        return 0;
    }

    public void VerlaagFootprint()
    {
        if (factor > 0)
            factor--;
    }
}
public class Plant
{ }

public interface ICarbonFootPrint
{
    int BerekenFootPrint();
    void VerlaagFootprint();
}
```