import 'package:first_exam_advanced/screen/model/country_details_model.dart';
import 'package:first_exam_advanced/utils/helpers/api_helper.dart';
import 'package:flutter/cupertino.dart';

class CountryDetailProvider with ChangeNotifier{
  List<CountryModel> countryList=[];
  APIHelper apiHelper=APIHelper();
  void getCountryListData()
  async {
    List<CountryModel> cList=[];
    cList=await apiHelper.getCountryData();
    countryList=cList;
  }
}