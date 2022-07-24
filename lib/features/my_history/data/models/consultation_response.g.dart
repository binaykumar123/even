// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationResponse _$ConsultationResponseFromJson(Map<String, dynamic> json) {
  return ConsultationResponse(
    id: json['id'] as String,
    date: json['date'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    institution: json['institution'] as String,
    type: _$enumDecodeNullable(_$ConsultationTypeEnumMap, json['type']),
    feedback: json['feedback'] as String,
    day: json['day'] as String,
    time: json['time'] as String,
  );
}

Map<String, dynamic> _$ConsultationResponseToJson(
        ConsultationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'institution': instance.institution,
      'type': _$ConsultationTypeEnumMap[instance.type],
      'feedback': instance.feedback,
      'day': instance.day,
      'time': instance.time,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ConsultationTypeEnumMap = {
  ConsultationType.CONSULTATION: 'CONSULTATION',
  ConsultationType.LAB_TEST: 'LAB_TEST',
  ConsultationType.TELE_CONSULTATION: 'TELE_CONSULTATION',
};
