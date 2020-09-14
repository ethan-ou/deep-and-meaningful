import 'package:flutter/material.dart';

Route customRoute(Widget child) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child);
}
