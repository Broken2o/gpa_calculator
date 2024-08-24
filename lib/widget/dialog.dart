import 'package:flutter/material.dart';
import 'package:gpa_calculator/widget/button_ok.dart';

void dialog(BuildContext context, final String title , final String content,  ) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:  Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          fontFamily: 'caveat',
        ),
      ),
      content:  Text(content),
      actions: [ButtonOK()],
    ),
  );
}
