import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button_Container extends StatelessWidget {
  const Button_Container({super.key,required this.text , required this.onTap});
  final String text;
  final Function() onTap;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
              color: Color(0xffE83D67)
          ),
          width: double.infinity,

          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[

                Text( text,
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500 ,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ]
          )
      ),
    );}}