---
layout: page
title: Contribuzione
parent: Manutentore Server
grand_parent: Manuale Manutentore
nav_order: 5
---

# Contribuzione
{: .no_toc }
Come indicato all'interno della sezione [Contributing del README](https://github.com/SwevenSoftware/BlockCOVID-server#contributing) è stato adottato il [Gitflow workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) e lo stile del codice deve seguire il formato [spotless](/manutentore/server/tecnologie#spotless).

<details closed markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Continuous Integration

Modifiche al codice sorgente (per ogni _branch_ e per _Pull Request_) scatenano i processi di [_continuous-integration_](/glossario#continuous-integration) attraverso _GitHub Actions_, seguendo due workflow (`.github/workflows`):
- `build-server`
    - Controlla l'aderenza al formato [spotless](/manutentore/server/tecnologie#spotless)
    - Compila il codice
    - Esegue tutti i test presenti
- `coverage-server`
    - Esegue tutti i test
    - Genera un report sui test effettuati e lo pubblica su [Codecov](https://app.codecov.io/gh/SwevenSoftware/BlockCOVID-server)

{% include prev_next.liquid %}
