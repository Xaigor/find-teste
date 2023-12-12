import 'package:dio/dio.dart';

const String apiUrl = "http://gateway.marvel.com";
const String params =
    "apikey=0901f403146e4052eefdf231156f5b00&hash=5054ae55c3889b8d07da6ac20879b445&ts=1702322937";

class ApiRepository {
  Dio dio;

  ApiRepository([Dio? client]) : dio = client ?? Dio();

  Future fetchApi(String path) async {
    final response = await dio.get("$apiUrl/$path$params");
    return response.data;
  }
}
