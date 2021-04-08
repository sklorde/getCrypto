import 'package:dio/native_imp.dart';
import 'package:getCrypto/app/modules/sub/home/info/info_controller.dart';
import 'package:getCrypto/app/shared/repositories/crypto_api.dart';
import 'widgets/card_crypto/card_crypto_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:getCrypto/app/app_widget.dart';
import 'package:getCrypto/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CryptoApiRepository(DioForNative())),
        Bind((i) => AppController()),
        Bind((i) => CardCryptoController),
        Bind((i) => InfoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: HomeModule()),
        ModularRouter('/info', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
