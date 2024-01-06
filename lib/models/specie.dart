class Specie {
  final String specieName, kingdom;

  Specie.fromJson(Map<String, dynamic> json)
      : specieName = json['acceptedScientificName'],
        kingdom = json['kingdom'];
}
