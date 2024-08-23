import 'package:flutter/material.dart';
class button_OK extends StatelessWidget {
  button_OK({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('OK',
        style:   TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300 ,
            color: Color(0xffFFFFFF),
            fontFamily: 'playball'
        ),
      ),
    );
  }
}
