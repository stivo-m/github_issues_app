import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';

List<Issue> issuesReducer(List<Issue> state, action) {
  if (action is GetIssues) {
    return []..addAll(state);
  }

  return state;
}
