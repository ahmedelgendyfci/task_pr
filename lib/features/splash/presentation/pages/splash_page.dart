import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/injection.dart';
import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../features/home/presentation/cubit/home_cubit.dart';
import '../../../../features/home/presentation/pages/home_page.dart';

/// Animated splash screen with logo and smooth transitions
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
    _navigateToHome();
  }

  void _initializeAnimations() {
    // Fade animation for logo appearance
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    // Scale animation for logo growth
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    // Rotation animation for subtle spin effect
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1, // Small rotation for subtle effect
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));

    // Pulse animation for breathing effect
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
  }

  void _startAnimations() {
    // Start fade animation immediately
    _fadeController.forward();
    
    // Start scale animation with slight delay
    Future.delayed(const Duration(milliseconds: 300), () {
      _scaleController.forward();
    });
    
    // Start rotation animation
    _rotationController.forward();
    
    // Start pulse animation and repeat it
    _pulseController.forward().then((_) {
      _pulseController.reverse().then((_) {
        _pulseController.repeat(reverse: true);
      });
    });
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3  ), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
              create: (context) => sl<HomeCubit>(),
              child: const HomePage(),
            ),
            transitionDuration: const Duration(milliseconds: 800),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Fade transition
              const begin = 0.0;
              const end = 1.0;
              const curve = Curves.easeInOut;
              
              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              );
              
              return FadeTransition(
                opacity: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorManager.createGradient(
            ColorManager.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo Container
              AnimatedBuilder(
                animation: Listenable.merge([
                  _fadeAnimation,
                  _scaleAnimation,
                  _rotationAnimation,
                  _pulseAnimation,
                ]),
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value * _pulseAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Container(
                          width: 200.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.surface.withOpacity(0.1),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.surface.withOpacity(0.3),
                                blurRadius: 30,
                                spreadRadius: 5,
                                offset: Offset(0, 10.h),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              ImageManager.logo,
                              width: 120.w,
                              height: 120.h,
                              colorFilter: ColorFilter.mode(
                                ColorManager.surface,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              SizedBox(height: 40.h),
              
              // App Title with fade animation
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Column(
                      children: [
                        Text(
                          'Wellness Overview',
                          style: TextStyle(
                            color: ColorManager.surface,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Your Health, Your Priority',
                          style: TextStyle(
                            color: ColorManager.surface.withOpacity(0.8),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              
              SizedBox(height: 60.h),
              
              // Loading indicator with fade animation
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: CupertinoActivityIndicator(
                        radius: 20.r,
                        color: ColorManager.surface.withOpacity(0.8),
                        // ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
