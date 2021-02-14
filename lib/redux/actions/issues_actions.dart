import 'package:flutter/material.dart';
import 'package:github_issues_app/models/issue_model.dart';

class GetIssues {}

class IssuesReceived {
  final List<Issue> issues;

  IssuesReceived({
    @required this.issues,
  });
}
