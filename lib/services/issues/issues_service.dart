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

  Future<List<Issue>> getIssues() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Link link = DioLink(
      API_ENDPOINT,
      client: client,
      defaultHeaders: {
        'authorization': _prefs.getString(TOKEN_TEXT),
      },
    );

    final res = await link
        .request(Request(
          operation: Operation(document: gqlLang.parseString(query)),
        ))
        .first;

    print(res.data);

    return [];
  }
}

IssuesService issuesService = IssuesService();
