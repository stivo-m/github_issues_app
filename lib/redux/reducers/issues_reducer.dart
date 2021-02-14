import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/state/issues_state.dart';

IssuesState issuesReducer(IssuesState state, action) {
  if (action is GetIssues) {
    IssuesState newState = state.copyWith(
      issues: [],
      loading: true,
    );
    return newState;
  }

  if (action is IssuesReceived) {
    IssuesState newState = state.copyWith(
      issues: action.issues,
      loading: false,
    );
    return newState;
  }

  return state;
}
