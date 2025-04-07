import 'package:flutter/material.dart';
import 'package:smart_home/routes/paths.dart';
import 'package:smart_home/src/screens/login_screen/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Paths.loginScreen: (context) => const LoginScreen(),
};
