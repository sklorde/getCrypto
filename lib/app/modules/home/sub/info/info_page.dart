import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  int getUnix(String time) {
    int result;
    int unixNow;

    unixNow = DateTime.now().millisecondsSinceEpoch;

    switch (time) {
      case '1h':
        result = unixNow - 3600000;
        break;
      case '24h':
        result = unixNow - 86400000;
        break;
      case '7d':
        result = unixNow - 604800000;
        break;
      case '30d':
        result = unixNow - 2592000000;
        break;
    }

    return result;
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
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
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
