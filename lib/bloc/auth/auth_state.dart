abstract class AuthState {}

class AuthEmptyState extends AuthState {}

class AuthCheckingState extends AuthState {}

class AuthCheckedState extends AuthState {}

class AuthErrorState extends AuthState {}
