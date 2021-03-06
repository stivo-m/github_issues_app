import "package:dio/dio.dart" as dio;
import 'package:github_issues_app/constants/constants.dart';
import 'package:gql/language.dart' as gqlLang;
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:gql_exec/gql_exec.dart';
import "package:gql_link/gql_link.dart";
import 'package:github_issues_app/models/models.dart';
import 'package:github_issues_app/graphql/issues_querry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IssuesService {
  dio.Dio client = dio.Dio();
  SharedPreferences _prefs;
  Link _link;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
    _link = DioLink(
      API_ENDPOINT,
      client: client,
      defaultHeaders: {
        API_AUTHORIZATION_TEXT: _prefs.getString(TOKEN_TEXT),
      },
    );
  }

  Future<List<Issue>> getIssues() async {
    List<Issue> issues = [];

    await init();
    try {
      final res = await _link
          .request(Request(
            operation: Operation(document: gqlLang.parseString(query)),
          ))
          .toList();
      res.forEach((d) {
        var data = d.data["viewer"]["issues"]["nodes"] as List;
        data.forEach((iss) {
          var comments = iss["comments"]["nodes"] as List;
          issues.add(Issue.fromJson(iss, comments));
        });
      });
    } catch (e) {}
    return issues;
  }
}

IssuesService issuesService = IssuesService();
