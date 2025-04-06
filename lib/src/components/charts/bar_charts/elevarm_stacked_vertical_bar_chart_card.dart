import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// [ElevarmStackedVerticalBarChartCard]'s data series class.
class ElevarmStackedVerticalBarChartDataSeries {
  /// The series' data points.
  final List<ElevarmStackedVerticalBarChartData> dataPoints;

  /// The series' color.
  final Color color;

  /// The series' label.
  final String label;

  ElevarmStackedVerticalBarChartDataSeries({
    required this.label,
    required this.dataPoints,
    required this.color,
  });
}

/// [ElevarmStackedVerticalBarChartCard]'s data point class.
class ElevarmStackedVerticalBarChartData {
  /// The data point's label.
  final String label;

  /// The data point's value.
  final int value;

  ElevarmStackedVerticalBarChartData({
    required this.label,
    required this.value,
  });
}

/// Elevarm UI's stacked vertical bar chart inside a card.
class ElevarmStackedVerticalBarChartCard extends StatelessWidget {
  /// Chart's title.
  final String title;

  /// Chart's subtitle if any.
  final String? subtitle;

  /// Chart's list of data.
  final List<ElevarmStackedVerticalBarChartDataSeries> dataSource;

  /// Chart's tooltip title. If null [title] will be used.
  final String? tooltipTitle;

  const ElevarmStackedVerticalBarChartCard({
    required this.title,
    required this.dataSource,
    this.subtitle,
    this.tooltipTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: ElevarmBoxShadow.sm,
        color: ElevarmColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: LibraryTextStyles.interLgSemiboldNeutral,
            ),
            subtitle != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2.0),
                      Text(
                        subtitle!,
                        style: ElevarmFontFamilies.inter(
                          color: const Color(
                            0xFF7A838F,
                          ), // FIXME: Not using ElevarmColors
                          fontSize: ElevarmFontSizes.sm,
                          fontWeight: ElevarmFontWeights.regular,
                        ),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 280,
              child: SfCartesianChart(
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
                primaryYAxis: CategoryAxis(
                  maximumLabelWidth: 0.0,
                  axisLine: const AxisLine(
                    color: Colors.transparent,
                  ),
                  majorTickLines: const MajorTickLines(
                    color: Colors.transparent,
                  ),
                  labelStyle: const TextStyle(color: Colors.transparent),
                  majorGridLines: const MajorGridLines(
                    width: 1.0,
                    // ignore: deprecated_member_use_from_same_package
                    color: ElevarmColors.grey100, // FIXME
                  ),
                ),
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                  legendItemBuilder: (legendText, series, point, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 6.0,
                        left: 6.0,
                        top: 16.0,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (series as StackedColumnSeries).color,
                              ),
                              width: 8.0,
                              height: 8.0,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              legendText,
                              style: LibraryTextStyles.interSmRegularGrey600,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                tooltipBehavior: TooltipBehavior(
                  color:
                      const Color(0xFF2F2F2F), // FIXME: Not using ElevarmColors
                  enable: true,
                  builder: (data, point, series, pointIndex, seriesIndex) {
                    final chartData =
                        data as ElevarmStackedVerticalBarChartData;
                    final chartSeries = series as StackedColumnSeries<
                        ElevarmStackedVerticalBarChartData, String>;
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
                              Text(
                                tooltipTitle ?? title,
                                style: ElevarmFontFamilies.inter(
                                  color: const Color(
                                    0xFF9F9E9E,
                                  ), // FIXME: Not using ElevarmColors
                                  fontSize: ElevarmFontSizes.xs,
                                  fontWeight: ElevarmFontWeights.regular,
                                ),
                              ),
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
                                    style:
                                        LibraryTextStyles.interXsRegularWhite,
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
                series: <CartesianSeries<ElevarmStackedVerticalBarChartData,
                    String>>[
                  ...dataSource.map(
                    (e) => StackedColumnSeries<
                        ElevarmStackedVerticalBarChartData, String>(
                      dataSource: e.dataPoints,
                      legendIconType: LegendIconType.circle,
                      name: e.label,
                      enableTooltip: true,
                      color: e.color,
                      xValueMapper:
                          (ElevarmStackedVerticalBarChartData data, _) =>
                              data.label,
                      yValueMapper:
                          (ElevarmStackedVerticalBarChartData data, _) =>
                              data.value,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
