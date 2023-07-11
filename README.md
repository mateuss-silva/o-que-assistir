# O que assistir 📺

O aplicativo tem como objetivo mostrar filmes, series e afins. Contendo informações como: sinopse, ano de lançamento, nota, gênero, etc. 

<div align="center">
<img src="/assets/images/home-1.png" alt="Home" style="height: 450px; "/>
<img src="/assets/images/home-2.png" alt="Home" style="height: 450px; "/>
<img src="/assets/images/loading.png" alt="Home" style="height: 450px; "/>

<img src="/assets/images/search-2.png" alt="Home" style="height: 450px; "/>
<img src="/assets/images/search.png" alt="Home" style="height: 450px; "/>

<img src="/assets/images/movie-details.png" alt="Details" style="height: 450px; "/>
</div>

### Testes de unidade

Nos testes de unidade foi utilizando o [Mocktail](https://pub.dev/packages/mocktail), biblioteca de teste que fornece uma sintaxe simples para criar mocks. Atualmente o projeto está com 92% de cobertura de testes na análise da feature movie, assim sendo a feature escolhida para ter os testes e exemplificar como seria a implementação em todo projeto. 

| Teste | Cobertura |
| --- | --- |
| Stores <br> Models <br> Usecases<br> Repositories<br> Datasources | ![Testes de unidade](/assets/images/coverage.png) |




## Detalhes Técnicos

### Versões
O aplicativo foi desenvolvido em Flutter e Dart com as mais recentes versões (Flutter 3.10.5 e Dart 3.0.5). 
### API
O aplicativo foi viabilizado utilizada a API do [The Movie Database](https://www.themoviedb.org/).

### Arquitetura

O aplicativo foi desenvolvido utilizando Clean Architecture em conjunto com o desenvolvimento orientado a testes (TDD). Vale salientar que a abordagem utilizada é o Clean Architecture apresentada pelo [Reso Coder](https://resocoder.com/flutter-clean-architecture-tdd/).
Dito isto, pode percebe-se que o aplicativo foi desenvolvido com uma arquitetura desacoplada.
<img src="/assets/images/tdd.png" align="left" alt="TDD" style="width: 175px; height: 125;"/>

<br clear="left"/>

<div align="center" >
<img src="/assets/images/clean-arch.png" alt="Clean Architecture" style="width: 400px; height: 400px;"/>
<img src="/assets/images/clean-arch-call-flow.png" alt="Clean Architecture" style="width: 400px; height:400px"/>
</div>

### Gerenciamento de estado: Mobx;

<img src="/assets/images/mobx.png" alt="Mobx" style="height: 200px; "/>

### Injeção de dependência: Modular;

### Testes de integração: integration_test

