# Apresentação do Projeto: Pokédex Flutter (Clean Architecture)

Este documento foi preparado para servir de base para a sua apresentação de slides. Ele resume todas as funcionalidades, decisões arquiteturais e tecnologias implementadas no aplicativo da Pokédex.

---

## Slide 1: Visão Geral do Projeto
**Título Sugerido:** Pokédex App - Explorando a 1ª Geração
**Tópicos:**
- **O que é:** Um aplicativo mobile construído em Flutter que funciona como uma enciclopédia interativa dos 151 Pokémons clássicos (Geração 1 - Kanto).
- **Objetivo:** Demonstrar habilidades avançadas em desenvolvimento mobile, consumo de APIs RESTful, gerenciamento de estado e estruturação de projetos escaláveis.
- **Integração:** Totalmente integrado com a PokéAPI pública (`pokeapi.co`), trazendo dados em tempo real e artes oficiais em alta definição.

---

## Slide 2: Arquitetura e Estrutura
**Título Sugerido:** Clean Architecture e Boas Práticas
**Tópicos:**
- O projeto segue rigidamente os princípios de **Clean Architecture**, dividindo a aplicação em camadas independentes.
- **Features (Telas/Views):** Componentização da UI em `home`, `pokemons` (listagem e detalhes) e `perfil`.
- **Shared (Compartilhado):** Isolamento das regras de negócio e de consumo de dados (Modelos e Serviços).
- **Componentização:** Criação de widgets reutilizáveis como `PokemonCard`, `PokemonDrawer` e `HomeBottomNavigation`, mantendo o código das telas enxuto.

---

## Slide 3: Funcionalidades Principais (Core Features)
**Título Sugerido:** O que o App faz?
**Tópicos:**
- **Catálogo Reativo:** Uma grade (`GridView`) rica visualmente que lista os Pokémons utilizando `FutureBuilder` com tratamento de erro, estado de carregamento e botão de "Tentar Novamente".
- **Detalhes Ricos:** Tela de detalhes exclusiva que exibe a "Official Artwork", Tipos, Status Base (HP, Ataque, Defesa), Peso, Altura e Habilidades.
- **Navegação Fluida:** Sistema de abas com `BottomNavigationBar` integrando a Pokédex e a tela de Perfil do Treinador (Mock do usuário).

---

## Slide 4: Gerenciamento de Estado Global
**Título Sugerido:** Reatividade com ValueNotifier
**Tópicos:**
- Implementação de gerenciamento de estado nativo do Flutter (`ValueNotifier` e `ValueListenableBuilder`) sem dependência de bibliotecas externas pesadas.
- **Tema Escuro (Dark Mode):** Alternância em tempo real entre modo claro e escuro, afetando toda a paleta de cores, botões e textos do app globalmente.
- **Filtros Dinâmicos:** O estado global controla a listagem principal, permitindo filtrar a grade instantaneamente ao selecionar os tipos no Menu Lateral.

---

## Slide 5: Filtros e Menu Lateral (Drawer)
**Título Sugerido:** Drawer Interativo e Filtragem
**Tópicos:**
- **Pokemon Drawer:** Um menu lateral personalizado e interativo acessível por toda a aplicação.
- Contém a "Central de Configurações" da Pokédex.
- **Filtragem por Tipo:** Implementação de `FilterChips` coloridos para todos os 15 tipos clássicos (Água, Fogo, Dragão, etc.). Ao selecionar um ou mais tipos, a grade de Pokémons é filtrada dinamicamente, exibindo apenas as opções correspondentes.

---

## Slide 6: Persistência de Dados (Favoritos)
**Título Sugerido:** Armazenamento Local com SharedPreferences
**Tópicos:**
- Implementação de um sistema de "Favoritos" para que o usuário possa salvar os Pokémons que mais gosta na tela de detalhes.
- **Persistência Offline:** Uso do `shared_preferences` para gravar listas no dispositivo, garantindo que o coraçãozinho de "Favoritado" permaneça vermelho mesmo se o aplicativo for fechado e reaberto.
- Criação de um `FavoritesService` injetável focado unicamente na regra de favoritar/desfavoritar.

---

## Slide 7: Internacionalização (i18n)
**Título Sugerido:** Um App Global (PT, EN, ES)
**Tópicos:**
- O aplicativo é 100% internacionalizado e traduzido para Português, Inglês e Espanhol através do pacote `intl` e `flutter_localizations`.
- **Tradução Dinâmica:** Se o idioma do celular do usuário mudar, todos os textos (títulos, botões, tipos de Pokémon e menus) se adaptam automaticamente usando os arquivos `.arb` compilados em código nativo gerado pelo `flutter gen-l10n`.
- Solucionou-se a barreira da PokéAPI (que não possui nomes de tipo em PT-BR) fazendo o mapeamento e a tradução local para máxima performance.

---

## Slide 8: Desafios Superados e Conclusão
**Título Sugerido:** Resumo e Próximos Passos
**Tópicos:**
- **Lidando com a PokéAPI:** Otimização para buscar as imagens de alta qualidade profundamente aninhadas no JSON (`sprites > other > official-artwork`).
- **Limpeza de Código Antigo:** Remoção de módulos "fantasmas" de versões anteriores do projeto sem quebrar a árvore de dependências.
- **Design:** Construção de uma interface "Premium", utilizando cores vibrantes herdadas do próprio tipo do Pokémon e sombreamentos harmônicos.
