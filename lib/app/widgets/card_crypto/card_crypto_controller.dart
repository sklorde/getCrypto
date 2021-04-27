import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'card_crypto_controller.g.dart';

@Injectable()
class CardCryptoController = _CardCryptoControllerBase
    with _$CardCryptoController;

abstract class _CardCryptoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
