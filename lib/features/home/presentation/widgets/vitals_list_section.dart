import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_pr/core/utils/image_manager.dart';
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
      color: Color(0xFFF7F7F7),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with connection status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Real-Time Vitals',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(ImageManager.check ,width: 18,height: 18,),
                  const SizedBox(width: 6),
                  const Text(
                    'Connected',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
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
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon
            SvgPicture.asset(vital.iconName ?? '',width: 25,height: 25,),
            
            const SizedBox(width: 16),
            
            // Vital Info
            Expanded(
              child: Text(
                vital.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            // Value
            Text(
              '${vital.value.toInt()}${vital.unit}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(width: 8),
            
            // Arrow
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade400,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

}
