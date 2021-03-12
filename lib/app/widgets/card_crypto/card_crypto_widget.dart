import 'package:flutter/material.dart';

class CardCryptoWidget extends StatelessWidget {
  final String name;
  final String symbol;
  final double priceusd;

  const CardCryptoWidget({Key key, this.name, this.symbol, this.priceusd})
      : super(key: key);

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
            Image.asset(
              'lib/app/assets/images/cryptos/btc.png',
              height: 45,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Text(
                    symbol,
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
                  '\$ ${priceusd.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    letterSpacing: 0.3,
                  ),
                ),
                Text(
                  '+ 2.97%',
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
