import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consultation_response.g.dart';

enum ConsultationType {
  CONSULTATION,
  LAB_TEST,
  TELE_CONSULTATION,
}

@JsonSerializable()
class ConsultationResponse extends Equatable {
  final String id;
  final String date;
  final String title;
  final String subtitle;
  final String institution;
  final ConsultationType type;
  final String feedback;
  final String day;
  final String time;

  ConsultationResponse({
    @required this.id,
    @required this.date,
    @required this.title,
    @required this.subtitle,
    @required this.institution,
    @required this.type,
    @required this.feedback,
    @required this.day,
    @required this.time,
  });

  @override
  List<Object> get props => [
        id,
        date,
        title,
        subtitle,
        institution,
        type,
        feedback,
        day,
        time,
      ];

  factory ConsultationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsultationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationResponseToJson(this);
}
