class LoginResponse {
  final String userId;
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final String firstName;
  final String email;
  final bool isSelfTeacher;
  final String mobileNumber;
  final String userUniqueLoginToken;
  final Role role;

  const LoginResponse(
      {required this.userId,
      required this.accessToken,
      required this.refreshToken,
      required this.tokenType,
      required this.firstName,
      required this.email,
      required this.isSelfTeacher,
      required this.mobileNumber,
      required this.userUniqueLoginToken,
      required this.role});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        userId: json['user_id'],
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
        email: json['id'],
        firstName: json['first_name'],
        isSelfTeacher: json['isSelfTeacher'],
        mobileNumber: json['mobile_number'],
        tokenType: json['token_type'],
        userUniqueLoginToken: json['user_unique_login_token'],
        role: Role.fromJson(json["role"]));
  }
}

class Role {
  final String authority;

  const Role({required this.authority});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(authority: json['authority']);
  }

  // Map<String, dynamic> toJson() {
  //     final Map<String, dynamic> data = new Map<String, dynamic>();
  //     data["authority"] = this.authority;
  //     return data;
  // }
}
