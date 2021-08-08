
class Comment {
  final String? createdAt, user;
  final String? comment;

  Comment({
    required this.createdAt,
    required this.user,
    required this.comment,
  });

  Comment.fromJson(json)
      : this.createdAt = json['publishedAt'],
        this.comment = json['body'],
        this.user = json['author']["login"];

  static List<Comment> comments(List<dynamic> comments) {
    List<Comment> cmnts = [];

    comments.forEach((c) {
      cmnts.add(Comment.fromJson(c));
    });

    return cmnts;
  }
}
