import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_here/bloc/auth/auth_event.dart';
import 'package:weather_here/bloc/auth/auth_state.dart';
import 'package:weather_here/ui/navigations/app_navigator.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState) {
    on<AuthEnterEvent>((event, emit) {
      emit(AuthCheckingState());
      emit(AuthCheckedState());
      AppNavigator.toWeather();
    });
  }
}
