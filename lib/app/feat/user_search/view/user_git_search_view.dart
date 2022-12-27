import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search_user/app/feat/user_search/bloc/user_search_bloc.dart';
import 'package:github_search_user/app/feat/user_search/components/user_git_list_tile.dart';

class UserGitSearchView extends StatefulWidget {
  const UserGitSearchView({super.key});

  @override
  State<UserGitSearchView> createState() => _UserGitSearchViewState();
}

class _UserGitSearchViewState extends State<UserGitSearchView> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search User'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Buscador de usuários do Github',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    hintText: 'User...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return 'Digite um user';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    final validate = _formKey.currentState?.validate() ?? false;
                    if (!validate) {
                      return;
                    }
                    context.read<UserSearchBloc>().add(
                          UserSearchEvent.search(
                            userId: _userController.text,
                          ),
                        );
                  },
                  child: const Text('Buscar'),
                ),
                const SizedBox(height: 15),
                BlocBuilder<UserSearchBloc, UserSearchState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      data: (user) {
                        final users = user.items ?? [];
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: users.length,
                          controller: ScrollController(keepScrollOffset: true),
                          itemBuilder: (context, index) {
                            final userGit = users[index];
                            return UserGitListTile(userGit: userGit);
                          },
                        );
                      },
                      error: (errorMessage) => Center(
                        child: Text(errorMessage),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
