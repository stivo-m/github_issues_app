import 'package:flutter/material.dart';
import 'comments_model.dart';

class Issue {
  final String title, body, user, id, closedAt, createdAt;
  final List<Comment> comments;
  final bool closed;

  Issue({
    @required this.title,
    @required this.body,
    @required this.user,
    @required this.id,
    @required this.closedAt,
    @required this.createdAt,
    @required this.closed,
    this.comments,
  });

  Issue.fromJson(Map<String, dynamic> map)
      : this.title = map["nodes"][0]['title'],
        this.body = map["nodes"][0]['body'],
        this.user = map['nodes'][0]['author']['login'],
        this.id = map["nodes"][0]['databaseId'].toString(),
        this.closedAt = map['nodes'][0]['closedAt'],
        this.createdAt = map['nodes'][0]['createdAt'],
        this.closed = map['nodes'][0]['closed'],
        this.comments = map['comments'] as List ?? [];

  static List<Issue> issuesListFromJson(List<dynamic> json) {
    return json == null
        ? List<Issue>()
        : json
            .map((value) => Issue.fromJson(value.data["viewer"]["issues"]))
            .toList();
  }
}
