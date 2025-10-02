import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

/// Widget that displays the SOS emergency button
class SOSButtonSection extends StatefulWidget {
  final VoidCallback onSOSTriggered;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SliderButton(
        action: () async{
      ///Do something here OnSlide
      return false;
          },
          backgroundColor: Color(0xffF27373).withOpacity(0.5),
          buttonColor: Color(0xffF27373),
          width: MediaQuery.of(context).size.width ,
          buttonSize: 55,
          
         label: Center(
           child: Text(
              "Slide For SOS",
              style: TextStyle(
                  color: Color(0xffF27373), fontWeight: FontWeight.w500, fontSize: 17),
            ),
         ),
         height: 64,
        icon: Text(
          "SOS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
