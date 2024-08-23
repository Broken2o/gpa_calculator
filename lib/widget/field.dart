import 'package:flutter/material.dart';
class Field extends StatelessWidget{
  final String labelText;
  final TextEditingController controller;
  Field({super.key , required this.controller, required this.labelText,});
  @override
  Widget build(BuildContext context)
  {
    return TextField(
      style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.w300 , fontFamily: 'anticSlab'),
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,

    controller: controller,
    decoration: InputDecoration(labelText: labelText),
    );
}}