---
layout: page
title: Reports
parent: Utente Server
nav_order: 5
grand_parent: Manuale Utente
---
# Reports
{: .no_toc}
Di seguito venogno riportate le API esposte dal server per la
richiesta dei report di utlizzo delle stanze

<details closed markdown="block">
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
{: .no_toc}

**Condizione** : Report creato con successo

**Codice** : `200 OK`

**Contenuto** : documento pdf

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                                                       |
|:--------------------------------------------------------------------|:------------------------------------------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti                                             |
| [500](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) | Errore nella creazione del report, contattare il team di sviluppo |


# Report sull'utilizzo

L'amministratore è in grado di richiedere un report sull'utilizzo
delle stanze e delle singole postazioni, che gli verrà fornito in
formato pdf.

**URL** : `/api/reports/usage`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

## Messaggi di successo
{: .no_toc}

**Condizione** : Report creato con successo

**Codice** : `200 OK`

**Contenuto** : documento pdf

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                                                       |
|:--------------------------------------------------------------------|:------------------------------------------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti                                             |
| [500](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) | Errore nella creazione del report, contattare il team di sviluppo |


# Lista dei report creati

L'amministratore è in grado di ricevere una lista di tutti i pdf
creati dall'avvio del server in poi

**URL** : `/api/reports/all`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

## Messaggi di successo
{: .no_toc}

**Condizione** : Lista dei report generata con successo

**Codice** : `200 OK`

**Contenuto** : 
```json
[
    {
	"name": "string",
	"creationDate": "time",
	"registrationDate": "time"
    },

    ...
]
```

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                                                       |
|:--------------------------------------------------------------------|:------------------------------------------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti                                             |
| [500](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) | Errore nella creazione del report, contattare il team di sviluppo |


{% include prev_next.liquid %}
