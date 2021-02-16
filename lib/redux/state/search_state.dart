import 'package:flutter/material.dart';
import 'package:github_issues_app/models/models.dart';

class SearchState {
  final bool searching;
  final List<Issue> issues;

  SearchState({
    @required this.searching,
    @required this.issues,
  });

  SearchState.initialState()
      : issues = [],
        searching = false;

  SearchState copyWith({@required searching, @required issues}) {
    return SearchState(
      issues: issues ?? this.issues,
      searching: searching ?? this.searching,
    );
  }
}
