import 'package:stock_scan_parser/features/stock_list/domain/entities/entities.dart';

class Criteria {
  final String type;
  final String text;
  final Map<String, VariableDetail>? variable;

  Criteria({
    required this.type,
    required this.text,
    this.variable,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) {
    Map<String, VariableDetail>? variable;
    if (json['variable'] != null) {
      variable = (json['variable'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, VariableDetail.fromJson(value)));
    }
    return Criteria(
      type: json['type'],
      text: json['text'],
      variable: variable,
    );
  }

  @override
  String toString() => 'Criteria(type: $type, text: $text, variable: $variable)';
}
