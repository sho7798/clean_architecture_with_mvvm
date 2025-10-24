import 'package:clean_architecture_mvvm/presentation/base/baseviewmodel.dart';

class LoginViewmodel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  //input
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => throw UnimplementedError();

  @override
  Sink get inputUserName => throw UnimplementedError();

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => throw UnimplementedError();
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
