import 'dart:convert';

class Histograma_CRE {
  final List<Cre> histogram;

  const Histograma_CRE({
    required this.histogram
  });

  factory Histograma_CRE.fromJson(String str) =>
      Histograma_CRE.fromMap(json.decode(str));

  factory Histograma_CRE.fromMap(Map<String, dynamic> json) {
    return Histograma_CRE(
      histogram: List<Cre>.from(
          json["histogram"].map((x) => Cre.fromMap(x))),
    );
  }


}

class Cre {
  final double? cre;

  Cre({this.cre});

  factory Cre.fromJson(String str) =>
      Cre.fromMap(json.decode(str));

  factory Cre.fromMap(Map<String, dynamic> json) {
    return Cre(
      cre: json["cre"],
    );
  }

}