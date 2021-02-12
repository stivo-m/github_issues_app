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
      : issues = [
          Issue(
            body: "Test issue",
            closedAt: "2 days ago",
            id: "#46468",
            title: "Title",
            user: "User",
            comments: [],
            link: "",
          )
        ],
        userState = UserState.initialState(false);
}
