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

  Issue.fromJson(Map<String, dynamic> map, List<dynamic> commentsJson)
      : this.title = map['title'],
        this.body = map['body'],
        this.user = map['author']['login'],
        this.id = map['databaseId'].toString(),
        this.closedAt = map['closedAt'],
        this.createdAt = map['createdAt'],
        this.closed = map['closed'],
        this.comments = Comment.comments(commentsJson);
}
