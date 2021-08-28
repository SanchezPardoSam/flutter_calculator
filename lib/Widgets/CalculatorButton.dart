import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CalcButton extends StatelessWidget {
  final String text;
  final int colorText;
  final int backgroundColor;
  final double textSize;
  final Function callBack;

  CalcButton(
    {required this.callBack,
    this.text="",
    this.backgroundColor = 0,     
    this.colorText = 0xFFFFFFFF,
    this.textSize = 28}    
  );
  @override
  Widget build(BuildContext context) {    
    
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 65,
        height: 65,
        child: new TextButton(
          onPressed: () {
            callBack(text);
          }, 
          child: new Text(text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize
              )
            ),
          ),    
          style: TextButton.styleFrom(   
            primary: Color(this.colorText),     
            backgroundColor: backgroundColor != null ? Color(backgroundColor) : null,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50)
            ),
            
          ),
        ),
      ),
    );
  }
}
