#  Chuck Norris Joke App

## Kravspecifikation

### - Appen ska visa en lista med skämt hämtade från chucknorris.io

### - Skämten laddas in ett i taget genom att slumpas fram med en knapptryckning

### - Om ett skämt slumpas fram som redan finns i listan ska ett felmeddelande visas och skämtet sparas inte

### - Skämten i listan ska visa en text med de första 30 tecknen av skämtet följt av "..." samt datum då skämtet skapades i backend, listan ska sorteras enligt äldsta skämten överst. Datumet ska visas i UTC med svensk locale.

Marginalen ska vara 16px till leading, trailing och 8px till top och bottom
+----------------------------------------+
|        This is an example of  ...           |
|        2021-05-05                               |
+----------------------------------------+

### - Listan ska visas i en UINavigationController med titel "Chuck Norris Jokes" och en knapp uppe till höger för att slumpa fram skämt

+----------------------------------------+
|        Chuck Norris Jokes     | Joke! | |
+----------------------------------------+
|        This is an example of  ...           |
|        2021-05-05                               |
+----------------------------------------+
|        This is an example of  ...           |
|        2021-05-05                               |
+----------------------------------------+
|        This is an example of  ...           |
|        2021-05-05                               |
+----------------------------------------+
|        This is an example of  ...           |
|        2021-05-05                               |
+----------------------------------------+

### - När man trycker på ett skämt i listan ska man komma till en detaljvy som visar upp all metadata om ett skämt, detaljvyn ska följa MVVM-mönster.

Detaljvyn ska visa id som titel och därefter lista parametrar enligt följande, ikonen ska laddas ned och visas som en bild i lämplig storlek 
[icon] created_at
updated_at 
link
categories1, categories2, etc
value
