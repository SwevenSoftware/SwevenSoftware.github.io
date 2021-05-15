---
layout: page
title: Testing
parent: Server
grand_parent: Manuale Manutentore
nav_order: 4
---

# Testing

<details open markdown="block">
  <summary>
    Indice
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>


## Unit Test

Gli _unit test_ relativi al server sono all'interno della cartella `src/test/java`.

La [_code-coverage_](/glossario#code-coverage) è misurata mediante [JaCoCo](#jacoco), dalla quale sono escluse le classi di configurazione, poiché più adatte ad un _integration test_.

> L'elenco di classi e package esculi dal _code-coverage_ è indicato all'interno del file `build.gradle`

{% include prev_next.liquid %}