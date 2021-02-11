import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final List<Issue> issues;
  final Function() getAllIssues;
  final Function() gitHubLogin;
  final User user;

  ViewModel({
    this.issues,
    this.getAllIssues,
    this.user,
    this.gitHubLogin,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onGetIssues() {
      store.dispatch(GetIssues);
    }

    _onLoginWithGitHub() {
      store.dispatch(UserLoginAction());
    }

    return ViewModel(
      issues: store.state.issues,
      getAllIssues: _onGetIssues,
      gitHubLogin: _onLoginWithGitHub,
    );
  }
}
