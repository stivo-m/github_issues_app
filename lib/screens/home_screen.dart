import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:redux/redux.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreBuilder<AppState>(
        onInit: (store) => store.dispatch(GetIssues()),
        builder: (BuildContext context, Store<AppState> store) => Material(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                automaticallyImplyLeading: false,
                title: Text(
                  APP_TITLE,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                centerTitle: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  )
                ],
                expandedHeight: 200.0,
                collapsedHeight: 200.0,
                flexibleSpace: Container(
                  height: 180.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // search widget
                      SearchWidget(),

                      SizedBox(
                        height: 20.0,
                      ),

                      // bottom row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(DATE_TEXT),
                          Text(FILTER_BY_TEXT),
                          Text(IOS_TEXT),
                          Text(ANDROID_TEXT),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (store.state.issues.length == 0) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 250.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              NO_ISSUES_FOUND,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return CustomCard(
                      issue: store.state.issues[index],
                    );
                  },
                  childCount: store.state.issues.length == 0
                      ? 1
                      : store.state.issues.length,
                ),
              ),

              // the circular progress notification is to be shown if the app is in loading state
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     },
              //     childCount: 1,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
