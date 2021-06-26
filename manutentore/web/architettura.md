---
layout: page
title: Architettura
parent: Web
grand_parent: Manuale Manutentore
nav_order: 3
---

# Architettura Web client

{: .no_toc }

<details closed markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Redux

Il web client è stato sviluppato tramite l'architettura [Redux](https://react-redux.js.org/). L'architettura in questione è formata da cinque componenti principali:

- ### Store

Lo [store](https://redux.js.org/api/store), lo stato dell'applicazione, è l'unica fonte di verità all'interno dell'applicazione e il posto dove sono contenute tutte le informazioni utili ai componenti;

- ### Components

Si occupano della renderizzazione dell'interfaccia utente a partire dallo stato dell'applicazione, gli eventi che accadono su questi componenti scatenano poi delle azioni. I componenti vengono creati a partire dalla loro dichiarazione e poi connessi tramite Redux allo stato condiviso dell'applicazione tramite i props, ovvero una mappa utilizzata come unico input al costruttore dei componenti. Tramite la funzione [`connect`](https://react-redux.js.org/api/connect) di React Redux il componente viene reso disponibile all'applicazione. Due funzioni si occupano di mappare la totalità dello stato ([`mapStateToProps`](https://react-redux.js.org/using-react-redux/connect-mapstate)) e del fare l'invio, il cosiddetto dispatch ([`mapDispatchToProps`](https://react-redux.js.org/using-react-redux/connect-mapdispatch)), di azioni dell'applicazione alle proprietà richieste dal componente, così da poter gestire la mappa in ingresso dai props in maniera consistente e indipendente dallo stato generale. È possibile aggiungere una nuova pagina creando un apposito componente. Se l'interazione con l'utente provoca cambiamenti al sistema (per esempio sono immesse informazioni necessarie ad altre componenti), bisogna sviluppare le actions e conseguentemente il/i reducer/reducers che modificheranno lo stato dell'applicazione;

- ### Actions

Le azioni identificano le operazioni da intraprendere sullo stato, a partire dallo stato attuale ed eventuali informazioni aggiuntive (nel nostro caso le chiamate all'API del server che effettuano le operazioni sul back-end). Consentono ai reducers di modificare lo stato dell'applicazione. Per creare le actions posizionarsi in `src/actions` e sviluppare il file comprensivo delle azioni;

- ### Reducers

A partire dallo stato corrente e dalle azioni intraprese, i reducers restituiscono un nuovo stato dell'applicazione, pronto poi per essere nuovamente ri-renderizzato dai componenti. I reducers sono gestiti tramite una factory che li genera a partire da uno stato iniziale corrispondente e una serie di handlers che gestiscono le operazioni:

- #### Handlers
Gli handlers sono costruiti come mappe di funzioni, che associano a ogni azione una funzione corrispondente. Questo [modo di organizzare i reducers](https://javascript.plainenglish.io/redux-without-switch-cases-and-some-other-tips-6a3d27157da6) è stato scelto al posto dell'approccio classico tramite `switch` in quanto rendeva più agevole l'aggiunta di una azione. Per creare un reducer posizionarsi in `src/reducers`, sviluppare il file comprensivo dello stato iniziale del reducer (più comunemente chiamato `initialState`) e dei riferimenti a `src/reducers/reducerFactory.ts` e `src/reducers/handlers/[nuovo handler]`. Aggiungere in `src/reducers/handlers/[nuovo handler]` l'handler apposito. Infine, importare il nuovo reducer in `src/reducers/rootReducer.ts` così che sia visibile allo store e quindi possibilmente a tutti i componenti.


## Tipi

Le actions, gli errori e i messaggi di conferma, sono gestiti tramite dei tipi esplicitati nel file `src/types.ts`. Questo consente di avere un unico punto nel quale dichiarare stringhe ricorrenti nel codice, permettendo una facile traduzione dei contenuti qualora fosse necessario. Ogni actions aggiunta deve aver un tipo presente in `src/types.ts`.

## Schema

Di seguito un esempio generico dell'architettura per l'applicazione web:

[![](/assets/web/web_scheme.png)](/assets/web/web_scheme.png)
> Click per ingrandire

Schema dell'architettura per la pagina di login:

[![](/assets/web/login_scheme.png)](/assets/web/login_scheme.png)
> Click per ingrandire

Schema dell'architettura per la pagina degli utenti:

[![](/assets/web/accounts_scheme.png)](/assets/web/accounts_scheme.png)
> Click per ingrandire

Schema dell'architettura per la pagina delle stanze:

[![](/assets/web/rooms_scheme.png)](/assets/web/rooms_scheme.png)
> Click per ingrandire

Schema dell'architettura per la pagina dei report:

[![](/assets/web/reports_scheme.png)](/assets/web/reports_scheme.png)
> Click per ingrandire

{% include prev_next.liquid %}
