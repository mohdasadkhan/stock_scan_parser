class VariableDetail {
  final String type;
  final List<dynamic>? values;
  final String? studyType;
  final int? defaultValue;

  VariableDetail({
    required this.type,
    this.values,
    this.studyType,
    this.defaultValue,
  });

  factory VariableDetail.fromJson(Map<String, dynamic> json) {
    return VariableDetail(
      type: json['type'],
      values: json['values'] as List<dynamic>?,
      studyType: json['study_type'],
      defaultValue: json['default_value'],
    );
  }

  @override
  String toString() {
    return 'VariableDetail(type: $type, values: $values, studyType: $studyType, defaultValue: $defaultValue)';
  }
}
