import 'package:even/common/helpers/functs.dart';
import 'package:even/constants/app_colors.dart';
import 'package:even/features/my_history/data/models/consultation_response.dart';
import 'package:flutter/material.dart';

class ConsultationTypeLabel extends StatelessWidget {
  const ConsultationTypeLabel({
    Key key,
    @required this.consultationType,
  }) : super(key: key);
  final ConsultationType consultationType;

  Color getCorrespondingColor(ConsultationType type) {
    switch (type) {
      case ConsultationType.CONSULTATION:
        return AppColors.colorFBE277;
      case ConsultationType.LAB_TEST:
        return AppColors.colorFEBACD;
      case ConsultationType.TELE_CONSULTATION:
        return AppColors.color2CC48B;
    }
    return AppColors.colorFEBACD;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: getCorrespondingColor(consultationType),
          ),
          top: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 4),
          child: Text(
            enumToString(consultationType),
          ),
        )
      ],
    );
  }
}
