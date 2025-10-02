import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pr/features/home/presentation/widgets/home_clipper_widget.dart';
import '../../../../core/utils/color_manager.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/user_profile_section.dart';
import '../widgets/wellness_percentage_section.dart';
import '../widgets/vitals_list_section.dart';
import '../widgets/sos_button_section.dart';

/// Main home page that displays the wellness overview
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Load initial data and start real-time updates
    context.read<HomeCubit>().loadWellnessData();
    context.read<HomeCubit>().startRealTimeUpdates();
  }

  @override
  void dispose() {
    // Stop real-time updates when leaving the page
    context.read<HomeCubit>().stopRealTimeUpdates();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        top: false,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: ColorManager.error,
                ),
              );
            } else if (state is HomeSOSTriggered) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: ColorManager.success,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeLoading && state is! HomeLoaded) {
              return Center(
                child: CircularProgressIndicator(color: ColorManager.primary),
              );
            }


            if (state is HomeLoaded) {
              return RefreshIndicator(
                onRefresh: () => context.read<HomeCubit>().refreshData(),
                color: ColorManager.primary,
                backgroundColor: ColorManager.surface,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Positioned.fill(
                                child: ClipPath(
                                  clipper: HomeClipperWidget2(),
                                  child: Container(
                                    // height: 350,
                                    decoration: BoxDecoration(
                                      gradient: ColorManager.createGradient(
                                        ColorManager.primaryGradient2,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: ClipPath(
                                  clipper: HomeClipperWidget(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: ColorManager.createGradient(
                                        ColorManager.primaryGradient,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 50.h),
                                        UserProfileSection(
                                          userProfile:
                                              state.wellnessData.userProfile,
                                        ),
                                        // Wellness Overview Section
                                        WellnessPercentageSection(
                                          percentage: state
                                              .wellnessData
                                              .wellnessPercentage,
                                          isConnected:
                                              state.wellnessData.isConnected,
                                          lastUpdated:
                                              state.wellnessData.lastUpdated,
                                        ),
                                        SizedBox(height: 20.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // White Content Section
                      VitalsListSection(vitals: state.wellnessData.vitals),

                      // Red SOS Section
                      SOSButtonSection(
                        onSOSTriggered: (isTriggered) =>
                            context.read<HomeCubit>().triggerSOSAlert(isTriggered, context),
                      ),


                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: Text(
                'Welcome to Wellness Overview',
                style: TextStyle(
                  color: ColorManager.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
