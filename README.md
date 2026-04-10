# CS1025 Hauptseminar — Themenkatalog (SoSe 2026)

Dieses Projekt ist ein modular gepflegter Themenkatalog für das Hauptseminar im Studiengang **B.Sc. Ingenieur-Informatik (THM)**.
Die Projektstruktur wurde so umgestellt, dass Themen **einfach ergänzt**, **semesterweise ein- oder ausgeblendet** und bei Bedarf in einer **Dozierendenansicht** überprüft werden können.

## Build

- Empfohlen: **LuaLaTeX**
- Alternativ: **pdfLaTeX**
- Bibliographie: **biber**
- Reihenfolge: `LaTeX -> biber -> LaTeX -> LaTeX`

## Schnellstart

### Studierendenansicht bauen
In `tex/catalog_settings.tex` belassen:

```latex
\TeacherViewfalse
```

Dann werden nur Themen mit Status `active` angezeigt.

### Dozierendenansicht bauen
In `tex/catalog_settings.tex` setzen:

```latex
\TeacherViewtrue
```

Dann werden auch Themen mit den Statuswerten `hidden`, `used` und `draft` angezeigt.

## Projektstruktur

- `main.tex` — Haupteinstieg für Overleaf/LaTeX
- `tex/catalog_settings.tex` — zentrale Semester- und Anzeigeeinstellungen
- `tex/macros.tex` — Makros für Themenkarten, Metadaten und Statuslogik
- `tex/registries/*.tex` — zentrale Listen, welche Themen in welchem Status angezeigt werden
- `tex/topics/.../*.tex` — eigentliche Themenkarten
- `tex/topics/_templates/topic_template.tex` — Vorlage für neue Themen
- `tex/00_module_readme.tex` — modulweite Rahmeninformationen
- `bib/seminar.bib` — Literaturdatenbank
- `docs/` — Begleitdokumentation zu Architektur und Pflegeworkflow

## Statusmodell

Jeder Registry-Eintrag hat genau einen Status:

- `active` — Thema ist im Katalog sichtbar und wählbar
- `hidden` — Thema ist intern vorhanden, aber für Studierende unsichtbar
- `used` — Thema wurde bereits verwendet und wird im aktuellen Durchlauf nicht angeboten
- `draft` — Thema ist in Bearbeitung und noch nicht freigegeben

Beispiel:

```latex
\TopicEntry{active}{tex/topics/iot/mqtt_pubsub.tex}
\TopicEntry{used}{tex/topics/iot/opcua.tex}
```

## Typischer Pflegeworkflow

1. Neue Themenkarte aus der Vorlage anlegen.
2. Datei unter dem passenden Unterordner in `tex/topics/` speichern.
3. Registry-Eintrag in `tex/registries/...` ergänzen, zunächst z. B. mit `draft`.
4. Nach redaktioneller Prüfung Status auf `active` setzen.
5. Bereits vergebene Themen semesterweise auf `used` setzen oder temporär auf `hidden`.

Die detaillierten Arbeitsabläufe stehen in `docs/WORKFLOWS.md` und `docs/THEMENPFLEGE.md`.


## Mitarbeit und Releases

- `CONTRIBUTING.md` — Regeln für Beiträge, Review und Git-Organisation
- `docs/SEMESTER_RELEASE_WORKFLOW.md` — semesterweiser Veröffentlichungsprozess mit Checklisten und Tagging
