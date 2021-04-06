import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
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
        color: GetCryptoColors.primary,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'getCrypto',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.filter_list_rounded),
                          iconSize: 38,
                          color: Colors.white,
                          onPressed: () {},
                          enableFeedback: false,
                          splashRadius: 0.1,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: GetCryptoColors.secundary),
                ],
              ),
              Expanded(
                child: Observer(
                  builder: (_) {
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
    );
  }
}
