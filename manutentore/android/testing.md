---
layout: page
title: Testing
parent: Android
grand_parent: Manuale Manutentore
nav_order: 4
---

# Test
{: .no_toc }
<details closed markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Test di unità
I test di unità sono stati sviluppati utilizzando Junit e Mockito.
Per eseguirli tramite Android Studio è sufficiente fare tasto destro sul file di test all'interno della cartella `com.sweven.blockcovid (test)` e cliccare su ***Run Test with Coverage***.
Alternativamente è possibile eseguirli tramite JaCoCo tramite il comando:
```sh
./gradlew clean test jacocoTestReport
```
dalla root del progetto. Verrà generato un report con il code coverage all'interno della cartella `app/build/reports/jacoco/jacocoTestReport/html/index.html`.

## Test di sistema
I test di sistema invece sono stati sviluppati tramite Espresso, situati nella cartella `/tests`.
Per eseguirli tramite Android Studio è sufficiente copiarli all'interno della cartella `androidTest`, fare tasto destro sul file di test e cliccare su ***Run Test with Coverage***.
Prima di eseguire questi test è necessario fare il run sul dispositivo mobile o sulla macchina virtuale e assicurarsi di essere sulla pagina di login. 
Inoltre è necessario disabilitare le animazioni del dispositivo Android tramite le Opzioni sviluppatore. 

## GitHub Actions
Il servizio di [Continuous Integration](/glossario#continuous-integration) che è stato deciso di utilizzare è GitHub Actions, fornito appunto da GitHub. 
Questo permette di creare dei workflow personalizzati, ovvero dei processi automatici creati sulla base delle proprie esigenze. 
Ciò ha l'obiettivo di automatizzare il ciclo di vita di sviluppo del software grazie ad un ampia gamma di strumenti e servizi.
La code coverage viene automaticamente calcolata ed aggiornata ad ogni push su GitHub tramite [Codecov](https://codecov.io/).

{% include prev_next.liquid %}
