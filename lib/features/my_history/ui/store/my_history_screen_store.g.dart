// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_history_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyHistoryScreenStore on _MyHistoryScreenStoreBase, Store {
  final _$consultationsHistoryFutureAtom =
      Atom(name: '_MyHistoryScreenStoreBase.consultationsHistoryFuture');

  @override
  ObservableFuture<DC<Exception, List<ConsultationResponse>>>
      get consultationsHistoryFuture {
    _$consultationsHistoryFutureAtom.reportRead();
    return super.consultationsHistoryFuture;
  }

  @override
  set consultationsHistoryFuture(
      ObservableFuture<DC<Exception, List<ConsultationResponse>>> value) {
    _$consultationsHistoryFutureAtom
        .reportWrite(value, super.consultationsHistoryFuture, () {
      super.consultationsHistoryFuture = value;
    });
  }

  final _$consultationsHistoryAtom =
      Atom(name: '_MyHistoryScreenStoreBase.consultationsHistory');

  @override
  List<ConsultationResponse> get consultationsHistory {
    _$consultationsHistoryAtom.reportRead();
    return super.consultationsHistory;
  }

  @override
  set consultationsHistory(List<ConsultationResponse> value) {
    _$consultationsHistoryAtom.reportWrite(value, super.consultationsHistory,
        () {
      super.consultationsHistory = value;
    });
  }

  final _$consultationsHistoryExceptionAtom =
      Atom(name: '_MyHistoryScreenStoreBase.consultationsHistoryException');

  @override
  Exception get consultationsHistoryException {
    _$consultationsHistoryExceptionAtom.reportRead();
    return super.consultationsHistoryException;
  }

  @override
  set consultationsHistoryException(Exception value) {
    _$consultationsHistoryExceptionAtom
        .reportWrite(value, super.consultationsHistoryException, () {
      super.consultationsHistoryException = value;
    });
  }

  final _$updateFeedbackFutureAtom =
      Atom(name: '_MyHistoryScreenStoreBase.updateFeedbackFuture');

  @override
  ObservableFuture<DC<Exception, bool>> get updateFeedbackFuture {
    _$updateFeedbackFutureAtom.reportRead();
    return super.updateFeedbackFuture;
  }

  @override
  set updateFeedbackFuture(ObservableFuture<DC<Exception, bool>> value) {
    _$updateFeedbackFutureAtom.reportWrite(value, super.updateFeedbackFuture,
        () {
      super.updateFeedbackFuture = value;
    });
  }

  final _$updateFeedbackSuccessAtom =
      Atom(name: '_MyHistoryScreenStoreBase.updateFeedbackSuccess');

  @override
  bool get updateFeedbackSuccess {
    _$updateFeedbackSuccessAtom.reportRead();
    return super.updateFeedbackSuccess;
  }

  @override
  set updateFeedbackSuccess(bool value) {
    _$updateFeedbackSuccessAtom.reportWrite(value, super.updateFeedbackSuccess,
        () {
      super.updateFeedbackSuccess = value;
    });
  }

  final _$updateFeedbackExceptionAtom =
      Atom(name: '_MyHistoryScreenStoreBase.updateFeedbackException');

  @override
  Exception get updateFeedbackException {
    _$updateFeedbackExceptionAtom.reportRead();
    return super.updateFeedbackException;
  }

  @override
  set updateFeedbackException(Exception value) {
    _$updateFeedbackExceptionAtom
        .reportWrite(value, super.updateFeedbackException, () {
      super.updateFeedbackException = value;
    });
  }

  final _$fetchConsultationsHistoryAsyncAction =
      AsyncAction('_MyHistoryScreenStoreBase.fetchConsultationsHistory');

  @override
  Future<void> fetchConsultationsHistory() {
    return _$fetchConsultationsHistoryAsyncAction
        .run(() => super.fetchConsultationsHistory());
  }

  @override
  String toString() {
    return '''
consultationsHistoryFuture: ${consultationsHistoryFuture},
consultationsHistory: ${consultationsHistory},
consultationsHistoryException: ${consultationsHistoryException},
updateFeedbackFuture: ${updateFeedbackFuture},
updateFeedbackSuccess: ${updateFeedbackSuccess},
updateFeedbackException: ${updateFeedbackException}
    ''';
  }
}
