// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_history_graph_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CoinHistoryGraphController = BindInject(
  (i) => CoinHistoryGraphController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoinHistoryGraphController on _CoinHistoryGraphControllerBase, Store {
  final _$valueAtom = Atom(name: '_CoinHistoryGraphControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_CoinHistoryGraphControllerBaseActionController =
      ActionController(name: '_CoinHistoryGraphControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CoinHistoryGraphControllerBaseActionController
        .startAction(name: '_CoinHistoryGraphControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CoinHistoryGraphControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
