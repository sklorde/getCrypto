import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/widgets/card_crypto/card_crypto_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(11, 20, 37, 1),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 35),
          child: Column(
            children: [
              Expanded(child: Observer(builder: (_) {
                return SmartRefresher(
                  controller: controller.refreshController,
                  onLoading: controller.onLoad,
                  onRefresh: controller.onRefresh,
                  enablePullDown: false,
                  enablePullUp: false,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.cryptos.length,
                    itemBuilder: (context, index) {
                      final crypto = controller.cryptos[index];

                      return CardCryptoWidget(
                        crypto: crypto,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 15),
                      );
                    },
                  ),
                );
              })),
            ],
          ),
        ),
      ),
    );
  }
}
