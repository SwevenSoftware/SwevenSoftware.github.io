---
layout: page
title: Tecnologie
parent: Server
grand_parent: Manuale Manutentore
nav_order: 1
---

# Tecnologie

Le versioni delle seguenti tecnologie utilizzate all'interno del progetto sono reperibili all'interno del file `build.gradle`.

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Java

Il server è scritto in [Java 14](https://docs.oracle.com/en/java/javase/14/), utilizzando [OpenJDK](https://adoptopenjdk.net/) come JDK di riferimento.

## Spring

[Spring](https://spring.io/projects/) è utilizzato principalmente come framework di dependency injection e per l'esposizione delle web API.

## MongoDB

Per la persistenza dei dati viene utilizzato il database non-relazionale [MongoDB](https://docs.mongodb.com/), collegamento facilitato dall'integrazione fornita da [Spring Data MongoDB](https://spring.io/projects/spring-data-mongodb).

## Lombok

[Lombok](https://projectlombok.org/) è un libreria Java alla quale viene delegata la scrittura di determinati metodi (quali _getter_, _setter_ e costruttori), ciò ha permesso di ridurre il carico di lavoro degli sviluppatori ed il numero di unit test richiesti.

## OpenAPI

L'esposizione di REST API attraverso il framework Spring ha permesso anche di generare automaticamente una documentazione di tali API fruibile attraverso un'interfaccia web (accedibile mediante l'URL `/swagger-ui.html`). Tale documentazione viene facilmente estesa attraverso l'utilizzo di annotazioni fornite dalla libreria [Swagger](https://github.com/swagger-api/swagger-core/wiki).

## iText7

[iText7](https://kb.itextsupport.com/home/it7kb) è la libreria utilizzata per la creazione dei report PDF.

## Solidity

[Solidity](https://soliditylang.org/) è il linguaggio con il quale è scritto lo [_smart contract_](/glossario#smart-contract) Ethereum.

## Web3j

[Web3j](https://github.com/web3j/web3j) è la libreria utilizzata per interfacciarsi con la blockchain Ethereum. Tale libreria implementa una classe astratta attraverso la quale viene esposto lo [_smart contract_](/glossario#smart-contract) Solidity.

## Ganache

[Ganache](https://www.trufflesuite.com/ganache) permette di simulare localmente una blockchain Ethereum così da facilitarne il testing.

## jUnit

[jUnit 5](https://junit.org/junit5/) è il framework utilizzato per la scrittura degli unit test.

## Mockito

[Mockito](https://site.mockito.org/) è la libreria utilizzata all'interno degli unit test per la creazione di [_mock_](/glossario#mock).

## JaCoCo

Il [code-coverage](/glossario#code-coverage) degli unit test viene misurato attraverso [JaCoCo](https://www.jacoco.org/jacoco/) e poi esposto attraverso il servizio web [Codecov](https://app.codecov.io/gh/SwevenSoftware/BlockCOVID-server).

## Spotless

Lo stile del codice prodotto è applicato e controllato attraverso la libreria [Spotless](https://github.com/diffplug/spotless), le regole di tale formato sono definite all'interno di `build.gradle`.

## Gradle

[Gradle](https://gradle.org/) è un tool di _build-automation_ che permette di configurare il progetto e le sue dipendenze attraverso un file `build.gradle`. Grazie a questo strumento è possibile riprodurre autonomamente il processo di build mediante [continuous-integration](/glossario#continuous-integration).

## Docker

[Docker](https://www.docker.com/) permette di creare facilmente container per definire ambienti di intallazione e configurazione definiti e riproducibili in qualsiasi macchina.

{% include prev_next.liquid %}