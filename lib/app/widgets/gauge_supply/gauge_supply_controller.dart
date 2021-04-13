import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'gauge_supply_controller.g.dart';

@Injectable()
class GaugeSupplyController = _GaugeSupplyControllerBase
    with _$GaugeSupplyController;

abstract class _GaugeSupplyControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
