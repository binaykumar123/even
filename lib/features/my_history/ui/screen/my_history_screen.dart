import 'package:even/common/di/di.dart';
import 'package:even/common/helpers/functs.dart';
import 'package:even/constants/app_colors.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:even/features/my_history/ui/screen/update_feedback_screen.dart';
import 'package:even/features/my_history/ui/store/my_history_screen_store.dart';
import 'package:even/features/my_history/ui/widgets/consultation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class MyHistoryScreen extends StatefulWidget {
  const MyHistoryScreen({
    Key key,
    @required this.changeTab,
  }) : super(key: key);

  final Function(int) changeTab;

  @override
  State<MyHistoryScreen> createState() => _MyHistoryScreenState();
}

class _MyHistoryScreenState extends State<MyHistoryScreen> {
  final _myHistoryScreenStore = getIt<MyHistoryScreenStore>();

  Function(int) get _changeTab => widget.changeTab;

  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _initReactions();
    _fetchConsultationHistory();
  }

  void _initReactions() {
    _disposers = [
      reaction(
        (_) => _myHistoryScreenStore.updateFeedbackSuccess,
        (bool isFeedbackUpdated) {
          if (isNull(isFeedbackUpdated)) {
            return;
          }

          _fetchConsultationHistory();
        },
      ),
    ];
  }

  Future<void> _fetchConsultationHistory() {
    return _myHistoryScreenStore?.fetchConsultationsHistory();
  }

  void navigateToUpdateFeedbackScreen(ConsultationResponse consultation) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UpdateFeedbackScreen(
          consultationResponse: consultation,
          updateFeedback: (request) {
            _myHistoryScreenStore?.updateFeedback(
              request: request,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorEAEDF5,
        body: Observer(
          builder: (context) {
            final _consultationHistory =
                _myHistoryScreenStore?.consultationsHistory;

            if (isNull(_myHistoryScreenStore?.consultationsHistoryFuture)) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'My History',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _consultationHistory?.length ?? 0,
                      padding: const EdgeInsets.only(bottom: 16),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: _consultationHistory[index].id,
                          child: ConsultationCard(
                            consultation: _consultationHistory[index],
                            navigateToUpdateScreen: () {
                              navigateToUpdateFeedbackScreen(
                                _consultationHistory[index],
                              );
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_disposers != null) {
      _disposers.forEach((disposer) {
        disposer();
      });
    }

    super.dispose();
  }
}
