---
layout: page
title: Architettura
parent: Android
grand_parent: Manuale Manutentore
nav_order: 3
---

# Architettura del prodotto
{: .no_toc }
<details closed markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Diagramma dei pacchetti
Vediamo qui il nostro diagramma dei package:

[![](/assets/android/package_diagram.png)](/assets/android/package_diagram.png)
> Click per ingrandire

I package all'interno di `ui` gestiscono i file della View e del Viewmodel e eventuali altre classi. 
Il package `data` gestisce il Model con le sue data class e le repositories. 
Il package `services` contiene le interfacce API, il NetworkClient e le data class per le risposte del server.
Infine il package `res` contiene tutti i file xml e png per gestire l'aspetto, la navigazione e le icone dell'applicazione.

## Pattern architetturale: MVVM
L'architettura scelta per l'applicazione mobile è il MVVM (Model View ViewModel).
Questa architetura è ottima per separare logica da presentazione, ma non solo, è particolarmente utile per gestire con efficacia e scalabilità le chiamate API.
Ogni funzionalità infatti segue questa architettura, a volte con alcune aggiunte per soddisfare le necessità intrinseche di ogni funzionalità.
Nello specifico quindi ogni funzionalità ricrea il MVVM, in cui si va a separare la UI dalla business logic:
- la View utilizza linguaggi di markup, nel nostro caso .xml, e si utilizza il two-way data binding per comunicare con essa.
- il ViewModel fa da intermediario tra il Model e la View grazie a LiveData. Invoca i metodi del Model per poi fornire i dati ottenuti alla View in una forma facilmente utilizzabile.
- il Model comunica con il server e contiene dati e logica di validazione.

[![](/assets/android/MVVM.png)](/assets/android/MVVM.png)
> Click per ingrandire

## Diagramma delle classi
Vediamo ora un diagramma delle classi, in questo caso della funzionalità UserRooms ma utilizzato in generale da quasi tutte le pagine:

[![](/assets/android/class_diagram.png)](/assets/android/class_diagram.png)
> Click per ingrandire

Da questo diagramma possiamo vedere come sono implementati i metodi e le classi del MVVM.
Per prima cosa viene creato il Model, per gestire gli oggetti in entrata dal lato server.
La chiamata Get all'API viene fatta dall'interfaccia APIRooms, creata dalla UserRepository tramite il nostro Retrofit Builder, implementato nel file NetworkClient.
In NetworkClient vengono anche gestiti i certificati http tramite la libreria Okhttp3.
L'UserRoomsFragment gestisce assieme ai file .xml la View, con cui comunica tramite data binding. Alla propria creazione, tramite un UserRoomsViewModelFactory, crea il nostro ViewModel: UserRoomsViewModel.
I dati che vengono ricevuti dal server tramite Retrofit vengono inseriti all'interno di LiveData, i quali vengono letti da UserRoomsFragment e UserRoomsViewModel tramite observers definiti nelle relative classi.
Questi observers si occupano di gestire e notificare alla View i cambiamenti agli oggetti, in modo da poter aggiornare i dati visti dall'utente nell'applicazione.

Come introdotto prima, ogni funzionalità ha dei bisogni aggiuntivi propri, in questo caso ad esempio è stato necessario implementare un UserRoomsAdapter per gestire dinamicamente gli oggetti della lista prenotazioni, implementata tramite uno standard RecyclerView.

## Espansione
Vista la natura modulare di questa applicazione è possibile estenderla in modo semplice visto che ogni pagina è indipendente dalle altre. Se si volessero aggiungere ulteriori funzionalità 
è sufficiente seguire i pattern già utilizzati per le altre pagine e quindi avere:
- un file .xml all'interno del package `layout`;
- creare un nuovo package all'interno di `ui`, contenente almeno un Fragment ed un ViewModel che comunicano con il layout tramite data binding;
- se si desidera utilizzare API del server, creare un'interfaccia all'interno di `apis`, una Repository all'interno di `repositories` ed eventuali data class all'interno di `model` e `gsonReceive`.
Infine, una volta creata la nuova pagina, è possibile inserirla all'interno dei file nel package `navigation` per renderla accessibile da altre pagine tramite la navigazione standard di Android.

Seguendo la struttura dei package appena definita, è anche possibile aggiungere test di unità delle rispettive classi all'interno della cartella `com.sweven.blockcovid (test)`.

{% include prev_next.liquid %}
