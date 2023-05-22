
class RatingData {
  num rate;
  int count;

  RatingData({
    required this.rate,
    required this.count,
  });

  factory RatingData.fromJson(Map<String, dynamic> json) {
    return RatingData(
      rate: json["rate"],
      count: json["count"] ?? 0,
    );
  }
}
