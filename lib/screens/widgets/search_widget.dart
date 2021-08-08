import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/models/issue_model.dart';
import 'package:github_issues_app/redux/actions/search_actions.dart';
import 'package:github_issues_app/redux/state/app_state.dart';
import 'package:redux/redux.dart';

class SearchWidget extends SearchDelegate {
  final Store<AppState> store;
  SearchWidget({
    required this.store,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          store.dispatch(SearchClosed([]));
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
        store.dispatch(SearchClosed([]));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    store.dispatch(SearchTerm(term: query));

    if (store.state.searchState!.issues.length == 0) {
      return Center(
        child: Text(NO_ISSUES_FOUND),
      );
    }

    return _searchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Widget _searchResults() {
    return ListView.builder(
      itemCount: store.state.searchState!.issues.length,
      itemBuilder: (context, index) {
        Issue issue = store.state.searchState!.issues[index];
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Material(
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              onTap: () => Navigator.of(context).pushNamed(
                DETAILS_SCREEN_ROUTE,
                arguments: issue,
              ),
              leading: Chip(
                label: Text(
                  issue.closed!
                      ? CLOSED_TEXT.toUpperCase()
                      : OPEN_TEXT.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                backgroundColor: issue.closed!
                    ? Colors.greenAccent[400]
                    : Colors.orange[800],
              ),
              title: Text(issue.title!),
              subtitle: Text(
                issue.body!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
