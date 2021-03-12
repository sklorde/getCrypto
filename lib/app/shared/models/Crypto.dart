import 'package:flutter/foundation.dart';

class Crypto {
  final String symbol;
  final String name;
  final double priceusd;

  Crypto({
    @required this.symbol,
    @required this.name,
    @required this.priceusd,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      symbol: json['symbol'],
      name: json['name'],
      priceusd: json['metrics']['market_data']['price_usd'],
    );
  }
}
