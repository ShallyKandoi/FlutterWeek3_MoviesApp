class Trp {
  final List results;

  Trp({
    required this.results,
  });

  factory Trp.fromJson(Map<String, dynamic> json) {
    return Trp(results: json['results']);
  }
}
