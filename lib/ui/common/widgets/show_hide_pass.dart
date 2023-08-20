import 'package:flutter/material.dart';

class ShowHidePass extends StatefulWidget {
  TextEditingController passTec;

  ShowHidePass({super.key, required this.passTec});

  @override
  ShowHidePassState createState() => ShowHidePassState();
}

class ShowHidePassState extends State<ShowHidePass> {
  bool showFlag = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passTec,
      validator: (value) {
        if (value!.isEmpty) return "Введите пароль";
        return null;
      },
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                    showFlag = !showFlag;
                  }),
              icon: showFlag
                  ? Image.asset("assets/icons/eye.png")
                  : Image.asset("assets/icons/eye-off.png")),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE4E6EC), width: 1.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF0700FF), width: 2.0),
          ),
          labelText: "Пароль",
          labelStyle: const TextStyle(
            color: Color(0xFF8799A5),
            fontFamily: 'Roboto',
            fontSize: 17,
          )),
      keyboardType: TextInputType.text,
      //style: const TextStyle(color: Colors.blue),
      obscureText: showFlag,
      maxLines: 1,
      textAlign: TextAlign.left,
    );
  }
}
