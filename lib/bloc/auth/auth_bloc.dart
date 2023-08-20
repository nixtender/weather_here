import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_here/bloc/auth/auth_event.dart';
import 'package:weather_here/bloc/auth/auth_state.dart';
import 'package:weather_here/ui/navigations/app_navigator.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState) {
    on<AuthEnterEvent>((event, emit) async {
      emit(AuthCheckingState());
      try {
        var cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        if (cred.user != null) {
          emit(AuthCheckedState());
          AppNavigator.toWeather();
        }
        emit(AuthErrorState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Fluttertoast.showToast(
              msg: "Пользователь с таким Email не найден",
              gravity: ToastGravity.BOTTOM);
          emit(AuthEmptyState());
        }
        if (e.code == 'wrong-password') {
          Fluttertoast.showToast(
              msg: "Неверный пароль", gravity: ToastGravity.BOTTOM);
          emit(AuthEmptyState());
        }
        if (e.code == 'invalid-email') {
          Fluttertoast.showToast(
              msg: "Неверно введён Email", gravity: ToastGravity.BOTTOM);
          emit(AuthEmptyState());
        }
        if (e.code == 'user-disabled') {
          Fluttertoast.showToast(
              msg: "Пользователь заблокирован", gravity: ToastGravity.BOTTOM);
          emit(AuthEmptyState());
        } else {
          Fluttertoast.showToast(
              msg: "Ошибка сети", gravity: ToastGravity.BOTTOM);
          emit(AuthEmptyState());
        }
      }
    });
  }
}


      // emit(AuthCheckingState());
      // try {
      //   await FirebaseAuth.instance
      //       .signInWithEmailAndPassword(
      //           email: event.email, password: event.password)
      //       .then((value) {
      //     emit(AuthCheckedState());
      //     AppNavigator.toWeather();
      //   }).catchError((error, stackTrace) {
      //     Fluttertoast.showToast(
      //         msg: "Пользователь с таким Email не найден",
      //         gravity: ToastGravity.BOTTOM);
      //     emit(AuthEmptyState());
      //   });
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'user-not-found') {
      //     emit(AuthErrorState());
      //     Fluttertoast.showToast(
      //         msg: "Пользователь с таким Email не найден",
      //         gravity: ToastGravity.BOTTOM);
      //     emit(AuthEmptyState());
      //   } else if (e.code == 'wrong-password') {
      //     Fluttertoast.showToast(
      //         msg: "Неверный пароль", gravity: ToastGravity.BOTTOM);
      //     emit(AuthEmptyState());
      //   } else {
      //     Fluttertoast.showToast(
      //         msg: "Пользователь с таким Email не найден",
      //         gravity: ToastGravity.BOTTOM);
      //     emit(AuthEmptyState());
      //   }
      // }
    