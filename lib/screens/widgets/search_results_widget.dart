import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/models/issue_model.dart';

class SearchResultsWidget extends StatelessWidget {
  final List<Issue> foundIssues;

  const SearchResultsWidget({
    Key key,
    this.foundIssues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      child: ListView.builder(
        itemCount: foundIssues.length,
        itemBuilder: (context, index) {
          Issue issue = foundIssues[index];

          if (foundIssues.length == 0) {
            return Center(
              child: Text(NO_ISSUES_FOUND),
            );
          }

          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Material(
              elevation: 4,
              child: ListTile(
                onTap: () => Navigator.of(context).pushNamed(
                  DETAILS_SCREEN_ROUTE,
                  arguments: issue,
                ),
                leading: Chip(
                  label: Text(
                    issue.closed
                        ? CLOSED_TEXT.toUpperCase()
                        : OPEN_TEXT.toUpperCase(),
                    style: TextStyle(
                      color: issue.closed ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: issue.closed
                      ? Colors.greenAccent[400]
                      : Colors.orange[800],
                ),
                title: Text(issue.title),
                subtitle: Text(
                  issue.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
