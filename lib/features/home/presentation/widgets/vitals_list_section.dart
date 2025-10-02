import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_pr/core/utils/image_manager.dart';
import 'package:task_pr/core/utils/color_manager.dart';
import '../../domain/entities/vital_metric.dart';

/// Widget that displays the list of vital metrics
class VitalsListSection extends StatelessWidget {
  final List<VitalMetric> vitals;

  const VitalsListSection({
    super.key,
    required this.vitals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.background,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with connection status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Real-Time Vitals',
                style: TextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: 14.sp,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(ImageManager.check, width: 18.w, height: 18.h),
                  SizedBox(width: 6.w),
                  Text(
                    'Connected',
                    style: TextStyle(
                      color: ColorManager.textPrimary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ...vitals.map((vital) => _VitalMetricItem(vital: vital)).toList(),
        ],
      ),
    );
  }
}

/// Individual vital metric item widget
class _VitalMetricItem extends StatelessWidget {
  final VitalMetric vital;

  const _VitalMetricItem({required this.vital});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: ColorManager.surface,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: ColorManager.createShadow(
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 5.h),
          opacity: 0.1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            // Icon
            SvgPicture.asset(vital.iconName ?? '', width: 25.w, height: 25.h),
            
            SizedBox(width: 16.w),
            
            // Vital Info
            Expanded(
              child: Text(
                vital.name,
                style: TextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            // Value
            Text(
              '${vital.value.toInt()}${vital.unit}',
              style: TextStyle(
                color: ColorManager.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(width: 8.w),
            
            // Arrow
            Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.textSecondary,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

}
