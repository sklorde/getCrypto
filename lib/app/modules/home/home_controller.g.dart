// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$cryptosAtom = Atom(name: '_HomeControllerBase.cryptos');

  @override
  ObservableList<Crypto> get cryptos {
    _$cryptosAtom.reportRead();
    return super.cryptos;
  }

  @override
  set cryptos(ObservableList<Crypto> value) {
    _$cryptosAtom.reportWrite(value, super.cryptos, () {
      super.cryptos = value;
    });
  }

  final _$onRefreshAsyncAction = AsyncAction('_HomeControllerBase.onRefresh');

  @override
  Future onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  final _$onLoadAsyncAction = AsyncAction('_HomeControllerBase.onLoad');

  @override
  Future onLoad() {
    return _$onLoadAsyncAction.run(() => super.onLoad());
  }

  @override
  String toString() {
    return '''
cryptos: ${cryptos}
    ''';
  }
}
