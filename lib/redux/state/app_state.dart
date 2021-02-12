import 'package:flutter/material.dart';
import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/state/user_state.dart';

class AppState {
  final List<Issue> issues;
  final UserState userState;

  AppState({
    @required this.issues,
    this.userState,
  });

  AppState.initialState()
      : issues = [],
        userState = UserState.initialState(false);
}
