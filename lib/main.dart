import 'package:first_exam_advanced/screen/provider/country_details_provider.dart';
import 'package:first_exam_advanced/utils/provider_declaration/app_provider_declaration.dart';
import 'package:first_exam_advanced/utils/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: appProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
      )
    ),
  );
}