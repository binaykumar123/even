import 'package:even/common/helpers/functs.dart';
import 'package:even/constants/app_colors.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:even/features/my_history/ui/widgets/consultation_type_label.dart';
import 'package:flutter/material.dart';

class ConsultationCard extends StatefulWidget {
  const ConsultationCard({
    Key key,
    @required this.consultation,
    this.navigateToUpdateScreen,
    this.updateFeedbackText,
    this.isFeedbackEditable,
  }) : super(key: key);

  final ConsultationResponse consultation;
  final VoidCallback navigateToUpdateScreen;
  final Function(String) updateFeedbackText;
  final bool isFeedbackEditable;

  @override
  State<ConsultationCard> createState() => _ConsultationCardState();
}

class _ConsultationCardState extends State<ConsultationCard>
    with WidgetsBindingObserver {
  ConsultationResponse get _consultation => widget.consultation;

  VoidCallback get _navigateToUpdateScreen => widget.navigateToUpdateScreen;

  bool get _isFeedbackEditable => widget.isFeedbackEditable ?? false;

  Function(String) get _updateFeedbackText => widget.updateFeedbackText;

  TextEditingController get _controller => TextEditingController(
        text: _consultation.feedback ?? "",
      );

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (isNotNull(_updateFeedbackText)) {
      _updateFeedbackText(_consultation.feedback);
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (_isFeedbackEditable) {
          if (!_focusNode.hasFocus ?? false) {
            _focusNode.requestFocus();
          }
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            const SizedBox(
              width: 22,
            ),
            Column(
              children: [
                Text(
                  _consultation.time,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: AppColors.color666666,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _consultation.day,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: AppColors.color666666,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ConsultationTypeLabel(
                          consultationType: _consultation.type,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          _consultation.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (isNotNullOrEmpty(_consultation.subtitle))
                          const SizedBox(
                            height: 8,
                          ),
                        if (isNotNullOrEmpty(_consultation.subtitle))
                          Text(
                            _consultation.subtitle,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        if (isNotNullOrEmpty(_consultation.institution))
                          const SizedBox(
                            height: 10,
                          ),
                        if (isNotNullOrEmpty(_consultation.institution))
                          Text(
                            _consultation.institution,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isNotNull(_navigateToUpdateScreen)) {
                        _navigateToUpdateScreen();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.colorF1F4F9,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          if (isNotNullOrEmpty(_consultation.feedback))
                            const SizedBox(
                              height: 12,
                            ),
                          if (isNotNullOrEmpty(_consultation.feedback))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Feedback',
                                  style: TextStyle(
                                    color: AppColors.color333333,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: AppColors.color0055FF,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          TextField(
                            focusNode: _focusNode,
                            enabled: _isFeedbackEditable,
                            controller: _controller,
                            style: TextStyle(
                              color: AppColors.color666666,
                              fontSize: 12,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText:
                                  'Please provide feedback for this session',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: AppColors.colorBBBBBB,
                                fontSize: 12,
                              ),
                            ),
                            onChanged: (text) {
                              if (isNotNull(_updateFeedbackText)) {
                                _updateFeedbackText(text);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
