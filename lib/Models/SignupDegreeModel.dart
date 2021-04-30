import 'package:flutter/cupertino.dart';

class DegreeDataModel {
  DegreeDataModel({
    this.data,
  });

  List<Datum> data;

  factory DegreeDataModel.fromMap(Map<String, dynamic> json) => DegreeDataModel(
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

  String  type;
  Variable variable;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    type: json["type"] == null ? null : json["type"],
    variable: json["variable"] == null ? null : Variable.fromMap(json["variable"]),
  );

  Map<String, dynamic> toMap() => {
    "type": type.toString() == "" ? "" : type.toString(),
    "variable": variable == null ? null : variable.toMap(),
  };
}

class Variable {
  Variable({
    this.institution,
    this.passingYear,
    this.batch,
    this.award,
  });

  String  institution;
  String passingYear;
  String batch;
  String  award;

  set setpassingYear(String item){
    this.passingYear = item;
  }

  String get getpassingYear{
    return passingYear;
  }

  factory Variable.fromMap(Map<String, dynamic> json) => Variable(
    institution: json["institution"] == null ? null : json["institution"],
    passingYear: json["passing_year"] == null ? null : json["passing_year"],
    batch: json["batch"] == null ? null : json["batch"],
    award: json["award"] == null ? null : json["award"],
  );

  Map<String, dynamic> toMap() => {
    "institution": institution.toString() == "" ? "" : institution.toString(),
    "passing_year": passingYear == null ? null : passingYear,
    "batch": batch.toString() == "" ? "" : batch.toString(),
    "award": award.toString() == "" ? "" : award.toString(),
  };
}
