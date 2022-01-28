import 'dart:convert';

class Enem {
  final int menosQuatrocentos;
  final int quatrocentos_quinhentos;
  final int quinhentos_seiscentos;
  final int seiscentos_setecentos;
  final int setecentos_oitocentos;
  final int maisOitocentos;
  final int naoInformado;

  const Enem({
    required this.menosQuatrocentos,
    required this.quatrocentos_quinhentos,
    required this.quinhentos_seiscentos,
    required this.seiscentos_setecentos,
    required this.setecentos_oitocentos,
    required this.maisOitocentos,
    required this.naoInformado
  });

  factory Enem.fromJson(String str) =>
      Enem.fromMap(json.decode(str));

  factory Enem.fromMap(Map<String, dynamic> json) {
    return Enem(
      menosQuatrocentos: json["<400"],
      quatrocentos_quinhentos: json["400-500"],
      quinhentos_seiscentos: json["500-600"],
      seiscentos_setecentos: json["600-700"],
      setecentos_oitocentos: json["700-800"],
      maisOitocentos: json[">=800"],
      naoInformado: json["NaoInformado"],
    );
  }

}