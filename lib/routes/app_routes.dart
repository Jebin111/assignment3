import 'package:assignment2/main.dart';
import 'package:assignment2/presentation/questionnaire_screen/firstpage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String questionnaireScreen = '/questionnaire_screen';

  static Map<String, WidgetBuilder> routes = {
    questionnaireScreen: (context) => firstpage()
  };
}
