import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/services/authentication/auth_service.dart';

class UserState {
  final User? user;
  final bool isLoading;

  UserState({
    required this.user,
    this.isLoading = false,
  });

  UserState.initialState(this.isLoading)
      : user = authService.user != null
            ? User.fromFirebase(authService.user!)
            : null;

  UserState copyWith({required User? user, isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
