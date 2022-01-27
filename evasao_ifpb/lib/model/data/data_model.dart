import 'dart:convert';

import 'package:evasao_ifpb/model/data/cre_model.dart';

class DataModel {
  final CreModel cre;

  const DataModel({
    required this.cre,
  });

  factory DataModel.fromJson(String str) =>
      DataModel.fromMap(json.decode(str));

  factory DataModel.fromMap(Map<String, dynamic> json) {
    return DataModel(
      cre: CreModel.fromMap(json["cre"]),
    );
  }

}