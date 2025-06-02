class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  RatingModel copyWith({double? rate, int? count}) =>
      RatingModel(rate: rate ?? this.rate, count: count ?? this.count);

  factory RatingModel.fromMap(Map<String, dynamic> json) =>
      RatingModel(rate: json["rate"]?.toDouble(), count: json["count"]);

  Map<String, dynamic> toMap() => {"rate": rate, "count": count};
}
