const query = """
{
  viewer {
    issues(last: 100) {
      pageInfo {
        startCursor
        hasNextPage
        endCursor
        hasPreviousPage
      }
      totalCount
      nodes {
        databaseId
        closed
        closedAt
        createdAt
        author{
          login
        }
        labels (first: 100){
          nodes{
            id
            description
          }
        }
        title
        body
        comments(first: 100) {
          totalCount
          nodes {
            author {
              login
            }
            body
            createdAt
            id
            publishedAt
          }
        }
      }
    }
  }
}

""";
