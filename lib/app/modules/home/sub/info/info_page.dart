import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/widgets/gauge_supply/gauge_supply_widget.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
import 'package:getCrypto/app/widgets/card_crypto_info/card_crypto_info_widget.dart';
import 'info_controller.dart';

class InfoPage extends StatefulWidget {
  final String name;

  InfoPage(this.name);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends ModularState<InfoPage, InfoController> {
  int selected;

  @override
  initState() {
    controller.init(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetCryptoColors.primary,
      appBar: AppBar(
        backgroundColor: GetCryptoColors.primary,
        elevation: 0,
        title: Text(widget.name),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (context) {
                if (controller.cryptoHistory.length == 0) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: GaugeSupplyWidget(
                      controller.crypto,
                    ),
                  );
                }
              },
            ),
            Observer(
              builder: (context) {
                if (controller.crypto == null) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        CardCryptoInfoWidget(
                          title: 'Price',
                          value: controller.crypto.priceUsd,
                        ),
                        CardCryptoInfoWidget(
                          title: 'Supply',
                          value: controller.crypto.supply,
                        ),
                        CardCryptoInfoWidget(
                          title: 'Max Supply',
                          value: controller.crypto.maxSupply,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
