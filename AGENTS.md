# Rakendusliku Majandusanalüüsi Projekt (Kodu 2) – AGENTS.md

Selles failis on kirjeldatud projekti reeglid, struktuur ja ülevaade tehtud muudatustest. See on projekti peamine ja keskne juhiste fail.

## 1. Projekti ülevaade ja eesmärk
- **Projekt:** Kausaalne hindamine (MEM5230 Rakenduslik majandusanalüüs, lühiprojekt nr 2, TalTech 2026).
- **Autorid:** Steven Sepp ja Mark Sverker Saar.
- **Meetod:** Erinevused-erinevustes (*Difference-in-Differences*, DID).
- **Andmestik:** `snow` R-paketist `causaldata` (John Snow' 1855. aasta koolerauuringu agregeeritud andmed: 1849 vs. 1854, Lambeth vs. Southwark & Vauxhall).
- **Tehnoloogiad:** R (`causaldata`, `dplyr`, `ggplot2`), MS Word (`.docx`), MS PowerPoint (`.pptx`).

## 2. Kaustastruktuur ja peamised failid
Kõik lõplikud ja kehtivad töödokumendid asuvad kaustas **`Lõplik/`**:
- `Lõplik/luhiprojekt2_vormistatud.docx` – Lõplik vormistatud uurimistöö (koos DAG-joonise, DID-mudelite, kontrafaktuaali joonise ja allikakirjetega).
- `Lõplik/esitlus_snow uus.pptx` – Lõplik esitlus (7 slaidi koos esineja märkmete ehk *speaker notes*'idega).
- `Lõplik/snow_analuusikood_selgitustega.R` – Lõplik R-i analüüsikood koos selgitavate kommentaaridega.
- `Lõplik/tõlgendamine.docx` – Põhjalik abimaterjal tabelite, kordajate, DAG-i ja jooniste samm-sammuliseks tõlgendamiseks.

Abifailid juurkaustas:
- `Lühiprojekt_Nr2 juhend (S2026).pdf` – Lühiprojekti ametlik juhend ja nõuded.
- `INVESTEERIMINE PLAATINASSE JA PALLAADIUMISSE EESTI INVESTORI VAATEST.docx (2).pdf` – Vormistuse ja akadeemilise stiili näidisdokument.

## 3. Stiili- ja vormistusnõuded ning reeglid
- **Olulised dokumendid:** Olulised on ainult kausta `Lõplik/` dokumendid. Juurkaustas olnud varasemad samasisulised mustandid (`luhiprojekt2.Rmd`, `esitlus.Rmd`, `esitlus.pdf`, `koolerasuremus_did.pdf`, `dag.png`, `luhiprojekt2.pdf`, `snow_analuusikood.R`) on eemaldatud ja neid ei taastata.
- **Keelekasutus:** Konkreetne, selge ja akadeemiline eesti keel. Arvudes kasutatakse eesti keele reeglite kohaselt kümnendkoma (nt `-56,9`) ja korrektselt miinusmärki (`−`).
- **Käsitsi muudatuste kaitse:** Kõik kasutaja poolt käsitsi tehtud muudatused kausta `Lõplik/` failides (`.docx`, `.pptx`, `.R`) peavad alati 100% säilima.
