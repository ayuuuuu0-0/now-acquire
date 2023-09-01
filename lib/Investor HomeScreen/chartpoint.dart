import 'package:collection/collection.dart';
class ChartPoint{
  final double x;
  final double y;
  ChartPoint({required this.x, required this.y});
}

List<ChartPoint> get ChartPoints {
  final data = <double>[2,4,6,11,3,6,4];
  return data.mapIndexed(((index, element) => ChartPoint(x: index.toDouble(), y: element)))
      .toList();
}

