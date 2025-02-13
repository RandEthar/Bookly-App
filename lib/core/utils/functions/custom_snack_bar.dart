


import 'package:flutter/material.dart';

void showSnakcBar(context, String text) {
    ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}