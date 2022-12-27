import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_search_user/app/feat/user_search/model/user.dart';
import 'package:github_search_user/app/feat/user_search/repository/user_git_repository.dart';

part 'user_search_event.dart';
part 'user_search_state.dart';
part 'user_search_bloc.freezed.dart';

class UserSearchBloc extends Bloc<UserSearchEvent, UserSearchState> {
  final UserGitRepository _userGitRepository;
  UserSearchBloc({required UserGitRepository userGitRepository})
      : _userGitRepository = userGitRepository,
        super(const _Initial()) {
    on<UserSearchEvent>(_searchUser);
  }

  FutureOr<void> _searchUser(
    UserSearchEvent event,
    Emitter<UserSearchState> emit,
  ) async {
    emit(const UserSearchState.loading());
    try {
      final user = await _userGitRepository.getUsers(event.userId);
      emit(UserSearchState.data(user: user));
    } catch (e, s) {
      log('Erro ao buscar o usuário', error: e, stackTrace: s);
      emit(const UserSearchState.error('Erro ao buscar o usuário'));
    }
  }
}
