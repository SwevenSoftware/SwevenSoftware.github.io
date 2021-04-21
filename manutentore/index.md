---
layout: page
title: Manuale Manutentore
has_children: true
nav_order: 2
---

# Manuale Manutentore

## Introduzione

Lo scopo del Manuale per lo sviluppatore è presentare l'architettura del prodotto BlockCovid, l'organizzazione del codice sorgente e tutte le informazioni relative al mantenimento ed estensione del progetto.
Questo documento ha il fine di illustrare le procedure di installazione e sviluppo, illustrare i framework e le librerie utilizzate, facendo uso di diagrammi UML dei package, classe e di sequenza.

## Scopo del documento

Il prodotto che si vuole sviluppare è BlockCOVID, un'applicazione web e mobile mirata a gestire al meglio la situazione pandemica all'interno di aziende ed aule studio. L'applicazione include al suo interno tre tipi di utenti che utilizzeranno il software, con le loro relative esigenze:

- amministratore: gestisce le stanze ed ha accesso ai report giornalieri e in tempo reale;
- dipendente: riceve informazioni utili sulla postazione di lavoro che può prenotare ed igienizzare con un eventuale kit fornito in loco;
- addetto alle pulizie: conosce lo stato di pulizia di ogni stanza per ottimizzare il suo operato.

L'applicazione è quindi divisa in 3 parti:

- Back-End server: gestisce le REST API, l'uso della blockchain e l'implementazione di Docker;
- Front-End Web: gestisce un applicativo web utilizzato esclusivamente dall'amministra-tore per gestire i dati di stanze, prenotazioni ed account;
- Applicazione Android: gestisce un'applicazione mobile che sarà utilizzata da tutti gliutenti per prenotare, visualizzare e gestire le postazioni.

## Riferimenti

### Riferimenti normativi

### Riferimenti informativi
