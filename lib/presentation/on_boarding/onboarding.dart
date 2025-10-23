import 'package:clean_architecture_mvvm/domain/model/model.dart';
import 'package:clean_architecture_mvvm/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clean_architecture_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_mvvm/presentation/resources/color_manager.dart';
import 'package:clean_architecture_mvvm/presentation/resources/strings_manager.dart';
import 'package:clean_architecture_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter_svg/svg.dart';

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
      subTitle: AppStrings.onBoardingSubTitle1,
      image: ImageAssets.onboardingLogo1,
    ),
    SliderObject(
      title: AppStrings.onBoardingSubTitle2,
      subTitle: AppStrings.onBoardingSubTitle2,
      image: ImageAssets.onboardingLogo2,
    ),
    SliderObject(
      title: AppStrings.onBoardingSubTitle3,
      subTitle: AppStrings.onBoardingSubTitle3,
      image: ImageAssets.onboardingLogo3,
    ),
    SliderObject(
      title: AppStrings.onBoardingSubTitle4,
      subTitle: AppStrings.onBoardingSubTitle4,
      image: ImageAssets.onboardingLogo4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
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
          return OnBoardingPage(sliderObject: _list[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            // add layout for indicator and arrows
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(
                  _getPreviousIndex(),
                  duration: Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),

          // circles indicator
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                ),
            ],
          ),

          // right arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: () {
                _pageController.animateToPage(
                  _getNextIndex(),
                  duration: Duration(milliseconds: DurationConstant.d300),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = currentIndex--; // -1
    if (previousIndex == -1) {
      currentIndex = _list.length - 1;
    }
    return currentIndex;
  }

  int _getNextIndex() {
    int nextIndex = currentIndex++; // +1
    if (nextIndex >= _list.length) {
      currentIndex = 0;
    }
    return currentIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // unselected slider
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage({super.key, required this.sliderObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        SizedBox(height: AppSize.s60),

        SvgPicture.asset(sliderObject.image ?? ""),
      ],
    );
  }
}
