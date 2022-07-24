import 'package:data_channel/data_channel.dart';
import 'package:even/features/my_history/data/controller/my_history_controller.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:even/features/my_history/data/models/feedback_update_request.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'my_history_screen_store.g.dart';

@lazySingleton
class MyHistoryScreenStore = _MyHistoryScreenStoreBase
    with _$MyHistoryScreenStore;

abstract class _MyHistoryScreenStoreBase with Store {
  final MyHistoryController _myHistoryController;

  _MyHistoryScreenStoreBase(this._myHistoryController);

  @observable
  ObservableFuture<DC<Exception, List<ConsultationResponse>>>
      consultationsHistoryFuture;
  @observable
  List<ConsultationResponse> consultationsHistory;
  @observable
  Exception consultationsHistoryException;

  @observable
  ObservableFuture<DC<Exception, bool>> updateFeedbackFuture;
  @observable
  bool updateFeedbackSuccess;
  @observable
  Exception updateFeedbackException;

  @action
  Future<void> fetchConsultationsHistory() async {
    consultationsHistoryFuture =
        ObservableFuture(_myHistoryController.fetchConsultationHistory());
    final _consultationsHistoryData = await consultationsHistoryFuture;

    _consultationsHistoryData.pick(
      onError: (error) {
        consultationsHistory = null;
        consultationsHistoryException = error;
      },
      onData: (data) {
        consultationsHistory = data;
        consultationsHistoryException = null;
      },
      onNoData: () {
        consultationsHistory = null;
      },
    );
  }

  Future<void> updateFeedback({
    @required FeedbackUpdateRequest request,
  }) async {
    updateFeedbackSuccess = null;
    updateFeedbackFuture =
        ObservableFuture(_myHistoryController.updateFeedback(request: request));
    final _updateFeedbackSuccess = await updateFeedbackFuture;

    _updateFeedbackSuccess.pick(
      onError: (error) {
        updateFeedbackSuccess = false;
        consultationsHistoryException = error;
      },
      onData: (data) {
        updateFeedbackSuccess = data;
        consultationsHistoryException = null;
      },
      onNoData: () {
        consultationsHistory = null;
      },
    );
  }
}
