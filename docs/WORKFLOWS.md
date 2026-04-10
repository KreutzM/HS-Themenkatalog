# Workflows für die Katalogpflege

## 1. Semesterstart

1. `tex/catalog_settings.tex` öffnen.
2. `\CatalogSemester` und bei Bedarf `\CatalogVersion` aktualisieren.
3. In den Registry-Dateien prüfen:
   - Welche Themen bleiben `active`?
   - Welche Themen sollen auf `used` gesetzt werden?
   - Welche Themen sollen vorübergehend `hidden` sein?
4. Projekt bauen und PDF prüfen.

## 2. Thema ausblenden

In der passenden Registry-Datei:

```latex
\TopicEntry{active}{tex/topics/iot/node_red.tex}
```

ändern zu:

```latex
\TopicEntry{hidden}{tex/topics/iot/node_red.tex}
```

## 3. Bereits verwendetes Thema markieren

```latex
\TopicEntry{used}{tex/topics/security/ota_strategies.tex}
```

Damit bleibt das Thema im Projekt erhalten, ist aber in der Studierendenansicht nicht sichtbar.

## 4. Neues Thema ergänzen

1. Vorlage `tex/topics/_templates/topic_template.tex` kopieren.
2. Unter dem passenden Themenbereich speichern.
3. Registry-Eintrag ergänzen, zunächst z. B.:

```latex
\TopicEntry{draft}{tex/topics/future/neues_thema.tex}
```

4. Nach Prüfung Status auf `active` setzen.

## 5. Dozierendenansicht nutzen

In `tex/catalog_settings.tex`:

```latex
\TeacherViewtrue
```

Danach werden auch interne Themen angezeigt. Das ist hilfreich für:
- Redaktionsprüfung,
- Semesterplanung,
- Überarbeitung bestehender Themen.

## 6. Studierendenansicht freigeben

Vor Veröffentlichung sicherstellen:

```latex
\TeacherViewfalse
```

Nur dann erscheinen ausschließlich freigegebene Themen im PDF.
