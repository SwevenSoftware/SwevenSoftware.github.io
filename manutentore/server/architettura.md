---
layout: page
title: Architettura
parent: Server
grand_parent: Manuale Manutentore
nav_order: 3
---

# Architettura Server
{: .no_toc }
<details closed markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Diagramma generale dei package, common Reuse Principle

Nonostante la natura monolitica del server è stato deciso di suddividere i package seguendo un _Common Reuse Principle_, ciò potrà facilitare il passaggio ad un'architettura a microservizi in caso risultasse in futuro necessario.

Seguendo le funzionalità offerte dal server e la suddivisione incrementale seguita in fase di sviluppo, i package che contengono i singoli layer sono:

### users
funzionalità inerenti alla gestione degli account: 
- Accesso (Login/Logout)
- Creazione nuovo account
- Modifica account
- Eliminazione account
- Informazioni singolo account
- Lista utenti registrati

Il diagramma UML del pacchetto utenti è il seguente (click per ingrandire)

[![](/assets/server/users_package.svg)](/assets/server/users_package.svg)

[Download UML](/download/user_diagram.uml){: .btn .btn-primary }

### rooms
Il package rooms si occupa della gestione delle stanze e delle postazioni:
- Creazione stanza/postazione
- Modifica stanza/postazione
- Eliminazione stanza/postazione
- Informazioni riguardanti lo stato di una stanza/postazione
- Segnalazione stanza come pulita

Il diagramma UML che descrive il pacchetto rooms (click per ingrandire):

[![](/assets/server/rooms_package.svg)](/assets/server/rooms_package.svg)

[Download UML](/download/room_diagram.uml){: .btn .btn-primary }

### reservations
Il package contiene layer che realizzano funzionalità inerenti all'utilizzo e la prenotazione delle singole postazioni:
- Nuova prenotazione
- Modifica prenotazione
- Eliminazione prenotazione
- Informazioni prenotazione
- Lista prenotazioni
- Segnalazione inizio e fine utilizzo postazione

Di seguito il diagramma UML (click per ingrandire)

[![](/assets/server/reservations_package.svg)](/assets/server/reservations_package.svg)

[Download UML](/download/reservations_diagram.uml){: .btn .btn-primary }

### blockchain
Il package di blockchain permette di interfacciarsi con la blockchain, generando in autonomia pdf o su richiesta dell'utente, ed in ogni caso registrando l'hash sulla blockchain:
- Generazione report PDF di utilizzo e pulizia delle stanze
- Lista report generati

Il diagramma UML per il pacchetto è il segente (click per ingrandire):

[![](/assets/server/blockchain_package.svg)](/assets/server/blockchain_package.svg)

[Download UML](/download/blockchain_diagram.uml){: .btn .btn-primary }

## Layer

Il server si basa su un'architettura a layer. Ogni package precendetemente illustrato contiene al proprio interno 3 package principali: `controller`, `service` e `repository`

### Controllers
contiene i controller (pricipalmente `RestController`) che si occupano di interfacciarsi con le richieste esterne dei client: controllare i dati in ingresso e passare le informazioni al service layer che si occuperà invece di gestire la logica delle richieste. Nel caso in cui il service layer risponda con eccezioni sarà compito del controller intercettarle e ritornare i messaggi di errore al client richiedente. Nella pratica i controller sono delle classi annotate tramite annotazioni _spring_. Sarà infatti spring ad occuparsi di eseguire un server [tomcat](http://tomcat.apache.org/) che esporrà i metodi delle classi annotate di conseguenza.

### Services
contiene le classi indicate come service, al loro interno è implementata la business logic: ricevono i dati validati dai controller e si interfacciano con le repositories per recuperare i dati richiesti o modificarli. Dato che non devono conservare uno stato interno, gestito invece tramite le _repository_ tutte le funzioni sono generalmente esposte tramite un'unica classe di service per ogni macro package descritto nel capitolo del [common reuse principle](#common-reuse-principle), che viene poi iniettata dove necessario da spring. Ciò non vieta per funzioni più avanzate o qualora necessario di avere più service ed utilizzare solo quelli necessari.

### Repositories
contiene i repository che si interfacciano con MongoDB per la persistenza dei dati. Tali repository sono interfaccie che presentano solo la firma dei metodi richiesti, tali metodi sono implementati autonomamente da Spring.

## Altri package

All'interno di questi package possono essere presenti, oltre ai package associabili ai [layer](#layer), anche dei package che racchiudono classi con funzioni specifiche:

### assemblers
racchiudono classi che implementano l'interfaccia `RepresentationModelAssembler`, attraverso le quali Spring restituisce link contestuali ai dati richiesti dai client, per avere una api restful.

### dto
insieme di _data class_ che forniscono una rappresentazione dei dati persistiti più adeguata alle richieste dei client.

### entities
insieme di _data class_ utilizzate per la rappresentazione dei dati persistiti.

### exceptions
racchiudono classi `Throwable`.

## Package specifici
In aggiunta a questi package possono essere inoltre presenti package specifici per singole funzionalità:
### users.security
contiene classi relative la gestione dell'autenticazione mediante token
### blockchain.documents
contiene classi per la creazione di report PDF 
### configurations
contiene classi relative alla configurazione del server

## Esecuzione

La classe `it.sweven.blockcovid.Server` è il punto d'accesso per l'esecuzione del server, gestita da Spring mediante l'annotazione `@SpringBootApplication`.

Quando un client effettua una chiamata ad una REST API esposta dal server:
1. Spring invoca il relativo metodo presente all'interno di un controller, utilizzando un _dto_ od una _entity_ per elaborare i dati richiesti
2. Il controller chiamerà poi un metodo di un service per elaborare tali dati
3. Il service quindi utilizzerà un repository per ottenere o salvare i dati persistiti richiesti
4. Il repository restituirà l'_entity_ richiesta al service 
5. Il service elaborerà e restituirà al controller l'_entity_, eventualmente convertendola in _dto_ se necessario
6. Il controller poi invierà la risposta al client, utilizzando un'_assembler_ per aggiungere link contestuali ai dati restituiti dal service.

Per esempio per l'avvio dell'utilizzo di un banco libero è rappresentato dal seguente diagramma di sequenza (click per ingrandire). È possibile notare come ogni modulo si interfacci solamente con se stesso o con un modulto di un layer sottostante (_controller_ con _service_, _service_ con _repository_, ...), mentre la gestione degli `EntityModel` è affidata ad un modulo assembler che permette di rilasciare i dati e i collegamenti in maniera consistente tramite tutta la API.

[![](/assets/server/newReservationSequence.png)](/assets/server/newReservationSequence.png)

### Interazione con la blockchain ethereum
La bockchain ethereum si occupa tramite il contratto in `src/main/solidity/DocumentContract.sol` di attestare l'esistenza di un hash in un dato momento. Registrando l'hash di un documento al momento della sua creazione è possibile dimostrarne l'esistenza in un dato momento. Il contratto scritto in solidity viene transpilato dal plugin `web3j` di gradle in una libreria java. La classe `BlockchainConfiguration` nel package `it.sweven.blockcovid.configurations` si occupa di gestire le informazioni di deploy del contratto in base all'ambiente di esecuzione, garantendo che le calssi che poi necessitano di interfacciarsi con la blockchain possano richiedere un oggetto di tipo `DocumentContract` che rappresenta un'istanza attiva del contratto sulla blockchain. Attraverso tale oggetto è possibile chiamare i metodi del contratto in solidity tramite RPC, attendendo una risposta dalla blockchain. Ad esempio il controller `AutomaticUsageController`, che si occupa ogni giorno a mezzanotte UTC di generare e firmare un nuovo documento sulla blockchain, utilizza service che si occupano di interfacciarsi col `DocumentContract` e che tramite chiamate sincrone creano i report e ne registrano l'hash. Il tutto con il seguente diagramma di sequenza:

[![](/assets/server/registerContractSequence.png)](/assets/server/registerContractSequence.png)

{% include prev_next.liquid %}
