import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/redux/actions/search_actions.dart';
import 'package:github_issues_app/redux/state/app_state.dart';
import 'package:redux/redux.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final Store<AppState> store;

  SearchWidget({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _searchController.clear();
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: TextField(
        onChanged: (String val) {
          Future.delayed(
            Duration(seconds: 2),
            () => store.dispatch(
              SearchTerm(term: _searchController.text),
            ),
          );
        },
        controller: _searchController,
        autofocus: false,
        decoration: InputDecoration(
          hintText: SEARCH_TEXT,
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _searchController.clear();
              store.dispatch(SearchClosed());
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
