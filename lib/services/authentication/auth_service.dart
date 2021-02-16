import 'dart:async';
import 'package:dio/dio.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/constants/secret_keys.dart' as SecretKey;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'dart:convert';
import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/services/navigation/navigator_service.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  static StreamSubscription _subs;
  final Dio _dio = Dio();

  auth.User get user => _firebaseAuth.currentUser;

  Stream<auth.User> get authChanges => _firebaseAuth.authStateChanges();

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

    // TODO: Save the access token from loginResponse.accessToken to _dio's shared preferences
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(TOKEN_TEXT, 'Bearer ${loginResponse.accessToken}');

    final auth.User user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    navigatorService.navigateTo(HOME_SCREEN_ROUTE);
    return user;
  }

  static void _userLogin() async {
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

  Future userLogOut() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove(TOKEN_TEXT);
    return await _firebaseAuth.signOut();
  }

  // deep link listener services
  static Future<auth.User> initDeepLinkListener() async {
    _userLogin();
    auth.User currentUser;
    _subs = getLinksStream().listen((String link) {
      _checkDeepLink(link).then((auth.User user) {
        currentUser = user;
      });
    }, cancelOnError: true);

    return currentUser;
  }

  static Future<auth.User> _checkDeepLink(String link) async {
    auth.User user;
    if (link != null) {
      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      await authService.loginWithGitHub(code).then((firebaseUser) {
        user = firebaseUser;
      }).catchError((e) {});
    }

    return user;
  }

  static void disposeDeepLinkListener() {
    if (_subs != null) {
      _subs.cancel();
      _subs = null;
    }
  }
}

AuthService authService = AuthService();
