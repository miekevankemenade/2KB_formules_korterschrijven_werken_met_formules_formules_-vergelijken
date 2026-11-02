-- ============================================================
-- Supabase: tabel voor de resultaten van de oefenapp
-- Plak dit in Supabase → SQL Editor → New query → Run.
-- Je hoeft dit maar één keer te doen.
-- ============================================================

create table if not exists public.resultaten (
  id            bigint generated always as identity primary key,
  created_at    timestamptz not null default now(),
  leerling      text not null check (char_length(leerling) between 1 and 100),
  klas          text check (klas is null or char_length(klas) <= 40),
  module        text,
  cijfer        numeric(3,1) check (cijfer between 1 and 10),
  score         integer,
  totaal        integer,
  gokkans       text check (gokkans in ('Laag','Gemiddeld','Hoog')),
  samenvatting  text,
  export_tekst  text,
  details       jsonb,
  sessie_start  timestamptz
);

-- Beveiliging aanzetten (Row Level Security)
alter table public.resultaten enable row level security;

-- Leerlingen (niet ingelogd) mogen alleen een resultaat INSTUREN.
drop policy if exists "leerling stuurt resultaat in" on public.resultaten;
create policy "leerling stuurt resultaat in"
  on public.resultaten for insert
  to anon, authenticated
  with check (true);

-- Alleen ingelogde docenten mogen resultaten LEZEN.
drop policy if exists "docent leest resultaten" on public.resultaten;
create policy "docent leest resultaten"
  on public.resultaten for select
  to authenticated
  using (true);

-- Alleen ingelogde docenten mogen resultaten VERWIJDEREN.
drop policy if exists "docent verwijdert resultaten" on public.resultaten;
create policy "docent verwijdert resultaten"
  on public.resultaten for delete
  to authenticated
  using (true);

create index if not exists resultaten_klas_idx on public.resultaten (klas, created_at desc);
