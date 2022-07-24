import 'package:data_channel/data_channel.dart';
import 'package:even/features/my_history/data/data_sources/my_history_remote_data_source.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:even/features/my_history/data/models/feedback_update_request.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MyHistoryRepository {
  final MyHistoryRemoteDataSource _myHistoryRemoteDataSource;

  MyHistoryRepository(this._myHistoryRemoteDataSource);

  Future<DC<Exception, List<ConsultationResponse>>>
      fetchConsultationHistory() async {
    return _myHistoryRemoteDataSource.fetchConsultationHistory();
  }

  Future<DC<Exception, bool>> updateFeedback({
    @required FeedbackUpdateRequest request,
  }) async {
    return _myHistoryRemoteDataSource.updateFeedback(request: request);
  }
}
