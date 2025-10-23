// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_mvvm/data/network/app_api.dart';
import 'package:clean_architecture_mvvm/data/request/request.dart';
import 'package:clean_architecture_mvvm/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient? appServiceClient;
  RemoteDataSourceImplementer({this.appServiceClient});

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await appServiceClient!.login(
      loginRequest.email,
      loginRequest.password,
      loginRequest.imei,
      loginRequest.deviceType,
    );
  }
}
