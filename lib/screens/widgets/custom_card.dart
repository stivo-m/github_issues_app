import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/models/models.dart';
import 'package:time_ago_provider/time_ago_provider.dart' as time_ago;

class CustomCard extends StatelessWidget {
  final Issue issue;
  const CustomCard({
    Key key,
    @required this.issue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        DETAILS_SCREEN_ROUTE,
        arguments: issue,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        width: MediaQuery.of(context).size.width,
        height: 240.0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: issue.id.hashCode,
                  child: Text(
                    "#" + issue.id,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Chip(
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
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              issue.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Repo: " + issue.repo,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              issue.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey[500],
                      size: 16,
                    ),
                    Text(
                      issue.user,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.grey[500],
                      size: 16,
                    ),
                    Text(
                      time_ago.format(
                        DateTime.parse(issue.createdAt),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.grey[500],
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      issue.comments.length.toString() + " comments",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
