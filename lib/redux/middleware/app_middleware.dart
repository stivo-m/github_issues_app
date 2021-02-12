import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/state/app_state.dart';
import 'package:redux/redux.dart';
import 'auth_middleware.module.dart';
import 'issues_middleware.module.dart';

List<Middleware<AppState>> appMiddleWare() {
  // auth middleware
  final logout = logOutUser();
  final login = loginUser();
  final user = checkAuth();

  // issues middleware
  final issues = getIssues();

  return [
    // auth middleware
    TypedMiddleware<AppState, UserLoginAction>(login),
    TypedMiddleware<AppState, UserLogoutAction>(logout),
    TypedMiddleware<AppState, UserCheckAuth>(user),

    // issues middleware
    TypedMiddleware<AppState, GetIssues>(issues),
  ];
}
