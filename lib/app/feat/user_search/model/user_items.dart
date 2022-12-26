class UserItems {
  String? login;
  int? id;
  String? avatarUrl;
  String? htmlUrl;

  UserItems({
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
  });

  @override
  String toString() {
    return 'UserItems(login: $login, id: $id, avatarUrl: $avatarUrl, htmlUrl: $htmlUrl)';
  }

  UserItems.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
  }
}
