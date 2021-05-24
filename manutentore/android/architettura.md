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

L'architettura scelta per l'applicazione mobile è il MVVM (Model View ViewModel).
Questa architetura è ottima per separare logica da presentazione, ma non solo, è particolarmente utile per gestire con efficacia e scalabilità le chiamate API.
Ogni funzionalità infatti segue questa architettura, con alcune aggiunte per soddisfare le necessità intrinseche ad ogni funzionalità.

Questo si denota dal nostro diagramma dei package:

![](/assets/android/package_diagram.png)

Il package "ui" gestiscono i file della view e del viewmodel, il package "data" gestisce il model e il package "services" contiene le interfacce API.
Invece il package "res" contiene tutti i file xml e png per gestire l'aspetto e le icone dell'applicazione.

Nello specifico quindi ogni funzionalità ricrea il MVVM, come descritto in questo diagramma delle classi, specifico per la funzionalità UserRooms:

![](/assets/android/class_diagram.png)

Da questo diagramma possiamo vedere come sono implementati i metodi e le classi del MVVM.
Per prima cosa viene creato il model, per gestire gli oggetti in entrata dal lato server.
La chiamata Get all'API viene fatta dall'interfaccia APIRooms, creata dalla UserRepository tramite il nostro Retrofit Builder, implementato nel file NetworkClient.
In NetworkClient vengono anche gestiti i certificati http tramite la libreria Okhttp3.
L'UserRoomsFragment gestisce assieme ai file XML la view e alla propria creazione, tramite un UserRoomsViewModelFactory, crea il nostro viewModel: UserRoomsViewModel.
I dati che vengono ricevuti dal server tramite Retrofit vengono inseriti all'interno di LiveData, i quali vengono letti da UserRoomsFragment e UserRoomsViewModel tramite observers definiti nelle relative classi.
Questi observers si occupano di gestire e notificare alla view i cambiamenti agli oggetti, in modo da poter aggiornare i dati visti dall'utente nell'applicazione.

Come introdotto prima, ogni funzionalità ha dei bisogni aggiuntivi propri, in questo caso ad esempio è stato necessario implementare un UserRoomsAdapter per gestire dinamicamente gli oggetti della lista prenotazioni, implementata tramite uno standard RecyclerView.

{% include prev_next.liquid %}
