import 'dart:async';
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

  Future<List<Crypto>> getCryptos() async {
    List<Crypto> list = <Crypto>[];

    list = await _getCrypto();

    return list;
  }

  Future<List<Crypto>> _getCrypto() async {
    String url =
        'https://data.messari.io/api/v2/assets?fields=symbol,name,metrics/market_data';
    List<Crypto> list = <Crypto>[];

    final result = await _client.get(url);

    result.data['data'].forEach((json) {
      list.add(Crypto.fromJson(json));
    });

    return list;
  }

  @override
  void dispose() {}
}
