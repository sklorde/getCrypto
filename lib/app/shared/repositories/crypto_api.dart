import 'dart:async';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';

class CryptoApiRepository extends Disposable {
  final DioForNative _client;

  CryptoApiRepository(this._client) {
    _init();
  }

  _init() async {}

  Future<List<Crypto>> getCryptos() async {
    List<Crypto> list = <Crypto>[];

    list = await _getCrypto();

    return list;
  }

  Future<List<Crypto>> _getCrypto() async {
    List<Crypto> list = <Crypto>[];

    final result = await _client.get('https://api.coincap.io/v2/assets');

    result.data['data'].forEach((json) {
      list.add(Crypto.fromJson(json));
    });

    return list;
  }

  @override
  void dispose() {}
}
