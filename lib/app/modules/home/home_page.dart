import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
import 'package:getCrypto/app/widgets/card_crypto/card_crypto_widget.dart';
import 'package:getCrypto/app/widgets/search_bar/search_bar_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../utils/getcrypto_colors.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBarWidget(
        cryptos: controller.cryptos.toList(),
        body: Container(
          color: GetCryptoColors.primary,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 90, 20, 0),
            child: Column(
              children: [
                Expanded(
                  child: Observer(
                    builder: (_) {
                      return SmartRefresher(
                        controller: controller.refreshController,
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
                            return Padding(padding: EdgeInsets.only(top: 15));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
