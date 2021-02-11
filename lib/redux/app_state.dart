import 'package:flutter/material.dart';
import 'package:github_issues_app/models/models.dart';

class AppState {
  final List<Issue> issues;

  AppState({
    @required this.issues,
  });

  AppState.initialState() : issues = List.unmodifiable(<Issue>[]);
}
