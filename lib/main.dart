import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:github_search_user/app/feat/user_search/bloc/user_search_bloc.dart';
import 'package:github_search_user/app/feat/user_search/repository/user_git_repository.dart';
import 'package:github_search_user/app/feat/user_search/view/user_git_search_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: RepositoryProvider(
        create: (context) => UserGitRepository(),
        child: BlocProvider(
          create: (context) => UserSearchBloc(
            userGitRepository: context.read(),
          ),
          child: const UserGitSearchView(),
        ),
      ),
    );
  }
}
