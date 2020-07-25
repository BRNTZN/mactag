# mactag

Script to read tags from an excel file and apply them to listed files


## Instructies (nl)

1. Eerst moeten er bepaalde componenten geïnstalleerd worden, open de LaunchPad en start een terminal:

![Open terminal op mac](doc/screenshot1.png)

2. Kopiëer onderstaand commando en plak het in de terminal, druk daarna op enter:


```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
```

![Curl commando](doc/screenshot2.png)

Als je je eigen username onderaan terug ziet verschijnen dan is het commando klaar en kan je naar de volgende stap.

![Curl commando uitgevoerd](doc/screenshot3.png)

3. Voer ook volgende commando's uit om pip te installeren:

```
python get-pip.py
```

```
export PATH=$PATH:~/Library/Python/2.7/bin
```

4. Nu kan pip gebruikt worden om openpyxl en xattr te installeren:

```
pip install openpyxl
```

```
pip install xattr
```