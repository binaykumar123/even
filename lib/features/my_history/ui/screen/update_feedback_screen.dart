import 'dart:ui';

import 'package:even/constants/app_colors.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:even/features/my_history/data/models/feedback_update_request.dart';
import 'package:even/features/my_history/ui/widgets/consultation_card.dart';
import 'package:flutter/material.dart';

class UpdateFeedbackScreen extends StatefulWidget {
  const UpdateFeedbackScreen({
    Key key,
    @required this.consultationResponse,
    @required this.updateFeedback,
  }) : super(key: key);
  final ConsultationResponse consultationResponse;
  final Function(FeedbackUpdateRequest) updateFeedback;

  @override
  State<UpdateFeedbackScreen> createState() => _UpdateFeedbackScreenState();
}

class _UpdateFeedbackScreenState extends State<UpdateFeedbackScreen> {
  ConsultationResponse get _consultationResponse => widget.consultationResponse;

  Function(FeedbackUpdateRequest) get _updateFeedback => widget.updateFeedback;

  String feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppColors.colorB0B8C8,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.close,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Dismiss',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Hero(
                    tag: _consultationResponse.id,
                    child: ConsultationCard(
                      consultation: _consultationResponse,
                      updateFeedbackText: (text) {
                        feedback = text;
                      },
                      isFeedbackEditable: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        _updateFeedback(
                          FeedbackUpdateRequest(
                            id: _consultationResponse.id,
                            feedback: feedback,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.color0055FF,
                          ),
                          child: Center(
                            child: Text(
                              'Update Feedback',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
