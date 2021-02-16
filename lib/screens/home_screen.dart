import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/actions/issues_actions.dart';
import 'package:github_issues_app/redux/actions/search_actions.dart';
import 'package:github_issues_app/redux/actions/user_actions.dart';
import 'package:github_issues_app/redux/app_redux.dart';
import 'package:redux/redux.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: StoreBuilder<AppState>(
          onInit: (store) {
            store.dispatch(UserCheckAuth());
            store.dispatch(GetIssues());
          },
          builder: (BuildContext context, Store<AppState> store) =>
              CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: false,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    APP_TITLE,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                centerTitle: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        SETTINGS_SCREEN_ROUTE,
                      );
                    },
                  )
                ],
                expandedHeight: 200.0,
                collapsedHeight: 200.0,
                flexibleSpace: _flexibleSpace(store),
              ),
              SliverList(
                delegate: _sliverListDelegate(context, store),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flexibleSpace(Store<AppState> store) {
    return Container(
      height: 180.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // search widget
          SearchWidget(
            store: store,
          ),

          SizedBox(
            height: 20.0,
          ),

          // bottom row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                onChanged: (selected) {
                  store.dispatch(SortBy(field: selected));
                },
                value: "null",
                items: [
                  DropdownMenuItem(
                    value: "null",
                    onTap: () {},
                    child: Text("Filter by"),
                  ),
                  DropdownMenuItem(
                    value: ID,
                    child: Text(ID.toString()),
                  ),
                  DropdownMenuItem(
                    value: TITLE_ID,
                    child: Text(TITLE_ID.toString()),
                  ),
                  DropdownMenuItem(
                    value: DATE_ID,
                    child: Text(DATE_ID.toString()),
                  ),
                ],
              ),
              Text(IOS_TEXT),
              Text(ANDROID_TEXT),
            ],
          ),
        ],
      ),
    );
  }

  SliverChildBuilderDelegate _sliverListDelegate(
      BuildContext context, Store<AppState> store) {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        if (store.state.issuesState.loading) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 250.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        if (!store.state.issuesState.loading &&
            store.state.issuesState.issues.length == 0) {
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

        if (store.state.searchState.searching) {
          return SearchResultsWidget(
            foundIssues: store.state.searchState.issues,
          );
        }

        return CustomCard(
          issue: store.state.issuesState.issues[index],
        );
      },
      childCount: store.state.issuesState.issues.length == 0
          ? 1
          : store.state.issuesState.issues.length,
    );
  }
}
