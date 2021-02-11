import 'package:github_issues_app/constants/strings.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/state/user_state.dart';
import 'package:github_issues_app/constants/secret_keys.dart' as SecretKey;
import 'package:url_launcher/url_launcher.dart';

UserState userReducer(UserState state, action) {
  if (action is UserCheckAuth) {
    return state.copyWith(user: state.user, isLoading: true);
  }

  if (action is UserLoginAction) {
    userLogin();
    return state.copyWith(user: state.user, isLoading: true);
  }

  if (action is UserLoginSuccess) {
    return state.copyWith(
      user: action.user,
      isLoading: false,
    );
  }

  if (action is UserLogoutAction) {
    return state.copyWith(
      user: null,
      isLoading: false,
    );
  }

  return state;
}

Future userLogin() async {
  if (await canLaunch(SecretKey.AUTH_URL)) {
    await launch(
      SecretKey.AUTH_URL,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    print(URL_NOT_FOUND);
  }
}
