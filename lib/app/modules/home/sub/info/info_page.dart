import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/widgets/coin_history_graph/coin_history_graph_widget.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
import 'info_controller.dart';

class InfoPage extends StatefulWidget {
  final String name;

  InfoPage(this.name);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends ModularState<InfoPage, InfoController> {
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
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 60),
            child: Text(widget.name),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (context) {
                if (controller.crypto == null) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          num.parse(controller.crypto.priceUsd)
                              .toStringAsFixed(2)
                              .replaceAll('.', ','),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        ),
                      ],
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
                  return Column(
                    children: [
                      CoinHistoryGraphWidget(
                        controller.cryptoHistory,
                        controller.crypto,
                      ),
                    ],
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
