import 'package:crime_chart_app/controller/connectivity/api_response.dart';
import 'package:crime_chart_app/utils/api_urls.dart';
import 'package:dio/dio.dart';

class CrimeRepo{
  Dio dio=Dio();
  Future<ApiResponse> getCrimeInfo()async{
    try {
      final response= await dio.get(ApiUrls.crimeApiUrl);
      return ApiResponse.withSuccess(response);
    } on Exception catch (e) {
      return ApiResponse.withError(e);
    }
  }
}