class Register {
  String? name;
  String? email;
  String? numberPhone;
  String? password;
  String? passwordConfirmation;

  Register({
    required this.name,
    required this.email,
    required this.numberPhone,
    required this.password,
    required this.passwordConfirmation,
  });
  Register.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    numberPhone = json['handphone'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }
}
