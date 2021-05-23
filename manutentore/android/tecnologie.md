---
layout: page
title: Tecnologie
parent: Android
grand_parent: Manuale Manutentore
nav_order: 1
---

# Indice
{: .no_toc .text-delta }

1. TOC
{:toc}

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

{% include prev_next.liquid %}