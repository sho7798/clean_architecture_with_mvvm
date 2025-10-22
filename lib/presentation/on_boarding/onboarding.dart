// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:clean_architecture_mvvm/presentation/resources/color_manager.dart';
import 'package:clean_architecture_mvvm/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  List<SliderObject> _getSliderData() => [
    SliderObject(
      title: AppStrings.onBoardingSubTitle1,
      subtitle: AppStrings.onBoardingSubTitle1,
      image: ImageAssets.onboardingLogo1,
    ),
    SliderObject(
      title: AppStrings.onBoardingSubTitle2,
      subtitle: AppStrings.onBoardingSubTitle2,
      image: ImageAssets.onboardingLogo2,
    ),
    SliderObject(
      title: AppStrings.onBoardingSubTitle3,
      subtitle: AppStrings.onBoardingSubTitle3,
      image: ImageAssets.onboardingLogo3,
    ),
    SliderObject(
      title: AppStrings.onBoardingSubTitle4,
      subtitle: AppStrings.onBoardingSubTitle4,
      image: ImageAssets.onboardingLogo4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}

class SliderObject {
  String? title;
  String? subtitle;
  String? image;
  SliderObject({this.title, this.subtitle, this.image});
}
