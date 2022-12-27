part of 'user_search_bloc.dart';

@freezed
class UserSearchEvent with _$UserSearchEvent {
  const factory UserSearchEvent.search({required String userId}) = _Search;
}
