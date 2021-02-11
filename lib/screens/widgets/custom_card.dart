import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/models/models.dart';

class CustomCard extends StatelessWidget {
  final Issue issue;

  const CustomCard({
    Key key,
    @required this.issue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, DETAILS_SCREEN_ROUTE),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  issue?.id,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Chip(
                  label: Text(
                    issue.closedAt,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: Colors.orange[800],
                )
              ],
            ),
            SizedBox(
              height: 10.0,
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
                      issue.closedAt,
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
                    Text(
                      issue.comments.length.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
