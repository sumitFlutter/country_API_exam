import 'package:first_exam_advanced/screen/model/country_details_model.dart';
import 'package:first_exam_advanced/screen/provider/country_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndependentScreen extends StatefulWidget {
  const IndependentScreen({super.key});

  @override
  State<IndependentScreen> createState() => _IndependentScreenState();
}

class _IndependentScreenState extends State<IndependentScreen> {
  List<CountryModel> independent=[];
  CountryDetailProvider? r;
  CountryDetailProvider? w;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<context.read<CountryDetailProvider>().countryList.length;i++)
      {
        if(context.read<CountryDetailProvider>().countryList[i].independent==true)
          {
            independent.add(context.read<CountryDetailProvider>().countryList[i]);
          }
      }
  }
  @override
  Widget build(BuildContext context) {
    r=context.read<CountryDetailProvider>();
    w=context.watch<CountryDetailProvider>();
    return w!.countryList.isNotEmpty?Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "details",arguments: independent[index]);
          },
          child: Hero(
            tag: "enter",
            child: ListTile(
              title: Text(independent[index].nameModel!.official!),
              subtitle: Text(independent[index].nameModel!.common!),
              leading: CircleAvatar(radius: 30,
              backgroundImage: NetworkImage(independent[index].flagModel!.png!),),
              //trailing: CircleAvatar(radius: 30,
               // backgroundImage: NetworkImage(independent[index].coatOfArmsModel!.png!),),
            ),
          ),
        );
      },
      itemCount: independent.length,),
    ):Center(child: CircularProgressIndicator(),);
  }
}
