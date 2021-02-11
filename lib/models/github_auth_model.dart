class GitHubLoginResponse {
  String accessToken;
  String tokenType;
  String scope;
  GitHubLoginResponse({this.accessToken, this.tokenType, this.scope});

  GitHubLoginResponse.fromJson(Map<String, dynamic> json)
      : this.accessToken = json["access_token"],
        this.tokenType = json["token_type"],
        this.scope = json["scope"];
}

class GitHubLoginRequest {
  String clientId;
  String clientSecret;
  String code;
  GitHubLoginRequest({this.clientId, this.clientSecret, this.code});
  dynamic toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "code": code,
      };
}
