import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_update_request.g.dart';

@JsonSerializable()
class FeedbackUpdateRequest extends Equatable {
  final String id;
  final String feedback;

  FeedbackUpdateRequest({
    @required this.id,
    @required this.feedback,
  });

  @override
  List<Object> get props => [
        id,
        feedback,
      ];

  factory FeedbackUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$FeedbackUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackUpdateRequestToJson(this);
}
