---
layout: page
title: Architettura
parent: Web
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

## Redux

Il web client è stato sviluppato tramite l'architettura [redux](https://react-redux.js.org/). L'architettura in questione è formata da 5 componenti principali:
### State
Lo stato dell'applicazione, è l'unica fonte di verità all'interno
dell'applicazione e il posto dove sono contenute tutte le informazioni
utili ai componenti.

### Components
Si occupano del render della UI a partire dallo stato
dell'applicazione, gli eventi che accadono su questi componenti
scatenano poi delle azioni. I componenti vengono creati a partire
dalla loro dichiarazione e poi connessi tramite redux allo stato
condiviso dell'applicazione tramite i props, ovvero una mappa
utilizzata come unico input al costruttore dei componenti. tramite la
funzione `connect` di redux il componente viene reso disponibile
all'applicazione. due funzioni (`mapDispatchToProps` e
`mapStateToProps`) si occupano di mappare la totalità dello stato e
del dispatch dell'applicazione alle proprietà richieste dal
componente, così da poter gestire la mappa in ingresso dai props in
maniera consistente e indipendente dallo stato generale.

### Actions
Le azioni comprendono le operazioni da intraprendere sullo stato, a
partire dallo stato attuale e informazioni aggiuntive (nel nostro caso
le chiamate all'api del server che effettuano le operazioni sul
backend) consentono ai reducer di modificare lo stato
dell'applicazione.

### Reducers
A partire allo stato corrente e le azioni intraprese restituisce un
nuovo stato dell'applicazione, pronto per essere nuovamente
visualizzato tramite i componenti. Sono gestiti tramite una factory
che li genera a partire da uno stato iniziale corrispondente e una
serie di Handler.
#### Handlers
Gli handler sono costruiti come mappe di funzioni, che associano ad
ogni azione una funzione corrispondente. Questo modo di organizzare i
reducer è stato scelto al posto dell'approccio classico tramite switch
in quanto rendeva più agevole l'aggiunta di una azione.

Di seguito un esempio dell'architettura per il componente di login
della webapp

![](/assets/web/web_scheme.png)

## Tipi
Le actions, gli errori e i messaggi di conferma, sono gestiti tramite
dei tipi esplicitati nel file `types.ts`. Questo consente di avere un
unico punto nel quale dichiarare stringhe ricorrenti nel codice,
permettendo una facile traduzione dei contenuti qualora necessario

{% include prev_next.liquid %}
