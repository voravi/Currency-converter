class CurrencyConvert {
  final double difference;
  final double rate;

  CurrencyConvert({
    required this.difference,
    required this.rate,
  });

  factory CurrencyConvert.fromMap({required Map<String, dynamic> json}) {
    return CurrencyConvert(
      difference: json["result"],
      rate: json["info"]["rate"],
    );
  }
}
