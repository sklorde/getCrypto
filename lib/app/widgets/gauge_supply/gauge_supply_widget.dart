import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getCrypto/app/shared/models/CryptoHistory.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GaugeSupplyWidget extends StatelessWidget {
  final CryptoHistory cryptoHistory;

  const GaugeSupplyWidget(this.cryptoHistory);

  @override
  Widget build(BuildContext context) {
    // void initState() {
    //   _trackballBehavior = Track
    // }

    return Center(
      child: Container(
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
            // minimum: 1,
            // maximum: controller.cryptoHistory.priceUsd;
            // interval: 0.05;
            labelFormat: '${cryptoHistory.priceUsd}',
            axisLine: AxisLine(width: 0),
          ),
          // trackballBehavior: _trackballBehavior,
          series: LineSeries(
            dataSource: cryptoHistory.length,
            xValueMapper: (CryptoHistory, data, _) => data.date,
            yValueMapper: (CryptoHistory, data, _) => data.priceUsd,
          ),
        ),
      ),
    );
  }
}

// List<LineSeries<CryptoHistory, DateTime>> _getDefaultDateTimeSeries() {
//   return <LineSeries<CryptoHistory, DateTime>>[
//     LineSeries(
//       dataSource: cryptoHistory.length,
//       xValueMapper: (CryptoHistory, data, _) => data.date,
//       yValueMapper: (CryptoHistory, data, _) => data.priceUsd,
//     ),
//   ];
// }
