# mactag

Script om tags van een excel bestand te lezen en toe te passen op de gegeven bestanden.


## Installeren

Deze stappen dienen eenmalig uitgevoerd te worden:

1. Download het script: 

Rechtsboven staat een groene knop met het woordje Code erop, klik erop en klik dan op `Download ZIP`

Als je browser vraagt of het ok is om van github te downloaden klik je op `Allow`

Pak het ZIP bestand uit door er op te dubbelklikken, nu staat er een nieuwe map in je Downloads map.


2. Open de LaunchPad en start een terminal:

![Open terminal op mac](doc/screenshot1.png)

3. Kopiëer onderstaand commando en plak het in de terminal, druk daarna op enter:


```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
```

![Curl commando](doc/screenshot2.png)

Als je je eigen username onderaan terug ziet verschijnen dan is het commando klaar en kan je naar de volgende stap.

![Curl commando uitgevoerd](doc/screenshot3.png)

Voer ook volgende commando's uit om pip te installeren:

```
python get-pip.py
```

```
export PATH=$PATH:~/Library/Python/2.7/bin
```

5. Nu kan pip gebruikt worden om openpyxl en biplist te installeren:

```
pip install openpyxl
```

```
pip install biplist
```

6. Nu enkel nog de permissies goedzetten voor het script:

```
chmod 755 ~/Downloads/mactag-master/tags.command
```

Als mac je vraagt of terminal aan je bestanden mag komen klik je op ok.

Voila, het script is geïnstalleerd. 

Om te testen rechtermuisklik op tags.command in de mactag-master folder in je downloads. Klik dan op openen. Klik vervolgens op Open.

Het script voert nu uit en de fotos eiffel en pisa hebben tags gekregen zoals vermeld in tags.xlsx

Je kan nu het script verplaatsen naar de folder waar de bestanden die getagged moeten worden zich bevinden, zorg dat er ook een xlsx bestand staat genaamd `tags.xlsx` met de nodige tags.
