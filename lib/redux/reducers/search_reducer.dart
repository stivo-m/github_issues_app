import 'package:github_issues_app/redux/actions/search_actions.dart';
import 'package:github_issues_app/redux/state/search_state.dart';

SearchState searchReducer(SearchState state, action) {
  if (action is SearchTerm) {
    SearchState newState = state.copyWith(
      issues: state.issues,
      searching: true,
    );
    return newState;
  }

  if (action is SearchResults) {
    SearchState newState = state.copyWith(
      issues: action.results,
      searching: true,
    );
    return newState;
  }

  if (action is SearchNotFound) {
    SearchState newState = state.copyWith(
      issues: state.issues,
      searching: true,
    );
    return newState;
  }

  if (action is SearchClosed) {
    SearchState newState = state.copyWith(
      issues: state.issues,
      searching: false,
    );
    return newState;
  }

  if (action is SortBy) {
    SearchState newState = state.copyWith(
      issues: state.issues,
      searching: false,
      sortBy: action.field,
    );
    return newState;
  }

  return state;
}
