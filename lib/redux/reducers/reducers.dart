import 'package:github_issues_app/redux/reducers/issues_reducer.dart';
import 'package:github_issues_app/redux/reducers/search_reducer.dart';
import 'package:github_issues_app/redux/reducers/user_reducer.dart';
import 'package:github_issues_app/redux/state/app_state.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    issuesState: issuesReducer(state.issuesState, action),
    userState: userReducer(state.userState, action),
    searchState: searchReducer(state.searchState, action),
  );
}
