import 'package:clean_architecture_mvvm/data/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:clean_architecture_mvvm/app/constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  @FormUrlEncoded()
  Future<AuthenticationResponse> login(
    @Field("email") String? email,
    @Field("password") String? password,
    @Field("imei") String? imei,
    @Field("deviceType") String? deviceType,
  );
}
