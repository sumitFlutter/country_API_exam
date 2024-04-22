class CountryModel {
  NameModel? nameModel;
  bool? independent, unMember;
  String? status, region;
  List? capital = [],
      timeZone = [],
      continent = [];
  num? population;
  FlagModel? flagModel;
  CoatOfArmsModel? coatOfArmsModel;

  CountryModel({
    this.nameModel,
    this.independent,
    this.unMember,
    this.status,
    this.region,
    this.capital,
    this.timeZone,
    this.continent,
    this.flagModel,
    this.coatOfArmsModel
  ,this.population});

  factory CountryModel.mapToModel(Map m1)
  {
    //List c = m1["capital"];
    List t = m1["timezones"];
    List co = m1["continents"];
    return CountryModel(//capital: c,
        coatOfArmsModel: CoatOfArmsModel.mapToModel(m1["coatOfArms"]),
        continent: co,
        flagModel: FlagModel.mapToModel(m1["flags"]),
        independent: m1["independent"],
        nameModel: NameModel.mapToModel(m1["name"]),
        region
        :m1["region"],
        status
        :m1["status"],
        timeZone: t,
        unMember: m1["unMember"],
    population: m1["population"]);
  }
}

class NameModel {
  String? official, common;

  NameModel({this.official, this.common});

  factory NameModel.mapToModel(Map m1)
  {
    return NameModel(common: m1["common"], official: m1["official"]);
  }
}

class FlagModel {
  String? png;

  FlagModel({this.png});

  factory FlagModel.mapToModel(Map m1)
  {
    return FlagModel(png: m1["png"]);
  }
}

class CoatOfArmsModel {
  String? png;

  CoatOfArmsModel({this.png});

  factory CoatOfArmsModel.mapToModel(Map m1)
  {
    return CoatOfArmsModel(png: m1["png"]);
  }
}