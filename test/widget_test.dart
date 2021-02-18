import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/main.dart';
import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:github_issues_app/redux/middleware/app_middleware.dart';
import 'package:github_issues_app/screens/screens.dart';
import 'package:redux/redux.dart';
import 'mocks/firebase_mocks.dart';
import 'mocks/issues_mock.dart';

void main() {
  setupFirebaseAuthMocks();
  Store<AppState> store;

  setUpAll(() async {
    await Firebase.initializeApp();
    store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: appMiddleWare(),
    );
  });

  group('MainScreen.test', () {
    testWidgets('on startup, check if the signup button exists',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that our counter starts at 0.
      expect(find.text(APP_TITLE), findsNothing);
      expect(find.text(SIGN_IN_WITH_GITHUB_TEXT), findsOneWidget);
    });
  });

  group('Homescreen.test', () {
    testWidgets(
        'on the home screen, check if a title, two icons exist, and a list of issues exist',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        StoreProvider(
          store: store,
          child: MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      // fetch the mock issues
      await store.dispatch(IssuesReceived(issues: issues));
      expect(find.text(APP_TITLE), findsOneWidget);
      expect(find.text(SIGN_IN_WITH_GITHUB_TEXT), findsNothing);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      expectLater(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('DetailsScreen.test', () {
    testWidgets(
        'on the details screen, at least a title of the passed issue should be found',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      Issue issue = issues.last;
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsScreen(
            issue: issue,
          ),
        ),
      );

      // fetch the mock issues
      expectLater(find.text(issue.title), findsOneWidget);
      expectLater(find.text(issue.body), findsOneWidget);
      expectLater(find.byIcon(Icons.search), findsNothing);
      expectLater(find.byIcon(Icons.settings), findsOneWidget);
      expectLater(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
