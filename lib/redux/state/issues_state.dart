import 'package:github_issues_app/models/models.dart';

class IssuesState {
  final List<Issue> issues;
  final bool loading;

  IssuesState({
    required this.issues,
    required this.loading,
  });

  IssuesState.initialState()
      : issues = [],
        loading = false;

  IssuesState copyWith({
    required List<Issue>? issues,
    required bool? loading,
  }) {
    return IssuesState(
      issues: issues ?? this.issues,
      loading: loading ?? this.loading,
    );
  }
}
