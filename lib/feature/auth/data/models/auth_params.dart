class AuthParams {
  String? email;
  String? password;
  String? name;
  String? passwordConfirmation;
  String? verifyCode;
  AuthParams({
    this.email,
    this.password,
    this.name,
    this.passwordConfirmation,
    this.verifyCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data["name"] = name;
    if (email != null) data["email"] = email;
    if (password != null) data["password"] = password;
    if (passwordConfirmation != null)
      data["password_confirmation"] = passwordConfirmation;
    if (verifyCode != null) data["verify_code"] = verifyCode;
    return data;
  }
}
