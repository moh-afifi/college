import 'package:flutter/material.dart';

class ReusableAdminCard extends StatelessWidget {
  ReusableAdminCard({this.label, this.onTap, this.color});
  final String label;
  final Function onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            width: 150,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
