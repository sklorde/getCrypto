import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'coin_history_graph_controller.g.dart';

@Injectable()
class CoinHistoryGraphController = _CoinHistoryGraphControllerBase
    with _$CoinHistoryGraphController;

abstract class _CoinHistoryGraphControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
