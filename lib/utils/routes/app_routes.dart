import 'package:first_exam_advanced/screen/view/details/details_screen.dart';
import 'package:first_exam_advanced/screen/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

Map <String,WidgetBuilder> appRoutes={
  "/":(context) => HomeScreen(),
  "details":(context) => DetailsScreen()
};