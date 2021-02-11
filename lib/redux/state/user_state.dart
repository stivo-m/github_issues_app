import 'package:flutter/widgets.dart';
import 'package:github_issues_app/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserState {
  final User user;
  final bool isLoading;

  UserState({
    @required this.user,
    this.isLoading = false,
  });

  UserState.initialState(this.isLoading)
      : user = auth.FirebaseAuth.instance.currentUser != null
            ? User(
                email: auth.FirebaseAuth.instance.currentUser.email,
                name: auth.FirebaseAuth.instance.currentUser.displayName,
                photoUrl: auth.FirebaseAuth.instance.currentUser.photoURL,
              )
            : null;

  UserState copyWith({@required User user, isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
