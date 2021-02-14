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
    await init();
    final res = await _link
        .request(Request(
          operation: Operation(document: gqlLang.parseString(query)),
        ))
        .toList();

    List<Issue> issues = Issue.issuesListFromJson(res);
    //  Issue.fromJson(issue.data["viewer"]["issues"])
    final data = res.map((issue) => issue.data["viewer"]["issues"]["nodes"][0]);
    print(data);

    return issues;
  }
}

IssuesService issuesService = IssuesService();
