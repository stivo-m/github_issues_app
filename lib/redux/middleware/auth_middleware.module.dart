import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/state/app_state.dart';
import 'package:github_issues_app/services/authentication/auth_service.dart';
import 'package:github_issues_app/services/navigator_service.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

Middleware<AppState> loginUser() {
  return (Store store, action, NextDispatcher next) async {
    print("working..");
    AuthService.initDeepLinkListener().then((auth.User user) {
      store.dispatch(UserLoginSuccess(User.fromFirebase(user)));
    }).catchError(
      (e) => store.dispatch(UserLoginError()),
    );
    next(action);
  };
}

Middleware<AppState> checkAuth() {
  return (Store store, action, NextDispatcher next) async {
    next(action);
  };
}

Middleware<AppState> logOutUser() {
  return (Store store, action, NextDispatcher next) async {
    await authService.userLogOut();
    store.dispatch(UserLogoutSuccess());
    navigatorService.popAndNavigateTo(SPLASH_SCREEN_ROUTE);

    next(action);
  };
}
