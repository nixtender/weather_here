import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_here/bloc/auth/auth_bloc.dart';
import 'package:weather_here/bloc/auth/auth_event.dart';
import 'package:weather_here/bloc/auth/auth_state.dart';
import 'package:weather_here/ui/common/widgets/show_hide_pass.dart';

class Authentication extends StatelessWidget {
  Authentication({Key? key}) : super(key: key);
  var emailTec = TextEditingController();
  var passTec = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (BuildContext context) => AuthBloc(AuthEmptyState()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: ((context, state) {
          if (state is AuthCheckingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthEmptyState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      "Вход",
                      style: TextStyle(fontSize: 28, fontFamily: 'Ubuntu'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Введите данные для входа",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          color: Color(0xff8799a5)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: emailTec,
                      validator: (value) {
                        if (value!.isEmpty) return "Введите email";
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFE4E6EC), width: 1.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF0700FF), width: 2.0),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Color(0xFF8799A5),
                            fontFamily: 'Roboto',
                            fontSize: 17,
                          )),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ShowHidePass(
                      passTec: passTec,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AuthBloc authBloc =
                              BlocProvider.of<AuthBloc>(context);
                          authBloc.add(AuthEnterEvent(
                              email: emailTec.text, password: passTec.text));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: const Color(0xFF0700FF),
                          foregroundColor:
                              const Color.fromARGB(255, 0, 204, 255)),
                      child: const Text(
                        "Войти",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is AuthCheckedState) {
            return const SizedBox(
              child: Text("Completed"),
            );
          }

          return const SizedBox();
        }),
      ),
    ));
  }
}
