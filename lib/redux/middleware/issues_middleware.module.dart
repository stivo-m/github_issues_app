import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:github_issues_app/services/issues/issues_service.dart';
import 'package:redux/redux.dart';

Middleware<AppState> getIssues() {
  return (Store store, action, NextDispatcher next) async {
    issuesService.getIssues().then((List<Issue> issues) {
      store.dispatch(IssuesReceived(issues: issues));
    });
    next(action);
  };
}
