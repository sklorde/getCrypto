import 'package:flutter/material.dart';

class CardCryptoInfoWidget extends StatelessWidget {
  final String title;
  final String value;

  const CardCryptoInfoWidget({
    @required this.title,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Color.fromRGBO(41, 55, 76, 1).withOpacity(0.42),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Text(
                '${num.parse(value).toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
