import 'package:clean_architecture_mvvm/presentation/login/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel viewModel = LoginViewModel(null);
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bind() {
    viewModel.start();
    userNameController.addListener(
      () => viewModel.setUserName(userNameController.text),
    );
    passwordController.addListener(
      () => viewModel.setPassword(passwordController.text),
    );
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
