import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'search by subject or doctor ..',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kTextCard1 =TextStyle(
    color: Colors.blueAccent,
    fontSize: 20,
    fontWeight: FontWeight.bold);

const kTextCard2 =TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold);