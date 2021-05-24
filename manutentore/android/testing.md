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
Per eseguirli tramite Android Studio è sufficiente fare tasto destro sul file di test all'interno della cartella "com.sweven.blockcovid (test)" e cliccare su "Run Test with Coverage".

## Test di sistema
I test di sistema invece sono stati sviluppati tramite Espresso.
Per eseguirli tramite Android Studio è sufficiente fare tasto destro sul file di test all'interno della cartella "com.sweven.blockcovid (androidTest)" e cliccare su "Run Test with Coverage".
Prima di eseguire questi test è necessario fare il run sul dispositivo mobile o sulla macchina virtuale e assicurarsi di essere sulla pagina di login. Inoltre è necessario disabilitare le animazioni del dispositivo Android tramite le Opzioni sviluppatore. 

## GitHub Actions
Il servizio di [Continuous Integration](/glossario#continuous-integration) che è stato deciso di utilizzare è GitHub Actions, fornito appunto da GitHub. Questo permette di creare dei workflow personalizzati, ovvero dei processi automatici creati sulla base delle proprie esigenze. Ciò ha l'obiettivo di automatizzare il ciclo di vita di sviluppo del software grazie ad un ampia gamma di strumenti e servizi.

{% include prev_next.liquid %}
