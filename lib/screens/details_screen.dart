import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'package:github_issues_app/models/comments_model.dart';
import 'package:github_issues_app/models/issue_model.dart';
import 'package:time_ago_provider/time_ago_provider.dart' as time_ago;

class DetailsScreen extends StatelessWidget {
  final Issue issue;

  const DetailsScreen({
    Key key,
    @required this.issue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                "#" + issue.id,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                )
              ],
              expandedHeight: 110.0,
              collapsedHeight: 110.0,
              flexibleSpace: Container(
                height: 110.0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // bottom row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ISSUES_TEXT,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          issue.body,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          COMMENTS_TEXT,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: issue.comments.length,
                            itemBuilder: (context, index) {
                              Comment comment = issue.comments[index];
                              return ListTile(
                                leading: Icon(Icons.comment_rounded),
                                title: Text(comment.comment),
                                subtitle: Text(time_ago.format(
                                  DateTime.parse(comment.createdAt),
                                )),
                                trailing: Text(comment.user),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
