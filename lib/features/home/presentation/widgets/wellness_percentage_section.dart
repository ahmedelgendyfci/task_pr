import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_pr/core/utils/image_manager.dart';

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
      padding: const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wellness Overview Title
              const Text(
                'Wellness Overview',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Subtitle
              const Text(
                "Based on today's readings",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              const SizedBox(height: 20),
              Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImageManager.date),
                            const SizedBox(width: 8),
                            Text(
                              _formatDate(DateTime.now()),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            SvgPicture.asset(ImageManager.clock),
                            const SizedBox(width: 8),
                            Text(
                              _formatTime(DateTime.now()),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
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
                width: 180,
                height: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background circle
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white,
                      ),
                    ),
                    
                    // Progress circle
                    SizedBox(
                      width: 140,
                      height: 140,
                      child: CircularProgressIndicator(
                        value: percentage / 100,
                        strokeWidth: 18,
                        backgroundColor: const Color(0xFFF5F5F5),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF4CAF50), // Green color
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
                          style: const TextStyle(
                            color: Color(0xFF4CAF50),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            '%',
                            style: const TextStyle(
                              color: Color(0xFF4CAF50),
                              fontSize: 16,
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
