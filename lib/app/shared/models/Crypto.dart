import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Crypto {
  final String symbol;
  final String name;
  final Double priceusd;

  Crypto({
    @required this.symbol,
    @required this.name,
    @required this.priceusd,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      symbol: json['userId'] as String,
      name: json['id'] as String,
      priceusd: json['price_usd'] as Double,
    );
  }
}
