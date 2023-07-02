# O que assistir 📺

O aplicativo tem como objetivo mostrar filmes, series e afins. Contendo informações como: sinopse, ano de lançamento, nota, gênero, etc. 

<div align="center">
<img src="/assets/images/home.png" alt="Home" style="height: 400px; "/>
<img src="/assets/images/details.png" alt="Details" style="height: 400px; "/>
</div>

## Detalhes Técnicos

### Versões
O aplicativo foi desenvolvido em Flutter e Dart com as mais recentes versões (Flutter 3.10.5 e Dart 3.0.5). 
### API
O aplicativo foi viabilizado utilizada a API do [The Movie Database](https://www.themoviedb.org/).

### Arquitetura

O aplicativo foi desenvolvido utilizando Clean Architecture em conjunto com o desenvolvimento orientado a testes (TDD).
<img src="/assets/images/tdd.png" align="left" alt="TDD" style="width: 175px; height: 125;"/>

<br clear="left"/>

<div align="center" >
<img src="/assets/images/clean-arch.png" alt="Clean Architecture" style="width: 400px; height: 400px;"/>
<img src="/assets/images/clean-arch-call-flow.png" alt="Clean Architecture" style="width: 400px; height:400px"/>
</div>

- Gerenciamento de estado: Mobx;

<img src="/assets/images/mobx.png" alt="Mobx" style="height: 200px; "/>

- Injeção de dependência: Modular;

### Testes de unidade: Mocktail

- Testes de Stores
- Testes de models
- Testes de Usecases
- Testes de repositories
- Testes de datasources

### Testes de integração: integration_test

