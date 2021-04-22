---
layout: page
title: Manuale Manutentore
has_children: true
nav_order: 2
---

# Manuale Manutentore

## Introduzione

Lo scopo del Manuale per il manutentore è presentare l'architettura del prodotto BlockCovid, l'organizzazione del codice sorgente e tutte le informazioni relative al mantenimento ed estensione del progetto.
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


## Riferimenti normativi
* Capitolato d'appalto C1:
https://www.math.unipd.it/~tullio/IS-1/2020/Progetto/C1.pdf
* Norme di progetto v3.0.0

## Riferimenti informativi
* Analisi dei Requisiti v3.0.0
* Diagrammi delle Classi
https://www.math.unipd.it/~rcardin/swea/2021/Diagrammi%20delle%20Classi_4x4.pdf
* Diagrammi dei Package
https://www.math.unipd.it/~rcardin/swea/2021/Diagrammi%20dei%20Package_4x4.pdf
* Diagrammi di Sequenza
https://www.math.unipd.it/~rcardin/swea/2021/Diagrammi%20di%20Sequenza_4x4.pdf
* Principi di programmazione SOLID
https://www.math.unipd.it/~rcardin/swea/2021/SOLID%20Principles%20of%20Object-Oriented%20Design_4x4.pdf
* Design pattern Strutturali
https://www.math.unipd.it/~rcardin/swea/2021/Design%20Pattern%20Strutturali_4x4.pdf
* Desing pattern Comportamentali
https://www.math.unipd.it/~rcardin/swea/2021/Design%20Pattern%20Comportamentali_4x4.pdf
* Documentazione Android
https://developer.android.com/docs
* Documentazione React  
https://it.reactjs.org/
* Documentazione MongoDB
https://www.mongodb.com/it
* Documentazione BlockChain   
https://ethereum.org/it/
* Documentazione Docker     
https://www.docker.com/

## Riferimenti legali
Licenza MIT:
https://opensource.org/licenses/MIT

## Note sulle versioni
Il gruppo SwevenSoftware garantisce il funzionamento del prodotto BlockCOvid solo nel caso in cui vengano utilizzate le versioni esatte delle librerie, specificate in ogni documento manutentore.
Le successive versioni dovrebbero supportare la retrocompatibilità, ma ciò non può essere garantito.



