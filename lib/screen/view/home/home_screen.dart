import 'package:first_exam_advanced/screen/provider/country_details_provider.dart';
import 'package:first_exam_advanced/screen/view/sub_screen_of_country/dependent_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sub_screen_of_country/independent_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CountryDetailProvider>().getCountryListData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      length: 2,
      child: Scaffold(appBar: AppBar(
        title: Text("CountryDetails"),
        bottom: TabBar(
          labelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          indicatorColor: Colors.blue,
          tabs: [
          Tab(text: "Independent\nCountry",),
          Tab(text: "Dependent\nCountry",)
        ],),
      ),
      body: TabBarView(children: [
        IndependentScreen(),
        DependentScreen()
      ],),),
    ));
  }
}
