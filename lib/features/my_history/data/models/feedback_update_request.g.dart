// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackUpdateRequest _$FeedbackUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return FeedbackUpdateRequest(
    id: json['id'] as String,
    feedback: json['feedback'] as String,
  );
}

Map<String, dynamic> _$FeedbackUpdateRequestToJson(
        FeedbackUpdateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedback': instance.feedback,
    };
