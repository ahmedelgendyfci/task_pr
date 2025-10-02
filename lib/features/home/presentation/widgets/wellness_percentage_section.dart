import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_pr/core/utils/image_manager.dart';
import 'package:task_pr/core/utils/color_manager.dart';

/// Widget that displays the wellness percentage with circular progress indicator
class WellnessPercentageSection extends StatelessWidget {
  final double percentage;
  final bool isConnected;
  final DateTime lastUpdated;

  const WellnessPercentageSection({
    super.key,
    required this.percentage,
    required this.isConnected,
    required this.lastUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 0, top: 0, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wellness Overview Title
              Text(
                'Wellness Overview',
                style: TextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 6.h),
              
              // Subtitle
              Text(
                "Based on today's readings",
                style: TextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              SizedBox(height: 20.h),
              Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImageManager.date),
                            SizedBox(width: 8.w),
                            Text(
                              _formatDate(DateTime.now()),
                              style: TextStyle(
                                color: ColorManager.textPrimary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w),
                        Row(
                          children: [
                            SvgPicture.asset(ImageManager.clock),
                            SizedBox(width: 8.w),
                            Text(
                              _formatTime(DateTime.now()),
                              style: TextStyle(
                                color: ColorManager.textPrimary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  
              
            ],
          ),
        
              SizedBox(
                width: 150.w,
                height: 150.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background circle
                    Container(
                      width: 110.w,
                      height: 110.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white,
                      ),
                    ),
                    
                    // Progress circle
                    SizedBox(
                      width: 110.w,
                      height: 110.w,
                      child: CircularProgressIndicator(
                        value: percentage / 100,
                        strokeWidth: 18.w,
                        backgroundColor: ColorManager.backgroundSecondary,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ColorManager.success,
                        ),
                      ),
                    ),
                    
                    // Percentage text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${percentage.toInt()}',
                          style: TextStyle(
                            color: ColorManager.success,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Text(
                            '%',
                            style: TextStyle(
                              color: ColorManager.success,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            
        
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute AM';
  }
}
