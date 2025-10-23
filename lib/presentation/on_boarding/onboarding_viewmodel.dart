// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:clean_architecture_mvvm/domain/model/model.dart';
import 'package:clean_architecture_mvvm/presentation/base/baseviewmodel.dart';

class OnboardingViewmodel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controller
  final StreamController _streamController =
      StreamController<SlideViewObject>();

  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void goNext() {}

  @override
  void goPrevious() {}

  @override
  void onPageChanged(int index) {}

  @override
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  Stream<SlideViewObject> get outputSliderViewObject =>
      throw UnimplementedError();
}

// inputs mean the orders that our view model will recieve from our view
mixin OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);
  Sink
  get inputSliderViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean data or results that will be sent from our view model to our view
mixin OnBoardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SlideViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}
