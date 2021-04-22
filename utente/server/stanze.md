---
layout: page
title: Stanze
parent: Server
grand_parent: Manuale Utente
---
# Stanze
Di seguito vengono riportate le API esposte dal server per la gestione delle stanze

# Nuova stanza

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

# Nuova postazione

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

# Modifica Stanza

Allow the Authenticated User to update their details.

**URL** : `/api/user/`

**Metodo** : `PUT`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

**Dati constraints**

```json
{
    "first_name": "[1 to 30 chars]",
    "last_name": "[1 to 30 chars]"
}
```

Note that `id` and `email` are currently read only fields.

**Header constraints**

The application used to update the User's information can be sent in the
header. Values passed in the `UAPP` header only pass basic checks for validity:

- If 0 characters, or not provided, ignore.
- If 1 to 8 characters, save.
- If longer than 8 characters, ignore.

```
UAPP: [1 to 8 chars]
```

**Dati examples**

Partial data is allowed.

```json
{
    "first_name": "John"
}
```

Empty data can be PUT to erase the name, in this case from the iOS application
version 1.2:

```
UAPP: ios1_2
```

```json
{
    "last_name": ""
}
```

## Messaggi di successos

**Condizione** : Dati provided is valid and User is Authenticated.

**Codice** : `200 OK`

**Contenuto example** : Response will reflect back the updated information. A
User with `id` of '1234' sets their name, passing `UAPP` header of 'ios1_2':

```json
{
    "id": 1234,
    "first_name": "Joe",
    "last_name": "Bloggs",
    "email": "joe25@example.com",
    "uapp": "ios1_2"
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

# Modifica Postazione

Allow the Authenticated User to update their details.

**URL** : `/api/user/`

**Metodo** : `PUT`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

**Dati constraints**

```json
{
    "first_name": "[1 to 30 chars]",
    "last_name": "[1 to 30 chars]"
}
```

Note that `id` and `email` are currently read only fields.

**Header constraints**

The application used to update the User's information can be sent in the
header. Values passed in the `UAPP` header only pass basic checks for validity:

- If 0 characters, or not provided, ignore.
- If 1 to 8 characters, save.
- If longer than 8 characters, ignore.

```
UAPP: [1 to 8 chars]
```

**Dati examples**

Partial data is allowed.

```json
{
    "first_name": "John"
}
```

Empty data can be PUT to erase the name, in this case from the iOS application
version 1.2:

```
UAPP: ios1_2
```

```json
{
    "last_name": ""
}
```

## Messaggi di successos

**Condizione** : Dati provided is valid and User is Authenticated.

**Codice** : `200 OK`

**Contenuto example** : Response will reflect back the updated information. A
User with `id` of '1234' sets their name, passing `UAPP` header of 'ios1_2':

```json
{
    "id": 1234,
    "first_name": "Joe",
    "last_name": "Bloggs",
    "email": "joe25@example.com",
    "uapp": "ios1_2"
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

# Lista stanze

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/user/`

**Metodo** : `GET`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto examples**

For a User with ID 1234 on the local database where that User has saved an
email address and name information.

```json
{
    "id": 1234,
    "first_name": "Joe",
    "last_name": "Bloggs",
    "email": "joe25@example.com"
}
```

For a user with ID 4321 on the local database but no details have been set yet.

```json
{
    "id": 4321,
    "first_name": "",
    "last_name": "",
    "email": ""
}
```

## Note

* If the User does not have a `UserInfo` instance when requested then one will
  be created for them.

# Informazioni Stanza

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/user/`

**Metodo** : `GET`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto examples**

For a User with ID 1234 on the local database where that User has saved an
email address and name information.

```json
{
    "id": 1234,
    "first_name": "Joe",
    "last_name": "Bloggs",
    "email": "joe25@example.com"
}
```

For a user with ID 4321 on the local database but no details have been set yet.

```json
{
    "id": 4321,
    "first_name": "",
    "last_name": "",
    "email": ""
}
```

## Note

* If the User does not have a `UserInfo` instance when requested then one will
  be created for them.

# Stato postazione

Get the details of the currently Authenticated User along with basic
subscription information.

**URL** : `/api/user/`

**Metodo** : `GET`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto examples**

For a User with ID 1234 on the local database where that User has saved an
email address and name information.

```json
{
    "id": 1234,
    "first_name": "Joe",
    "last_name": "Bloggs",
    "email": "joe25@example.com"
}
```

For a user with ID 4321 on the local database but no details have been set yet.

```json
{
    "id": 4321,
    "first_name": "",
    "last_name": "",
    "email": ""
}
```

## Note

* If the User does not have a `UserInfo` instance when requested then one will
  be created for them.

# Pulizia postazione

Allow the Authenticated User to update their details.

**URL** : `/api/user/`

**Metodo** : `PUT`

**Autenticazione richiesta** : YES

**Permessi richiesti** : None

**Dati constraints**

```json
{
    "first_name": "[1 to 30 chars]",
    "last_name": "[1 to 30 chars]"
}
```

Note that `id` and `email` are currently read only fields.

**Header constraints**

The application used to update the User's information can be sent in the
header. Values passed in the `UAPP` header only pass basic checks for validity:

- If 0 characters, or not provided, ignore.
- If 1 to 8 characters, save.
- If longer than 8 characters, ignore.

```
UAPP: [1 to 8 chars]
```

**Dati examples**

Partial data is allowed.

```json
{
    "first_name": "John"
}
```

Empty data can be PUT to erase the name, in this case from the iOS application
version 1.2:

```
UAPP: ios1_2
```

```json
{
    "last_name": ""
}
```

## Messaggi di successos

**Condizione** : Dati provided is valid and User is Authenticated.

**Codice** : `200 OK`

**Contenuto example** : Response will reflect back the updated information. A
User with `id` of '1234' sets their name, passing `UAPP` header of 'ios1_2':

```json
{
    "id": 1234,
    "first_name": "Joe",
    "last_name": "Bloggs",
    "email": "joe25@example.com",
    "uapp": "ios1_2"
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

# Eliminazione stanza

Delete the Account of the Authenticated User if they are Owner.

**URL** : `/api/accounts/:pk/`

**Parametri URL** : `pk=[integer]` where `pk` is the ID of the Account in the
database.

**Metodo** : `DELETE`

**Autenticazione richiesta** : YES

**Permessi richiesti** : User is Account Owner

**Dati** : `{}`

## Messaggi di successo

**Condizione** : If the Account exists.

**Codice** : `204 NO CONTENT`

**Contenuto** : `{}`

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

# Eliminazione ppostazione

Delete the Account of the Authenticated User if they are Owner.

**URL** : `/api/accounts/:pk/`

**Parametri URL** : `pk=[integer]` where `pk` is the ID of the Account in the
database.

**Metodo** : `DELETE`

**Autenticazione richiesta** : YES

**Permessi richiesti** : User is Account Owner

**Dati** : `{}`

## Messaggi di successo

**Condizione** : If the Account exists.

**Codice** : `204 NO CONTENT`

**Contenuto** : `{}`

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
