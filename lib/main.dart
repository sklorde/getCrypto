import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getCrypto/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(ModularApp(module: AppModule()));
}
