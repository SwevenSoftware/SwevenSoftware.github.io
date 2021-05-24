---
layout: page
title: API
parent: Manuale Utente
has_children: true
---

# Manuale Utente Server
Il seguente manuale è rivolto agli utilizzatori del server, ovvero i
client che utilizzano le API esposte. Per informazioni riguardanti il
deploy del server fare riferimento al [manuale sviluppatore](/manutentore/server/index.html).

## Regole generali
* Ogni richiesta all'api deve avere nel campo `Contenuto-Type`
  dell'header `application/json`
* Il formato per le date è `YYYY-MM-DD`, per i tempi `HH:mm` e per i
  timestamp `YYYY-MM-DDTHH:mm`
* Il ritorno di ogni chiamata all'API contiene il campo `_links` che
  contiene i link dove le informazioni recuperate con la chiamata
  fatta possono essere riutilizzate all'interno dell'api in maniera
  semanticamente simile
