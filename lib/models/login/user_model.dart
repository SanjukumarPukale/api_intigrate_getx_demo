class UserModel {
  String? accessToken;
  int? expiresIn;
  int? refreshExpiresIn;
  String? refreshToken;
  String? tokenType;
  int? notBeforePolicy;
  String? sessionState;
  String? scope;

  UserModel(
      {this.accessToken,
      this.expiresIn,
      this.refreshExpiresIn,
      this.refreshToken,
      this.tokenType,
      this.notBeforePolicy,
      this.sessionState,
      this.scope});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    refreshExpiresIn = json['refresh_expires_in'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    notBeforePolicy = json['not-before-policy'];
    sessionState = json['session_state'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['refresh_expires_in'] = this.refreshExpiresIn;
    data['refresh_token'] = this.refreshToken;
    data['token_type'] = this.tokenType;
    data['not-before-policy'] = this.notBeforePolicy;
    data['session_state'] = this.sessionState;
    data['scope'] = this.scope;
    return data;
  }
}