import 'package:flutter/material.dart';

class CardTrendingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Color.fromRGBO(41, 55, 76, 1).withOpacity(0.42),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'lib/app/assets/images/cryptos/btc.png',
              height: 45,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'BTC',
                style: TextStyle(
                  color: Color.fromRGBO(143, 148, 155, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text(
                'Bitcoin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '\$51.4K',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                '+ 2.97%',
                style: TextStyle(
                  color: Color.fromRGBO(31, 148, 111, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
