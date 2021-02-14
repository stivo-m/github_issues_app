import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class User {
  final String name, email, photoUrl;

  User({
    @required this.name,
    @required this.email,
    this.photoUrl,
  });

  User.fromFirebase(auth.User user)
      : this.name = user.displayName ?? null,
        this.email = user.email ?? null,
        this.photoUrl = user.photoURL ?? null;
}
