import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({Key? key, required this.setPassword, required this.hintText}) : super(key: key);

  final void Function(String) setPassword;
  final String hintText;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: TextField(
        obscureText: _isObscurePassword,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscurePassword = !_isObscurePassword;
                });
              },
              icon: Icon(
                  _isObscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.orangeAccent)),
        ),
        onChanged: (password) {
          widget.setPassword(password);
        },
      ),
    );
  }
}
