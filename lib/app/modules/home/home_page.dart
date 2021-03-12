import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/widgets/card_crypto/card_crypto_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:getCrypto/app/widgets/card_trending/card_trending_widget.dart';
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
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending Cryptos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.3,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: Color.fromRGBO(31, 148, 111, 1),
                        fontSize: 16,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                color: Colors.transparent,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardTrendingWidget();
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22, bottom: 10),
                child: Text(
                  'Other Cryptos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
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
                      return CardCryptoWidget(
                        name: controller.cryptos[index].name,
                        symbol: controller.cryptos[index].symbol,
                        priceusd: controller.cryptos[index].priceusd,
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
