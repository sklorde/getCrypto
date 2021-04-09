import 'package:getCrypto/app/shared/models/Crypto.dart';
import 'package:getCrypto/app/shared/models/CryptoHistory.dart';
import 'package:getCrypto/app/shared/repositories/crypto_api.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'info_controller.g.dart';

@Injectable()
class InfoController = _InfoControllerBase with _$InfoController;

abstract class _InfoControllerBase with Store {
  final cryptoApi = Modular.get<CryptoApiRepository>();
  final refreshController = RefreshController();

  Crypto crypto;

  @observable
  ObservableList<CryptoHistory> cryptoHistory =
      <CryptoHistory>[].asObservable();

  _InfoControllerBase() {
    // onRefresh();
  }

  @action
  onRefresh() async {
    final list = await cryptoApi.getCryptoHistory(crypto.name);
    cryptoHistory = list.asObservable();
    refreshController.refreshCompleted();
  }

  @action
  onLoad() async {
    final list = await cryptoApi.getCryptoHistory(crypto.name);
    cryptoHistory.addAll(list.asObservable());
    refreshController.loadComplete();
  }
}
