import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'info_controller.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends ModularState<InfoPage, InfoController> {
  int selected;

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
        title: Text('teste'),
      ),
      body: Column(
        children: <Widget>[
          ChipsChoice<int>.single(
            value: selected,
            onChanged: (val) {
              setState(
                () {
                  selected = val;
                },
              );
            },
            choiceItems: <C2Choice<int>>[
              C2Choice<int>(value: 1, label: '1h'),
              C2Choice<int>(value: 2, label: '24h'),
              C2Choice<int>(value: 3, label: '7d'),
              C2Choice<int>(value: 4, label: '30d'),
              C2Choice<int>(value: 5, label: 'All'),
            ],
          ),
          Observer(
            builder: (context) {
              return Expanded(
                child: SmartRefresher(
                  controller: controller.refreshController,
                  onLoading: controller.onLoad,
                  onRefresh: controller.onRefresh,
                  enablePullDown: false,
                  enablePullUp: false,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.cryptoHistory.length,
                    itemBuilder: (context, index) {
                      final crypto = controller.cryptoHistory[index];

                      return Container(
                        height: 50,
                        width: 50,
                        color: Colors.white,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(padding: EdgeInsets.only(top: 15));
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
