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