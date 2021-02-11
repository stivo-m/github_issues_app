import 'package:flutter/material.dart';
// import our custom routing module
import 'package:github_issues_app/routes/router.dart';
// import the constants for strings and routes
import 'package:github_issues_app/constants/constants.dart';
// import the redux and flutter_redux packagas installed through pubspec
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
// importour app_redux folder
import 'package:github_issues_app/redux/app_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: APP_NAME_ID,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            textTheme: TextTheme(
              headline1: TextStyle(color: Colors.black),
            ),
          ),
          scaffoldBackgroundColor: Colors.grey[100],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: Router.generateRoute,
        initialRoute: HOME_SCREEN_ROUTE,
      ),
    );
  }
}
