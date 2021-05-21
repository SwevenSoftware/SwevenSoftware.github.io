---
layout: page
title: Tecnologie
parent: Web
grand_parent: Manuale Manutentore
nav_order: 1
---

# Tecnologie

Le versioni delle seguenti tecnologie utilizzate all'interno del progetto sono reperibili all'interno del file `package.json`.

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Typescript
Il client web è scritto in
[typescript](https://www.typescriptlang.org/), linguaggio tipizzato
che viene poi transpilato in javascript in seguito al processo di
build.

## React
[React](https://reactjs.org/) è la libreria scelta per la
realizzazione delle interfacce utente

### Material UI
Alcuni componenti utilizzati sono stati incorporati dalla libreria
[Material UI](https://material-ui.com/) che fornisce una serie di
componenti react con una interfaccia consistente

## React-Redux
La libreria redux consente l'implementazione di architetture redux su
applicazioni scritte tramite react, integra le componenti per react e
le altre parti dell'architettura descritta nel capitolo [architettura](architettura)

## Jest
[Jest](https://jestjs.io/) è la libreria scelta per l'implementazione
dei test, in quanto consigliata dalla comunità e dalla documentazione
ufficiale di redux.

## Prettier
Il codice è formattato tramite il formatter
[Prettier](https://prettier.io/), così da aderire tutti alle stesse
regole stilistiche nella scrittura del codice.

## Webpack

[Webpack](https://webpack.js.org/) è un tool di _build-automation_ che
permette di configurare il progetto e le sue dipendenze attraverso un
file arbitrario (al momento il progetto comprende 2 configurazioni,
una per l'ambiente di sviluppo tramite il file `webpack.dev.js` e una
di deploy tramite il file `webpack.prod.js`). Grazie a questo
strumento è possibile riprodurre autonomamente il processo di build
mediante [continuous-integration](/glossario#continuous-integration).

## Docker

[Docker](https://www.docker.com/) permette di creare facilmente
container per definire ambienti di intallazione e configurazione
definiti e riproducibili in qualsiasi macchina.

{% include prev_next.liquid %}
