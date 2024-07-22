class Servisan {
  
  final String noserv;
  final String jebar;
  final String atn;
  final String acc;
  final String telp;
  final String wkt_dtg;
  final String wkt_updt;
  final String wkt_ambl;
  final String kel;
  final String ket;
  final String op_tek;
  final String rep_tek;
  final String stat;

  Servisan({
    required this.noserv,
    required this.jebar,
    required this.atn,
    required this.acc,
    required this.telp,
    required this.wkt_dtg,
    required this.wkt_updt,
    required this.wkt_ambl,
    required this.kel,
    required this.ket,
    required this.op_tek,
    required this.rep_tek,
    required this.stat,
    });

  factory Servisan.fromJson(Map<String, dynamic> json) {
    return Servisan(
      noserv: json['noserv'],
      jebar: json['jebar'],
      atn: json['atn'],
      acc: json['acc'],
      telp: json['telp'],
      wkt_dtg: json['wkt_dtg'],
      wkt_updt: json['wkt_updt'],
      wkt_ambl: json['wkt_ambl'],
      kel: json['kel'],
      ket: json['ket'],
      op_tek: json['op_tek'],
      rep_tek: json['rep_tek'],
      stat: json['stat'],
    );
  }

  Map<String, dynamic> toJson() => {
    'noserv': noserv,
    'jebar': jebar,
    'atn': atn,
    'ac': acc,
    'telp': telp,
    'wkt_dtg': wkt_dtg,
    'wkt_updt': wkt_updt,
    'wkt_ambl': wkt_ambl,
    'kel': kel,
    'ket': ket,
    'op_tek': op_tek,
    'rep_tek': rep_tek,
    'stat': stat,
  };

}