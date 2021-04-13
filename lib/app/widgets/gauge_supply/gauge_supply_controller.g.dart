// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gauge_supply_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GaugeSupplyController = BindInject(
  (i) => GaugeSupplyController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GaugeSupplyController on _GaugeSupplyControllerBase, Store {
  final _$valueAtom = Atom(name: '_GaugeSupplyControllerBase.value');

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

  final _$_GaugeSupplyControllerBaseActionController =
      ActionController(name: '_GaugeSupplyControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_GaugeSupplyControllerBaseActionController
        .startAction(name: '_GaugeSupplyControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_GaugeSupplyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
