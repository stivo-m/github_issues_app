import 'package:flutter/material.dart';
import 'package:github_issues_app/routes/router.dart';
import 'package:github_issues_app/constants/constants.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: HOME_SCREEN_ROUTE,
    );
  }
}
