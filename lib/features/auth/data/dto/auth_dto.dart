//seperating domain layer from presentation layer
class LoginRequestDto {
  final String email;
  final String password;

  LoginRequestDto({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class SignupRequestDto {
  final String email;
  final String password;
  final String username;

  SignupRequestDto(
      {required this.email, required this.password, required this.username});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
    };
  }
}

class AuthResponseDto {
  final String token;
  final String message;

  AuthResponseDto({required this.token, required this.message});

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      token: json['token'],
      message: json['message'],
    );
  }
}
