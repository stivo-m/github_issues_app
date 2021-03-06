import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/main.dart';
import 'mocks/firebase_mocks.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:github_issues_app/redux/middleware/app_middleware.dart';
import 'package:redux/redux.dart';

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

  // group('Homescreen.test', () {
  //   testWidgets(
  //       'on the home screen, check if a title, two icons exist, and a list of issues exist',
  //       (WidgetTester tester) async {
  //     await tester.pumpWidget(MyApp());
  //     // Build our app and trigger a frame.
  //     await tester.pumpWidget(HomeScreen());
  //     // fetch the mock issues
  //     await store.dispatch(IssuesReceived(issues: issues));
  //     // Verify that our counter starts at 0.
  //     expect(find.text(APP_TITLE), findsOneWidget);
  //     expect(find.text(SIGN_IN_WITH_GITHUB_TEXT), findsNothing);
  //     expect(find.byIcon(Icons.search), findsOneWidget);

  //   });
  // });
}
