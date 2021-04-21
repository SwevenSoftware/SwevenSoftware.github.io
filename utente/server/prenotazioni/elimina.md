---
layout: page
title: Elimina prenotazione
parent: Server
grand_parent: Manuale Utente
---
# Delete User's Account

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
