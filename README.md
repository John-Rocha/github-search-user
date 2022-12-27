
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
    1. Abra uma terminal;
    2. Digite `git@github.com:John-Rocha/github-search-user.git` e pressione ENTER;
    3. Digite `cd github_search_user`;
    4. Digite `flutter pub get`;
    5. Abra o diretório na IDE da sua escolha.

### Usabilidade
