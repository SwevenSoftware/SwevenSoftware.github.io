---
layout: page
title: Reports
parent: Server
grand_parent: Manuale Utente
---
# Reports
{: .no_toc}
Di seguito venogno riportate le API esposte dal server per la
richiesta dei report di utlizzo delle stanze

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Report sanificazione stanze

L'amministratore è in grado di richiedere un report sulla
sanificazione delle stanze che gli verrà fornito in formato pdf.

**URL** : `/api/reports/cleaner`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

## Messaggi di successo

**Condizione** : Report creato con successo

**Codice** : `200 OK`

**Contenuto** : documento pdf

## Messaggi di errore

| Codice                                                              | Motivazione                                                       |
|:--------------------------------------------------------------------|:------------------------------------------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti                                             |
| [500](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) | Errore nella creazione del report, contattare il team di sviluppo |


