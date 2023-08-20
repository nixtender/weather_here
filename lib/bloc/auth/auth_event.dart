abstract class AuthEvent {}

class AuthEnterEvent extends AuthEvent {
  String email;
  String password;

  AuthEnterEvent({required this.email, required this.password});
}

class AuthStartEvent extends AuthEvent {}
