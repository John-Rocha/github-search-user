import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:github_search_user/app/feat/user_search/model/user_items.dart';

class UserGitProfileView extends StatelessWidget {
  final UserItems user;

  UserGitProfileView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final browser = InAppBrowser();

  var options = InAppBrowserClassOptions(
    crossPlatform: InAppBrowserOptions(hideUrlBar: false),
    inAppWebViewGroupOptions: InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        javaScriptEnabled: true,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(user.login!),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                user.avatarUrl!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, color: Colors.indigo),
                    const SizedBox(width: 15),
                    Text(
                      user.login!,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'ID: ${user.id!}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    browser.openUrlRequest(
                      urlRequest: URLRequest(
                        url: Uri.parse(user.htmlUrl!),
                      ),
                      options: options,
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.link, color: Colors.indigo),
                      const SizedBox(width: 15),
                      Text(user.htmlUrl!),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
