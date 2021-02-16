import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/models/issue_model.dart';

class SearchTerm {
  final String term;
  SearchTerm({this.term});
}

class SearchResults {
  final List<Issue> results;
  SearchResults({@required this.results});
}

class SearchNotFound {
  final String notFound;
  SearchNotFound({this.notFound = NO_ISSUES_FOUND});
}

class SearchClosed {}

class SortBy {
  final String field;

  SortBy({this.field});
}
