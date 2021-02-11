import 'package:github_issues_app/models/models.dart';
import 'app_state.dart';
import 'actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    issues: issuesReducer(state.issues, action),
  );
}

List<Issue> issuesReducer(List<Issue> state, action) {
  if (action is GetIssues) {
    return []..addAll(state);
  }

  return state;
}
