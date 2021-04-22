---
layout: page
title: Prenotazioni
parent: Server
grand_parent: Manuale Utente
---

# Prenotazioni
Di seguito vengono riportate le API che permettono le gestione delle prenotazioni

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Stato di una postazione

Indica se una postazione è attualmente occupata o libera, e quando ci
sarà il prossimo cambio si stato (da occupata a libera o da libera ad
occupata).

**URL** : `/api/reservations/desk/{deskID}/{timestamp}`

**Parametri URL** : 
- `{deskID}`: id della postazione
- `{timestamp}`: momento nel quale si vuole sapere lo stato

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : USER

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto**
Ritorna lo stato corrente e il prossimo cambio
```json
{
    "available": boolean,
    "nextChange": "time"
}
```

## Messaggi di errore

| Codice                                                              | Motivazione            |
|:--------------------------------------------------------------------|:-----------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti  |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | postazione non trovata |

# Nuova prenotazione

Crea una prenotazione a nome dell'utente richiedente

**URL** : `/api/reservations/reservation`

**Metodo** : `POST`

**Autenticazione richiesta** : SI

**Permessi richiesti** : USER

**Dati**

Indicare postazione, timestamp di inizio e fine prenotazione. Tutti i campi vanno inviati e l'inizio deve essere strettamente prima della fine.

```json
{
    "deskId": "id",
    "start": "time",
    "end": "time"
}

```


## Messaggi di successo

**Condizione** : La prenotazione è valida ed è stata creata sul server

**Codice** : `200 OK`

**Contenuto example**

```json
{
    "id": "string",
    "deskId": "string",
    "room": "string",
    "username": "string",
    "start": "time",
    "end": "time"
}
```

## Messaggi di errore

| Codice                                                              | Motivazione                                                                    |
|:--------------------------------------------------------------------|:-------------------------------------------------------------------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | dati forniti non validi                                                        |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti                                                          |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | postazione non trovata                                                         |
| [409](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409) | un'alatra prenotazione sta occupando la postazione nell'intervallo specificato |


# Modifica Prenotazione

Modifica di una prenotazione già effettuata

**URL** : `/api/reservations/reservation/{reservationID}`

**Parametri URL** : `{reservationID}`, ID della prenotazione effettuata

**Metodo** : `PUT`

**Autenticazione richiesta** : SI

**Permessi richiesti** : USER, ADMIN

**Dati constraints**

```json
{
    "deskId": "string",
    "start": "time",
    "end": "time"
}

```

## Messaggi di successo

**Condizione** : I nuovi dati della prenotazione sono validi e
l'utente richiedente è admin o è lo stesso che ha effettuato la
prenotazione originariamente

**Codice** : `200 OK`

**Contenuto** : 
```json
{
    "id": "string",
    "deskId": "string",
    "room": "string",
    "username": "string",
    "start": "time",
    "end": "time"
}

```

## Messaggi di errore

| Codice                                                              | Motivazione                                           |
|:--------------------------------------------------------------------|:------------------------------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti                                 |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | prenotazione non trovata                              |
| [409](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409) | Un'altra prenotazione va in conflitto con la modifica |

# Lista prenotazioni personali

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/reservations/view/personal`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : USER

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto**

```json
[
    {
	"id": "string",
	"deskId": "string",
	"room": "string",
	"username": "string",
	"start": "time",
	"end": "time"
    },

    ...
]
```

## Messaggi di errore

| Codice                                                              | Motivazione           |
|:--------------------------------------------------------------------|:----------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | tempo mal formattato  |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | permessi insufficenti |

# Lista tutte le prenotazioni
L'admin è in grado do visualizzare tutte le prenotazioni in un certo
intervallo temporale

**URL** : `/api/reservations/view/all`

**Parametri GET** : 
- `from` : timestamp inizio periodo
- `to` : timestamp fine periodo

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto** Un amministratore autenticato è in grado di visualizzare
l'elenco delle prenotazioni attive nel periodo indicato

```json
[
    {
	"id": "string",
	"deskId": "string",
	"room": "string",
	"username": "string",
	"start": "time",
	"end": "time"
    },

    ...
]
```

## Messaggi d'errore

| Codice                                                              | Motivazione           |
|:--------------------------------------------------------------------|:----------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | tempo mal formattato  |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti |

# Eliminazione prenotazione

Elimina una prenotazione

**URL** : `/api/reservations/reservation/{reservationID}`

**Parametri URL** : `reservationID` id della prenotazione fatta dall'utente

**Metodo** : `DELETE`

**Autenticazione richiesta** : SI

**Permessi richiesti** : USER

## Messaggi di successo

**Condizione** : La prenotazione esiste e l'utente che ne ha richiesto la rimozione è lo stesso che l'ha effettuata

**Codice** : `200 OK`

**Contenuto** : 
```json
{
    "id": "string",
    "deskId": "string",
    "room": "string",
    "username": "string",
    "start": "time",
    "end": "time"
}
```

## Messaggi di errore

| Codice                                                              | Motivazione            |
|:--------------------------------------------------------------------|:-----------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | permessi insufficenti  |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | postazione non trovata |


