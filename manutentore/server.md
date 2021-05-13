---
layout: page
title: Server
parent: Manuale Manutentore
---

# Manuale Manutentore Server

1. TOC
{:toc}

## Informazioni

La componente server del progetto BlockCOVID è adibita all'esposizione di REST API per la gestione del servizio di prenotazioni ed il collegamento con una blockchain Ethereum per il salvataggio di report PDF.

Secondo le richieste del proponente il server è pensato per essere installato [_on-premises_](/glossario#on-premises) all'interno dell'infrastruttura aziendale che lo utilizza. Ciò non limita però le possibilità offerte ai client, infatti il server rimane utilizzabile con un carico di traffico elevato ed è indipendente dal fuso orario dei singoli utenti.

## Tecnologie

Le versioni delle seguenti tecnologie utilizzate all'interno del progetto sono reperibili all'interno del file `build.gradle`.

### Java

Il server è scritto in [Java 14](https://docs.oracle.com/en/java/javase/14/), utilizzando [OpenJDK](https://adoptopenjdk.net/) come JDK di riferimento.

### Spring

[Spring](https://spring.io/projects/) è utilizzato principalmente come framework di dependency injection e per l'esposizione delle web API.

### MongoDB

Per la persistenza dei dati viene utilizzato il database non-relazionale [MongoDB](https://docs.mongodb.com/), collegamento facilitato dall'integrazione fornita da [Spring Data MongoDB](https://spring.io/projects/spring-data-mongodb).

### Lombok

[Lombok](https://projectlombok.org/) è un libreria Java alla quale viene delegata la scrittura di determinati metodi (quali _getter_, _setter_ e costruttori), ciò ha permesso di ridurre il carico di lavoro degli sviluppatori ed il numero di unit test richiesti.

### OpenAPI

L'esposizione di REST API attraverso il framework Spring ha permesso anche di generare automaticamente una documentazione di tali API fruibile attraverso un'interfaccia web (accedibile mediante l'URL `/swagger-ui.html`). Tale documentazione viene facilmente estesa attraverso l'utilizzo di annotazioni fornite dalla libreria [Swagger](https://github.com/swagger-api/swagger-core/wiki).

### iText7

[iText7](https://kb.itextsupport.com/home/it7kb) è la libreria utilizzata per la creazione dei report PDF.

### Solidity

[Solidity](https://soliditylang.org/) è il linguaggio con il quale è scritto lo [_smart contract_](/glossario#smart-contract) Ethereum.

### Web3j

[Web3j](https://github.com/web3j/web3j) è la libreria utilizzata per interfacciarsi con la blockchain Ethereum. Tale libreria implementa una classe astratta attraverso la quale viene esposto lo [_smart contract_](/glossario#smart-contract) Solidity.

### Ganache

[Ganache](https://www.trufflesuite.com/ganache) permette di simulare localmente una blockchain Ethereum così da facilitarne il testing.

### jUnit

[jUnit 5](https://junit.org/junit5/) è il framework utilizzato per la scrittura degli unit test.

### Mockito

[Mockito](https://site.mockito.org/) è la libreria utilizzata all'interno degli unit test per la creazione di [_mock_](/glossario#mock).

### JaCoCo

Il [code-coverage](/glossario#code-coverage) degli unit test viene misurato attraverso [JaCoCo](https://www.jacoco.org/jacoco/) e poi esposto attraverso il servizio web [Codecov](https://app.codecov.io/gh/SwevenSoftware/BlockCOVID-server).

### Spotless

Lo stile del codice prodotto è applicato e controllato attraverso la libreria [Spotless](https://github.com/diffplug/spotless), le regole di tale formato sono definite all'interno di `build.gradle`.

### Gradle

[Gradle](https://gradle.org/) è un tool di _build-automation_ che permette di configurare il progetto e le sue dipendenze attraverso un file `build.gradle`. Grazie a questo strumento è possibile riprodurre autonomamente il processo di build mediante [continuous-integration](/glossario#continuous-integration).

### Docker

[Docker](https://www.docker.com/) permette di creare facilmente container per definire ambienti di intallazione e configurazione definiti e riproducibili in qualsiasi macchina.

## Utilizzo

Per l'installazione e l'utilizzo del server si faccia riferimento alla sezione [Usage del README](https://github.com/SwevenSoftware/BlockCOVID-server#usage)

## Architettura

### Layer

Il server si basa su un'architettura a layer. Tali layer sono definiti dai seguenti package:
- `controllers`: contiene i controller (pricipalmente `RestController`) che hanno il compito di interfacciarsi con le richieste esterne dei client. I controller si limitano ad effettuare brevi controlli di validazione sui dati.
- `services`: contiene le classi indicate come service, al loro interno è implementata la business logic: ricevono i dati validati dai controller ed effettuano la maggior parte dell'elaborazione richiesta.
- `repositories`: contiene i repository che si interfacciano con MongoDB per la persistenza dei dati. Tali repository sono interfaccie che presentano solo la firma dei metodi richiesti, tali metodi sono implementati autonomamente da Spring.

### Common Reuse Principle

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

### Altri package

All'interno di questi package possono essere presenti, oltre ai package associabili ai [layer](#layer), anche dei package che racchiudono classi con funzioni specifiche:
- `assemblers`: racchiudono classi che implementano l'interfaccia `RepresentationModelAssembler`, attraverso le quali Spring restituisce link contestuali ai dati richiesti dai client
- `dto`: insieme di _data class_ che forniscono una rappresentazione dei dati persistiti più adeguata alle richieste dei client
- `entities`: insieme di _data class_ utilizzate per la rappresentazione dei dati persistiti
- `exceptions`: racchiudono classi `Throwable`

In aggiunta a questi package possono essere inoltre presenti package specifici per singole funzionalità:
- `users.security` contiene classi relative la gestione dell'autenticazione mediante token
- `blockchain.documents` contiene classi per la creazione di report PDF 
- `configurations` contiene classi relative alla configurazione del server

### Esecuzione

La classe `it.sweven.blockcovid.Server` è il punto d'accesso per l'esecuzione del server, gestita da Spring mediante l'annotazione `@SpringBootApplication`.

Quando un client effettua una chiamata ad una REST API esposta dal server:
1. Spring invoca il relativo metodo presente all'interno di un controller, utilizzando un _dto_ od una _entity_ per elaborare i dati richiesti
2. Il controller chiamerà poi un metodo di un service per elaborare tali dati
3. Il service quindi utilizzerà un repository per ottenere o salvare i dati persistiti richiesti
4. Il repository restituirà l'_entity_ richiesta al service 
5. Il service elaborerà e restituirà al controller l'_entity_, eventualmente convertendola in _dto_ se necessario
6. Il controller poi invierà la risposta al client, utilizzando un'_assembler_ per aggiungere link contestuali ai dati restituiti dal service.

![](/assets/server/class_diagram.png)

## Testing

### Unit Test

Gli _unit test_ relativi al server sono all'interno della cartella `src/test/java`.

La [_code-coverage_](/glossario#code-coverage) è misurata mediante [JaCoCo](#jacoco), dalla quale sono escluse le classi di configurazione, poiché più adatte ad un _integration test_.

> L'elenco di classi e package esculi dal _code-coverage_ è indicato all'interno del file `build.gradle`


## Contribuzione

Come indicato all'interno della sezione [Contributing del README](https://github.com/SwevenSoftware/BlockCOVID-server#contributing) è stato adottato il [Gitflow workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) e lo stile del codice deve seguire il formato [spotless](#spotless).

### Continuous Integration

Modifiche al codice sorgente (per ogni _branch_ e per _Pull Request_) scatenano i processi di [_continuous-integration_](/glossario#continuous-integration) attraverso _GitHub Actions_, seguendo due workflow (`.github/workflows`):
- `build-server`
    - Controlla l'aderenza al formato [spotless](#spotless)
    - Compila il codice
    - Esegue tutti i test presenti
- `coverage-server`
    - Esegue tutti i test
    - Genera un report sui test effettuati e lo pubblica su [Codecov](https://app.codecov.io/gh/SwevenSoftware/BlockCOVID-server)
