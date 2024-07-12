import 'package:flutter/material.dart';
import '../../main.dart';

class Constants {

  static const String baseURL = "https://dummyjson.com";
  static const String endPoint = "/products";
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
}
