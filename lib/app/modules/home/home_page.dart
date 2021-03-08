import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:getCrypto/app/widgets/card_trending/card_trending_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(18, 27, 41, 1),
        child: ListView(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 35),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Cryptos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Color.fromRGBO(31, 148, 111, 1),
                      fontSize: 16,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 220,
              color: Colors.transparent,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CardTrendingWidget();
                },
                separatorBuilder: (context, index) {
                  return Padding(padding: EdgeInsets.only(left: 15));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
