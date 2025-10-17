#  Chuck Norris Joke App

## Kravspecifikation

### - Appen ska visa en lista med skämt hämtade från chucknorris.io

### - Skämten laddas in ett i taget genom att slumpas fram med en knapptryckning

### - Om ett skämt slumpas fram som redan finns i listan ska ett felmeddelande visas med **röd text** och skämtet sparas inte

### - Vyer skapas i SwiftUI

### - Skämten i listan ska visa en text med de första 30 tecknen av skämtet följt av "..." samt datum då skämtet skapades i backend, listan ska sorteras enligt äldsta skämten överst. Datumet ska visas i UTC med svensk locale.

### - Texter i appen ska kunna skalas till 200% och element ska ha rätt accessibility traits.

Marginalerna ska vara 16px till leading, trailing och 8px till top och bottom

    +------------------------------------+
    |    This is an example of  ...      |
    |    2021-05-05                      |
    +------------------------------------+

### - Listan ska visas i en vy med titel (navigation bar) "Chuck Norris Jokes" och en knapp uppe till höger för att slumpa fram skämt

    +------------------------------------+
    |    Chuck Norris Jokes     | Joke! ||
    +------------------------------------+
    |    This is an example of  ...      |
    |    2021-05-05                      |
    +------------------------------------+
    |    This is an example of  ...      |
    |    2021-05-05                      |
    +------------------------------------+
    |    This is an example of  ...      |
    |    2021-05-05                      |
    +------------------------------------+
    |    This is an example of  ...      |
    |    2021-05-05                      |
    +------------------------------------+

### - När man trycker på ett skämt i listan ska man komma till en detaljvy (push) som visar upp all metadata om ett skämt.

Detaljvyn ska visa id som titel och därefter lista parametrar enligt följande, ikonen ska laddas ned asynkront och visas som en bild.

[icon] created_at
updated_at 
link
categories1, categories2, etc
value

## Övriga krav
### Projektet ska inte innehålla några varningar
### Interfacet för ChuckService ska se till att man bara kan kasta fel av typen ChuckError 
### ChuckWorker ska skapas varje gång man gör ett nytt nätverksanrop och därefter deallokeras.
### Bonus: Idag finns det en NetworkCache för att lagra data, den kan bara hantera ChuckJoke. Gör den generisk för att kunna hantera även andra skämt än ChuckJoke.
