import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/state/user_state.dart';
import 'package:github_issues_app/services/authentication/auth_service.dart';

UserState userReducer(UserState state, action) {
  if (action is UserCheckAuth) {
    UserState newState = state.copyWith(
        user: authService.user == null
            ? state.user
            : User.fromFirebase(authService.user),
        isLoading: false);
    return newState;
  }

  if (action is UserLoginAction) {
    return state.copyWith(user: state.user, isLoading: true);
  }

  if (action is UserLoginSuccess) {
    UserState newState = state.copyWith(
      user: action.user,
      isLoading: false,
    );
    return newState;
  }

  if (action is UserLogoutAction) {
    UserState newState = state.copyWith(
      user: state.user,
      isLoading: true,
    );
    return newState;
  }

  if (action is UserLogoutSuccess) {
    UserState newState = state.copyWith(
      user: null,
      isLoading: false,
    );
    return newState;
  }

  return state;
}
