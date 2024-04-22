import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/country_details_model.dart';
import '../../provider/country_details_provider.dart';

class DependentScreen extends StatefulWidget {
  const DependentScreen({super.key});

  @override
  State<DependentScreen> createState() => _DependentScreenState();
}

class _DependentScreenState extends State<DependentScreen> {
  List<CountryModel> dependent=[];
  CountryDetailProvider? r;
  CountryDetailProvider? w;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<context.read<CountryDetailProvider>().countryList.length;i++)
    {
      if(context.read<CountryDetailProvider>().countryList[i].independent==false)
      {
        dependent.add(context.read<CountryDetailProvider>().countryList[i]);
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
            Navigator.pushNamed(context, "details",arguments: dependent[index]);
          },
          child: Hero(
            tag: "enter",
            child: ListTile(
              title: Text(dependent[index].nameModel!.official!),
              subtitle: Text(dependent[index].nameModel!.common!),
              leading: CircleAvatar(radius: 30,
                backgroundImage: NetworkImage(dependent[index].flagModel!.png!),),
            //  trailing: CircleAvatar(radius: 30,
              //  backgroundImage: NetworkImage(dependent[index].coatOfArmsModel!.png!),),
            ),
          ),
        );
      },
        itemCount: dependent.length,),
    ):Center(child: CircularProgressIndicator(),);

  }
}
