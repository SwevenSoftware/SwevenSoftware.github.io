---
layout: page
title: Manuale Manutentore
has_children: true
nav_order: 2
---

# Manuale Manutentore

## Introduzione

Lo scopo del Manuale Manutentore è presentare le procedure di installazione e sviluppo, illustrare i framework e librerie utilizzate, e descrivere l'architettura scelta per il prodotto BlockCOVID, fornendo così tutte le informazioni utili al mantenimento e all'estensione del progetto.

## Informazioni sul prodotto

Il prodotto BlockCOVID permette di tracciare l'utilizzo di postazioni e stanze di lavoro all'interno di aziende.
Il progetto si articola su 3 moduli:
- [Server](/manutentore/server): espone le API utilizzate dai client Android e Web, fornisce la business logic e permette di persistere i dati su database e servizio blockchain,
- [Android](/manutentore/android): permette ai dipendenti di prenotare ed utilizzare le postazioni di lavoro, e agli addetti alle pulizie di segnalare le stanze sanificate,
- [Web](/manutentore/web): mette a disposizione degli amministratori una piattaforma web per reperire informazioni sull'utilizzo delle postazioni, con possibilità di creare e modificare stanze e di generare i report che verranno aggiunti alla blockchain.

## Tipologie di utenti

All'interno del progetto vengono considerate 3 tipologie di utenti (si noti che ogni account può essere associato a più di una tipologia di utente):
- **User**: generalmente associato ad un dipendente, permette di effettuare prenotazioni ed utilizzare le postazioni
- **Cleaner**: tipologia di utente utilizzato dagli addetti alle pulizie per segnalare la sanificazione delle stanze
- **Admin**: utenti che hanno permessi di modifica di stanze e account, nonché di visualizzazione di tutte le prenotazioni presenti nel sistema 

## Riferimenti normativi
- [Capitolato d'appalto C1](https://www.math.unipd.it/~tullio/IS-1/2020/Progetto/C1.pdf)
- Norme di progetto v3.0.0

## Riferimenti informativi
- Analisi dei Requisiti v3.0.0
- [Lezioni Design Pattern e Diagrammi UML](https://www.math.unipd.it/~rcardin/swea/2021/)
- [Documentazione Spring](https://spring.io/projects/)
- [Documentazione Android](https://developer.android.com/docs)
- [Documentazione React](https://reactjs.org/docs/)
- [Documentazione MongoDB](https://docs.mongodb.com/)
- [Documentazione Ethereum](https://ethereum.org/en/developers/docs/programming-languages/java/)

## Note sulle versioni
Il gruppo SwevenSoftware garantisce il funzionamento del prodotto BlockCOVID solo nel caso in cui vengano utilizzate le versioni esatte delle librerie, specificate in ogni manuale manutentore.
Le successive versioni dovrebbero supportare la retrocompatibilità, ma ciò non può essere garantito.



