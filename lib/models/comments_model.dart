import 'package:flutter/material.dart';

class Comment {
  final String createdAt, user;
  final Text comment;

  Comment({
    @required this.createdAt,
    @required this.user,
    @required this.comment,
  });

  Comment.fromJson(Map<String, dynamic> json)
      : this.createdAt = json['created_at'],
        this.comment = json['comment'],
        this.user = json['user'];
}
