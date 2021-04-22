---
layout: page
title: Reports
parent: Server
grand_parent: Manuale Utente
---
# Reports
Di seguito venogno riportate le API esposte dal server per la richiesta dei report di utlizzo delle stanze

# Show Accessible Accounts

Show all Accounts the active User can access and with what permission level.
Includes their own Account if they have one.

**URL** : `/api/accounts/`

**Metodo** : `GET`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

**Dati constraints** : `{}`

## Messaggi di successos

**Condizione** : User can not see any Accounts.

**Codice** : `200 OK`

**Contenuto** : `{[]}`

### OR

**Condizione** : User can see one or more Accounts.

**Codice** : `200 OK`

**Contenuto** : In this example, the User can see three Accounts as AccountAdmin
`AA`, Viewer `VV`, and Owner `OO` - in that order:

```json
[
    {
        "account": {
            "id": 123,
            "name": "Lots of Admins Project",
            "enterprise": false,
            "url": "http://testserver/api/accounts/123/"
        },
        "permission": "AA"
    },
    {
        "account": {
            "id": 234,
            "name": "Feel free to View this",
            "enterprise": false,
            "url": "http://testserver/api/accounts/234/"
        },
        "permission": "VV"
    },
    {
        "account": {
            "id": 345,
            "name": "Mr Owner Project",
            "enterprise": false,
            "url": "http://testserver/api/accounts/345/"
        },
        "permission": "OO"
    }
]
```
