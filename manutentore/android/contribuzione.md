---
layout: page
title: Contribuzione
parent: Android
grand_parent: Manuale Manutentore
nav_order: 5
---

# Contribuzione
{: .no_toc }
<details closed markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

Come indicato all'interno della sezione [Contributing del README](https://github.com/SwevenSoftware/BlockCOVID-android#contributing) è stato adottato il [Gitflow workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

## Continuous Integration

Modifiche al codice sorgente (per ogni _branch_ e per _Pull Request_) scatenano i processi di [_continuous-integration_](/glossario#continuous-integration) attraverso _GitHub Actions_, seguendo due workflow (`.github/workflows`):
- `build-app`
    - Compila il codice;
- `detekt-analysis`
    - Esegue un'analisi statica del codice;
- `code-coverage`
    - Calcola la code coverage e la carica su [Codecov](https://codecov.io/).

{% include prev_next.liquid %}
