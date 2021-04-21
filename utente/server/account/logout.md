---
layout: page
title: Logout
parent: Server
grand_parent: Manuale Utente
---
# Logout
Se valido, elimina il token richiedente

**URL** : `/api/account/logout/`

**Metodo** : `DELETE`

**Autenticazione richiesta** : SI

**Permessi richiesti** : Nessuno

## Messaggi di successo

**Codice** : `200 OK`

**Contenuto** : `{}`

## Messaggi di errore

**Condizione** : Nessun account corrispondente

**Codice** : `404 NOT FOUND`

**Contenuto** : `{}`

## Note

* Elimina il token corrispondente, non esegue il logout di tutti i dispositivi
