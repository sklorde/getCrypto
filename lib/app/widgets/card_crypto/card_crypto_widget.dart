import 'package:flutter/material.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';

class CardCryptoWidget extends StatelessWidget {
  final Crypto crypto;

  const CardCryptoWidget({Key key, this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Color.fromRGBO(41, 55, 76, 1).withOpacity(0.42),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Image.network(
                'https://static.coincap.io/assets/icons/${crypto.symbol.toLowerCase()}@2x.png'),
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
                  '\$ ${crypto.metrics.marketData.priceUsd.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    letterSpacing: 0.3,
                  ),
                ),
                Text(
                  '${crypto.metrics.marketData.percentChangeUsdLast24Hours.toStringAsFixed(2).replaceAll('.', ',')}%',
                  style: TextStyle(
                    color: Color.fromRGBO(31, 148, 111, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
