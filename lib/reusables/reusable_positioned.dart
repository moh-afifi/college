import 'package:flutter/material.dart';


class ReusablePositioned extends StatelessWidget {
  ReusablePositioned({this.text,this.bottom,this.left,this.onTap});
  final String text;
  final double bottom,left;
final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70,
          width: 100,
          color: Color(0xFFD1D6E1),
          child: Center(child: Text(text,style: TextStyle(fontSize: 15,color: Colors.blue[900]),)),
        ),
      ),
      bottom: bottom,
      left: left,
    );
  }
}
