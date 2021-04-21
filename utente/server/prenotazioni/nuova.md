---
layout: page
title: Nuova prenotazione
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
