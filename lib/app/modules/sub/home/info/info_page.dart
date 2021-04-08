import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
import 'info_controller.dart';

class InfoPage extends StatefulWidget {
  final Crypto crypto;

  const InfoPage({
    Key key,
    @required this.crypto,
  }) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends ModularState<InfoPage, InfoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetCryptoColors.primary,
      appBar: AppBar(
        backgroundColor: GetCryptoColors.primary,
        elevation: 0,
        title: Text(widget.crypto.name),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
