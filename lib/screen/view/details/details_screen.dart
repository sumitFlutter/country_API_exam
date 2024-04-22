import 'package:first_exam_advanced/screen/model/country_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  CountryModel countryModel=CountryModel();
  @override
  Widget build(BuildContext context) {
    countryModel=ModalRoute.of(context)!.settings.arguments as CountryModel;
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text(countryModel.nameModel!.official!),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: "enter",
                child: Container(height: MediaQuery.sizeOf(context).height*0.30,
                child: Image.network(countryModel.flagModel!.png!,fit: BoxFit.cover,),),
              ),
              SizedBox(height: 20,),
              Text(countryModel!.nameModel!.official!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 10,),
              Text(countryModel!.nameModel!.common!,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
              SizedBox(height: 10,),
              countryModel!.independent!?const Text("Independent Country",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)): Text("Dependent Country",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              SizedBox(height: 10,),
              const Text("Continent:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              SizedBox(height: 10,),
              SizedBox(
                height: 70,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(countryModel!.continent![index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)),
                  );
                },itemCount: countryModel!.continent!.length,),
              ),
              const Text("Timezone:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              SizedBox(height: 10,),
              SizedBox(
                height: 70,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(countryModel!.timeZone![index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)),
                  );
                },itemCount: countryModel!.timeZone!.length,),
              ),
              SizedBox(height: 5,),
              Text("Member of United Nations?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              countryModel.unMember!?Text("Yes!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),):Text("No!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),),
              SizedBox(height: 15,),
              BottomAppBar(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                ],
              ),)
            ],
          ),
        ),
      ),
    ));
  }
}
