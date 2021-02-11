import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_issues_app/models/user_model.dart' as AppUser;
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/services/authentication/auth_service.dart';
import 'package:redux/redux.dart';
import 'package:uni_links/uni_links.dart';

import '../app_state.dart';

List<Middleware<AppState>> appMiddleWare() {
  final logout = _logOutUser();
  final login = _loginUser();
  final user = _checkAuth();

  return [
    TypedMiddleware<AppState, UserLoginAction>(login),
    TypedMiddleware<AppState, UserLogoutAction>(logout),
    TypedMiddleware<AppState, UserCheckAuth>(user),
  ];
}

StreamSubscription _sub;
Middleware<AppState> _loginUser() {
  return (Store store, action, NextDispatcher next) async {
    _sub = getLinksStream().listen((String link) {
      checkDeepLink(link).then((user) {
        if (user != null) {
          AppUser.User currentUser = AppUser.User(
            email: user.email,
            name: user.displayName,
            photoUrl: user.photoURL,
          );
          store.dispatch(UserLoginSuccess(currentUser));
          _sub.cancel();
        }
      }).catchError(
        (e) => store.dispatch(
          UserLoginError(),
        ),
      );
    }, cancelOnError: true);
    next(action);
  };
}

Middleware<AppState> _checkAuth() {
  return (Store store, action, NextDispatcher next) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      AppUser.User currentUser = AppUser.User(
        email: auth.currentUser.email,
        name: auth.currentUser.displayName,
        photoUrl: auth.currentUser.photoURL,
      );
      store.dispatch(UserLoginSuccess(currentUser));
    }
    next(action);
  };
}

Middleware<AppState> _logOutUser() {
  return (Store store, action, NextDispatcher next) async {
    next(action);
  };
}

Future checkDeepLink(String link) async {
  var user;
  if (link != null) {
    String code = link.substring(link.indexOf(RegExp('code=')) + 5);
    await authService.loginWithGitHub(code).then((firebaseUser) {
      user = firebaseUser;
    }).catchError((e) {});
  }
  return user;
}
