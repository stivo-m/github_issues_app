import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:redux/redux.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: StoreBuilder(
            onInit: (store) => store.dispatch(UserCheckAuth()),
            builder: (BuildContext context, Store<AppState> store) {
              return _buildBody(context, store);
            },
          ),
        ),
      ),
    );
  }

  _buildBody(BuildContext context, Store<AppState> store) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(store.state.userState.user.photoUrl ?? ""),
              backgroundColor: Colors.white,
              radius: 100.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              store.state.userState.user.name ?? "",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              store.state.userState.user.email ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              color: Colors.redAccent,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              onPressed: () => store.dispatch(UserLogoutAction()),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: store.state.userState.isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        SIGN_OUT_TEXT.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
