import 'package:github_issues_app/models/models.dart';

class SearchService {
  Future<List<Issue>> searchIssue(List<Issue> issues, String searchTerm) async {
    List<Issue> foundIssues = [];

    // searching logic here
    for (int i = 0; i < issues.length; i++) {
      if (issues[i].title.toLowerCase().contains((searchTerm.toLowerCase()))) {
        foundIssues.add(issues[i]);
      }
    }
    return foundIssues;
  }
}

SearchService searchService = SearchService();
