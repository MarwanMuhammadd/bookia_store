class AuthParams {
  String? email;
  String? password;
  String? name;
  String? passwordConfirmation;
  AuthParams({this.email, this.password, this.name, this.passwordConfirmation});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
  }
}
