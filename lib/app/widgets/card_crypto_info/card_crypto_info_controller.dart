import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'card_crypto_info_controller.g.dart';

@Injectable()
class CardCryptoInfoController = _CardCryptoInfoControllerBase
    with _$CardCryptoInfoController;

abstract class _CardCryptoInfoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
