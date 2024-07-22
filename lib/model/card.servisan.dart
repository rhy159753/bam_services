class Servisan {
  
  final String noserv;
  final String jebar;
  final String atn;
  final String wkt_dtg;
  final String stat;

  Servisan({
    required this.noserv,
    required this.jebar,
    required this.atn,
    required this.wkt_dtg,
    required this.stat,
    });

  factory Servisan.fromJson(Map<String, dynamic> json) {
    return Servisan(
      noserv: json['noserv'],
      jebar: json['jebar'],
      atn: json['atn'],
      wkt_dtg: json['wkt_dtg'],
      stat: json['stat'],
    );
  }

  Map<String, dynamic> toJson() => {
    'noserv': noserv,
    'jebar': jebar,
    'atn': atn,
    'wkt_dtg': wkt_dtg,
    'stat': stat,
  };

}