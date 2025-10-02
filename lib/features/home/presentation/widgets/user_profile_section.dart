import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../domain/entities/user_profile.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Widget that displays the user profile information
class UserProfileSection extends StatelessWidget {
  final UserProfile userProfile;

  const UserProfileSection({
    super.key,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top section with user profile and action icons
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.surface,
                  border: Border.all(
                    color: ColorManager.border,
                    width: 2.w,
                  ),
                ),
                child: userProfile.avatarUrl != null
                    ? ClipOval(
                        child: Image.network(
                          userProfile.avatarUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.person,
                            color: ColorManager.textSecondary,
                            size: 25.sp,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.person,
                        color: ColorManager.textSecondary,
                        size: 25.sp,
                      ),
              ),
              
              SizedBox(width: 12.w),
              
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: ColorManager.textPrimary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      userProfile.name,
                      style: TextStyle(
                        color: ColorManager.textPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Action Icons
              Row(
                children: [
                  SvgPicture.asset(ImageManager.notification, width: 25.w, height: 25.h),
                  SizedBox(width: 15.w),
                  
                  SvgPicture.asset(ImageManager.settings, width: 25.w, height: 25.h),
                  SizedBox(width: 15.w),
                  
                  SvgPicture.asset(ImageManager.reload, width: 23.w, height: 23.h),
                  ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

