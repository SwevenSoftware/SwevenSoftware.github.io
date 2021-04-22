---
layout: page
title: Utenti
parent: Server
grand_parent: Manuale Utente
---
# Create User's Account

Create an Account for the authenticated User if an Account for that User does
not already exist. Each User can only have one Account.

**URL** : `/api/accounts/`

**Metodo** : `POST`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

**Dati constraints**

Provide name of Account to be created.

```json
{
    "name": "[unicode 64 chars max]"
}
```

**Dati example** All fields must be sent.

```json
{
    "name": "Build something project dot com"
}
```

## Messaggi di successo

**Condizione** : If everything is OK and an Account didn't exist for this User.

**Codice** : `201 CREATED`

**Contenuto example**

```json
{
    "id": 123,
    "name": "Build something project dot com",
    "url": "http://testserver/api/accounts/123/"
}
```

## Messaggi di errore

**Condizione** : If Account already exists for User.

**Codice** : `303 SEE OTHER`

**Headers** : `Location: http://testserver/api/accounts/123/`

**Contenuto** : `{}`

### Or

**Condizione** : If fields are missed.

**Codice** : `400 BAD REQUEST`

**Contenuto example**

```json
{
    "name": [
        "This field is required."
    ]
}
```

# Lista utenti

Ritorna una lista di utenti al momento inseriti nell'applicazione,
ognuno col proprio username e i permessi.

**URL** : `/api/users/`

**Metodo** : `GET`

**Autenticazione richiesta** : SI

**Permessi richiesti** : Amministratore

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto**


```json
{
    "content": [
	{
	    "username": "user",
	    "authorities": [ "USER" ]
	}
    ]
}
```

# Modifica utente amministratore

L'amministratore è in grado di modificare le informazioni di un acccount, ovvero username, password e credenziali

**URL** : `/api/users/{username}`

**Metodo** : `PUT`

**Parametri URL** : `{username}=[String]` lo username dell'account da eliminare

**Autenticazione richiesta** : SI

**Permessi richiesti** : Amministratore

**Dati constraints**

```json
{
    "username": "user",
    "password": "password",
    "authorities": [
	"USER", "ADMIN"
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

## Error Response

**Condizione** : If provided data is invalid, e.g. a name field is too long.

**Codice** : `400 BAD REQUEST`

**Contenuto example** :

```json
{
    "first_name": [
        "Please provide maximum 30 character or empty string",
    ]
}
```

## Note

* Endpoint will ignore irrelevant and read-only data such as parameters that
  don't exist, or fields that are not editable like `id` or `email`.
* Similar to the `GET` endpoint for the User, if the User does not have a
  UserInfo instance, then one will be created for them.

# Eliminazione account utente

Elimina l'account utente selezionato.

**URL** : `/api/users/user/{username}`

**Parametri URL** : `{username}=[String]` lo username dell'account da eliminare

**Metodo** : `DELETE`

**Autenticazione richiesta** : SI

**Permessi richiesti** : Il richiedente deve essere amministratore

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

**Condizione** : If there was no Account available to delete.

**Codice** : `404 NOT FOUND`

**Contenuto** : `{}`

### Or

**Condizione** : Authorized User is not Owner of Account at URL.

**Codice** : `403 FORBIDDEN`

**Contenuto** : `{}`


## Note

* Will remove memberships for this Account for all Users that had access.
