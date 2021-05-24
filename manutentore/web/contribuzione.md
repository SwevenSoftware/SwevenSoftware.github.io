---
layout: page
title: Contribuzione
parent: Web
grand_parent: Manuale Manutentore
nav_order: 5
---

# Contribuzione

Come indicato all'interno della [sezione contributing del README](https://github.com/SwevenSoftware/BlockCOVID-web#contributing) è stato adottato il [Gitflow workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) e lo stile del codice deve seguire il formato [Prettier](/manutentore/web/tecnologie#prettier).

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Continuous integration

Modifiche al codice sorgente (per ogni _branch_ e per _Pull Request_) scatenano i processi di [_continuous-integration_](/glossario#continuous-integration) attraverso _GitHub Actions_, seguendo due workflow (`.github/workflows`):
- `build-bundle`
    - installa le dipendenze;
    - controlla l'aderenza al formato [Prettier](/manutentore/web/tecnologie#prettier);
    - compila il codice.
- `coverage`
    - installa le dipendeze;
    - esegue tutti i test;
    - genera un report sui test effettuati e lo pubblica su [Codecov](https://app.codecov.io/gh/SwevenSoftware/BlockCOVID-web).

{% include prev_next.liquid %}
