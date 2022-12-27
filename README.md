
# App para pesquisar usuários no Github

Um aplicativo desenvolvido em Flutter que consulta a API pública de pesquisa do GitHub. Este app faz
um filtro por nome de usuário, retornando os usuários encontrados na pesquisa. Ao clicar em um usuário,
o app abre uma nova tela com mais informações sobre o usuário selecionado.

### Organização
O app está organizado por features. Como este só possui uma tela de busca e uma de perfil, foi criada apenas um feature que é `user_search`.

### Gerência de estado
O app utiliza o BLoC pattern como state management, no qual está definido com os módulo de `event`, `state` e `bloc`.

### Packages utilizados

- http
- freezed_annotation
- freezed
- flutter_bloc
- flutter_inappwebview
- build_runner (dev dependency)

### Instalação
1. Abra um terminal;
2. Digite `git@github.com:John-Rocha/github-search-user.git` e pressione ENTER;
3. Digite `cd github_search_user`;
4. Digite `flutter pub get`;
5. Abra o diretório na IDE da sua escolha.

### Usabilidade

![426LjrOZ2X](https://user-images.githubusercontent.com/52468127/209608601-c6643e7b-b146-4188-8300-3698185f4037.png)

![7QtyjDg0Qv](https://user-images.githubusercontent.com/52468127/209608608-88062aa6-d2bf-4fc9-9910-ac6a778383b1.png)

![gV5QXeyTT6](https://user-images.githubusercontent.com/52468127/209608613-dd75de43-6468-4431-bf0a-e2c8e5136127.png)

![QUUoKb1Hh6](https://user-images.githubusercontent.com/52468127/209608616-066a409a-b89f-4658-8d1b-b85bed74f0ad.png)

https://user-images.githubusercontent.com/52468127/209608619-f58d9cb2-3c84-4619-bfd1-19c149fdf293.mp4

