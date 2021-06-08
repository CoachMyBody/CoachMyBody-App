class UserInfo {
  String email;
  String loginType;
  String nickname;
  String socialId;

  UserInfo(this.email, this.loginType, this.nickname, this.socialId);

  UserInfo.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String,
        loginType = json['loginType'] as String,
        nickname = json['nickname'] as String,
        socialId = json['socialId'] as String;

  Map<String, dynamic> toJson() => {
        'email': email,
        'loginType': loginType,
        'nickname': nickname,
        'socialId': socialId
      };
}

class CMBTokenInfo {
  String accessToken;
  String refreshToken;
  String expiredAt;

  CMBTokenInfo(this.accessToken, this.refreshToken, this.expiredAt);

  CMBTokenInfo.fromJson(Map<String, dynamic> json)
      : accessToken = json['accessToken'] as String,
        refreshToken = json['refreshToken'] as String,
        expiredAt = json['expiredAt'] as String;

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'expiredAt': expiredAt,
  };
}
