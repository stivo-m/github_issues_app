import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final List<Issue> issues;
  final Function() getAllIssues;

  ViewModel({
    this.issues,
    this.getAllIssues,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onGetIssues() {
      store.dispatch(GetIssues);
    }

    return ViewModel(
      issues: store.state.issues,
      getAllIssues: _onGetIssues,
    );
  }
}
