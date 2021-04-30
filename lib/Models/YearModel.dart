import 'package:flutter/cupertino.dart';

class YearModel {
  YearModel({
    this.data,
  });

  List<Datum> data;

  factory YearModel.fromMap(Map<String, dynamic> json) => YearModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.type,
    this.variable,
  });

  TextEditingController type;
  Variable variable;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    type: json["type"] == null ? null : json["type"],
    variable: json["variable"] == null ? null : Variable.fromMap(json["variable"]),
  );

  Map<String, dynamic> toMap() => {
    "type": type.text.toString() == "" ? "" : type.text.toString(),
    "variable": variable == null ? null : variable.toMap(),
  };
}

class Variable {
  Variable({
    this.SpecialityController,
    this.expYear,

  });

  TextEditingController SpecialityController;
  String expYear;


  set setExpYear(String item){
    this.expYear = item;
  }

  String get getExpYear{
    return expYear;
  }

  factory Variable.fromMap(Map<String, dynamic> json) => Variable(
    SpecialityController: json["speciality"] == null ? null : json["speciality"],
    expYear: json["exp_year"] == null ? null : json["exp_year"],

  );

  Map<String, dynamic> toMap() => {
    "speciality": SpecialityController.text.toString() == "" ? "" : SpecialityController.text.toString(),
    "exp_year": expYear == null ? null : expYear,

  };
}
