# Rakendusliku Majandusanalüüsi Projekt (Kodu 2) - Juhised ja muudatuste logi

Selles failis on kirjeldatud projekti reeglid, struktuur ja ülevaade tehtud muudatustest. Seda faili kasutavad tehisintellektist assistendid konteksti säilitamiseks.

## Üldised Juhised
- **Projekt:** Kausaalne hindamine (MEM5230 lühiprojekt nr 2).
- **Meetod:** Difference-in-Differences (DID).
- **Andmestik:** `snow` paketist `causaldata` (John Snow koolerauuring 1855).
- **Peamised failid:**
  - `snow_analuusikood.R` - R-i kood analüüsi tegemiseks ja joonise loomiseks.
  - `luhiprojekt2.Rmd` - Uurimistöö tekst ja koodi põimimine RMarkdown formaadis.
  - `esitlus.Rmd` - Ettekande slaidide RMarkdown kood.
  - `Lühiprojekt_Nr2 juhend (S2026).pdf` - Projekti ametlik juhend ja nõuded.
  - `INVESTEERIMINE PLAATINASSE JA PALLAADIUMISSE EESTI INVESTORI VAATEST.docx (2).pdf` - Näidisdokument, millest šnitti võtta akadeemilise kirjutamisstiili ja vormistuse osas.
- **Tööriistad:** Tuleb kasutada RStudio programmi failide (.Rmd) kompileerimiseks PDF-iks nupu "Knit" abil.
- **Keelekasutus:** Konkreetne, lühike ja akadeemiline eesti keel ("üleliigse rasvata"). Kirjutamisstiili ja vormistuse eeskujuks on kaasasolev näidisdokument.

## Muudatuste logi (Kuhu on muudatusi tehtud)
* **10. oktoober 2026:**
  * Loodud `snow_analuusikood.R` - lisatud DID regressioon ja joonise eksport.
  * Loodud `luhiprojekt2.Rmd` - loodud uurimistöö struktuur vastavalt nõuetele (kuni 10 lk nõue täidetud optimaalse lühidusega). Lisatud Dagitty tekstiline DAG (NB: `Veevõtukoht` muudetud `Vesi`, et vältida UTF-8 parseerimise vigu Dagittys).
  * Parandatud DID kausaalse mõju arvutus Rmd tekstis (-56.9).
  * Parandatud ggplot2 `size` asendamine `linewidth`-iga.
  * Loodud `esitlus.Rmd` - 6 slaidi pikkune beamer esitlus.
  * Loodud `GEMINI.md` ja `CLAUDE.md` (see fail) assistentide juhiste ja logi haldamiseks.
