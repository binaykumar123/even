import 'package:data_channel/data_channel.dart';
import 'package:even/common/api_client/api_client.dart';
import 'package:even/common/helpers/functs.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:even/features/my_history/data/models/feedback_update_request.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MyHistoryRemoteDataSource {
  final ApiClient _apiClient;

  MyHistoryRemoteDataSource(this._apiClient);

  Future<DC<Exception, List<ConsultationResponse>>>
      fetchConsultationHistory() async {
    try {
      final response = await _apiClient.get('/consultations');

      if (isNotNull(response)) {
        final list = response as List<dynamic>;
        if (isNullOrEmpty(list)) {
          return DC.data(null);
        }
        List<ConsultationResponse> _consultations = [];
        list.forEach(
          (element) {
            _consultations.add(ConsultationResponse.fromJson(element));
          },
        );

        return DC.data(_consultations);
      }

      return DC.data(null);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }

  Future<DC<Exception, bool>> updateFeedback({
    @required FeedbackUpdateRequest request,
  }) async {
    try {
      await _apiClient.put(
        '/consultations/${request.id}',
        request.toJson(),
      );
      return DC.data(true);
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }
}
