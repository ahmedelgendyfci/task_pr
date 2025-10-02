import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_action_button/sliding_action_button.dart';
import '../../../../core/utils/color_manager.dart';

/// Widget that displays the SOS emergency button
class SOSButtonSection extends StatefulWidget {

  final Function(bool) onSOSTriggered;

  const SOSButtonSection({
    super.key,
    required this.onSOSTriggered,
  });

  @override
  State<SOSButtonSection> createState() => _SOSButtonSectionState();
}

class _SOSButtonSectionState extends State<SOSButtonSection>{
  @override
  Widget build(BuildContext context) {

    return CircleSlideToActionButton(
      width: MediaQuery.of(context).size.width - 32.w,
      height: 60.h,
      parentBoxRadiusValue: 100.r,
      circleSlidingButtonSize: 45.w,
      leftEdgeSpacing: 3.w,
      rightEdgeSpacing: 3.w,
      slideActionButtonType: SlideActionButtonType.slideActionWithLoaderButton,
      initialSlidingActionLabel: 'Slide For SOS',
      finalSlidingActionLabel: 'SOS',
      circleSlidingButtonIcon: Icon(Icons.sos, color: ColorManager.textOnDark),
      parentBoxBackgroundColor: ColorManager.withOpacity(ColorManager.sosPrimary, 0.5),
      parentBoxDisableBackgroundColor: ColorManager.withOpacity(ColorManager.sosPrimary, 0.5),
      circleSlidingButtonBackgroundColor: ColorManager.sosPrimary,
      isEnable: true,
      onSlideActionCompleted: () {
        // print("Sliding action completed");
        // widget.onSOSTriggered(true);
      },
      onSlideActionCanceled: () {
        // print("Sliding action cancelled");
        // widget.onSOSTriggered(false);
      },
    );
  }
}
