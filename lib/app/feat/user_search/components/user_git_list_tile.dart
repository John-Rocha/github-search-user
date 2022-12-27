import 'package:flutter/material.dart';
import 'package:github_search_user/app/feat/user_search/model/user_items.dart';
import 'package:github_search_user/app/feat/user_search/view/user_git_profile_view.dart';

class UserGitListTile extends StatelessWidget {
  const UserGitListTile({
    Key? key,
    required this.userGit,
  }) : super(key: key);

  final UserItems userGit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userGit.avatarUrl!),
        ),
        title: Text(userGit.login!),
        subtitle: Text(userGit.htmlUrl!),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserGitProfileView(user: userGit),
          ));
        },
      ),
    );
  }
}
