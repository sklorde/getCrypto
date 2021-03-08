import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'card_trending_controller.g.dart';

@Injectable()
class CardTrendingController = _CardTrendingControllerBase
    with _$CardTrendingController;

abstract class _CardTrendingControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
