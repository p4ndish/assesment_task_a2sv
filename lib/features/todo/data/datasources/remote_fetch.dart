import 'dart:convert';

import 'package:assesment_task_a2sv/core/core.dart';
import 'package:assesment_task_a2sv/features/todo/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchApiService {
  Dio dio = Dio();

  Future<dynamic> getTodos() async {
    final result = await dio.get(appUrl);
    print("-> $result.data");
    final List<dynamic> todoList = result.data;

    return todoList.map((obj) => TodoModel.fromJson(obj)).toList();
  }

  Future<dynamic> deleteTodo(id) async {
    try {
      final result = await dio.get(appUrl + id);
    } on DioException catch (e) {
      return ServerException();
    }
  }

  // data is jsonencoded
  Future<dynamic> CreateTodos(data) async {
    try {
      final result = await dio.post(appUrl,
          data: jsonEncode(data),
          options: Options(headers: {'content-type': "application/json"}));

      if (result.statusCode == 201) return true;
      // else it's error
      throw ServerException();
    } catch (e) {
      return ServerException();
    }
  }

  // data is jsonencoded
  Future<dynamic> UpdateTodos(data) async {
    try {
      final result = await dio.patch(appUrl + data.id);
      final List<dynamic> todoList = result.data;
      if (result.statusCode == 200) return true;
      // else it's error
      throw ServerException();
    } catch (e) {
      return ServerException();
    }
  }
}
