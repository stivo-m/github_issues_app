import 'package:github_issues_app/models/user_model.dart';

class UserCheckAuth {}

class UserLoginAction {}

class UserLoginSuccess {
  final User user;
  UserLoginSuccess(this.user);
}

class UserLoginError {}

class UserLogoutAction {}
