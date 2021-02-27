import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  hintText: 'Email',
  fillColor: Colors.purple[100],
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple[100], width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple[500], width: 2.0),
  ),
);
