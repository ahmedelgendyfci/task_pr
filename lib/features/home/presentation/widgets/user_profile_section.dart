import 'package:flutter/material.dart';
import '../../../../core/utils/image_manager.dart';
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
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: userProfile.avatarUrl != null
                    ? ClipOval(
                        child: Image.network(
                          userProfile.avatarUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 25,
                      ),
              ),
              
              const SizedBox(width: 12),
              
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      userProfile.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Action Icons
              Row(
                children: [
                  SvgPicture.asset(ImageManager.notification,width: 25,height: 25,),
                  const SizedBox(width: 15),
                  
                  SvgPicture.asset(ImageManager.settings,width: 25,height: 25,),
                  const SizedBox(width: 15),
                  
                  SvgPicture.asset(ImageManager.reload,width: 23,height: 23,),
                  ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

