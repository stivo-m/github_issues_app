import 'package:github_issues_app/models/models.dart';

List<Issue> issues = [
  Issue(
    title: "unrelated title ",
    body: "totally different description for the test",
    repo: "test",
    id: "",
    closed: false,
    closedAt: DateTime.now().toString(),
    createdAt: DateTime.now().toString(),
    user: "",
    comments: [],
  ),
  Issue(
    title: "sample title ",
    body: "Sample data to use for testing the search",
    repo: "test sample",
    id: "",
    closed: false,
    closedAt: DateTime.now().toString(),
    createdAt: DateTime.now().toString(),
    user: "",
    comments: [],
  ),
];
