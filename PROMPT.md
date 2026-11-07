# Prompt: nieuwe oefenapp maken op basis van de H2 Formules-app

Kopieer alles onder de streep en plak het in een nieuw gesprek met Claude.
Voeg daarna de screenshots van de boekpagina's en de antwoorden toe.
Vul eerst de vier regels tussen [ ] in.

---

Je bouwt een nieuwe oefenapp voor wiskunde, VMBO Basis.
Gebruik de bestaande app als basis.
Die staat in mijn GitHub-repository:
`miekevankemenade/2KB_formules_korterschrijven_werken_met_formules_formules_-vergelijken`

**Nieuwe app**
- Onderwerp: [bijv. Hoofdstuk 3 Verhoudingen, § 3.1 t/m 3.3]
- Klas: [bijv. 2KB]
- Naam van de nieuwe repository: [bijv. 2KB_H3_verhoudingen]
- Opdrachten die eruit moeten: [bijv. 41 en 42, of "geen"]

Ik stuur screenshots van de boekpagina's (theorie en opdrachten) en van het antwoordenboek.

## Werkwijze

1. Clone de bestaande repository en kopieer alles naar de nieuwe repository.
2. Verander in `index.html` alleen de inhoud: de objecten `CTX` en `SECTIES`, de assenstelsels (`G..`) en de domeincodes (`D4..`).
   Laat de rest van de code staan. Daar zitten alle functies in die ik al heb goedgekeurd.
3. Zet in `config.js` de nieuwe `MODULE`-naam. De Supabase-gegevens blijven hetzelfde.
4. Maak bij elk theorieblok een animatiefilmpje (zie hieronder) en zet het in `videos/`.
5. Neem alle opdrachten uit de screenshots over. Controleer elk antwoord met het antwoordenboek.
6. Test de app automatisch: elke opdracht moet goed te beantwoorden zijn, zonder fouten in de console. Test ook op een telefoonscherm (400 px breed).
7. Push naar GitHub en zet GitHub Pages aan (branch main, map /root).
8. Vertel me welke opdrachten je zelf hebt moeten opstellen, omdat ze niet volledig op de screenshots stonden.

## Doelgroep en taal

- Leerlingen VMBO Basis met een taalachterstand en een rekenniveau onder 2F.
- Schrijf in eenvoudig Nederlands: korte zinnen, één opdracht per zin.
- **Elke zin op een eigen regel.** Gebruik in `intro` en `vraag` voor elke zin een apart item.
- Formules zet je op een eigen regel met `'F:'` ervoor, bijvoorbeeld `'F:tijd × 10 + 40 = aantal liters'`.
- Vermijd moeilijke woorden zoals "vermenigvuldigingsteken", "letterformule", "roosterpunt" en "gelijkwaardig" (dat laatste alleen met uitleg).
- Hints helpen, maar geven het antwoord niet weg.

## Lay-out en huisstijl (staat al in de basis)

- Twee kolommen van gelijke breedte: links de afbeelding, grafiek of tabel, rechts de opdracht.
- Alles past op één scherm.
- Lettertype Montserrat, tekst 10 punt, formules 12 punt.
- Kleuren: roze `#E924D5`, paars `#5E0696`, cyaan `#45EDFF`.
- Een witregel tussen de algemene opdracht en de vraag.
- Bij elke vraag staat het examendomein, bijvoorbeeld `WI/K/4 Algebraïsche verbanden`. Zoek het juiste domein op in de syllabus VMBO 2027.

## Soorten opdrachten (velden in `SECTIES`)

| type | gebruik | belangrijkste velden |
|---|---|---|
| `num` | één getal | `ans`, `eenheid` |
| `tijd` | een tijdstip | `ans: '8:56'` |
| `tabel` | tabel invullen | `kop`, `xs`, `ans`, `gegeven` (vakjes die al ingevuld zijn) |
| `stappen` | berekening stap voor stap | `begin` (de formule), `velden: [{tpl: '4 × ({} − 7) = n', ans: [-3], invul: true}, …]`. Elke `{}` is een invulvakje. Zet nooit tussenuitkomsten voor; de leerling vult zelf het getal in en rekent elke stap uit. |
| `mk` | meerkeuze | `opties`, `ans` (index). Met `multi: true` en `ans: [0, 2]` kiest de leerling er meer, en dan verschijnt de knop "Wis antwoorden". |
| `formule` | formule typen | `orig`, `vars`, en eventueel `zonderKeer`, `begin`, `moetStarten`, `aantal: 2` |
| `grafiek` | zelf punten zetten | `g` (assenstelsel), `f` (de lijn), `min` (minimum aantal punten), `bron: ['22b']` (tabel van de vorige vraag, die boven de grafiek komt) |
| theorie | filmpje | `{theorie: true, titel, video, tekst: [...]}` |

Elke opdracht heeft ook `hint: [...]` (stappen), `uitleg: [...]` (voor de stap-voor-stap-hulp na 4 fouten) en eventueel `fouten: {'waarde': 'soort fout'}` voor de foutenanalyse.

## Grafieken

- Leerlingen tekenen zelf. Ze kunnen geen punten typen en zien geen coördinaten als ze over het rooster bewegen.
- Bij een grafiekopdracht staat de tabel van de vorige vraag boven het assenstelsel, als één tabel die bij de grafiek hoort.
- Het assenstelsel om in te tekenen is groot. De andere grafieken passen in de linkerhelft.
- Kies de schaal (`xs`, `ys`, `snapX`, `snapY`) zo dat alle punten uit de tabel precies op een roosterpunt vallen.

## Theoriefilmpjes

- Een animatiefilmpje per theorieblok, 1280 × 720, mp4.
- Gebruik dezelfde huisstijl: paarse titelkaart, formules die stap voor stap veranderen, negatieve getallen in rood, een "Onthoud"-kaart aan het eind.
- Gebruik een Vlaamse mannenstem: Piper, stem `nl_BE rdh medium` (uit de GitHub-release `rhasspy/piper v0.0.2`, bestand `voice-nl-rdh-medium.tar.gz`), `--length-scale 1.08`.
- Schrijf letters zoals je ze uitspreekt ("kaa", "em", "pee"), × als "keer" en −4 als "min vier".
- De animatie wacht tot de stem een zin heeft uitgesproken.
- Gebruik in de filmpjes dezelfde eenvoudige taal als in de app.

## Functies die al in de basis zitten (niet veranderen)

- Punten: 2 punten als het in één keer goed is; 1 punt bij de tweede poging of na een hint; 0 punten daarna.
- Cijfer = (punten ÷ totaal × 9) + 1, afgerond op één decimaal.
- Schrijffouten tellen niet als fout. Denk aan: een woord in plaats van een getal, een vergeten haakje, een verkeerde letter, lege vakjes.
- Foutenanalyse, gokkans, kopieerknop voor Forms en download als .txt of .json.
- Rekenmachine in examenmodel. Je kunt hem verslepen, en het min-teken werkt ook voor negatieve getallen. Je kunt de som na de uitkomst nog aanpassen. Met de knop "Kopieer naar antwoordvak" zet je de uitkomst in het antwoordvak.
- Voorleesfunctie met 🔊 Lees voor en een snelheid die je kunt kiezen. Formules worden uitgesproken als woorden.
- Persoonlijke code per leerling. Het werk wordt online opgeslagen in Supabase, zodat de leerling de volgende les verder kan.
- Docentenpagina `docent.html`: resultaten per klas, codes opzoeken, wachtwoord wijzigen. Alleen e-mailadressen in de tabel `docenten` kunnen de resultaten zien.

## Supabase

- Gebruik hetzelfde Supabase-project (`grmimckwtuczevvgeflc`). De tabellen `resultaten`, `voortgang` en `docenten` bestaan al.
- De kolom `module` maakt duidelijk bij welke app een resultaat hoort.
- Zorg dat de docentenpagina kan filteren op module als er meer dan één app is.

## Na oplevering

Vraag mij: "Wil je dat ik hier extra vragen aan toevoeg?"
