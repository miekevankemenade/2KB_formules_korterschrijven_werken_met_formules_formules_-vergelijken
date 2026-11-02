# H2 Formules – oefenapp (VMBO Basis)

Oefenapp bij hoofdstuk 2 *Formules*, paragraaf 2.4, 2.5 en 2.6.

## Wat zit erin?

| Bestand | Wat is het? |
|---|---|
| `index.html` | De app voor leerlingen. |
| `docent.html` | De pagina waar jij de resultaten bekijkt. |
| `config.js` | Hier vul je de Supabase-gegevens in. |
| `supabase.sql` | Script dat de tabel voor de resultaten maakt. |
| `videos/` | Vijf theoriefilmpjes met een Vlaamse stem. |

**Theorie (filmpjes):** negatieve getallen invullen, formules korter schrijven, formule bij een tabel, formule bij een grafiek en gelijkwaardige formules.

**Opdrachten:** 19 t/m 34, 38 en de Leerdoelen van 2.4 en 2.6.
De theorie en opdrachten over "een aftrekking als optelling schrijven" (35, 36, 37 en Leerdoelen 2.6b) zitten er bewust niet in.

**Per vraag krijgt de leerling:**
- 2 punten als het antwoord in één keer goed is;
- 1 punt bij de 2e poging of na een hint;
- 0 punten bij de 3e poging of later.

Na 4 foute pogingen verschijnt een stap-voor-stap-uitleg.

**Cijfer:** (behaalde punten ÷ totaal × 9) + 1.

**Op het eindscherm staan:**
- het cijfer;
- de gokkans;
- een foutenanalyse;
- een knop "Kopieer resultaten voor Forms";
- downloadknoppen (.txt en .json).

De resultaten worden ook in Supabase opgeslagen.

---

## Stap 1 – Online zetten met GitHub Pages

1. Zet alle bestanden uit deze map in je repository. Het bestand `index.html` moet in de hoofdmap staan.
2. Ga op GitHub naar je repository → **Settings** → **Pages**.
3. Kies bij *Source*: **Deploy from a branch**.
4. Kies de branch **main** en de map **/ (root)**. Klik op **Save**.
5. Na een paar minuten staat de app online op dit adres:
   `https://miekevankemenade.github.io/2KB_formules_korterschrijven_werken_met_formules_formules_-vergelijken/`

Dit adres geef je aan de leerlingen.
De docentenpagina staat op hetzelfde adres, met `docent.html` erachter.

## Stap 2 – Supabase klaarzetten

1. Maak een gratis account op https://supabase.com en maak een **New project** aan.
2. Ga naar **SQL Editor** → **New query**.
3. Plak de inhoud van `supabase.sql` in het venster en klik op **Run**.
4. Ga naar **Project Settings** → **API**. Kopieer de **Project URL** en de **anon public key**.
5. Open `config.js` en plak de URL en de sleutel tussen de aanhalingstekens.
6. Sla `config.js` op en zet het bestand opnieuw op GitHub.

De anon-sleutel mag openbaar zijn. Door de beveiliging in `supabase.sql` mogen leerlingen alleen resultaten **insturen**, niet lezen.

## Stap 3 – Docentaccount maken

1. Open `docent.html`.
2. Vul je e-mailadres en een nieuw wachtwoord in, minstens 8 tekens.
3. Klik op **Account aanmaken (eerste keer)**.
4. Klik op de link in de e-mail die je krijgt.
5. Log daarna in met **Inloggen**.

Alleen e-mailadressen in de tabel `docenten` kunnen de resultaten zien.
Een collega toevoegen? Voeg in Supabase (Table Editor → docenten) een rij toe met zijn of haar e-mailadres.

## Verder werken in een volgende les

Elke leerling krijgt bij de start een persoonlijke code, bijvoorbeeld `QZ7W-M7CT`.
- De voortgang wordt automatisch online bewaard na elke opdracht.
- In de volgende les kiest de leerling **Ik ga verder met mijn code**. Dat werkt ook op een andere computer.
- Is een leerling zijn code kwijt? Op `docent.html` staat bij **Codes en voortgang** de code van elke leerling.

## Werkt het zonder Supabase?

Ja. Als `config.js` leeg is, werkt de app gewoon.
De leerling kopieert of downloadt dan de resultaten aan het eind.
De voortgang van de leerling wordt in de browser bewaard. Na het verversen van de pagina gaat hij verder waar hij was.
