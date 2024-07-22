class Panggilan {
  final String id_pgl;
  final String lok;
  final String kel;
  final String ket;
  final String wkt_pgl;
  final String wkt_done;
  final String stat;
  final String id_tek;

  Panggilan({
    required this.id_pgl,
    required this.lok,
    required this.kel,
    required this.ket,
    required this.wkt_pgl,
    required this.wkt_done,
    required this.stat,
    required this.id_tek,
  });

  factory Panggilan.fromJson(Map<String, dynamic> json) {
    return Panggilan(
      id_pgl: json['id_pgl'],
      lok: json['lok'],
      kel: json['kel'],
      ket: json['ket'],
      wkt_pgl: json['tgl_pgl'],
      wkt_done: json['tgl_selesai'],
      stat: json['stat'],
      id_tek: json['id_tek'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_pgl': id_pgl,
        'lok': lok,
        'kel': kel,
        'ket': ket,
        'wkt_pgl': wkt_pgl,
        'wkt_done': wkt_done,
        'stat': stat,
        'id_tek': id_tek,
      };
}
