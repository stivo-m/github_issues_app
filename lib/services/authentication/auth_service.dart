import 'package:dio/dio.dart';
import 'package:github_issues_app/constants/secret_keys.dart' as SecretKey;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'dart:convert';
import 'package:github_issues_app/models/models.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final Dio _dio = Dio();

  Future<auth.User> loginWithGitHub(String code) async {
    //ACCESS TOKEN REQUEST
    final response = await _dio.post(
      SecretKey.ACCESS_TOKEN_LINK,
      data: jsonEncode(
        GitHubLoginRequest(
          clientId: SecretKey.GITHUB_CLIENT_ID,
          clientSecret: SecretKey.GITHUB_CLIENT_SECRET,
          code: code,
        ),
      ),
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      ),
    );

    GitHubLoginResponse loginResponse =
        GitHubLoginResponse.fromJson(response.data);
    //FIREBASE SIGNIN
    final auth.AuthCredential credential =
        auth.GithubAuthProvider.credential(loginResponse.accessToken);

    final auth.User user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    print("USER: " + user.displayName);
    return user;
  }
}

AuthService authService = AuthService();
