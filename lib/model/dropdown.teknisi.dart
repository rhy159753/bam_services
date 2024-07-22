class Teknisi {
  final String id_tek;
  final String name;

  Teknisi({
    required this.id_tek,
    required this.name,
    });

  factory Teknisi.fromJson(Map<String, dynamic> json) {
    return Teknisi(
      id_tek: json['id_tek'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_tek': id_tek,
    'name': name,
  };

}
