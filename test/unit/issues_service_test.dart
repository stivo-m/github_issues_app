import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/actions/search_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:github_issues_app/redux/middleware/app_middleware.dart';
import 'package:redux/redux.dart';

import '../mocks/firebase_mocks.dart';
import '../mocks/issues_mock.dart';

void main() {
  setupFirebaseAuthMocks();
  late Store<AppState> store;

  setUpAll(() async {
    await Firebase.initializeApp();
    store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: appMiddleWare(),
    );
  });

  group('Issues.test', () {
    test(
        'if search term is dispatched on empty list, an empty list is expected as result, and searching is false',
        () {
      store.dispatch(SearchTerm(term: "search term"));
      expect(store.state.searchState!.issues.length, 0);
      expect(store.state.searchState!.searching, false);
    });

    test(
        'if search term is dispatched on populated list, with search term "test" result is on either title, body, or repo of the issue, in this case, 2',
        () async {
      await store.dispatch(IssuesReceived(issues: issues));
      await store.dispatch(SearchTerm(term: "test"));
      expect(store.state.searchState!.issues.length, 2);
      expect(store.state.searchState!.searching, true);
    });
    test(
        'if search term is dispatched on populated list, with search term "sample" result is on either title, body, or repo of the issue, in this case, 1',
        () async {
      await store.dispatch(IssuesReceived(issues: issues));
      await store.dispatch(SearchTerm(term: "sample"));
      expect(store.state.searchState!.issues.length, 1);
      expect(store.state.searchState!.searching, true);
    });
    test(
        'if the sort method is called, with field being Title, then its first element must match the last element in the mock data',
        () async {
      await store.dispatch(IssuesReceived(issues: issues));
      await store.dispatch(SortBy(field: TITLE_ID));
      expect(store.state.searchState!.issues.first.title, issues.last.title);
    });
  });
}
