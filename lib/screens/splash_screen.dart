import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoreBuilder<AppState>(
        onInit: (store) => store.dispatch(UserCheckAuth()),
        builder: (BuildContext context, Store<AppState> store) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                GITHUB_IMAGE,
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
              store.state.userState.isLoading
                  ? CircularProgressIndicator()
                  : MaterialButton(
                      color: Colors.grey[200],
                      onPressed: store.dispatch(UserLoginAction()),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              GITHUB_IMAGE,
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
              store.state.userState.isLoading &&
                      store.state.userState.user != null
                  ? MaterialButton(
                      color: Colors.purple,
                      onPressed: () {
                        Navigator.pushNamed(context, HOME_SCREEN_ROUTE);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          CONTINUE_TEXT,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
