import 'package:chuckapp/model/joke.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  final Dio dio = Dio();
  static const baseUrl = "https://api.chucknorris.io/jokes";
  static const categoryBaseUrl =
      "https://api.chucknorris.io/jokes/random?category=";
  static const randomJokesUri = "/random";
  static const categories = "/categories";

  Future<Joke> fetchJoke() async {
    try {
      final response = await dio.get(baseUrl + randomJokesUri);
      debugPrint(response.toString());
      return Joke.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Failed to get joke :((");
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    try {
      final response = await dio.get(baseUrl + categories);
      return response.data as List<dynamic>;
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Failed to get joke :((");
    }
  }

  Future<Joke> fetchCategoryJoke(String category) async {
    try {
      final response = await dio.get(categoryBaseUrl + category);
      return Joke.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint("Status code: ${e.response?.statusCode.toString()}");
      throw Exception("Failed to get joke :((");
    }
  }
}
