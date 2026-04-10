# Architektur des Themenkatalogs

## Ziel der Struktur

Die Projektstruktur trennt bewusst zwischen:

1. **Themeninhalt** (`tex/topics/...`) und
2. **Sichtbarkeit / Semesterstatus** (`tex/registries/...`).

Dadurch bleibt der Inhalt eines Themas stabil, während seine Sichtbarkeit semesterweise mit minimalem Aufwand gesteuert werden kann.

## Kernbausteine

### `tex/catalog_settings.tex`
Zentrale Einstellungen für:
- Semesterbezeichnung
- Katalogversion
- Kontaktadresse
- Studierenden- oder Dozierendenansicht

### `tex/macros.tex`
Enthält:
- das `topic`-Environment,
- die Metadaten-Logik,
- Warnungen bei fehlenden Pflichtbestandteilen,
- das Makro `\TopicEntry{status}{datei}`.

### `tex/registries/*.tex`
Je Themenbereich gibt es genau eine Registry-Datei.
Dort wird ausschließlich gepflegt:
- welche Themen zu einem Bereich gehören,
- in welchem Status sie sich befinden.

### `tex/topics/.../*.tex`
Jede Themenkarte liegt in einer separaten Datei und enthält:
- Titel,
- Metadaten,
- Beschreibung,
- Leitfragen,
- Abgrenzung,
- optionale Praxisidee,
- Schlagwörter,
- Startquellen.

## Warum keine Statuspflege in den Themenkarten selbst?

Die Statusinformation ändert sich häufig semesterweise. Würde sie in den Themenkarten selbst liegen, müsste man für jede organisatorische Änderung in den eigentlichen Inhalt der Themen eingreifen. Die Registry-Struktur vermeidet genau das.

## Sichtlogik

- In der **Studierendenansicht** (`\TeacherViewfalse`) werden nur `active`-Themen gerendert.
- In der **Dozierendenansicht** (`\TeacherViewtrue`) werden auch `hidden`, `used` und `draft` angezeigt und auf der Themenkarte kenntlich gemacht.
