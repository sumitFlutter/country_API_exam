import 'package:first_exam_advanced/screen/provider/country_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List <SingleChildWidget> appProvider=[
  ChangeNotifierProvider.value(value: CountryDetailProvider()),
];