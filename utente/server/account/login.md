---
layout: page
title: Login
parent: Server
nav_order: 1
grand_parent: Manuale Utente
---

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
Login effettuato con successo, viene ritornato il token per le chiamate successive

**Codice** : `200 OK`

**Dati**
```json
{
   "authorities" : [
      "ADMIN"
   ],
   "token" : {
      "expiryDate" : "2021-04-23T18:58:04.543170085",
      "id" : "0182ab59-b2fe-45d3-ac9c-cdbb38994032",
      "username" : "admin"
   }
}
```
### Bad Request
Account inesistente o disattivato

**Codice** : `400 BAD REQUEST`

**Dati**
```json
{
   "error" : "Bad Request",
   "message" : "Invalid username",
   "path" : "/api/account/login",
   "status" : 400,
   "timestamp" : "2021-04-21T19:07:49.602+00:00"
}
```
