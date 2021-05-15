---
layout: page
title: Architettura
parent: Server
grand_parent: Manuale Manutentore
nav_order: 3
---

# Architettura Server

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Layer

Il server si basa su un'architettura a layer. Tali layer sono definiti dai seguenti package:
- `controllers`: contiene i controller (pricipalmente `RestController`) che hanno il compito di interfacciarsi con le richieste esterne dei client. I controller si limitano ad effettuare brevi controlli di validazione sui dati.
- `services`: contiene le classi indicate come service, al loro interno è implementata la business logic: ricevono i dati validati dai controller ed effettuano la maggior parte dell'elaborazione richiesta.
- `repositories`: contiene i repository che si interfacciano con MongoDB per la persistenza dei dati. Tali repository sono interfaccie che presentano solo la firma dei metodi richiesti, tali metodi sono implementati autonomamente da Spring.

## Common Reuse Principle

Nonostante la natura monolitica del server è stato deciso di suddividere i package seguendo un _Common Reuse Principle_, ciò potrà facilitare il passaggio ad un'architettura a microservizi in caso risultasse in futuro necessario.

Seguendo le funzionalità offerte dal server e la suddivisione incrementale seguita in fase di sviluppo, i package che contengono i singoli package singoli layer precedentemente descritti sono:
- `users`: funzionalità inerenti alla gestione degli account
    - Accesso (Login/Logout)
    - Creazione nuovo account
    - Modifica account
    - Eliminazione account
    - Informazioni singolo account
    - Lista utenti registrati
- `rooms`: funzionalità inerenti alla gestione delle stanze e delle postazioni ad esse collegate
    - Creazione stanza/postazione
    - Modifica stanza/postazione
    - Eliminazione stanza/postazione
    - Informazioni riguardanti lo stato di una stanza/postazione
    - Segnalazione stanza come pulita
- `reservations`: funzionalità inerenti all'utilizzo e la prenotazione delle singole postazioni
    - Nuova prenotazione
    - Modifica prenotazione
    - Eliminazione prenotazione
    - Informazioni prenotazione
    - Lista prenotazioni
    - Segnalazione inizio e fine utilizzo postazione
- `blockchain`: funzionalità che permettono d'interfacciarsi con la blockchain inserendo report PDF autogenerati
    - Generazione report PDF di utilizzo e pulizia delle stanze
    - Lista report generati

![](/assets/server/package_diagram.png)

## Altri package

All'interno di questi package possono essere presenti, oltre ai package associabili ai [layer](#layer), anche dei package che racchiudono classi con funzioni specifiche:
- `assemblers`: racchiudono classi che implementano l'interfaccia `RepresentationModelAssembler`, attraverso le quali Spring restituisce link contestuali ai dati richiesti dai client
- `dto`: insieme di _data class_ che forniscono una rappresentazione dei dati persistiti più adeguata alle richieste dei client
- `entities`: insieme di _data class_ utilizzate per la rappresentazione dei dati persistiti
- `exceptions`: racchiudono classi `Throwable`

In aggiunta a questi package possono essere inoltre presenti package specifici per singole funzionalità:
- `users.security` contiene classi relative la gestione dell'autenticazione mediante token
- `blockchain.documents` contiene classi per la creazione di report PDF 
- `configurations` contiene classi relative alla configurazione del server

## Esecuzione

La classe `it.sweven.blockcovid.Server` è il punto d'accesso per l'esecuzione del server, gestita da Spring mediante l'annotazione `@SpringBootApplication`.

Quando un client effettua una chiamata ad una REST API esposta dal server:
1. Spring invoca il relativo metodo presente all'interno di un controller, utilizzando un _dto_ od una _entity_ per elaborare i dati richiesti
2. Il controller chiamerà poi un metodo di un service per elaborare tali dati
3. Il service quindi utilizzerà un repository per ottenere o salvare i dati persistiti richiesti
4. Il repository restituirà l'_entity_ richiesta al service 
5. Il service elaborerà e restituirà al controller l'_entity_, eventualmente convertendola in _dto_ se necessario
6. Il controller poi invierà la risposta al client, utilizzando un'_assembler_ per aggiungere link contestuali ai dati restituiti dal service.

![](/assets/server/class_diagram.png)

{% include prev_next.liquid %}