import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:github_issues_app/services/authentication/auth_service.dart';
import 'package:redux/redux.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static StreamSubscription _subs;

  void _initDeepLinkListener() async {
    _subs = getLinksStream().listen((String link) {
      checkDeepLink(link);
    }, cancelOnError: true);
  }

  void checkDeepLink(String link) async {
    if (link != null) {
      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      await authService.loginWithGitHub(code).then((firebaseUser) {
        if (firebaseUser.email != null) {
          Navigator.of(context).pushNamed(HOME_SCREEN_ROUTE);
        }
      }).catchError((e) {
        print("LOGIN ERROR: " + e.toString());
      });
    }
  }

  static void _disposeDeepLinkListener() {
    if (_subs != null) {
      _subs.cancel();
      _subs = null;
    }
  }

  @override
  void initState() {
    _initDeepLinkListener();
    super.initState();
  }

  @override
  void dispose() {
    _disposeDeepLinkListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel model) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/github.png',
                width: 300.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                SPLASH_SCREEN_TITLE,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),

              MaterialButton(
                color: Colors.grey[200],
                onPressed: model.gitHubLogin,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/github.png',
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        SIGN_IN_WITH_GITHUB_TEXT,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
