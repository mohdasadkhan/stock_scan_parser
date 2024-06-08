import 'package:stock_scan_parser/features/stock_list/domain/entities/entities.dart';

class StockScan {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<Criteria> criteria;

  StockScan({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory StockScan.fromJson(Map<String, dynamic> json) {
    return StockScan(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criteria: (json['criteria'] as List<dynamic>)
          .map((e) => Criteria.fromJson(e))
          .toList(),
    );
  }


  @override
  String toString() {
    return 'StockScan(id: $id, name: $name, tag: $tag, color: $color, criteria: $criteria)';
  }
}
