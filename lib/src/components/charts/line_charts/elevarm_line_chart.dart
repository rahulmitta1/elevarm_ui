import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// [ElevarmLineChart]'s spline types.
enum ElevarmLineChartSplineType {
  /// [SplineType.monotonic] spline type.
  monotonic,

  /// [SplineType.clamped] spline type.
  clamped,

  /// [SplineType.natural] spline type.
  natural,
}

/// [ElevarmLineChart]'s data series class.
class ElevarmLineChartDataSeries {
  /// The series' data points.
  final List<ElevarmLineChartData> dataPoints;

  /// The series' color.
  final Color color;

  /// The series' label.
  final String label;

  ElevarmLineChartDataSeries({
    required this.label,
    required this.dataPoints,
    required this.color,
  });
}

/// [ElevarmLineChart]'s data point class.
class ElevarmLineChartData {
  /// The data point's label.
  final String label;

  /// The data point's value.
  final int value;

  ElevarmLineChartData({
    required this.label,
    required this.value,
  });
}

/// Elevarm UI's line chart inside a card.
class ElevarmLineChart extends StatelessWidget {
  /// Chart's list of data.
  final List<ElevarmLineChartDataSeries> dataSource;

  /// Chart's spline type.
  final ElevarmLineChartSplineType splineType;

  const ElevarmLineChart({
    required this.dataSource,
    this.splineType = ElevarmLineChartSplineType.natural,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SfCartesianChart(
          margin: EdgeInsets.zero,
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(
              color: Colors.transparent,
            ),
            axisLine: const AxisLine(
              color: Colors.transparent,
            ),
            labelStyle: LibraryTextStyles.interXsRegularGrey600,
          ),
          plotAreaBorderColor: Colors.transparent,
          primaryYAxis: const CategoryAxis(
            maximumLabelWidth: 0.0,
            axisLine: AxisLine(
              color: Colors.transparent,
            ),
            majorTickLines: MajorTickLines(
              color: Colors.transparent,
            ),
            labelStyle: TextStyle(color: Colors.transparent),
            majorGridLines: MajorGridLines(
              width: 1.0,
              // ignore: deprecated_member_use_from_same_package
              color: ElevarmColors.grey100, // FIXME
            ),
          ),
          legend: const Legend(
            isVisible: false,
          ),
          tooltipBehavior: TooltipBehavior(
            color: const Color(0xFF2F2F2F), // FIXME: Not using ElevarmColors
            enable: true,
            builder: (data, point, series, pointIndex, seriesIndex) {
              final chartData = data as ElevarmLineChartData;
              final chartSeries =
                  series as SplineSeries<ElevarmLineChartData, String>;
              return FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFF2F2F2F,
                    ), // FIXME: Not using ElevarmColors
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 7.0),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: chartSeries.color,
                              ),
                              width: 10.0,
                              height: 10.0,
                            ),
                            const SizedBox(width: 7.0),
                            Text(
                              '${chartData.label}: ${chartData.value}',
                              style: LibraryTextStyles.interXsRegularWhite,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          series: <CartesianSeries<ElevarmLineChartData, String>>[
            ...dataSource.map(
              (e) {
                SplineType splineTypeSeries;
                switch (splineType) {
                  case ElevarmLineChartSplineType.monotonic:
                    splineTypeSeries = SplineType.monotonic;
                    break;
                  case ElevarmLineChartSplineType.clamped:
                    splineTypeSeries = SplineType.clamped;
                    break;
                  case ElevarmLineChartSplineType.natural:
                  default:
                    splineTypeSeries = SplineType.natural;
                    break;
                }
                return SplineSeries(
                  dataSource: e.dataPoints,
                  legendIconType: LegendIconType.circle,
                  name: e.label,
                  enableTooltip: true,
                  color: e.color,
                  splineType: splineTypeSeries,
                  xValueMapper: (ElevarmLineChartData data, _) => data.label,
                  yValueMapper: (ElevarmLineChartData data, _) => data.value,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            ...dataSource.asMap().entries.map(
              (entry) {
                final dataPoint = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: dataPoint.color,
                              ),
                              height: 8.0,
                              width: 8.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            dataPoint.label,
                            style: LibraryTextStyles.interXsRegularGrey600,
                          ),
                        ),
                      ],
                    ),
                    entry.key < dataSource.length - 1
                        ? const SizedBox(height: 4.0)
                        : Container(),
                  ],
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
