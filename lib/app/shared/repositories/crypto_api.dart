import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';

class CryptoApiRepository extends Disposable {
  final DioForNative _client;

  CryptoApiRepository(this._client) {
    _init();
  }

  _init() async {
    _client.options.headers["x-messari-api-key"] =
        "9241f899-3d6c-4675-8f78-58b221454014";
  }

  int _offset = 0;
  int _limit = 1;

  Future<List<Crypto>> getCryptos() async {
    List<Crypto> list = <Crypto>[];

    for (int i = _offset; i < _limit + _offset; i++) {
      Crypto crypto;

      if (crypto == null) {
        crypto = await _getCrypto();
      }

      if (crypto != null) {
        list.add(crypto);
      }
    }

    return list;
  }

  Future<Crypto> _getCrypto() async {
    final result = await _client.get(
      'https://data.messari.io/api/v2/assets?fields=symbol,name,metrics/market_data/price_usd',
    );
    final crypto = Crypto.fromJson(result.data);

    return crypto;
  }

  @override
  void dispose() {}
}
