// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_crypto_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CardCryptoController = BindInject(
  (i) => CardCryptoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardCryptoController on _CardCryptoControllerBase, Store {
  final _$valueAtom = Atom(name: '_CardCryptoControllerBase.value');

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

  final _$_CardCryptoControllerBaseActionController =
      ActionController(name: '_CardCryptoControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CardCryptoControllerBaseActionController
        .startAction(name: '_CardCryptoControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CardCryptoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
