class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  RatingModel copyWith({double? rate, int? count}) =>
      RatingModel(rate: rate ?? this.rate, count: count ?? this.count);

  factory RatingModel.fromMap(Map<String, dynamic> json) =>
      RatingModel(
        rate: (json["rate"] is int)
            ? (json["rate"] as int).toDouble()
            : (json["rate"] as num).toDouble(),
        count: (json["count"] as num).toInt(),
      );

  Map<String, dynamic> toMap() => {"rate": rate, "count": count};
}
