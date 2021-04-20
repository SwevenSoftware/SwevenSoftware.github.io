---
layout: page
title: Manutentore
permalink: /android/manutentore
parent: Manuali Android
---

## Indice
{: .no_toc .text-delta }

1. TOC
{:toc}

# Manuale sviluppatore Android
## Introduzione
Lo scopo del Manuale per lo sviluppatore è presentare l'architettura del prodotto BlockCovid, l'organizzazione del codice sorgente e tutte le informazioni relative al mantenimento ed estensione del progetto.
Questo documento ha il fine di illustrare le procedure di installazione e sviluppo, illustrare i framework e le librerie utilizzate, facendo uso di diagrammi UML dei package, classe e di sequenza.

## Scopo del Documento
Il prodotto che si vuole sviluppare è BlockCOVID, un'applicazione web e mobile mirata a gestire al meglio la situazione pandemica all'interno di aziende ed aule studio. L'applicazione include al suo interno tre tipi di utenti che utilizzeranno il software, con le loro relative esigenze:

- amministratore: gestisce le stanze ed ha accesso ai report giornalieri e in tempo reale;
- dipendente: riceve informazioni utili sulla postazione di lavoro che può prenotare ed igienizzare con un eventuale kit fornito in loco;
- addetto alle pulizie: conosce lo stato di pulizia di ogni stanza per ottimizzare il suo operato.

L'applicazione è quindi divisa in 3 parti:

- Back-End server: gestisce le REST API, l'uso della blockchain e l'implementazione di Docker;
- Front-End Web: gestisce un applicativo web utilizzato esclusivamente dall'amministra-tore per gestire i dati di stanze, prenotazioni ed account;
- Applicazione Android: gestisce un'applicazione mobile che sarà utilizzata da tutti gliutenti per prenotare, visualizzare e gestire le postazioni.

## Riferimenti
### Riferimenti normativi
### Riferimenti informativi

# Tecnologie e Librerie Utilizzate
## Tecnologie
### Android SDK 30
Android SDK fornisce le librerie API e gli strumenti per sviluppatori necessari per creare, testare ed eseguire il debug di app per Android.

[https://developer.android.com/studio/](https://developer.android.com/studio/)

- - -

### Kotlin 1.4.32

Kotlin è un linguaggio di programmazione general purpose, multi-paradigma, open source sviluppato dall'azienda di software JetBrains. Kotlin si basa sulla JVM (Java Virtual Machine) e dal 2019 viene utilizzato da Google per lo sviluppo Android.

[https://kotlinlang.org/](https://kotlinlang.org/)

- - -

### Gradle 6.5
Gradle è uno strumento di automazione della build open source progettato per essere abbastanza flessibile da creare quasi tutti i tipi di software. Gradle viene eseguito sulla JVM e per utilizzarlo è necessario disporre di un Java Development Kit (JDK)

[https://docs.gradle.org/current/userguide/userguide.html](https://docs.gradle.org/current/userguide/userguide.html)

- - -

### Java SDK 8
JDK è un ambiente di sviluppo per la creazione di applicazioni utilizzando il linguaggio diprogrammazione Java. Include strumenti utili per lo sviluppo e il test di programmi scritti nel linguaggio di programmazione Java e in esecuzione sulla piattaforma JavaTM.

[https://www.oracle.com/it/java/technologies/javase/javase8-archive-downloads.html](https://www.oracle.com/it/java/technologies/javase/javase8-archive-downloads.html)

- - -

## Librerie
### AndroidX
AndroidX è un importante miglioramento rispetto alla libreria di supporto Android originale,che non viene più mantenuta. I pacchetti androidx sostituiscono completamente la libreria di supporto fornendo parità di funzionalità e nuove librerie. Gli artifact all'interno del namespac eandroidx comprendono le librerie Jetpack di Android. Come la libreria di supporto, le librerie del namespace androidx vengono fornite separatamente dalla piattaforma Android e forniscono la compatibilità con le versioni precedenti tra le versioni di Android

[https://developer.android.com/jetpack/androidx/](https://developer.android.com/jetpack/androidx/)

- - -

### Okhttp3
OkHttp è un client HTTP spesso utilizzato assieme alla libreria Retrofit2.

[https://square.github.io/okhttp/](https://square.github.io/okhttp/)

- - -

### Retrofit2
Retrofit trasforma l'API HTTP in un'interfaccia Java. Questa libreria è stata utilizzata pergestire le numerose chiamata API necessarie per sviluppare le funzionalità richieste da capitolato.

[https://square.github.io/retrofit/](https://square.github.io/retrofit/)

- - -

### Material Design
Material è un sistema di progettazione, supportato da codice open source, che aiuta i team acreare esperienze digitali di alta qualità. Tramite questa libreria abbiamo creato i componentidi design della nostra App.

[https://material.io/](https://material.io/)

- - -

### Junit
JUnit è un semplice framework per scrivere test ripetibili. È un'istanza dell'architettura xUnit per framework di unit test. Nella nostra applicazione mobile Junit è stato utilizzato assieme a Mockito per sviluppare i test di unità.

[https://junit.org/junit4/](https://junit.org/junit4/)

- - -

### Mockito
Mockito è un mocking framework per sviluppare test in Java, lo abbiamo utilizzato per scrivere i nostri test di unità.

[https://site.mockito.org/](https://site.mockito.org/)

- - -

### ZoomLayout
ZoomLayout è una raccolta di componenti Android che supportano lo zoom e la panoramica digerarchie di visualizzazione, immagini, flussi video e molto altro.

[https://natario1.github.io/ZoomLayout/home](https://natario1.github.io/ZoomLayout/home)

- - -

### Espresso
Espresso è una libreria nata per scrivere test dell'interfaccia utente Android.  Espresso testa chiaramente le aspettative, le interazioni e le affermazioni senza che la distrazione di contenuti standard, infrastrutture personalizzate o dettagli di implementazione disordinati si intromettano. Nella nostra applicazione questa libreria è stata utlizzata per creare un test dell'interfaccia utente.

[https://developer.android.com/training/testing/espresso/](https://developer.android.com/training/testing/espresso/)

- - -

### Jacoco
Il plug-in JaCoCo fornisce metriche di copertura del codice per il codice Java tramite l'integrazione con JaCoCo.

[https://www.jacoco.org/jacoco/](https://www.jacoco.org/jacoco/)

- - -

# Setup
## Requisiti minimi di sistema
### Prerequisiti
- Android Studio
- (opzionale) Dispositivo Android

### Requisiti Hardware

- 4GB di memoria RAM
- Sistema operativo 64bit

## Installazione
Per preparare l'ambiente di lavoro per lo sviluppo dell'applicazione mobile BlockCOVID è necessario:
1. scaricare ed installare Android Studio, disponibile al seguente link:  
[Android Studio](https://developer.android.com/studio);
2. scaricare l'ultima release dell'applicazione, in formato .zip, disponibile al seguente link:  
[BlockCOVID-Android](https://github.com/SwevenSoftware/BlockCOVID-android/releases);
3. estrarne il contenuto in una cartella qualsiasi;
4. tramite Android Studio, aprire la cartella in cui è stata estratta la release come progetto;

Se si desidera inoltre installare l'applicazione sul proprio dispositivo Android è necessario:
1. Attivare la modalità debug sul proprio dispositivo Android;
2. fare la build del progetto tramite Android Studio andando su Build > Make Project o la shortcut Ctrl + F9;
3. collegare il proprio dispositivo Android al computer, autorizzando la lettura/scrittura di file;
4. aprire la tendina "Available devices" in alto a destra di Android Studio e selezionare il proprio dispositivo;
5. fare il run del progetto tramite Android Studio andando su Run > Run 'app' o la shortcut Ctrl + F10.

Se non si disponesse di un dispositivo Android fisico è possibile utilizzare l'emulatore fornito da Android Studio. Per utilizzarlo è sufficiente selezionare il dispositivo emulato, invece che quello fisico, dalla tendina "Available devices". Il resto dei passi per l'installazione rimangono gli stessi.

# Test
## Test Unità
I test di unità sono stati sviluppati utilizzando Junit e Mockito.
Per eseguirli è sufficiente fare tasto destro sul file di test e cliccare su "Run Test", il compilatore di Android Studio si occuperà del resto.

## Test Interfaccia
I test di interfaccia invece sono stati sviluppati tramite Espresso.
Per eseguirli è necessario prima fare il run sul dispositivo mobile o sulla macchina virtuale, e poi fare "Run test" sul file di test.

## GitHub Actions
Il servizio di Continuous IntegrationG che è stato deciso di utilizzare è GitHub Actions, fornito appunto da GitHub. Questo permette di creare dei workflow personalizzati, ovvero dei processi automatici creati sulla base delle proprie esigenze. Ciò ha l'obiettivo di automatizzare il ciclo di vita di sviluppo del software grazie ad un ampia gamma di strumenti e servizi.

# Architettura del prodotto
L'architettura scelta per l'applicazione mobile è il MVVM (Model View ViewModel).
Questa architetura è ottima per separare logica da presentazione, ma non solo, è particolarmente utile per gestire con efficacia e scalabilità le chiamate API.
Ogni funzionalità infatti segue questa architettura, con alcune aggiunte per soddisfare le necessità intrinseche ad ogni funzionalità.

Questo si denota dal nostro diagramma dei package:

![](/android/imgs/package_diagram.png)

Il package "ui" gestiscono i file della view e del viewmodel, il package "data" gestisce il model e il package "services" contiene le interfacce API.
Invece il package "res" contiene tutti i file xml e png per gestire l'aspetto e le icone dell'applicazione.

Nello specifico quindi ogni funzionalità ricrea il MVVM, come descritto in questo diagramma delle classi, specifico per la funzionalità UserRooms:

![](/android/imgs/class_diagram.png)

Da questo diagramma possiamo vedere come sono implementati i metodi e le classi del MVVM.
Per prima cosa viene creato il model, per gestire gli oggetti in entrata dal lato server.
La chiamata Get all'API viene fatta dall'interfaccia APIRooms, creata dalla UserRepository tramite il nostro Retrofit Builder, implementato nel file NetworkClient.
In NetworkClient vengono anche gestiti i certificati http tramite la libreria Okhttp3.
L'UserRoomsFragment gestisce assieme ai file XML la view e alla propria creazione, tramite un UserRoomsViewModelFactory, crea il nostro viewModel: UserRoomsViewModel.
I dati che vengono ricevuti dal server tramite Retrofit vengono inseriti all'interno di LiveData, i quali vengono letti da UserRoomsFragment e UserRoomsViewModel tramite observers definiti nelle relative classi.
Questi observers si occupano di gestire e notificare alla view i cambiamenti agli oggetti, in modo da poter aggiornare i dati visti dall'utente nell'applicazione.

Come introdotto prima, ogni funzionalità ha dei bisogni aggiuntivi propri, in questo caso ad esempio è stato necessario implementare un UserRoomsAdapter per gestire dinamicamente gli oggetti della lista prenotazioni, implementata tramite uno standard RecyclerView.

