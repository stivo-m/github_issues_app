import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await (showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new TextButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    });
                  },
                  child: new Text('Yes'),
                ),
              ],
            ),
          ) as FutureOr<bool>?)) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Material(
        child: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(UserCheckAuth()),
          builder: (BuildContext context, Store<AppState> store) {
            return _buildBody(context, store);
          },
        ),
      ),
    );
  }

  _buildBody(BuildContext context, Store<AppState> store) {
    return Container(
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
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: store.state.userState!.isLoading
                ? CircularProgressIndicator()
                : MaterialButton(
                    color: Colors.grey[200],
                    onPressed: () => store.dispatch(UserLoginAction()),
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
          )
        ],
      ),
    );
  }
}
