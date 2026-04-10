# Contributing

Dieses Repository enthält den Themenkatalog für das Hauptseminar **CS1025** im Studiengang **B.Sc. Ingenieur-Informatik (THM)**.

Ziel ist ein Katalog, der fachlich konsistent, für Studierende verständlich und für die semesterweise Pflege möglichst leicht wartbar ist.

## Grundprinzipien

1. **Inhalt und Status sind getrennt.**
   - Der **Inhalt** einer Themenkarte liegt in `tex/topics/.../*.tex`.
   - Der **Status** eines Themas wird ausschließlich in `tex/registries/*.tex` gepflegt.

2. **Studierendenansicht und Dozierendenansicht werden zentral gesteuert.**
   - Einstellungen liegen in `tex/catalog_settings.tex`.
   - Für die Veröffentlichung muss vor dem Build immer geprüft werden, dass die Studierendenansicht aktiv ist.

3. **Themenkarten sollen im 4. Semester realistisch bearbeitbar sein.**
   - Fokus statt Vollständigkeit.
   - Klare Leitfragen.
   - Klare Abgrenzung.
   - Einstieg über belastbare Startquellen.

## Was wohin gehört

### Themeninhalt
Neue oder geänderte Themenkarten gehören nach:

- `tex/topics/embedded/`
- `tex/topics/security/`
- `tex/topics/iot/`
- `tex/topics/robotics/`
- `tex/topics/future/`
- `tex/topics/open/`

Für neue Karten bitte die Vorlage verwenden:

- `tex/topics/_templates/topic_template.tex`

### Statusverwaltung
Die Sichtbarkeit wird **nicht** in der Themenkarte selbst gepflegt, sondern in:

- `tex/registries/01_embedded_registry.tex`
- `tex/registries/02_security_registry.tex`
- `tex/registries/03_iot_registry.tex`
- `tex/registries/04_robotics_registry.tex`
- `tex/registries/05_future_registry.tex`
- `tex/registries/99_open_registry.tex`

Erlaubte Statuswerte:

- `active` — sichtbar und wählbar
- `hidden` — intern vorhanden, aber ausgeblendet
- `used` — bereits verwendet, aktuell nicht anbieten
- `draft` — noch in Bearbeitung

## Typische Beiträge

### Neues Thema hinzufügen
1. Vorlage kopieren.
2. Neue Datei im passenden Unterordner von `tex/topics/` anlegen.
3. Metadaten und Inhalt ausfüllen.
4. Registry-Eintrag zunächst mit `draft` ergänzen.
5. Nach redaktioneller Prüfung auf `active` setzen.

### Bestehendes Thema überarbeiten
1. Inhalt direkt in der Themenkarte anpassen.
2. `updated`-Metadatum setzen.
3. Prüfen, ob Titel, Leitfragen, Abgrenzung und Startquellen noch konsistent sind.
4. Falls die Karte vorübergehend nicht veröffentlicht werden soll, Status in der Registry auf `hidden` setzen.

### Thema nach Vergabe ausblenden
In der passenden Registry:

```latex
\TopicEntry{used}{tex/topics/.../dateiname.tex}
```

## Qualitätsanforderungen an Themenkarten

Jede Themenkarte sollte mindestens diese Punkte gut erfüllen:

- **präziser Titel**
- **realistischer Zuschnitt** für 30 Minuten Vortrag und ca. 4500 Wörter Ausarbeitung
- **verständliche Kurzbeschreibung**
- **mehrere gute Leitfragen**
- **klare Abgrenzung**
- **sinnvolle Startquellen**
- **gepflegte Metadaten**

Empfohlene Metadaten:

- `difficulty`
- `type`
- `prerequisites`
- `practice`
- `owner`
- `updated`
- `tags`

## Build und Prüfung

Empfohlener Build:

- **LuaLaTeX**
- **biber**
- danach noch zweimal LaTeX

Vor dem Merge oder Release prüfen:

1. Projekt baut ohne harte Fehler.
2. `\TeacherViewfalse` ist für die veröffentlichte Studierendenfassung gesetzt.
3. Neu ergänzte Themen erscheinen im richtigen Abschnitt.
4. Ausgeblendete oder verwendete Themen sind in der Studierendenansicht nicht sichtbar.
5. README und `docs/` sind bei strukturellen Änderungen mit aktualisiert.

## Git-Empfehlung

Empfohlenes Arbeitsmodell:

- **Git-Repository als führendes System**
- **Overleaf** als komfortable Kollaborations- und Build-Oberfläche
- **Prism** optional für redaktionelle KI-Unterstützung

Overleaf oder Prism sollen nicht die einzige maßgebliche Langzeitablage sein.

## Branch- und Commit-Konventionen

Empfohlene Branches:

- `main` — stabiler veröffentlichter Stand
- `develop` — laufende redaktionelle Arbeiten
- Kurzläufer wie `topic/add-...`, `docs/update-...`, `release/SoSe-2027`

Empfohlene Commit-Nachrichten:

- `feat: add 3 new iot topics`
- `docs: update semester workflow`
- `refactor: move visibility control to registry`
- `fix: correct metadata and sources`

## Releases

Für die semesterweise Veröffentlichung gilt der Ablauf in:

- `docs/SEMESTER_RELEASE_WORKFLOW.md`

Dort sind Checklisten für Vorbereitung, Veröffentlichung, Nachpflege und Archivierung dokumentiert.
