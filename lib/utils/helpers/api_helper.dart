import 'dart:convert';

import 'package:first_exam_advanced/screen/model/country_details_model.dart';
import 'package:http/http.dart'as http;
class APIHelper{
  Future<List<CountryModel>> getCountryData()
  async {
    var response=await http.get(Uri.parse("https://restcountries.com/v3.1/all?_gl=1*1cu7vp2*_ga*NTg3NjM1MTAzLjE3MDcyMDg5MzI.*_ga_ZCYG64C7PL*MTcxMzc3NDM4MC45LjEuMTcxMzc3NDk3Ny4wLjAuMA.."));
    if(response.statusCode==200)
      {
        List jsonList=jsonDecode(response.body);
        List<CountryModel>jsonModelList=jsonList.map((e) => CountryModel.mapToModel(e)).toList();
        return jsonModelList;
      }
    return [];
  }
}
