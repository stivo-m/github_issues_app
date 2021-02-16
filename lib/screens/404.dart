import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';

class NotFoundScreen extends StatelessWidget {
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
