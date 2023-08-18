import 'package:flutter/material.dart';
import 'package:weather_here/ui/common/widgets/show_hide_pass.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Вход",
                style: TextStyle(fontSize: 28, fontFamily: 'Ubuntu'),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Введите данные для входа",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    color: Color(0xff8799a5)),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFE4E6EC), width: 1.0),
                    ),
                    // enabledBorder: UnderlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Color(0xFFE4E6EC), width: 1.0),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF0700FF), width: 2.0),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Color(0xFF8799A5),
                      fontFamily: 'Roboto',
                      fontSize: 17,
                    )),
                keyboardType: TextInputType.emailAddress,
                //style: const TextStyle(color: Colors.blue),
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              const ShowHidePass(),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  // if (widget.formKey.currentState!.validate()) {
                  //   dataState.login();
                  // }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(500, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: const Color(0xFF0700FF),
                    foregroundColor: const Color.fromARGB(255, 0, 204, 255)),
                child: const Text(
                  "Войти",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
