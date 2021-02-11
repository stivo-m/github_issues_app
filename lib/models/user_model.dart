import 'package:flutter/material.dart';

class User {
  final String name, email, photoUrl;

  User({
    @required this.name,
    @required this.email,
    this.photoUrl,
  });

  User.fromJson(Map<String, dynamic> json)
      : this.name = json["displayName"],
        this.email = json["email"],
        this.photoUrl = json["photoUrl"];
}
