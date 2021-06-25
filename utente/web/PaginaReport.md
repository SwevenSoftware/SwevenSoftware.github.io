---
layout: page
title: Pagina report
parent: Web Client
nav_order: 5
grand_parent: Manuale Utente
---

# Pagina report
{: .no_toc }
<details closed markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

Dopo aver effettuato il login sarà disponibile la pagina contenente i
report sull'utilizzo e sull'igenizzazione delle
stanze. L'amministratore da quì potrà scaricare i report
già generati oppure crearne di nuovi al momento.

## Download report già generato
L'amministratore può scaricare un report già generato semplicemente
cliccando sul nome di quest'ultimo.

[![](/assets/web/downloadReport.gif)](/assets/web/downloadReport.gif)
> Click per ingrandire

## Generazione report
L'amministratore tramite due pulsanti in alto a destra potrà generare
due tipi di report: il report sull'utilizzo delle stanze (icona marrone)
oppure il report sulla sanificazione delle stanze (icona azzurra).

[![](/assets/web/createUsageReport.gif)](/assets/web/createUsageReport.gif)
> Click per ingrandire

[![](/assets/web/createCleanerReport.gif)](/assets/web/createCleanerReport.gif)
> Click per ingrandire

## Verifica hashcode report
Ogni report è caratterizzato da informazioni peculiari quali:
  - data di creazione;
  - data di registrazione;
  - hashcode del documento;
  - hashcode della transizione;
  - link "Vedi la transazione su etherscan".

L'amministratore, dopo aver cliccato l'anzidetto link, verrà reindirizzato su Etherscan da cui ottiene tutte le informazioni riguardo al salvataggio del report sulla blockchain. Se viene cliccato "Click to see More" (tradotto: "Clicca per visualizzare di più"), è possibile verificare l'hashcode del documento tramite il bottone "Decode Input Data" a fondo pagina.

Etherscan è un servizio che monitora le transazioni sulla rete Ethereum, viene usato come fonte terza per dimostrare che è effettivamente chiamato il contratto indicato nei report.

[![](/assets/web/checkHashReport.gif)](/assets/web/checkHashReport.gif)
> Click per ingrandire

{% include prev_next.liquid %}
