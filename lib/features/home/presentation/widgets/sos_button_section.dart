import 'package:flutter/material.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

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
      width: MediaQuery.of(context).size.width - 32,
      parentBoxRadiusValue: 27,
      circleSlidingButtonSize: 47,
      leftEdgeSpacing: 3,
      rightEdgeSpacing: 3,
      initialSlidingActionLabel: 'Slide For SOS',
      finalSlidingActionLabel: 'SOS',
      circleSlidingButtonIcon: const Icon(Icons.sos, color: Colors.white),
      parentBoxBackgroundColor: Color(0xffF27373).withOpacity(0.5),
      parentBoxDisableBackgroundColor: Color(0xffF27373).withOpacity(0.5),
      circleSlidingButtonBackgroundColor: Color(0xffF27373),
      isEnable: true,
      onSlideActionCompleted: () {
        // print("Sliding action completed");
        widget.onSOSTriggered(true);
      },
      onSlideActionCanceled: () {
        // print("Sliding action cancelled");
        widget.onSOSTriggered(false);
      },
    );
  }
}
