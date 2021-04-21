---
layout: page
title: Account Info
parent: Server
nav_order: 2
grand_parent: Manuale Utente
---

# Account info
Ritorna all'utente le proprie informazioni non confidenziali, quali username e permessi

**URL** : `/api/account/info`

**Metodo** : `GET`

**Autorizzazione richiesta** : SI

**Permessi richiesti** : Nessuno

## Risposte
### Dati recuperati
I dati dell'utente sono stati recuperati con successo

**Codice** : `200 OK`

**Dati**
```json
{
   "authorities" : [
      "ADMIN"
   ],
   "username" : "admin"
}
```
