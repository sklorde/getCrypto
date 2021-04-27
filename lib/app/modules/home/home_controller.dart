import 'package:getCrypto/app/shared/models/Crypto.dart';
import 'package:getCrypto/app/shared/repositories/crypto_api.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final crytpApi = Modular.get<CryptoApiRepository>();
  final refreshController = RefreshController();

  @observable
  ObservableList<Crypto> cryptos = <Crypto>[].asObservable();

  _HomeControllerBase() {
    onRefresh();
  }

  @action
  onRefresh() async {
    final list = await crytpApi.getCryptos();
    cryptos = list.asObservable();
    refreshController.refreshCompleted();
  }

  @action
  onLoad() async {
    final list = await crytpApi.getCryptos();
    cryptos.addAll(list.asObservable());
    refreshController.loadComplete();
  }
}
