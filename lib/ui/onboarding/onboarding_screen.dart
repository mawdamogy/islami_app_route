import 'package:flutter/material.dart';
import 'package:islami_app_route/model/onboarding_model.dart';
import 'package:islami_app_route/ui/onboarding/widget/dot_widget.dart';
import 'package:islami_app_route/utils/app_images.dart';
import 'package:islami_app_route/utils/app_routes.dart';
import 'package:islami_app_route/utils/app_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onbboardingScreens = [
    OnboardingModel(
        imagePath: AppImages.onboardingScreen1, title: 'Welcome To Islmi App'),
    OnboardingModel(
        imagePath: AppImages.onboardingScreen2,
        title: 'Welcome To Islami',
        subtitle: 'We Are Very Excited To Have You In Our Community'),
    OnboardingModel(
        imagePath: AppImages.onboardingScreen3,
        title: 'Reading the Quran',
        subtitle: 'Read, and your Lord is the Most Generous'),
    OnboardingModel(
        imagePath: AppImages.onboardingScreen4,
        title: 'Bearish',
        subtitle: 'Praise the name of your Lord, the Most High'),
    OnboardingModel(
        imagePath: AppImages.onboardingScreen5,
        title: 'Holy Quran Radio',
        subtitle:
            'You can listen to the Holy Quran Radio through the application for free and easily'),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController pageController = PageController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppImages.logo),
            SizedBox(height: size.height * .07),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: pageController,
                itemCount: onbboardingScreens.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: Column(
                      children: [
                        Image.asset(
                          onbboardingScreens[index].imagePath,
                          height: size.height * .35,
                        ),
                        SizedBox(height: size.height * .03),
                        Text(
                          onbboardingScreens[index].title,
                          style: AppStyle.primary24,
                        ),
                        SizedBox(height: size.height * .03),
                        Text(
                          onbboardingScreens[index].subtitle ?? '',
                          style: AppStyle.primary20,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * .05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(currentIndex - 1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.bounceInOut);
                                },
                                child: Text(
                                  currentIndex == 0 ? '' : 'back',
                                  style: AppStyle.primary16,
                                ),
                              ),
                              Row(
                                children: [
                                  DotWidget(isselected: currentIndex == 0),
                                  DotWidget(isselected: currentIndex == 1),
                                  DotWidget(isselected: currentIndex == 2),
                                  DotWidget(isselected: currentIndex == 3),
                                  DotWidget(isselected: currentIndex == 4),
                                ],
                              ),
                              currentIndex == 4
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, AppRoutes.homeroute);
                                      },
                                      child: Text(
                                        'finish',
                                        style: AppStyle.primary16,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        pageController.animateToPage(
                                            currentIndex + 1,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.bounceInOut);
                                      },
                                      child: Text(
                                        'next',
                                        style: AppStyle.primary16,
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
