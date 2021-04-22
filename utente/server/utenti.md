---
layout: page
title: Utenti
parent: Server
grand_parent: Manuale Utente
---
# Nuovo account
L'amministratore può creare un nuovo account fornendo le informazioni necessarie

**URL** : `/api/users/`

**Metodo** : `POST`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

**Dati**
```json
{
    "username": "string",
    "password": "string",
    "authorities": [
	"ADMIN", "USER", "CLEANER"
    ]
}
```

## Messaggi di successo

**Condizione** : I dati in input sono validi e il nuovo account è stato creato

**Codice** : `200 OK`

**Contenuto**
Ritorna le informazioni non sensibili dell'account appena creato
```json
{
    "username": "string",
    "authorities": [
	"ADMIN", ...
    ]
}
```

## Messaggi di errore

| Codice                                                              | Motivazione              |
|:--------------------------------------------------------------------|:-------------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Dati in input non validi |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Permessi insufficenti    |
| [409](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409) | Username già presente    |

# Lista utenti

Ritorna una lista di utenti al momento inseriti nell'applicazione,
ognuno col proprio username e i permessi.

**URL** : `/api/users/`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto**


```json
[
    {
	"username": "user",
	"authorities": [ 
		"USER"
	]
    },
    ...
]
```

## Messaggi di errore

| Codice                                                              | Motivazione              |
|:--------------------------------------------------------------------|:-------------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Dati in input non validi |
| [409](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409) | Username già presente    |


# Modifica utente

permette all'amministratore di modificare le informazioni di un acccount, ovvero username, password e credenziali

**URL** : `/api/users/{username}`

**Metodo** : `PUT`

**Parametri URL** : `{username}` lo username dell'account da eliminare

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

**Dati constraints**

```json
{
    "username": "user",
    "password": "password",
    "authorities": [
	"USER", ...
    ]
}
```

## Messaggi di successo

**Condizione** : Dati inviati validi e utente presente

**Codice** : `200 OK`

**Contenuto** : 

```json
{
    "username": "string",
    "authorities": [
	"ADMIN"
    ]
}
```

## Messaggi di errore

| Codice                                                              | Motivazione               |
|:--------------------------------------------------------------------|:--------------------------|
| [400](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/400) | Dati in input non validi  |
| [401](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401) | Autorizzazione non valida |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Permessi insufficenti     |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | Username non trovato      |


# Eliminazione account utente

Elimina l'account utente indicato

**URL** : `/api/users/user/{username}`

**Parametri URL** : `{username}` lo username dell'account da eliminare

**Metodo** : `DELETE`

**Autenticazione richiesta** : SI

**Permessi richiesti** : ADMIN

## Messaggi di successo

**Condizione** : Se l'account esiste può essere eliminato

**Codice** : `200 OK`

**Contenuto** : 
```json
{
	"username": "user",
	"authorities": [
		"USER"
	]
}
```

## Messaggi di errore

| Codice                                                              | Motivazione               |
|:--------------------------------------------------------------------|:--------------------------|
| [401](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401) | Autorizzazione non valida |
| [403](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403) | Permessi insufficenti     |
| [404](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/404) | Username non trovato      |


