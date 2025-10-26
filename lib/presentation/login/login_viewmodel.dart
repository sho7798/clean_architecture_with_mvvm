import 'dart:async';

import 'package:clean_architecture_mvvm/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_mvvm/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture_mvvm/presentation/common/freezed_data_classes.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject(userName: "", password: "");

  LoginUsecase? loginUsecase;
  LoginViewModel(this.loginUsecase);

  @override
  void dispose() {
    userNameStreamController.close();
    passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  @override
  login() async {
    (await loginUsecase?.execute(
      LoginUseCaseInput(
        userName: loginObject.userName,
        password: loginObject.password,
      ),
    ))?.fold(
      (failure) =>
          // left -> failure
          debugPrint(failure.message),

      (data) =>
          // right -> success (data)
          debugPrint(data.customer?.name),
    );
  }

  @override
  setPassword(String password) {
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    loginObject = loginObject.copyWith(userName: userName);
  }

  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream.map(
    (password) => isPasswordValid(password),
  );

  @override
  Stream<bool> get outputIsUserNameValid => userNameStreamController.stream.map(
    (userName) => isUserNameValid(userName),
  );

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

mixin LoginViewModelInputs {
  // three functions for actions
  setUserName(String userName);

  setPassword(String password);

  login();

  // two sinks for streams
  Sink get inputUserName;

  Sink get inputPassword;
}

mixin LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;
}
