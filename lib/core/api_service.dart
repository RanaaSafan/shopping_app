import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class api_service{
  final base_url="https://dummyjson.com/";
  final Dio dio;

  api_service(this.dio);

  Future <Map<String,dynamic>> getdata({required String endpoint})async{
    var response=await dio.get("$base_url$endpoint");
    return response.data;

  }
}