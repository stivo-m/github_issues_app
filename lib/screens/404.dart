import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';

class NotFoundScreen extends StatefulWidget {
  @override
  _NotFoundScreenState createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Text(PAGE_NOT_FOUND),
        ),
      ),
    );
  }
}
