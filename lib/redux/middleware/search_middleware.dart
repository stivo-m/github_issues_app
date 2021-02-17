import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/actions/search_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:github_issues_app/services/issues/search_service.dart';
import 'package:redux/redux.dart';

Middleware<AppState> searchIssue() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    await searchService
        .searchIssue(store.state.issuesState.issues, action.term)
        .then((List<Issue> issues) {
      store.dispatch(SearchResults(results: issues));
    });
    next(action);
  };
}

Middleware<AppState> sortBy() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    await searchService
        .sortIssues(store.state.issuesState.issues, action.field)
        .then((List<Issue> issues) {
      store.dispatch(IssuesReceived(issues: issues));
    });
    next(action);
  };
}
