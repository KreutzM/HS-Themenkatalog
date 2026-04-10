# Semester-Release-Workflow

Dieser Workflow beschreibt, wie aus dem gepflegten Repository ein veröffentlichter Themenkatalog für ein neues Semester entsteht.

## Ziel

Für jedes Semester soll es einen klar nachvollziehbaren, reproduzierbaren und archivierten Katalogstand geben.

## Empfohlenes Betriebsmodell

- **Git** ist das führende Versionssystem.
- **Overleaf** ist die bevorzugte Oberfläche für PDF-Build und gemeinsame Bearbeitung.
- **Prism** kann ergänzend für redaktionelle Überarbeitung genutzt werden.

Die maßgeblichen Release-Stände werden im Git-Repository per Commit und Tag festgehalten.

## Empfohlene Namenskonventionen

### Branches
- `main`
- `develop`
- `release/SoSe-2027`
- `release/WS-2026-27`

### Tags
- `SoSe-2026-kickoff`
- `SoSe-2026-published`
- `SoSe-2026-freeze`
- `WS-2026-27-published`

## Release-Artefakte

Ein Semester-Release besteht idealerweise aus:

1. dem LaTeX-Quellstand im Git-Repository,
2. einem gesetzten Git-Tag,
3. einer veröffentlichten Studierendenfassung als PDF,
4. optional einem synchronisierten Stand in Overleaf.

## Überblick über die Phasen

1. **Vorbereitung**
2. **Redaktionelle Pflege**
3. **Release-Kandidat prüfen**
4. **Veröffentlichung**
5. **Pflege während des Semesters**
6. **Semesterabschluss und Archivierung**

---

## 1. Vorbereitung

Ausgangspunkt ist ein stabiler Stand auf `main` oder `develop`.

### Checkliste

- neues Semester festlegen
- Branch für das Release anlegen, z. B. `release/SoSe-2027`
- `tex/catalog_settings.tex` aktualisieren:
  - `\CatalogSemester`
  - ggf. `\CatalogVersion`
  - Kontaktangaben prüfen
- offene Dokumentationspunkte in `README.md` und `docs/` prüfen

### Beispiel

```bash
git checkout develop
git pull
git checkout -b release/SoSe-2027
```

---

## 2. Redaktionelle Pflege

In dieser Phase wird der Katalog fachlich und organisatorisch angepasst.

### Typische Aufgaben

- neue Themen ergänzen
- schwache oder veraltete Themen überarbeiten
- bereits verwendete Themen auf `used` setzen
- vorübergehend ungeeignete Themen auf `hidden` setzen
- unfertige neue Themen als `draft` belassen
- Metadaten vereinheitlichen
- Startquellen aktualisieren

### Betroffene Dateien

- `tex/topics/.../*.tex`
- `tex/registries/*.tex`
- ggf. `tex/00_module_readme.tex`
- ggf. `README.md` und `docs/`

### Qualitätskriterien

Vor Veröffentlichung sollten alle `active`-Themen:

- inhaltlich verständlich sein,
- realistisch bearbeitbar sein,
- einen klaren technischen Fokus haben,
- passende Leitfragen enthalten,
- eine klare Abgrenzung haben,
- mit brauchbaren Startquellen versehen sein.

---

## 3. Release-Kandidat prüfen

Vor der Veröffentlichung wird die Studierendenfassung gebaut und geprüft.

### Checkliste

- `\TeacherViewfalse` ist gesetzt
- Projekt kompiliert erfolgreich
- nur `active`-Themen erscheinen in der PDF
- Abschnittsreihenfolge ist korrekt
- offene Themen-Sektion ist konsistent
- offensichtliche Tippfehler und veraltete Quellen sind bereinigt

### Optional zusätzlich

- Dozierendenansicht mit `\TeacherViewtrue` bauen
- prüfen, ob `hidden`, `used` und `draft` wie erwartet sichtbar sind
- intern freigeben oder gegenlesen lassen

---

## 4. Veröffentlichung

Nach erfolgreicher Prüfung wird der Stand veröffentlicht.

### Empfohlener Ablauf

1. finalen Commit erzeugen
2. in `main` mergen
3. Tag setzen
4. PDF bauen und archivieren
5. Stand nach Overleaf spiegeln oder dort final freigeben

### Beispiel

```bash
git checkout main
git merge --no-ff release/SoSe-2027
git tag SoSe-2027-published
git push origin main --tags
```

### Veröffentlichungscheckliste

- Git-Tag gesetzt
- PDF der Studierendenfassung erzeugt
- Overleaf-Projekt auf veröffentlichtem Stand
- ggf. ZIP-Export als zusätzliche Sicherung abgelegt

---

## 5. Pflege während des Semesters

Während des laufenden Semesters sollten nur kontrollierte Änderungen erfolgen.

### Erlaubte typische Änderungen

- kleine Korrekturen an Tippfehlern
- Präzisierung einzelner Formulierungen
- Aktualisierung einzelner Quellen
- in Ausnahmefällen Statuswechsel eines Themas

### Vorgehen

- Änderungen zuerst im Git-Repo festhalten
- danach nach Overleaf synchronisieren
- keine unkontrollierte Drift zwischen Overleaf und Git zulassen

Für kleinere Nachbesserungen können Tags wie diese sinnvoll sein:

- `SoSe-2027-hotfix-1`
- `SoSe-2027-hotfix-2`

---

## 6. Semesterabschluss und Archivierung

Nach Vergabe oder nach Abschluss des Durchlaufs wird der Katalog nachgepflegt.

### Typische Aufgaben

- vergebene Themen auf `used` setzen
- nicht weiterverfolgte neue Themen auf `draft` oder `hidden`
- Lessons Learned in `docs/` ergänzen
- finalen Semesterstand taggen

### Empfohlener Tag

- `SoSe-2027-freeze`

### Nutzen

Damit bleibt nachvollziehbar:

- welche Themen veröffentlicht waren,
- welche Themen tatsächlich angeboten wurden,
- welche Themen für das nächste Semester vorbereitet sind.

---

## Notfall- und Rollback-Regel

Wenn kurz vor Veröffentlichung ein Problem auffällt:

1. nicht direkt auf dem veröffentlichten Tag weiterarbeiten,
2. Fix in Branch oder direkt per Hotfix-Commit auf `main`,
3. neuen Tag setzen,
4. PDF und Overleaf-Stand erneut aktualisieren.

Beispiel:

```bash
git checkout main
git checkout -b hotfix/SoSe-2027-01
```

---

## Minimale Semester-Checkliste

### Vor Veröffentlichung

- [ ] Semester in `tex/catalog_settings.tex` aktualisiert
- [ ] `\TeacherViewfalse` gesetzt
- [ ] Registry-Statuswerte geprüft
- [ ] neue Themen redaktionell geprüft
- [ ] PDF erfolgreich gebaut
- [ ] README und Doku aktuell

### Nach Veröffentlichung

- [ ] Merge nach `main`
- [ ] Tag `...-published` gesetzt
- [ ] PDF archiviert
- [ ] Overleaf-Stand synchronisiert

### Nach Semesterende

- [ ] vergebene Themen auf `used`
- [ ] offener Redaktionsbedarf dokumentiert
- [ ] Tag `...-freeze` gesetzt
