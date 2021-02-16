import 'package:flutter/material.dart';
import 'package:github_issues_app/redux/state/issues_state.dart';
import 'package:github_issues_app/redux/state/search_state.dart';
import 'package:github_issues_app/redux/state/user_state.dart';

class AppState {
  final IssuesState issuesState;
  final UserState userState;
  final SearchState searchState;

  AppState({
    @required this.issuesState,
    this.userState,
    this.searchState,
  });

  AppState.initialState()
      : issuesState = IssuesState.initialState(),
        userState = UserState.initialState(false),
        searchState = SearchState.initialState();
}
