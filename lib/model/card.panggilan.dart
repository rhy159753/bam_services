class Panggilan {

  final String id_pgl;
  final String lok;
  final String tgl;
  final String stat;
  final String id_tek;

  Panggilan({
    required this.id_pgl,
    required this.lok,
    required this.tgl,
    required this.stat,
    required this.id_tek,
    });

  factory Panggilan.fromJson(Map<String, dynamic> json) {
    return Panggilan(
      id_pgl: json['id_pgl'],
      lok: json['lok'],
      tgl: json['tgl'],
      stat: json['stat'],
      id_tek: json['id_tek'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_pgl': id_pgl,
    'lok': lok,
    'tgl': tgl,
    'stat': stat,
    'id_tek': id_tek,
  };

}