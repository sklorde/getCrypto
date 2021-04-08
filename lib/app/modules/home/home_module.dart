import 'package:getCrypto/app/modules/sub/home/info/info_page.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter('/info', child: (_, args) => InfoPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
