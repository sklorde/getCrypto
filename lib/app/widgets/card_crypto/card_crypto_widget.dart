import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
import 'package:octo_image/octo_image.dart';

class CardCryptoWidget extends StatelessWidget {
  final Crypto crypto;

  const CardCryptoWidget({Key key, this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/info/${crypto.name}');
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Color.fromRGBO(41, 55, 76, 1).withOpacity(0.42),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                height: 64,
                width: 64,
                child: OctoImage(
                  image: CachedNetworkImageProvider(crypto.imageUrl),
                  progressIndicatorBuilder: (context, progress) =>
                      CircularProgressIndicator(
                    backgroundColor: GetCryptoColors.primary,
                  ),
                  errorBuilder: (context, error, stacktrace) =>
                      Image.asset('lib/app/assets/images/cryptos/coinBase.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crypto.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      crypto.symbol,
                      style: TextStyle(
                        color: Color.fromRGBO(143, 148, 155, 1),
                        fontSize: 17,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$ ${num.parse(crypto.priceUsd).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Text(
                    '${num.parse(crypto.changePercent24Hr).toStringAsFixed(2).replaceAll('.', ',')}%',
                    style: TextStyle(
                      color: crypto.changePercent24Hr.startsWith('-')
                          ? Colors.red
                          : Color.fromRGBO(31, 148, 111, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
