---
layout: page
title: Stanze
parent: Server
nav_order: 3
grand_parent: Manuale Utente
---
# Stanze
Di seguito vengono riportate le API esposte dal server per la gestione delle stanze

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Nuova stanza
Crea una stanza secondo i dati forniti in input

**URL** : `/api/rooms/`

**Metodo** : `POST`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

**Dati**:

`openingAt` e `closingAt` vanno inseriti nel formato `HH:mm`, 
mentre `width` e `height` devono essere almeno 1, definiscono 
la larghezza e altezza della stanza, indicano quindi una griglia 
dove è possibile posizionare delle postazioni
```json
{
    "name": "string",
    "openingAt": "time",
    "closingAt": "time",
    "openingDays": [
	"MONDAY", ...
    ],
    "width": int,
    "height": int
}
```
## Messaggi di successo
{: .no_toc}

**Condizione** : I dati in input sono validi, la stanza è stata creata

**Codice** : `200 OK`

## Messaggi di errore
{: .no_toc}


| Codice                                                              | Motivazione                     |
|:--------------------------------------------------------------------|:--------------------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Account inesistente o eliminato |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Autorizzazioni insufficenti     |


# Nuova postazione
Crea una stanza secondo i dati forniti in input

**URL** : `/api/rooms/{roomName}/desks`

**Parametri URL** : `{roomName}`, il nome della stanza dove si vogliono inserire delle postazioni

**Metodo** : `POST`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

**Dati**:

x e y devono essere >= 1 e <= delle dimensioni della stanza
```json
[
    {
	"x": int,
	"y": int
    },
    
    ...
]
```
è possibile fornire un numero qualsiasi di postazioni in input, purchè stiano all'interno della stanza

## Messaggi di successo
{: .no_toc}

**Condizione** : I dati in input sono validi, le postazioni sono state inserite nella stanza

**Codice** : `200 OK`

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                     |
|:--------------------------------------------------------------------|:--------------------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Account inesistente o eliminato |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Autorizzazioni insufficenti     |
	
# Modifica Stanza

Permette ad un admin di modificare i dati di una stanza

**URL** : `/api/rooms/{roomName}`

**Metodo** : `PUT`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

**Dati**:

Valgono gli stessi vincoli imposti per la [creazione di una stanza](#nuova-stanza)

```json
{
  "name": "string",
  "openingAt": "time",
  "closingAt": "time",
  "openingDays": [
      "MONDAY", ...
  ],
  "width": int,
  "height": int
}
```

## Messaggi di successo
{: .no_toc}

**Condizione** : I dati in input sono validi e la stanza è stata modificata

**Codice** : `200 OK`

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                   |
|:--------------------------------------------------------------------|:------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Autorizzazioni insufficenti   |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | La stanza indicata non esiste |

# Modifica Postazione

Permette all'amministratore di modificare la posizione della postazione
nella griglia senza modificarne l'id e quindi  mantenendo le prenotazioni
ad essa associate.


**URL** : `/api/rooms/{roomName}/desks`

**Metodo** : `PUT`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

**Dati**:

```json
{
    "oldInfo": {
	"x": int,
	"y": int
    },
    "newInfo": {
	"x": int,
	"y": int
    }
}

```

## Messaggi di successo
{: .no_toc}

**Condizione** : La postazione è stata spostata nella nuova sede

**Codice** : `200 OK`

**Contenuto** :
```json
{
    "roomName": "string",
    "deskId": "string",
    "x": int,
    "y": int
}
```

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                   |
|:--------------------------------------------------------------------|:------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Autorizzazioni insufficenti   |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | La stanza indicata non esiste |

# Lista stanze
Permette a tutti gli utenti di visualizzare una lista con le stanze attualmente presenti

**URL** : `/api/rooms/`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : Nessuno

## Messaggi di successo
{: .no_toc}

**Codice** : `200 OK`

**Contenuto**

```json
[
    {
	"room": {
            "name": "string",
            "closed": boolean,
            "openingTime": "time",
            "closingTime": "time",
            "openingDays": [
		"MONDAY", ...
            ],
            "width": int,
            "height": int,
            "roomStatus": "CLEAN"
	},
	"desks": [
            {
		"deskId": "string",
		"x": int,
		"y": int,
		"available": boolean
            },
	    ...
	],
     },

    // altra room con altri desks
    ...
]
```

# Informazioni Stanza
Permette a tutti di recuperare le informazioni su una particolare stanza

**URL** : `/api/rooms/{roomName}`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : Nessuno

## Messaggi di successo
{: .no_toc}

**Codice** : `200 OK`

**Contenuto**
```json
{
    "room": {
	"name": "string",
	"closed": boolean,
	"openingTime": "time",
	"closingTime": "time",
	"openingDays": [
	    "MONDAY", ...
	],
	"width": int,
	"height": int,
	"roomStatus": "CLEAN"
    },
    "desks": [
	{
	    "deskId": "string",
	    "x": 0,
	    "y": 0,
	    "available": true
	},
	...
    ]
}

```

# Stato postazione
Permette di recuperare le informazioni sullo stato di una postazione

**URL** : `/api/rooms/desks/{deskID}`

**Parametri URL** : `{deskID}` id della postazione della quale si vogliono recuperare i dati

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : Nessuno

## Messaggi di successo
{: .no_toc}

**Codice** : `200 OK`

**Contenuto**
```json
{
    "id": "string",
    "x": 0,
    "y": 0,
    "roomId": "string",
    "deskStatus": "CLEAN"
}{
    "id": "string",
    "x": 0,
    "y": 0,
    "roomId": "string",
    "deskStatus": "CLEAN"
}

```

# Pulizia stanza
Permette ad un addetto alle pulizie di marcare una stanza come pulita

**URL** : `/api/rooms/{roomName}/clean`

**Parametri URL** : `{roomName}` nome della stanza da marcare come pulita

**Metodo** : `PUT`

**Autenticazione richiesta** : SI

**Permessi richiesti** : CLEANER

## Messaggi di successo
{: .no_toc}

**Condizione** : La stanza esiste ed è stata segnata come pulita

**Codice** : `200 OK`

**Contenuto** : 
Il ritorno sono i dati della stanza, soprattutto il campo `roomStatus` per verificare che sia `CLEAN`
```json
{
    "room": {
	"name": "string",
	"closed": boolean,
	"openingTime": "time",
	"closingTime": "time",
	"openingDays": [
	    "MONDAY", ...
	],
	"width": int,
	"height": int,
	"roomStatus": "CLEAN"
    },
    "desks": [
	{
	    "deskId": "string",
	    "x": 0,
	    "y": 0,
	    "available": true
	},
	...
    ]
}
```

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                   |
|:--------------------------------------------------------------------|:------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Autorizzazioni insufficenti   |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | La stanza indicata non esiste |

# Eliminazione stanza

Permette all'amministratore di eliminare una stanza

**URL** : `/api/rooms/{roomName}`

**Parametri URL** : `{roomName}` nome della stanza da eliminare.

**Metodo** : `DELETE`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

## Messaggi di successo
{: .no_toc}

**Condizione** : La stanza deve esistere.

**Codice** : `200 OK`

**Contenuto** : 
Il ritorno sono le informazioni della stanza eliminata:
```json
{
    "room": {
	"name": "string",
	"closed": boolean,
	"openingTime": "time",
	"closingTime": "time",
	"openingDays": [
	    "MONDAY", ...
	],
	"width": int,
	"height": int,
	"roomStatus": "CLEAN"
    },
    "desks": [
	{
	    "deskId": "string",
	    "x": 0,
	    "y": 0,
	    "available": true
	},
	...
    ]
}

```

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                   |
|:--------------------------------------------------------------------|:------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Autorizzazioni insufficenti   |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | La stanza indicata non esiste |

# Eliminazione postazione
Consente all'amministratore di eliminare una postazione

**URL** : `/api/rooms/{roomName}/desks`

**Parametri URL** : `pk=[integer]` where `pk` is the ID of the Account in the
database.

**Metodo** : `DELETE`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

**Dati**:

```json
{
    "id": "string",
    "x": int,
    "y": int
}

```

## Messaggi di successo
{: .no_toc}

**Condizione** : La postazione esiste

**Codice** : `200 OK`

**Contenuto** : 
```json
{
    "roomName": "string",
    "deskId": "string",
    "x": int,
    "y": int
}
```

## Messaggi di errore
{: .no_toc}

| Codice                                                              | Motivazione                   |
|:--------------------------------------------------------------------|:------------------------------|
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Autorizzazioni insufficenti   |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | La stanza indicata non esiste |

{% include prev_next.liquid %}
