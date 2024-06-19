
# Boekencollectie (Essential)

Maak een applicatie die een gebruiker in staat stelt om zijn/haar boekencollectie te beheren. De boekengegevens worden opgeslagen in een tekstbestand op de computer. De gebruiker moet boeken kunnen toevoegen, verwijderen, en de volledige lijst van boeken kunnen bekijken.

De applicatie moet de volgende menu-opties bieden:
1. Een nieuw boek toevoegen
2. Een boek verwijderen
3. Alle boeken weergeven
4. Programma afsluiten

Elke regel in het tekstbestand (boeken.txt) representeert een boek in het volgende formaat: Titel;Auteur;Jaar

Bijvoorbeeld:

```text
De Hobbit;J.R.R. Tolkien;1937
Harry Potter en de Steen der Wijzen;J.K. Rowling;1997
Het Leven van Pi;Yann Martel;2001
```

# IMDB Top 100 JSON (Essential)


Op [deze site](https://github.com/hjorturlarsen/IMDB-top-100/blob/master/data/movies.json) vind je de top 100 films ooit volgens IMDB. Download het bestand en gebruik het om een applicatie rond te ontwikkelen. De applicatie toont een menu'tje met volgende functionaliteiten:

1. Top 100 titels tonen.
2. Zoeken naar een titel (of deel ervan) en dan tonen op welke plek de titel staat.
3. Voor een nummer tussen 1 en 100 in en open vervolgens de browser (zoek zelf op hoe dit kan mbv ``Process``) naar de bijhorende IMDB-pagina van die film. Je gebruikt hiervoor het id van de film, bv: "https://www.imdb.com/title/tt0111161/" indien je de pagina van The Shawnshank Redemption nodig hebt.

# Bitmap header analyzer (Essential)

Maak een applicatie die de headerinformatie van een bitmap-afbeelding binair inleest en de basisinformatie ervan toont. Je gaat de hoogte, breedte en bitdiepte van de afbeelding tonen aan de gebruiker. De gebruiker kan zelf ingeven welk bitmap (.bmp)-bestand moet ingelezen worden.

Een BMP-header bevat veel details, maar voor deze opdracht richten we ons op de volgende informatie:

* Breedte van de afbeelding: bytes 18-21 (4 bytes, Little Endian)
* Hoogte van de afbeelding: bytes 22-25 (4 bytes, Little Endian)
* Bitdiepte van de afbeelding: bytes 28-29 (2 bytes, Little Endian)

Ter info de volledige structuur van de BMP header (eerste 54 bytes):

* BMP Signature: bytes 0-1 (2 bytes)
* File Size: bytes 2-5 (4 bytes)
* Reserved: bytes 6-9 (4 bytes)
* Data Offset: bytes 10-13 (4 bytes)
* DIB Header Size: bytes 14-17 (4 bytes)
* Width: bytes 18-21 (4 bytes)
* Height: bytes 22-25 (4 bytes)
* Planes: bytes 26-27 (2 bytes)
* Bit Depth: bytes 28-29 (2 bytes)

Tips:

* De ``ReadBytes`` methode van een ``BinaryReader`` aanvaardt een ``int`` als parameter om aan te geven hoevel bytes je van het bestand wilt inlezen.
* De ``BitConverter``-klasse kan eenvoudig bytes omzetten naar ``int`` met behulp van de ``ToInt32`` klasse.