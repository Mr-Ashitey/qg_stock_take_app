class LoginModel {
  String phone;
  String code;

  LoginModel({
    required this.phone,
    required this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      phone: json['phone_param'],
      code: json['code_param'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone_param': phone,
      'code_param': code,
    };
  }
}
