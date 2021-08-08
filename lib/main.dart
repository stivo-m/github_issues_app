import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/middleware/app_middleware.dart';
import 'package:github_issues_app/redux/reducers/reducers.dart';
// import our custom routing module
import 'package:github_issues_app/routes/router.dart';
// import the constants for strings and routes
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/services/issues/issues_service.dart';
import 'package:github_issues_app/services/navigation/navigator_service.dart';
// import the redux and flutter_redux packagas installed through pubspec
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
// importour app_redux folder
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:github_issues_app/constants/secret_keys.dart' as SecretKey;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: SecretKey.FIREBASE_API_KEY,
      authDomain: SecretKey.AUTH_DOMAIN,
      appId: SecretKey.FIREBASE_APP_ID,
      projectId: SecretKey.FIREBASE_PROJECT_ID,
      messagingSenderId: SecretKey.FIREBASE_MESSAGING_SENDER_ID,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: appMiddleWare(),
    );

    issuesService.init();
    store.dispatch(GetIssues());

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: APP_NAME_ID,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorService.navigatorKey,
        theme: ThemeData(
          fontFamily: 'Roboto',
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
          scaffoldBackgroundColor: Colors.grey[200],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: !store.state.userState!.isLoading &&
                store.state.userState!.user != null
            ? HOME_SCREEN_ROUTE
            : SPLASH_SCREEN_ROUTE,
      ),
    );
  }
}
