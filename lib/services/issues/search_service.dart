import 'package:github_issues_app/constants/strings.dart';
import 'package:github_issues_app/models/models.dart';

class SearchService {
  Future<List<Issue>> searchIssue(List<Issue> issues, String searchTerm) async {
    List<Issue> foundIssues = [];

    // searching logic here
    for (int i = 0; i < issues.length; i++) {
      if (issues[i].title.toLowerCase().contains((searchTerm.toLowerCase())) ||
          issues[i].repo.toLowerCase().contains((searchTerm.toLowerCase())) ||
          issues[i].body.toLowerCase().contains((searchTerm.toLowerCase()))) {
        foundIssues.add(issues[i]);
      }
    }
    return foundIssues;
  }

  Future<List<Issue>> sortIssues(List<Issue> issues, String field) async {
    switch (field) {
      case TITLE_ID:
        return issues.sortBy((issue) => issue.title);
        break;
      case DATE_ID:
        return issues.sortBy((issue) => issue.createdAt);
        break;
      case ID:
        return issues.sortBy((issue) => issue.id);
        break;
      case REPO_ID:
        return issues.sortBy((issue) => issue.repo);
        break;

      default:
        return issues;
    }
  }
}

SearchService searchService = SearchService();
