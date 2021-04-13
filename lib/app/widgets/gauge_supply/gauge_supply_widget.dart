import 'package:flutter/material.dart';
import 'package:getCrypto/app/shared/models/Crypto.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeSupplyWidget extends StatelessWidget {
  final Crypto crypto;

  const GaugeSupplyWidget(this.crypto);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SfRadialGauge(
          title: GaugeTitle(
            text: 'Supply x Max Supply',
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          enableLoadingAnimation: true,
          animationDuration: 2500,
          axes: <RadialAxis>[
            RadialAxis(
              showLastLabel: true,
              showFirstLabel: true,
              useRangeColorForAxis: true,
              interval: 1000000000000,
              minimum: 0,
              maximum: double.parse(crypto.maxSupply),
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: double.parse(crypto.maxSupply) / 4,
                    color: Colors.green,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: double.parse(crypto.maxSupply) / 4,
                    endValue: double.parse(crypto.maxSupply) / 2,
                    color: Colors.orange),
                GaugeRange(
                  startValue: double.parse(crypto.maxSupply) / 2,
                  endValue: double.parse(crypto.maxSupply),
                  color: Colors.red,
                )
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: double.parse(crypto.supply),
                  needleColor: Colors.white,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                    child: Text(
                      double.parse(crypto.supply).toStringAsFixed(0),
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.3,
                ),
              ],
              axisLabelStyle: GaugeTextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
