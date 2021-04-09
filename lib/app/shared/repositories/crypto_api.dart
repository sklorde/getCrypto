import 'dart:async';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';
import 'package:getCrypto/app/shared/models/CryptoHistory.dart';
import 'package:getCrypto/app/utils/string_extension.dart';

class CryptoApiRepository extends Disposable {
  final DioForNative _client;

  CryptoApiRepository(this._client) {
    _init();
  }

  _init() async {}

  Future<List<CryptoHistory>> getCryptoHistory(String cryptoName) async {
    List<CryptoHistory> list = <CryptoHistory>[];

    String url =
        'https://api.coincap.io/v2/assets/${cryptoName.toURL()}/history?interval=d1';

    final result = await _client.get(url);

    result.data['data'].forEach(
      (json) {
        CryptoHistory cryptoHistory = CryptoHistory.fromJson(json);
        list.add(cryptoHistory);
      },
    );

    return list;
  }

  Future<List<Crypto>> getCryptos() async {
    List<Crypto> list = <Crypto>[];

    list = await _getCrypto();

    return list;
  }

  Future<List<Crypto>> _getCrypto() async {
    List<Crypto> list = <Crypto>[];

    final result = await _client.get('https://api.coincap.io/v2/assets');

    result.data['data'].forEach(
      (json) {
        Crypto crypto = Crypto.fromJson(json);
        crypto.imageUrl =
            'https://static.coincap.io/assets/icons/${crypto.symbol.toLowerCase()}@2x.png';
        list.add(crypto);
      },
    );

    return list;
  }

  @override
  void dispose() {}
}
