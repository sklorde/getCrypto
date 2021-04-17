import 'package:flutter/material.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';
import 'package:getCrypto/app/utils/getcrypto_colors.dart';
import 'package:getCrypto/app/shared/models/CryptoHistory.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class GaugeSupplyWidget extends StatelessWidget {
  final List<CryptoHistory> cryptoHistory;
  final Crypto crypto;

  const GaugeSupplyWidget(this.cryptoHistory, this.crypto);

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(GetCryptoColors.secundary);
    color.add(Color.fromRGBO(54, 62, 82, 1));
    color.add(GetCryptoColors.primary);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.42,
          child: SfCartesianChart(
            plotAreaBorderColor: Colors.red,
            plotAreaBorderWidth: 0,
            enableAxisAnimation: true,
            primaryXAxis: DateTimeAxis(
              majorGridLines: MajorGridLines(width: 0),
              isVisible: false,
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              axisLine: AxisLine(width: 0),
              isVisible: false,
            ),
            series: <AreaSeries<CryptoHistory, DateTime>>[
              AreaSeries<CryptoHistory, DateTime>(
                dataSource: cryptoHistory,
                borderColor: Colors.white38,
                borderWidth: 1,
                markerSettings: MarkerSettings(
                  height: 10,
                  width: 10,
                  isVisible: true,
                ),
                gradient: LinearGradient(
                  colors: color,
                  stops: stops,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                xValueMapper: (CryptoHistory data, _) =>
                    DateTime.parse(data.date),
                yValueMapper: (CryptoHistory data, _) =>
                    num.parse(data.priceUsd),
              ),
            ],
            trackballBehavior: TrackballBehavior(
              enable: true,
              activationMode: ActivationMode.singleTap,
              tooltipSettings: InteractiveTooltip(
                format: 'point.x: point.y',
                borderWidth: 0,
                decimalPlaces: 2,
                canShowMarker: false,
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.42,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '\$ ${NumberFormat.compact().format(num.parse(crypto.priceUsd))}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$ ${NumberFormat.compact().format(num.parse(crypto.priceUsd) / 2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$ ${NumberFormat.compact().format(num.parse(crypto.priceUsd) / 4)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
