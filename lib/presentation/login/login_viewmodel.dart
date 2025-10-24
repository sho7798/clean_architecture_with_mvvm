import 'dart:async';

import 'package:clean_architecture_mvvm/presentation/base/baseviewmodel.dart';

class LoginViewmodel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();

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
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    throw UnimplementedError();
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
