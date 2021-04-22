---
layout: page
title: Account
parent: Server
nav_order: 1
grand_parent: Manuale Utente
---
# Account
{: .no_toc }
Di seguito vengono riportate le API per la gestione del proprio
account e l'autenticazione sul server

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Login
Autentica l'utente tramite username e password. All'utente viene
fornito un token, da poter utilizzare per le chiamate successive nel
campo `Authorization` dell'header

**URL** : `/api/account/login`

**Metodo** : `POST`

**Autorizzazione richiesta** : NO

**Permessi richiesti** : Nessuno

**Dati** 
```json
{
	"username": "user",
	"password": "password"
}
```

## Risposte
### Login effettuato
Login effettuato con successo, viene ritornato un token

**Codice** : `200 OK`

**Dati**
```json
{
   "authorities" : [
      "ADMIN"
   ],
   "token" : {
      "expiryDate" : "YYYY-MM-ddTHH:mm:ss.nnnnnnnnn",
      "id" : "00000000-aaaa-bbbb-cccc-000000000000",
      "username" : "admin"
   }
}
```
### Errori

| Codice | Motivazione                     |
|:-------|:--------------------------------|
| 400    | Account inesistente o eliminato |


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

### Errori

| Codice | Motivazione                     |
|:-------|:--------------------------------|
| 404    | Account inesistente o eliminato |


# Logout
Se valido, elimina il token richiedente

**URL** : `/api/account/logout/`

**Metodo** : `DELETE`

**Autenticazione richiesta** : SI

**Permessi richiesti** : Nessuno

## Risposte
### Successo

**Codice** : `200 OK`

### Errori

| Codice | Motivazione                     |
|:-------|:--------------------------------|
| 404    | Account inesistente o eliminato |

## Note

* Elimina il token corrispondente, non esegue il logout di tutti i dispositivi
