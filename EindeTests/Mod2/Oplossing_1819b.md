```csharp
using System;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] naamArray = new string[100];
            string[] resultaatArray = new string[100];
            bool isAdmin = false;

            while (true)
            {


                isAdmin = VraagDetails(naamArray);
                if (!isAdmin)
                {
                    string result = StemWijzer(ConsoleColor.Green, isAdmin);

                    int teller = 0;
                    do
                    {
                        teller++;
                    } while (teller < naamArray.Length && naamArray[teller] != null);
                    resultaatArray[teller - 1] = result;

                    ToonStatistieken(naamArray, resultaatArray);
                }
                else
                {
                    StemWijzer(ConsoleColor.Red, isAdmin);
                }
            }

        }
        enum Partijen { VVD, D66, BAS, LA }
        private static void ToonStatistieken(string[] naamArray, string[] resultaatArray)
        {
            int[] totals = new int[4];
            for (int i = 0; i < resultaatArray.Length; i++)
            {
                switch (resultaatArray[i])
                {
                    case "VVD":
                        totals[(int)Partijen.VVD]++;
                        break;
                    case "D66":
                        totals[(int)Partijen.D66]++;
                        break;
                    case "BAS":
                        totals[(int)Partijen.BAS]++;
                        break;
                    case "LA":
                        totals[(int)Partijen.LA]++;
                        break;
                }
            }
            Console.WriteLine($"VVD percentage={totals[(int)Partijen.VVD] / resultaatArray.Length}");
            Console.WriteLine($"D66 percentage={totals[(int)Partijen.D66] / resultaatArray.Length}");
            Console.WriteLine($"BAS percentage={totals[(int)Partijen.BAS] / resultaatArray.Length}");
            Console.WriteLine($"LA percentage={totals[(int)Partijen.LA] / resultaatArray.Length}");

            ToonPartijAantal("VVD", totals[(int)Partijen.VVD]);
            ToonPartijAantal("D66", totals[(int)Partijen.D66]);
            ToonPartijAantal("BAS", totals[(int)Partijen.BAS]);
            ToonPartijAantal("LA", totals[(int)Partijen.LA]);

            //Gemiddelde naamlengte
            int totaalLetters = 0;
            int totaalNamen = 0;
            for (int i = 0; i < naamArray.Length; i++)
            {
                if (naamArray[i] != null)
                {
                    totaalNamen++;
                    totaalLetters += naamArray[i].Length;
                }
            }
            Console.WriteLine($"Gemiddelde naamlengte= {totaalLetters / totaalNamen:D2}");
            Console.WriteLine("Stemoverzicht");
            for (int i = 0; i < naamArray.Length; i++)
            {
                if (naamArray[i] != null)
                    Console.WriteLine($"{naamArray[i][0]}, {resultaatArray[i]}");
            }
        }

        static void ToonPartijAantal(string naam, int aantal)
        {
            Console.Write($"{naam} ");
            for (int i = 0; i < aantal; i++)
            {
                Console.Write("*");
            }
            Console.WriteLine();
        }
        static bool VraagDetails(string[] naamIn, ConsoleColor kleur = ConsoleColor.Red)
        {
            Console.ForegroundColor = kleur;
            bool opnieuw = false;
            int teller = 0; string naam;

            do
            {
                opnieuw = false;
                Console.WriteLine("Geef je naam");
                naam = Console.ReadLine();
                teller = -1;
                do
                {
                    teller++;
                    if (naamIn[teller] == naam)
                    {
                        Console.WriteLine("Naam bestaat reeds!");
                        opnieuw = true;
                    }


                } while (teller < naamIn.Length - 1 && naamIn[teller] != null);
            } while (opnieuw);
            Console.ResetColor();
            if (naam != "admin")
            {
                naamIn[teller] = naam;
                return false;
            }
            else
                return true;

        }
        static string StemWijzer(ConsoleColor colorIn, bool isAdmin = false)
        {
            Random r = new Random();
            Console.ForegroundColor = colorIn;
            int aantalJa = 0;
            int aantalNee = 0;
            string result = "";

            if (Vraag("Vrije sluitingstijden in de horeca?"))
            {
                aantalJa++;
                if (Vraag("Politie moet harde optreden"))
                {
                    aantalJa++;
                    result = "VVD";

                }
                else
                {
                    aantalNee++;
                    result = "D66";
                }
            }
            else
            {

                aantalJa++;
                if (Vraag("Extra evenementen"))
                {
                    aantalJa++;
                    result = "BAS";
                }
                else
                {
                    aantalNee++;
                    result = "LA";
                }

            }
            Console.ResetColor();
            ToonResultaat(result, aantalJa, aantalNee);
            return result;
        }

        static void ToonResultaat(string keuze, int aantalJa, int aantalNee)
        {
            Console.Clear();
            Console.WriteLine($"De partij waar je best op stemt is {keuze} je hebt hiervoor {aantalJa} keer ja geantwoord en {aantalNee} keer nee");
        }
        static bool Vraag(string vraagZin)
        {

            string input = "";
            do
            {
                Console.WriteLine($"{vraagZin}(ja/nee)");
                input = Console.ReadLine();
            } while (input != "ja" && input != "nee");
            if (input == "ja")
                return true;
            return false;
        }
    }
}

```