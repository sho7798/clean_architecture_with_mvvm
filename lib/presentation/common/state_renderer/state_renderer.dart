// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:clean_architecture_mvvm/data/mapper/mapper.dart';
import 'package:clean_architecture_mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_mvvm/data/network/failure.dart';

enum StateRendererType {
  //POPUP STATES
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  //FULL SCREEN STATES
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE,
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final Failure failure;
  final String message;
  final String title;
  final Function retryActionFunction;

  StateRenderer({
    super.key,
    required this.stateRendererType,
    Failure? failure,
    String? message,
    String? title,
    required this.retryActionFunction,
  }) : message = message ?? AppStrings.loading,
       title = title ?? EMPTY,
       failure = failure ?? DefaultFailure();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
