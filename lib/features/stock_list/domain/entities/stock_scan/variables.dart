class VariableDetail {
  final String type;
  final List<dynamic>? values;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;

  VariableDetail({
    required this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  factory VariableDetail.fromJson(Map<String, dynamic> json) {
    return VariableDetail(
      type: json['type'],
      values: json['values'] as List<dynamic>?,
      studyType: json['study_type'],
      parameterName: json['parameter_name'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      defaultValue: json['default_value'],
    );
  }

  @override
  String toString() {
    return 'VariableDetail(type: $type, values: $values, studyType: $studyType, parameterName: $parameterName, minValue: $minValue, maxValue: $maxValue, defaultValue: $defaultValue)';
  }
}
