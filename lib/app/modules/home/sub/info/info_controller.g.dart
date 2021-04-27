// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $InfoController = BindInject(
  (i) => InfoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfoController on _InfoControllerBase, Store {
  final _$cryptoAtom = Atom(name: '_InfoControllerBase.crypto');

  @override
  Crypto get crypto {
    _$cryptoAtom.reportRead();
    return super.crypto;
  }

  @override
  set crypto(Crypto value) {
    _$cryptoAtom.reportWrite(value, super.crypto, () {
      super.crypto = value;
    });
  }

  final _$cryptoHistoryAtom = Atom(name: '_InfoControllerBase.cryptoHistory');

  @override
  ObservableList<CryptoHistory> get cryptoHistory {
    _$cryptoHistoryAtom.reportRead();
    return super.cryptoHistory;
  }

  @override
  set cryptoHistory(ObservableList<CryptoHistory> value) {
    _$cryptoHistoryAtom.reportWrite(value, super.cryptoHistory, () {
      super.cryptoHistory = value;
    });
  }

  final _$onRefreshAsyncAction = AsyncAction('_InfoControllerBase.onRefresh');

  @override
  Future onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  final _$onLoadAsyncAction = AsyncAction('_InfoControllerBase.onLoad');

  @override
  Future onLoad() {
    return _$onLoadAsyncAction.run(() => super.onLoad());
  }

  @override
  String toString() {
    return '''
crypto: ${crypto},
cryptoHistory: ${cryptoHistory}
    ''';
  }
}
