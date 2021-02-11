import 'package:flutter/material.dart';
import 'comments_model.dart';

class Issue {
  final String title, body, user, link, id, closedAt;
  final List<Comment> comments;

  Issue({
    @required this.title,
    @required this.body,
    @required this.user,
    @required this.link,
    @required this.id,
    @required this.closedAt,
    this.comments,
  });

  Issue.fromJson(Map<String, dynamic> map)
      : this.title = map['title'],
        this.body = map['body'],
        this.user = map['user'],
        this.link = map['link'],
        this.id = map['id'],
        this.closedAt = map['created_at'],
        this.comments = map['comments'] as List ?? [];

  static List<Issue> issuesListFromJson(List<dynamic> json) {
    return json == null
        ? List<Issue>()
        : json.map((value) => Issue.fromJson(value)).toList();
  }
}
