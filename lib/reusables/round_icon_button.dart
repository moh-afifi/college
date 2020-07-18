import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon,size: 20,color: Colors.white,),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 35.0,
        height: 35.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.blueAccent,
    );
  }
}