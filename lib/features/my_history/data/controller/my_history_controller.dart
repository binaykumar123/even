import 'package:data_channel/data_channel.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:even/features/my_history/data/models/feedback_update_request.dart';
import 'package:even/features/my_history/data/repository/my_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MyHistoryController {
  final MyHistoryRepository _myHistoryRepository;

  MyHistoryController(this._myHistoryRepository);

  Future<DC<Exception, List<ConsultationResponse>>>
      fetchConsultationHistory() async {
    return _myHistoryRepository.fetchConsultationHistory();
  }

  Future<DC<Exception, bool>> updateFeedback({
    @required FeedbackUpdateRequest request,
  }) async {
    return _myHistoryRepository.updateFeedback(request: request);
  }
}
